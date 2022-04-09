package com.ren.eduservice.service.impl;

import com.alibaba.excel.EasyExcel;
import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.ren.commonutils.Result;
import com.ren.eduservice.entity.*;
import com.ren.eduservice.entity.excl.appraisalData.JudgeFactorData;
import com.ren.eduservice.entity.excl.appraisalData.RoughConvertData;
import com.ren.eduservice.entity.excl.ScaleSubjectData;
import com.ren.eduservice.entity.vo.*;
import com.ren.eduservice.listener.AppraisalExcelListener.JudgeFactorAppraisalExcelListener;
import com.ren.eduservice.listener.SubjectExcelListener.JudgeFactorSubjectExcelListener;
import com.ren.eduservice.listener.SubjectExcelListener.RoughCovertSubjectExcelListener;
import com.ren.eduservice.listener.AppraisalExcelListener.RoughConvertAppraisalExcelListener;
import com.ren.eduservice.mapper.EduScaleMapper;
import com.ren.eduservice.service.*;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.ren.servicebase.exceptionhandler.ReclException;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.util.StringUtils;
import org.springframework.web.multipart.MultipartFile;

import java.io.IOException;
import java.io.InputStream;
import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.Collection;
import java.util.List;
import java.util.stream.Collectors;

/**
 * <p>
 * 服务实现类
 * </p>
 *
 * @author testjava
 * @since 2021-08-08
 */
@Service
public class EduScaleServiceImpl extends ServiceImpl<EduScaleMapper, EduScale> implements EduScaleService {

    @Autowired
    EduCounselorService eduCounselorService;

    @Autowired
    EduScaleClassifyService eduScaleClassifyService;

    @Autowired
    EduScaleCommentService eduScaleCommentService;

    @Autowired
    EduScaleSubjectService eduScaleSubjectService;

    @Autowired
    AclUserService aclUserService;

    @Autowired
    EduScaleCollectService eduScaleCollectService;

    @Autowired
    EduScaleAppraisalService eduScaleAppraisalService;

    @Autowired
    EvaluationAlgorithmService evaluationAlgorithmService;

    @Override
    public boolean delScaleInfoById(String scaleId) {

        int i = this.baseMapper.delScaleInfo(scaleId);
        return true;
    }

    @Override
    public ScaleInfoVo getScaleInfoVo(String scaleId) {

        EduScale eduScale = this.baseMapper.selectById(scaleId);

        //获取一级分类名
        QueryWrapper<EduScaleClassify> oneWrapper = new QueryWrapper<>();
        oneWrapper.select("title");
        oneWrapper.eq("id", eduScale.getClassifyParentId());
        EduScaleClassify oneClassify = eduScaleClassifyService.getOne(oneWrapper);

        //获取二级分类名
        QueryWrapper<EduScaleClassify> twoWrapper = new QueryWrapper<>();
        twoWrapper.select("title");
        twoWrapper.eq("id", eduScale.getClassifyId());
        EduScaleClassify twoClassify = eduScaleClassifyService.getOne(twoWrapper);

        ScaleInfoVo scaleInfoVo = new ScaleInfoVo();

        BeanUtils.copyProperties(eduScale, scaleInfoVo);
        scaleInfoVo.setOneClassify(oneClassify.getTitle());
        scaleInfoVo.setTwoClassify(twoClassify.getTitle());
        return scaleInfoVo;
    }

    @Override
    public void saveScaleSubject(MultipartFile file, String scaleId) {

        List<EduScaleSubject> subjectList = new ArrayList<>();
        QueryWrapper<EduScale> wrapper = new QueryWrapper<>();
        wrapper.select("scale_category");
        wrapper.eq("id", scaleId);
        EduScale scale = this.baseMapper.selectOne(wrapper);

        try {
            InputStream in = file.getInputStream();

            if (scale.getScaleCategory() == 1) {

                EasyExcel.read(in, ScaleSubjectData.class, new RoughCovertSubjectExcelListener(scaleId, subjectList)).sheet().doRead();
            } else if (scale.getScaleCategory() == 2) {

                EasyExcel.read(in, ScaleSubjectData.class, new JudgeFactorSubjectExcelListener(scaleId, subjectList)).sheet().doRead();
            }


            EduScaleSubject scaleSubject = null;
            //添加题目信息集合
            for (int i = 0; i < subjectList.size(); i++) {

                scaleSubject = subjectList.get(i);
                scaleSubject.setSubjectSort(i + 1);
                boolean flag = eduScaleSubjectService.save(scaleSubject);
                if (!flag) {

                    throw new ReclException(20001, "量表题目添加失败");
                }
            }

        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    @Override
    public void saveScaleAppraisal(MultipartFile file, String scaleId) {

        List<EduScaleAppraisal> appraisalList = new ArrayList<>();
        QueryWrapper<EduScale> wrapper = new QueryWrapper<>();
        wrapper.select("scale_category");
        wrapper.eq("id", scaleId);
        EduScale scale = this.baseMapper.selectOne(wrapper);

        try {
            InputStream in = file.getInputStream();

            if (scale.getScaleCategory() == 1) {

                EasyExcel.read(in, RoughConvertData.class, new RoughConvertAppraisalExcelListener(scaleId, appraisalList)).sheet().doRead();
            } else if (scale.getScaleCategory() == 2) {

                EasyExcel.read(in, JudgeFactorData.class, new JudgeFactorAppraisalExcelListener(scaleId, appraisalList)).sheet().doRead();
            }


            //添加题目信息集合
            for (int i = 0; i < appraisalList.size(); i++) {

                boolean flag = eduScaleAppraisalService.save(appraisalList.get(i));
                if (!flag) {

                    throw new ReclException(20001, "量表评估标准添加失败");
                }
            }

        } catch (IOException e) {
            e.printStackTrace();
        }

    }

    @Override
    public ScaleFrontVo getScaleFrontVo(String scaleId) {

        EduScale eduScale = this.baseMapper.selectById(scaleId);
        ScaleFrontVo scale = new ScaleFrontVo();
        BeanUtils.copyProperties(eduScale, scale);

        //根据eduScale中的分类id查询量表分类信息
        List<EduScaleClassify> scaleClassify = eduScaleClassifyService.getScaleClassifyById(eduScale.getClassifyId(), eduScale.getClassifyParentId());
        scale.setOneClassify(scaleClassify.get(0).getTitle());
        scale.setTwoClassify(scaleClassify.get(1).getTitle());

        //获取量表评论数量
        QueryWrapper<EduScaleComment> commentWrapper = new QueryWrapper<>();
        commentWrapper.eq("scale_id", scaleId);
        long commentCount = eduScaleCommentService.count(commentWrapper);
        scale.setCommentCount(commentCount);

        //获取量表题目数量
        QueryWrapper<EduScaleSubject> subjectWrapper = new QueryWrapper<>();
        subjectWrapper.eq("scale_id", scaleId);
        int optionCount = eduScaleSubjectService.count(subjectWrapper);
        scale.setScaleOptionCount(optionCount);
        return scale;
    }

    @Override
    public List<String> getScaleAppraisalResult(String scaleId, String userId, List<String> scaleResult) {

        QueryWrapper<EduScale> wrapper = new QueryWrapper<>();
        wrapper.select("scale_category");
        wrapper.eq("id", scaleId);
        EduScale scale = this.baseMapper.selectOne(wrapper);

        if (scale.getScaleCategory() == 1) {

            List<String> appraisalResult = evaluationAlgorithmService.RoughConvertMethod(scaleId, userId, scaleResult);
            return appraisalResult;
        } else if (scale.getScaleCategory() == 2) {

            List<String> appraisalResult = evaluationAlgorithmService.JudgeFactorsMethod(scaleId, userId, scaleResult);
            return appraisalResult;
        }


        return null;
    }

    @Override
    public Result getPageScaleFactor(long current, long limit, ScaleQuery scaleQuery) {

        Page<EduScale> scalePage = new Page<>(current, limit);
        String classifyId = scaleQuery.getClassifyId();
        QueryWrapper<EduScale> wrapper = new QueryWrapper<>();
        if(classifyId != null && !classifyId.equals("0")) wrapper.eq("classify_parent_id", classifyId);

        wrapper.orderByDesc("view_count");
        wrapper.eq("status", "Normal");

        this.baseMapper.selectPage(scalePage, wrapper);

        List<EduScale> scaleList = scalePage.getRecords();
        if(scaleList.isEmpty()) {

            throw new ReclException(20001, "没有此类量表");
        }
        List<String> userIds = scaleList.stream().map(EduScale::getUserId).collect(Collectors.toList());
        List<String> classifyIds = scaleList.stream().map(EduScale::getClassifyId).collect(Collectors.toList());
        List<UserInfoVo> userInfoVos;
        try {
            userInfoVos = aclUserService.getAclUsers(userIds);
        } catch (Exception e) {
            throw new ReclException(20001, "没有此类量表");
        }
        Collection<EduScaleClassify> classifies = eduScaleClassifyService.listByIds(classifyIds);


        List<ScalePageVo> scalePageVoList = new ArrayList<>();
        for (EduScale scale : scaleList) {

            for (UserInfoVo userInfoVo : userInfoVos) {

                if(userInfoVo.getId().equals(scale.getUserId())) {

                    ScalePageVo scalePageVo = new ScalePageVo();
                    for (EduScaleClassify classify : classifies) {

                        if(classify.getId().equals(scale.getClassifyId())) {

                            scalePageVo.setClassifyTitle(classify.getTitle());
                            break;
                        }
                    }
                    BeanUtils.copyProperties(scale, scalePageVo);
                    scalePageVo.setUserId(userInfoVo.getId());
                    scalePageVo.setName(userInfoVo.getNickName());
                    scalePageVoList.add(scalePageVo);
                    break;

                }
            }
        }

        long total = scalePage.getTotal();
        return Result.ok()
                .data("scaleList", scalePageVoList)
                .data("total",total);
    }

    @Override
    public Result pageScaleFactor(long current, long limit, ScaleQuery scaleQuery) {

        Page<EduScale> scalePage = new Page<>(current, limit);

        QueryWrapper<EduScale> wrapper = new QueryWrapper<>();

        String classifyId = scaleQuery.getClassifyId();
        String classifyParentId = scaleQuery.getClassifyParentId();
        Long buyCount = scaleQuery.getBuyCount();
        BigDecimal price = scaleQuery.getPrice();
        String title = scaleQuery.getTitle();
        String status = scaleQuery.getStatus();
        Long viewCount = scaleQuery.getViewCount();
        String gmtCreate = scaleQuery.getGmtCreate();
        String gmtModified = scaleQuery.getGmtModified();

        if(!StringUtils.isEmpty(title)) wrapper.like("title", title);

        if(!StringUtils.isEmpty(classifyId)) wrapper.like("classify_id", classifyId);

        if(!StringUtils.isEmpty(classifyParentId)) wrapper.like("classify_parent_id", classifyParentId);

        if(!StringUtils.isEmpty(buyCount)) wrapper.ge("buy_count", buyCount);

        if(!StringUtils.isEmpty(viewCount)) wrapper.ge("view_count", viewCount);

        if(!StringUtils.isEmpty(status)) wrapper.eq("status", status);

        if(!StringUtils.isEmpty(price)) wrapper.like("price", price);

        if(!StringUtils.isEmpty(gmtCreate)) wrapper.ge("gmt_create", gmtCreate);

        if(!StringUtils.isEmpty(gmtModified)) wrapper.le("gmt_modified", gmtModified);


        this.baseMapper.selectPage(scalePage, wrapper);
        long total = scalePage.getTotal();
        List<EduScale> scales = scalePage.getRecords();

        List<String> userIds = scales.stream().map(EduScale::getUserId).collect(Collectors.toList());
        List<UserInfoVo> userInfoVos = aclUserService.getAclUsers(userIds);
        ArrayList<ScaleInfoVo> scaleList = new ArrayList<>();

        for (EduScale scale : scales) {

            for (UserInfoVo userInfoVo : userInfoVos) {

                if(scale.getUserId().equals(userInfoVo.getId())) {
                    ScaleInfoVo scaleInfoVo = new ScaleInfoVo();
                    BeanUtils.copyProperties(scale, scaleInfoVo);
                    scaleInfoVo.setCounselorName(userInfoVo.getNickName());
                    scaleInfoVo.setUserId(userInfoVo.getId());
                    scaleList.add(scaleInfoVo);
                    break;
                }
            }
        }
        return Result.ok()
                .data("scaleList", scaleList)
                .data("total", total);
    }

    @Override
    public List<ScaleVo> getCollectScale(String userId) {

        List<EduScaleCollect> collects = eduScaleCollectService.list(new QueryWrapper<EduScaleCollect>().eq("user_id", userId)
                .orderByDesc("gmt_create"));

        if(collects.isEmpty()) return new ArrayList<>();
        else {

            List<String> scaleIds = collects.stream().map(EduScaleCollect::getScaleId).collect(Collectors.toList());
            List<EduScale> scales = this.baseMapper.selectList(new QueryWrapper<EduScale>().in("id", scaleIds));
            List<String> userIds = scales.stream().map(EduScale::getUserId).collect(Collectors.toList());
            List<UserInfoVo> userInfoVos = aclUserService.getAclUsers(userIds);

            List<ScaleVo> scaleList = new ArrayList<>();

            for (EduScale scale : scales) {

                for (UserInfoVo userInfoVo : userInfoVos) {

                    ScaleVo scaleVo = new ScaleVo();
                    BeanUtils.copyProperties(scale, scaleVo);
                    scaleVo.setAvatar(userInfoVo.getAvatar());
                    scaleVo.setUserId(userInfoVo.getId());
                    scaleVo.setNickName(userInfoVo.getNickName());
                    scaleList.add(scaleVo);
                    break;
                }
            }
            return scaleList;
        }
    }
}

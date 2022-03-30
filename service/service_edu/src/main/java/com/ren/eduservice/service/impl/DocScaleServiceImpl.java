package com.ren.eduservice.service.impl;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.ren.commonutils.Result;
import com.ren.eduservice.entity.UcenterMember;
import com.ren.eduservice.client.UcenterClient;
import com.ren.eduservice.entity.DocScale;
import com.ren.eduservice.entity.EduScale;
import com.ren.eduservice.entity.vo.DocScaleQuery;
import com.ren.eduservice.entity.vo.DocScaleVo;
import com.ren.eduservice.mapper.DocScaleMapper;
import com.ren.eduservice.service.DocScaleService;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.ren.eduservice.service.EduCounselorService;
import com.ren.eduservice.service.EduScaleService;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.util.StringUtils;

import java.util.ArrayList;
import java.util.Collection;
import java.util.Date;
import java.util.List;
import java.util.stream.Collectors;

/**
 * <p>
 *  服务实现类
 * </p>
 *
 * @author rzy
 * @since 2022-03-13
 */
@Service
public class DocScaleServiceImpl extends ServiceImpl<DocScaleMapper, DocScale> implements DocScaleService {

    @Autowired
    UcenterClient ucenterClient;

    @Autowired
    EduScaleService eduScaleService;

    @Override
    public void createDocScale(DocScale docScale) {

        this.baseMapper.insert(docScale);
    }

    @Override
    public Result getPageFactor(long current, long limit, DocScaleQuery docScaleQuery) {

        Page<DocScale> page = new Page<>(current, limit);
        QueryWrapper<DocScale> docWrapper = new QueryWrapper<>();
        Integer warningLevel = docScaleQuery.getWarningLevel();
        Date start = docScaleQuery.getStart();
        Date end = docScaleQuery.getEnd();

        if(!StringUtils.isEmpty(warningLevel)) {
            docWrapper.eq("warning_level", warningLevel);
        }

        if(!StringUtils.isEmpty(start)) {
            docWrapper.ge("gmt_create", start);
        }

        if(!StringUtils.isEmpty(end)) {
            docWrapper.le("gmt_modified", end);
        }

        docWrapper.orderByDesc("warning_level");

        this.baseMapper.selectPage(page, docWrapper);
        List<DocScale> records = page.getRecords();
        long total = page.getTotal();

        List<String> userIds = records.stream().map(DocScale::getUserId).collect(Collectors.toList());
        List<String> scaleIds = records.stream().map(DocScale::getScaleId).collect(Collectors.toList());

        Collection<EduScale> eduScales = eduScaleService.listByIds(scaleIds);
        List<EduScale> scales = new ArrayList<>(eduScales);
        List<UcenterMember> users = ucenterClient.getUsers(userIds);

        ArrayList<DocScaleVo> docScaleList = new ArrayList<>();
        for (DocScale docScale : records) {

            for (UcenterMember user : users) {

                for (EduScale scale : scales) {

                    if(docScale.getUserId().equals(user.getId()) && docScale.getScaleId().equals(scale.getId())) {

                        DocScaleVo docScaleVo = new DocScaleVo();
                        BeanUtils.copyProperties(docScale, docScaleVo);
                        docScaleVo.setUserId(user.getId());
                        docScaleVo.setMobile(user.getMobile());
                        docScaleVo.setNickName(user.getNickName());
                        docScaleVo.setSex(user.getSex());
                        docScaleVo.setTitle(scale.getTitle());
                        docScaleList.add(docScaleVo);
                    }
                }
            }
        }

        return Result.ok()
                .data("docScaleList", docScaleList)
                .data("total", total);
    }
}

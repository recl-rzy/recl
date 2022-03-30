package com.ren.eduservice.service.impl;

import com.alibaba.excel.EasyExcel;
import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.ren.eduservice.entity.TestClassify.OneClassify;
import com.ren.eduservice.entity.TestClassify.TwoClassify;
import com.ren.eduservice.listener.ClassifyExcelListener;
import com.ren.eduservice.entity.EduScaleClassify;
import com.ren.eduservice.entity.excl.TestClassifyData;
import com.ren.eduservice.mapper.EduScaleClassifyMapper;
import com.ren.eduservice.service.EduScaleClassifyService;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import java.io.InputStream;
import java.util.ArrayList;
import java.util.List;

/**
 * <p>
 * 服务实现类
 * </p>
 *
 * @author testjava
 * @since 2021-08-07
 */
@Service
public class EduScaleClassifyServiceImpl extends ServiceImpl<EduScaleClassifyMapper, EduScaleClassify> implements EduScaleClassifyService {


    @Override
    public List<OneClassify> getAllClassify() {

        //获取一级分类
        QueryWrapper<EduScaleClassify> oneWrapper = new QueryWrapper<>();
        oneWrapper.eq("parent_id", "0");
        List<EduScaleClassify> oneClassifies = this.baseMapper.selectList(oneWrapper);
        //获取二级分类
        QueryWrapper<EduScaleClassify> twoWrapper = new QueryWrapper<>();
        oneWrapper.ne("parent_id", "0");
        List<EduScaleClassify> twoClassifies = this.baseMapper.selectList(twoWrapper);

        List<OneClassify> finalClassify = new ArrayList<>();
        //封装一级和二级分类信息
        for (EduScaleClassify oneClassify : oneClassifies) {

            OneClassify oneClassify1 = new OneClassify();
            BeanUtils.copyProperties(oneClassify, oneClassify1);
            List<TwoClassify> list = new ArrayList<>();
            for (EduScaleClassify twoClassify : twoClassifies) {

                if (oneClassify1.getId().equals(twoClassify.getParentId())) {

                    TwoClassify twoClassify1 = new TwoClassify();
                    BeanUtils.copyProperties(twoClassify, twoClassify1);
                    list.add(twoClassify1);
                }
            }
            oneClassify1.setTwoClassifies(list);
            finalClassify.add(oneClassify1);
        }

        return finalClassify;
    }

    @Override
    public void saveTestClassify(MultipartFile file, EduScaleClassifyService eduScaleClassifyService) {

        InputStream in;
        try {

            in = file.getInputStream();
            EasyExcel.read(in, TestClassifyData.class, new ClassifyExcelListener(eduScaleClassifyService)).sheet().doRead();
        } catch (Exception e) {

            e.printStackTrace();
        }
    }

    @Override
    public List<EduScaleClassify> getScaleClassifyById(String id, String parentId) {

        return this.baseMapper.getClassifyById(id, parentId);
    }

}

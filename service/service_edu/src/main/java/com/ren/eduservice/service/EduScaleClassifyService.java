package com.ren.eduservice.service;

import com.ren.eduservice.entity.EduScaleClassify;
import com.baomidou.mybatisplus.extension.service.IService;
import com.ren.eduservice.entity.TestClassify.OneClassify;
import org.springframework.web.multipart.MultipartFile;

import java.util.List;

/**
 * <p>
 * 服务类
 * </p>
 *
 * @author testjava
 * @since 2021-08-07
 */
public interface EduScaleClassifyService extends IService<EduScaleClassify> {

    void saveTestClassify(MultipartFile file, EduScaleClassifyService eduScaleClassifyService);

    List<OneClassify> getAllClassify();

    List<EduScaleClassify> getScaleClassifyById(String id, String parentId);

}

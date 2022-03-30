package com.ren.eduservice.service;

import com.ren.commonutils.Result;
import com.ren.eduservice.entity.EduScale;
import com.baomidou.mybatisplus.extension.service.IService;
import com.ren.eduservice.entity.vo.ScaleFrontVo;
import com.ren.eduservice.entity.vo.ScaleInfoVo;
import com.ren.eduservice.entity.vo.ScaleQuery;
import com.ren.eduservice.entity.vo.ScaleVo;
import org.springframework.web.multipart.MultipartFile;

import java.util.List;

/**
 * <p>
 * 服务类
 * </p>
 *
 * @author testjava
 * @since 2021-08-08
 */
public interface EduScaleService extends IService<EduScale> {

    ScaleInfoVo getScaleInfoVo(String scaleId);

    ScaleFrontVo getScaleFrontVo(String scaleId);

    void saveScaleSubject(MultipartFile file, String scaleId);

    void saveScaleAppraisal(MultipartFile file, String scaleId);

    List<String> getScaleAppraisalResult(String scaleId, String userId, List<String> scaleResult);

    boolean delScaleInfoById(String scaleId);

    Result getPageScaleFactor(long current, long limit, ScaleQuery scaleQuery);

    Result pageScaleFactor(long current, long limit, ScaleQuery scaleQuery);

    List<ScaleVo> getCollectScale(String userId);
}

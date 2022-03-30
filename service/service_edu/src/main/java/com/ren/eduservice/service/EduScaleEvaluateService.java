package com.ren.eduservice.service;

import com.ren.eduservice.entity.EduScaleEvaluate;
import com.baomidou.mybatisplus.extension.service.IService;
import com.ren.eduservice.entity.vo.ScaleEvaluateVo;

/**
 * <p>
 * 服务类
 * </p>
 *
 * @author testjava
 * @since 2021-09-30
 */
public interface EduScaleEvaluateService extends IService<EduScaleEvaluate> {

    ScaleEvaluateVo getScaleEvaluate(String scaleId);
}

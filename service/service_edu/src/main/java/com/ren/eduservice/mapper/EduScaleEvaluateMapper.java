package com.ren.eduservice.mapper;

import com.ren.eduservice.entity.EduScaleEvaluate;
import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.ren.eduservice.entity.vo.ScaleEvaluateVo;

/**
 * <p>
 * Mapper 接口
 * </p>
 *
 * @author testjava
 * @since 2021-09-30
 */
public interface EduScaleEvaluateMapper extends BaseMapper<EduScaleEvaluate> {

    ScaleEvaluateVo getScaleEvaluate(String scaleId);
}

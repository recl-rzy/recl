package com.ren.eduservice.mapper;

import com.ren.eduservice.entity.EduScale;
import com.baomidou.mybatisplus.core.mapper.BaseMapper;

/**
 * <p>
 * Mapper 接口
 * </p>
 *
 * @author testjava
 * @since 2021-08-08
 */
public interface EduScaleMapper extends BaseMapper<EduScale> {

    int delScaleInfo(String scaleId);
}

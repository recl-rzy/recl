package com.ren.eduservice.mapper;

import com.ren.eduservice.entity.EduScaleClassify;
import com.baomidou.mybatisplus.core.mapper.BaseMapper;

import java.util.List;

/**
 * <p>
 * Mapper 接口
 * </p>
 *
 * @author testjava
 * @since 2021-08-07
 */

public interface EduScaleClassifyMapper extends BaseMapper<EduScaleClassify> {

    List<EduScaleClassify> getClassifyById(String id, String parentId);
}

package com.ren.eduservice.mapper;

import com.ren.eduservice.entity.EduScaleComment;
import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.ren.eduservice.entity.vo.ScaleCommentVo;

import java.util.List;

/**
 * <p>
 * Mapper 接口
 * </p>
 *
 * @author testjava
 * @since 2021-09-30
 */
public interface EduScaleCommentMapper extends BaseMapper<EduScaleComment> {

    List<ScaleCommentVo> getScaleComment(String id);
}

package com.ren.eduservice.service;

import com.ren.eduservice.entity.EduScaleComment;
import com.baomidou.mybatisplus.extension.service.IService;
import com.ren.eduservice.entity.vo.ScaleCommentVo;

import java.util.List;

/**
 * <p>
 * 服务类
 * </p>
 *
 * @author testjava
 * @since 2021-09-30
 */
public interface EduScaleCommentService extends IService<EduScaleComment> {

    List<ScaleCommentVo> getScaleComment(String id);
}

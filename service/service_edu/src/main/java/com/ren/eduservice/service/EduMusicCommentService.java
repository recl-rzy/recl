package com.ren.eduservice.service;

import com.ren.commonutils.Result;
import com.ren.eduservice.entity.EduMusicComment;
import com.baomidou.mybatisplus.extension.service.IService;

/**
 * <p>
 * 服务类
 * </p>
 *
 * @author testjava
 * @since 2021-10-02
 */
public interface EduMusicCommentService extends IService<EduMusicComment> {

    Result getMusicCommentById(String id);
}

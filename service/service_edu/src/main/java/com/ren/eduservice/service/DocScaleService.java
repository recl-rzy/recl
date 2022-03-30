package com.ren.eduservice.service;

import com.ren.commonutils.Result;
import com.ren.eduservice.entity.DocScale;
import com.baomidou.mybatisplus.extension.service.IService;
import com.ren.eduservice.entity.vo.DocScaleQuery;

/**
 * <p>
 *  服务类
 * </p>
 *
 * @author rzy
 * @since 2022-03-13
 */
public interface DocScaleService extends IService<DocScale> {

    void createDocScale(DocScale docScale);

    Result getPageFactor(long current, long limit, DocScaleQuery docScaleQuery);
}

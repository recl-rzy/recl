package com.ren.educenter.service;

import com.ren.commonutils.Result;
import com.ren.educenter.entity.MemberFocus;
import com.baomidou.mybatisplus.extension.service.IService;

/**
 * <p>
 * 服务类
 * </p>
 *
 * @author rzy
 * @since 2021-10-23
 */
public interface MemberFocusService extends IService<MemberFocus> {

    Result focusMember(MemberFocus memberFocus);
}

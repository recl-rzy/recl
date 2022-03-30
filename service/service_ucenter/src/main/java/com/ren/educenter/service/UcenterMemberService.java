package com.ren.educenter.service;

import com.ren.educenter.entity.UcenterMember;
import com.baomidou.mybatisplus.extension.service.IService;
import com.ren.educenter.entity.vo.RegisterVo;

/**
 * <p>
 * 服务类
 * </p>
 *
 * @author testjava
 * @since 2021-09-20
 */
public interface UcenterMemberService extends IService<UcenterMember> {

    String login(UcenterMember ucenterMember);

    void register(RegisterVo registerVo);
}

package com.ren.eduservice.service;

import com.ren.eduservice.entity.AclUser;
import com.baomidou.mybatisplus.extension.service.IService;
import com.ren.eduservice.entity.vo.UserInfoVo;

import java.util.List;

/**
 * <p>
 * 用户表 服务类
 * </p>
 *
 * @author rzy
 * @since 2022-03-13
 */
public interface AclUserService extends IService<AclUser> {

    UserInfoVo getAclUserById(String id);

    List<UserInfoVo> getAclUsers(List<String> ids);
}

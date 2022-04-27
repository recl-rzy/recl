package com.ren.eduservice.service.impl;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.ren.commonutils.RedisUtils;
import com.ren.eduservice.client.UcenterClient;
import com.ren.eduservice.entity.AclUser;
import com.ren.eduservice.entity.EduCounselor;
import com.ren.eduservice.entity.EduListener;
import com.ren.eduservice.entity.UcenterMember;
import com.ren.eduservice.entity.vo.UserInfoVo;
import com.ren.eduservice.mapper.AclUserMapper;
import com.ren.eduservice.service.AclUserService;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.ren.eduservice.service.EduCounselorService;
import com.ren.eduservice.service.EduListenerService;
import com.ren.servicebase.constant.RedisKeyPrefixConstant;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.util.StringUtils;

import java.util.ArrayList;
import java.util.List;

/**
 * <p>
 * 用户表 服务实现类
 * </p>
 *
 * @author rzy
 * @since 2022-03-13
 */
@Service
public class AclUserServiceImpl extends ServiceImpl<AclUserMapper, AclUser> implements AclUserService {

    @Autowired
    EduCounselorService eduCounselorService;

    @Autowired
    EduListenerService eduListenerService;

    @Autowired
    UcenterClient ucenterClient;

    @Override
    public UserInfoVo getAclUserById(String id) {

        //redis对应的key
        String aclUserKey = RedisKeyPrefixConstant.ACL_USER_CACHE + id;
        //redis中查询key
        UserInfoVo userInfoVo = (UserInfoVo) RedisUtils.get(aclUserKey);

        if(userInfoVo == null) {

            userInfoVo = new UserInfoVo();
            //查询数据库并封装
            EduCounselor counselor = eduCounselorService.getOne(new QueryWrapper<EduCounselor>().eq("user_id", id));
            if(!StringUtils.isEmpty(counselor)) {

                BeanUtils.copyProperties(counselor, userInfoVo);
                userInfoVo.setNickName(counselor.getName());
                userInfoVo.setId(id);
            } else {

                EduListener listener = eduListenerService.getOne(new QueryWrapper<EduListener>().eq("user_id", id));
                if(!StringUtils.isEmpty(listener)) {

                    BeanUtils.copyProperties(listener, userInfoVo);
                    userInfoVo.setNickName(listener.getName());
                    userInfoVo.setId(id);
                } else {

                    UcenterMember member = ucenterClient.getSingleUser(id);
                    if(!StringUtils.isEmpty(member)) {

                        BeanUtils.copyProperties(member, userInfoVo);
                    }
                }
            }
            //放入缓存
            RedisUtils.set(aclUserKey, userInfoVo, RedisUtils.setCacheTimeout(7200));
        }

        //缓存续约
        RedisUtils.expire(aclUserKey, RedisUtils.setCacheTimeout(7200));
        return userInfoVo;
    }

    @Override
    public List<UserInfoVo> getAclUsers(List<String> ids) {

        ArrayList<UserInfoVo> userInfoVos = new ArrayList<>();
        List<EduCounselor> counselors = eduCounselorService.list(new QueryWrapper<EduCounselor>().in("user_id", ids));
        List<EduListener> listeners = eduListenerService.list(new QueryWrapper<EduListener>().in("user_id", ids));
        List<UcenterMember> members = ucenterClient.getUsers(ids);

        if(!StringUtils.isEmpty(counselors)) {

            for (EduCounselor counselor : counselors) {

                UserInfoVo userInfoVo = new UserInfoVo();
                BeanUtils.copyProperties(counselor, userInfoVo);
                userInfoVo.setNickName(counselor.getName());
                userInfoVo.setId(counselor.getUserId());
                userInfoVos.add(userInfoVo);
            }
        }

        if(!StringUtils.isEmpty(listeners)) {

            for (EduListener listener : listeners) {

                UserInfoVo userInfoVo = new UserInfoVo();
                BeanUtils.copyProperties(listener, userInfoVo);
                userInfoVo.setNickName(listener.getName());
                userInfoVo.setId(listener.getUserId());
                userInfoVos.add(userInfoVo);
            }
        }

        if(!StringUtils.isEmpty(members)) {

            for (UcenterMember member : members) {

                UserInfoVo userInfoVo = new UserInfoVo();
                BeanUtils.copyProperties(member, userInfoVo);
                userInfoVos.add(userInfoVo);
            }
        }

        return userInfoVos;
    }
}

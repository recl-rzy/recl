package com.ren.eduservice.controller;


import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.ren.commonutils.MD5;
import com.ren.commonutils.Result;
import com.ren.eduservice.entity.AclUser;
import com.ren.eduservice.entity.EduCounselor;
import com.ren.eduservice.entity.EduListener;
import com.ren.eduservice.entity.vo.UserInfoVo;
import com.ren.eduservice.service.AclUserService;
import com.ren.eduservice.service.EduCounselorService;
import com.ren.eduservice.service.EduListenerService;
import io.swagger.annotations.Api;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.*;

/**
 * <p>
 * 用户表 前端控制器
 * </p>
 *
 * @author RZY
 * @since 2022-03-13
 */
@Api(tags = "角色管理")
@RestController
@RequestMapping("/eduservice/acl-user")
public class AclUserController {

    @Autowired
    AclUserService aclUserService;

    @Autowired
    EduCounselorService eduCounselorService;

    @Autowired
    EduListenerService eduListenerService;

    @PostMapping("/getAclUserByUsername")
    public AclUser getAclUserByUsername(@RequestParam String username) {

        return  aclUserService.getOne(new QueryWrapper<AclUser>().eq("username", username));
    }

    @GetMapping("/getAclUserById/{id}")
    public UserInfoVo getAclUserById(@PathVariable String id) {

        AclUser aclUser = aclUserService.getById(id);
        UserInfoVo userInfo = new UserInfoVo();
        BeanUtils.copyProperties(aclUser, userInfo);
        if(aclUser.getIsCounselor()) {

            EduCounselor counselor = eduCounselorService.getOne(new QueryWrapper<EduCounselor>().eq("user_id", id));
            BeanUtils.copyProperties(counselor, userInfo);
            userInfo.setCounselorId(counselor.getId());
        } else if (aclUser.getIsListener()) {

            EduListener listener = eduListenerService.getOne(new QueryWrapper<EduListener>().eq("user_id", id));
            BeanUtils.copyProperties(listener, userInfo);
            userInfo.setListenerId(listener.getId());
        }
        userInfo.setId(id);
        return userInfo;
    }

    @GetMapping("/getAclIdentity/{id}")
    public String getAclIdentity(@PathVariable String id) {

        UserInfoVo user = aclUserService.getAclUserById(id);
        Boolean isCounselor = user.getIsCounselor();
        Boolean isListener = user.getIsListener();
        if(!StringUtils.isEmpty(isCounselor) && isCounselor) {

            return "counselor";
        } else if(!StringUtils.isEmpty(isListener) && isListener) {

            return "listener";
        } else {

            return "user";
        }
    }

    @PostMapping("/updatePw")
    public Result updatePw(@RequestBody UserInfoVo userInfoVo) {

        String password = aclUserService.getOne(new QueryWrapper<AclUser>().eq("id", userInfoVo.getId())
                .select("password")).getPassword();
        if(!MD5.encrypt(userInfoVo.getPassword()).equals(password)) {

            return Result.error().message("密码输入错误，修改失败!");
        } else {

            AclUser aclUser = new AclUser();
            aclUser.setPassword(MD5.encrypt(userInfoVo.getNewPw()));
            aclUser.setId(userInfoVo.getId());
            aclUserService.updateById(aclUser);
            return Result.ok().message("密码修改成功");
        }

    }

    @PostMapping("/updateAclUser")
    @Transactional(rollbackFor = Exception.class)
    public void updateAclUser(@RequestBody UserInfoVo userInfoVo) {

        Integer age = userInfoVo.getAge();
        String nickName = userInfoVo.getNickName();
        String sign = userInfoVo.getSign();
        Integer sex = userInfoVo.getSex();
        String avatar = userInfoVo.getAvatar();

        AclUser user = new AclUser();
        EduCounselor counselor = new EduCounselor();
        EduListener listener = new EduListener();

        if(userInfoVo.getIsCounselor()) {

            if(!StringUtils.isEmpty(nickName)) {
                user.setNickName(nickName);
                counselor.setName(nickName);
            }
            if(!StringUtils.isEmpty(age)) counselor.setAge(age);

            if(!StringUtils.isEmpty(sign)) counselor.setSign(sign);

            if(!StringUtils.isEmpty(sex)) counselor.setSex(sex);

            if(!StringUtils.isEmpty(avatar)) counselor.setAvatar(avatar);

            user.setId(userInfoVo.getId());
            aclUserService.updateById(user);
            eduCounselorService.update(counselor, new QueryWrapper<EduCounselor>().eq("user_id", userInfoVo.getId()));

        } else if(userInfoVo.getIsListener()) {

            if(!StringUtils.isEmpty(nickName)) {
                user.setNickName(nickName);
                listener.setName(nickName);
            }
            if(!StringUtils.isEmpty(age)) listener.setAge(age);

            if(!StringUtils.isEmpty(sign)) listener.setSign(sign);

            if(!StringUtils.isEmpty(sex)) listener.setSex(sex);

            if(!StringUtils.isEmpty(avatar)) listener.setAvatar(avatar);

            user.setId(userInfoVo.getId());
            eduListenerService.update(listener, new QueryWrapper<EduListener>().eq("user_id", userInfoVo.getId()));
        }
    }
}


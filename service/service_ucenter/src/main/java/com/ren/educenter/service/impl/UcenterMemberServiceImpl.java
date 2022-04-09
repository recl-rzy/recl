package com.ren.educenter.service.impl;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.ren.commonutils.JwtUtils;
import com.ren.commonutils.MD5;
import com.ren.educenter.client.AclUserClient;
import com.ren.educenter.entity.AclUser;
import com.ren.educenter.entity.UcenterMember;
import com.ren.educenter.entity.vo.RegisterVo;
import com.ren.educenter.mapper.UcenterMemberMapper;
import com.ren.educenter.service.UcenterMemberService;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.ren.servicebase.exceptionhandler.ReclException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.redis.core.RedisTemplate;
import org.springframework.stereotype.Service;

/**
 * <p>
 * 服务实现类
 * </p>
 *
 * @author testjava
 * @since 2021-09-20
 */
@Service
public class UcenterMemberServiceImpl extends ServiceImpl<UcenterMemberMapper, UcenterMember> implements UcenterMemberService {

    @Autowired
    private RedisTemplate<String, String> redisTemplate;

    @Autowired
    private AclUserClient aclUserClient;

    @Override
    public String login(UcenterMember ucenterMember) {

        //获取登录手机号和密码
        String mobile = ucenterMember.getMobile();
        String password = ucenterMember.getPassword();

        //手机号密码非空验证
        if (mobile == null || password == null) {
            throw new ReclException(20001, "手机和密码不能为空");
        }
        //判断手机号是否正确
        QueryWrapper<UcenterMember> wrapper = new QueryWrapper<>();
        wrapper.eq("mobile", mobile);
        UcenterMember member = this.baseMapper.selectOne(wrapper);

        if (member == null) {

            AclUser aclUser = null;
            try {
                aclUser = aclUserClient.getAclUserByUsername(mobile);
//            throw new ReclException(20001, "手机号不存在");
                //密码判断（采用MD5加密方式）
                if (!MD5.encrypt(password).equals(aclUser.getPassword())) {
                    throw new ReclException(20001, "密码错误");
                }
            } catch (NullPointerException e) {
                throw new ReclException(20001, "用户不存在");
            }

            return JwtUtils.getJwtToken(aclUser.getId(), aclUser.getNickName());
        }

        //密码判断（采用MD5加密方式）
        if (!MD5.encrypt(password).equals(member.getPassword())) {
            throw new ReclException(20001, "密码错误");
        }

        if (member.getIsDisabled()) {
            throw new ReclException(20001, "账户已经被禁止登录");
        }

        String jwtToken = JwtUtils.getJwtToken(member.getId(), member.getNickName());
        return jwtToken;
    }

    @Override
    public void register(RegisterVo registerVo) {

        //获取注册数据
        String code = registerVo.getCode();
        String mobile = registerVo.getMobile();
        String nickName = registerVo.getNickName();
        String password = registerVo.getPassword();

        if (nickName == null) {
            throw new ReclException(20001, "请输入昵称");
        }

        if (mobile == null) {
            throw new ReclException(20001, "请输入手机号");
        }

        if (password == null) {
            throw new ReclException(20001, "请输入密码");
        }

        if (code == null) {
            throw new ReclException(20001, "请输入验证码");
        }

        String redisCode = redisTemplate.opsForValue().get(mobile);
        if (!code.equals(redisCode)) {
            throw new ReclException(20001, "请输入正确的验证码");
        }

        //手机号判断重复
        QueryWrapper<UcenterMember> wrapper = new QueryWrapper<>();
        wrapper.eq("mobile", mobile);
        Integer count = this.baseMapper.selectCount(wrapper);
        if (count > 0) {
            throw new ReclException(20001, "手机号已注册");
        }

        UcenterMember ucenterMember = new UcenterMember();
        ucenterMember.setMobile(mobile);
        ucenterMember.setNickName(nickName);
        ucenterMember.setPassword(MD5.encrypt(password));
        ucenterMember.setAvatar("beijing.aliyuncs.com/2021/08/10/9060f46f93984b5ca4d6c105d3f5a743file.png");
        int insert = this.baseMapper.insert(ucenterMember);
    }
}

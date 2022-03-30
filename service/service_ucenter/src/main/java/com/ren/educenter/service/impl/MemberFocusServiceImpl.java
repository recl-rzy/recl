package com.ren.educenter.service.impl;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.ren.commonutils.Result;
import com.ren.educenter.entity.MemberFocus;
import com.ren.educenter.mapper.MemberFocusMapper;
import com.ren.educenter.service.MemberFocusService;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import org.springframework.stereotype.Service;

/**
 * <p>
 * 服务实现类
 * </p>
 *
 * @author rzy
 * @since 2021-10-23
 */
@Service
public class MemberFocusServiceImpl extends ServiceImpl<MemberFocusMapper, MemberFocus> implements MemberFocusService {

    @Override
    public Result focusMember(MemberFocus memberFocus) {

        QueryWrapper<MemberFocus> wrapper = new QueryWrapper<>();
        wrapper.eq("user_id", memberFocus.getUserId());
        wrapper.eq("focus_user_id", memberFocus.getFocusUserId());
        MemberFocus focus = this.baseMapper.selectOne(wrapper);
        if (focus == null) {

            int insert = this.baseMapper.insert(memberFocus);
            if (insert > 0) {
                return Result.ok()
                        .data("focusStatus", true);
            } else {
                return Result.error();
            }
        } else {

            memberFocus.setFocusStatus(!focus.getFocusStatus());
            int update = this.baseMapper.update(memberFocus, wrapper);
            if (update > 0) {
                return Result.ok()
                        .data("focusStatus", memberFocus.getFocusStatus());
            } else {
                return Result.error();
            }
        }
    }
}

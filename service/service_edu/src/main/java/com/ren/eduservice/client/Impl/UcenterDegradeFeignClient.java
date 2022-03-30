package com.ren.eduservice.client.Impl;

import com.ren.eduservice.client.UcenterClient;
import com.ren.eduservice.entity.UcenterMember;
import org.springframework.stereotype.Component;

import java.util.List;

/**
 * @Description: TODO
 * @ClassName: UcenterDegradeFeignClient
 * @Project_Name: recl
 * @Author RZY
 * @Date: 2022/2/27 19:02
 * @Vertion: 2019.1
 */

@Component
public class UcenterDegradeFeignClient implements UcenterClient {


    @Override
    public UcenterMember getSingleUser(String id) {
        return null;
    }

    @Override
    public List<UcenterMember> getUsers(List<String> userIds) {
        return null;
    }

    @Override
    public int getPraiseCount(String id) {
        return 0;
    }


}


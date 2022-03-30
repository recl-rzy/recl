package com.ren.eduservice.entity.TestClassify;

import lombok.Data;

import java.util.ArrayList;
import java.util.List;

/**
 * @Description: TODO
 * @ClassName: OneClassify
 * @Project_Name: recl
 * @Author RZY
 * @Date: 2021/8/7 20:55
 * @Vertion: 2019.1
 */
@Data
public class OneClassify {

    private String id;

    private String title;

    List<TwoClassify> twoClassifies = new ArrayList<>();
}


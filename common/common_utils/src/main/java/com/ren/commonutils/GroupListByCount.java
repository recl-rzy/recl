package com.ren.commonutils;

import java.util.ArrayList;
import java.util.List;

/**
 * @Description: TODO
 * @ClassName: GroupListByCount
 * @Project_Name: recl
 * @Author RZY
 * @Date: 2022/3/3 19:03
 * @Vertion: 2019.1
 */

public class GroupListByCount {

    /**
     * List按个数分组
     *
     * @param list
     * @param quantity
     * @return
     */
    public static <T> List<List<T>> groupListByCount(List<T> list, int quantity) {
        List<List<T>> wrapList = new ArrayList<>();
        if (list == null || list.size() == 0) {
            return wrapList;
        }
        int count = 0;
        while (count < list.size()) {
            wrapList.add(list.subList(count, (count + quantity) > list.size() ? list.size() : (count + quantity)));
            count += quantity;
        }
        return wrapList;

    }

}


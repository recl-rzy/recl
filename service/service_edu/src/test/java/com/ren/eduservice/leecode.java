package com.ren.eduservice;

import org.junit.Test;
import sun.plugin.javascript.navig.LinkArray;

import java.util.ArrayList;
import java.util.List;

/**
 * @Description: TODO
 * @ClassName: leecode
 * @Project_Name: recl
 * @Author RZY
 * @Date: 2021/7/29 21:19
 * @Vertion: 2019.1
 */

public class leecode {

//    @Test
//    public ListNode addTwoNumbers(ListNode l1, ListNode l2) {
//        ListNode l3 = new ListNode(0);
//        ListNode cursor = l3;
//        int next = 0;
//        while (l1 !=null || l2 != null || next != 0){
//            int m = (l1 != null)? l1.val : 0;
//            int n = (l2 != null)? l2.val : 0;
//            int sum = m+n+next;
//            next = sum / 10;
//
//            ListNode sumval = new ListNode(sum%10);
//            cursor.next = sumval;
//            cursor = sumval;
//
//            if(l1 != null){
//
//                l1=l1.next;
//            }
//            if(l2 != null){
//
//                l2=l2.next;
//            }
//        }
//        return l3;
//    }

    public class ListNode {
        int val;
        ListNode next;

        ListNode() {
        }

        ListNode(int val) {
            this.val = val;
        }

        ListNode(int val, ListNode next) {
            this.val = val;
            this.next = next;
        }
    }

    @Test
    public void LongestString() {

        String s = "pwwkew";
        String[] arr = s.split("");
        int len = 0;
        for (int i = 0; i < arr.length - 1; i++)
            for (int j = i + 1; j < arr.length; j++) {

                System.out.println("i=" + i);
                if (s.substring(i, j).contains(arr[j])) {

                    break;
                } else {

                    len = (len < j - i + 1) ? j - i + 1 : len;
                    System.out.println(len);
                }
            }
        System.out.println(len);
    }

    @Test
    public void dpuble() {

        int[] nums1 = {1, 3};
        int[] nums2 = {2};
        int[] nums3 = new int[nums1.length + nums2.length];
        for (int i = 0; i < nums1.length; i++) {

            nums3[i] = nums1[i];
        }
        for (int i = 0; i < nums2.length; i++) {

            nums3[nums1.length + i] = nums2[i];
        }
        for (int i = 0; i < nums3.length - 1; i++)
            for (int j = 0; j < nums3.length - i - 1; j++) {
                int tep = 0;
                if (nums3[j + 1] > nums3[j]) {

                    tep = nums3[j + 1];
                    nums3[j + 1] = nums3[j];
                    nums3[j] = tep;
                }
            }

        for (int i = 0; i < nums3.length; i++) {
            System.out.println(nums3[i]);
        }
        if ((nums3.length + 1) % 2 != 0) {

            int a = (1 + nums3.length) / 2 - 1;
            System.out.println((nums3[a] + nums3[a + 1]) / 2.0);
        } else {

            System.out.println(nums3[(nums3.length - 1) / 2]);
        }
    }
}


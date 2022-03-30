package com.ren.servicebase.exceptionhandler;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

/**
 * @Description: TODO
 * @ClassName: ReclException
 * @Project_Name: recl
 * @Author RZY
 * @Date: 2021/7/13 13:23
 * @Vertion: 2019.1
 */

@Data
@AllArgsConstructor
@NoArgsConstructor
public class ReclException extends RuntimeException {

    private Integer code; //状态码

    private String message; //异常信息
}


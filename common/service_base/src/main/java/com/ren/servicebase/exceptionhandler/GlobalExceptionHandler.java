package com.ren.servicebase.exceptionhandler;

import com.ren.commonutils.Result;
import lombok.extern.slf4j.Slf4j;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.ResponseBody;

import java.sql.SQLIntegrityConstraintViolationException;

/**
 * @Description: TODO
 * @ClassName: GlobalExceptionHandler
 * @Project_Name: recl
 * @Author RZY
 * @Date: 2021/7/13 13:10
 * @Vertion: 2019.1
 */

@ControllerAdvice
@Slf4j
public class GlobalExceptionHandler {

    @ExceptionHandler(Exception.class)
    @ResponseBody
    public Result error(Exception e) {

        e.printStackTrace();
        log.error(e.getMessage());
        return Result.error().message("执行全局异常处理");
    }

    @ExceptionHandler(NullPointerException.class)
    @ResponseBody
    public Result error(NullPointerException e) {

        e.printStackTrace();
        log.error(e.getMessage());
        return Result.error().message("NullPointerException异常处理");
    }

    @ExceptionHandler(ArithmeticException.class)
    @ResponseBody
    public Result error(ArithmeticException e) {

        e.printStackTrace();
        log.error(e.getMessage());
        return Result.error().message("ArithmeticException异常处理");
    }

    @ExceptionHandler(ReclException.class)
    @ResponseBody
    public Result error(ReclException e) {

        System.out.println(e);
        log.error(e.getMessage());
        return Result.error()
                .code(e.getCode())
                .message(e.getMessage());
    }

    @ExceptionHandler(SQLIntegrityConstraintViolationException.class)
    @ResponseBody
    public void error(SQLIntegrityConstraintViolationException e) {
        e.printStackTrace();
        log.error(e.getMessage());
    }
}


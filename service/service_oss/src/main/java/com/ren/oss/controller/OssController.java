package com.ren.oss.controller;

import com.ren.commonutils.Result;
import com.ren.oss.service.OssService;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;

/**
 * @Description: TODO
 * @ClassName: OssController
 * @Project_Name: recl
 * @Author RZY
 * @Date: 2021/8/6 15:45
 * @Vertion: 2019.1
 */
@Api(tags = "aliyun文件上传")
@RestController
@RequestMapping("/eduoss/fileoss")
public class OssController {


    @Autowired
    OssService ossService;

    //TODO 头像上传

    @ApiOperation(value = "头像上传")
    @PostMapping("")
    public Result uploadOssFile(MultipartFile file) {

        //获取上传的头像
        String url = ossService.uploadFileAvatar(file);
        return Result.ok()
                .data("url", url);
    }

    @ApiOperation(value = "音频上传")
    @PostMapping("uploadMusic")
    public Result uploadOssMusicFile(MultipartFile file) {

        //获取上传的音频
        String url = ossService.uploadFileMusic(file);
        return Result.ok()
                .data("url", url);
    }
}


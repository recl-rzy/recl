package com.ren.oss.service;

import org.springframework.web.multipart.MultipartFile;

public interface OssService {
    String uploadFileAvatar(MultipartFile file);

    String uploadFileMusic(MultipartFile file);
}

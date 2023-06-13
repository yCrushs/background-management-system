package com.hzlx.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * @author 哈喽沃德
 * @version 1.0.0
 * @title EasyCaptchaService
 * @description <TODO description class purpose>
 * @createTime 2023/6/5 9:16
 **/
public interface EasyCaptchaService {
    /**
     * 获取验证码
     * @param request
     * @param response
     */
    void captcha(HttpServletRequest request, HttpServletResponse response);

    /**
     * 校验验证码
     * @param request
     * @return
     */
    String check(HttpServletRequest request);
}

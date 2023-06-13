package com.hzlx.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public interface BusinessInfoService {
    String getBusiness(HttpServletRequest request);

    /**
     * 用户登录的请求
     * @param request http 请求，用于获取用户提交的数据
     * @return json 字符串
     */
    String login(HttpServletRequest request);

    void getBusinessList(HttpServletRequest request);

    String editBusiness(HttpServletRequest request);

    String newBusiness(HttpServletRequest request);

    String qiyongBusinessInfoByid(HttpServletRequest request);

    String deleteBusiness(HttpServletRequest request);

    String syslogin(HttpServletRequest request);

    String busdeletebtn(HttpServletRequest request);
}

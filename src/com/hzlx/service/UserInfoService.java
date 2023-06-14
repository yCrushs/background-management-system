package com.hzlx.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

public interface UserInfoService {


    String getUser(HttpServletRequest request);

    /**
     * 用户登录的请求
     * @param request http 请求，用于获取用户提交的数据
     * @return json 字符串
     */
    String login(HttpServletRequest request);

    void getUserList(HttpServletRequest request);

    String editUser(HttpServletRequest request);

    String newUser(HttpServletRequest request,HttpServletResponse response);

    String qiyongUserInfoByid(HttpServletRequest request);

    String deleteUser(HttpServletRequest request);

    String userDeleteBtn(HttpServletRequest request);

    String UserInfoRegister(HttpServletRequest req);
}

package com.hzlx.service;

import javax.servlet.http.HttpServletRequest;

public interface RoleInfoService {
    void getRoleList(HttpServletRequest request);
    String getRole(HttpServletRequest request);

    String editMenu(HttpServletRequest request);

    String deleteRole(HttpServletRequest request);

    String qiyongRoleInfoByid(HttpServletRequest request);

    String newRole(HttpServletRequest request);

    String roleDeleteBtn(HttpServletRequest request);
}

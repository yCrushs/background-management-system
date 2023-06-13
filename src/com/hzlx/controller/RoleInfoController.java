package com.hzlx.controller;


import com.hzlx.annotation.Controller;
import com.hzlx.annotation.RequestMapping;
import com.hzlx.annotation.RequestParameter;
import com.hzlx.annotation.ResponseBody;
import com.hzlx.service.RoleInfoService;
import com.hzlx.service.impl.RoleInfoServiceImpl;

import javax.servlet.http.HttpServletRequest;

@Controller
@RequestMapping("/api/role")
public class RoleInfoController {
    private RoleInfoService roleInfoService=new RoleInfoServiceImpl();

    @RequestMapping("/roleList")
    @RequestParameter
    public String roleList(HttpServletRequest request){
        roleInfoService.getRoleList(request);
        return "pages/role_list";
    }

    @RequestMapping("/getRole")
    @ResponseBody
    @RequestParameter
    public String getRole(HttpServletRequest request){
        return roleInfoService.getRole(request);
    }

    @RequestMapping("/edit")
    @ResponseBody
    @RequestParameter
    public String edit(HttpServletRequest request){
        return roleInfoService.editMenu(request);
    }
    @RequestMapping("/deleteRole")
    @ResponseBody
    @RequestParameter
    public String deleteRole(HttpServletRequest request){
        return roleInfoService.deleteRole(request);
    }
    @RequestMapping("/roleDeleteBtn")
    @ResponseBody
    @RequestParameter
    public String roleDeleteBtn(HttpServletRequest request){
        return roleInfoService.roleDeleteBtn(request);
    }

    @RequestMapping("/change")
    @ResponseBody
    @RequestParameter
    public String changeId(HttpServletRequest request){
        return roleInfoService.qiyongRoleInfoByid(request);
    }

    @RequestMapping("/New")
    @ResponseBody
    @RequestParameter
    public String NewRole(HttpServletRequest request){
        return roleInfoService.newRole(request);
    }
}

package com.hzlx.controller;

import com.hzlx.annotation.*;
import com.hzlx.service.UserInfoService;
import com.hzlx.service.impl.UserInfoServiceImpl;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@Controller
@RequestMapping("/api/user")
public class UserInfoController {

    private UserInfoService userInfoService = new UserInfoServiceImpl();
    @RequestMapping("/userList")
    @RequestParameter
    public String userList(HttpServletRequest request){
        userInfoService.getUserList(request);
        return "pages/user_list";
    }

    @RequestMapping("/login")
    @ResponseBody
    @RequestParameter
    public String login(HttpServletRequest request){
        return userInfoService.login(request);
    }

    @RequestMapping("/getUser")
    @ResponseBody
    @RequestParameter
    public String getUser(HttpServletRequest request){
        return userInfoService.getUser(request);
    }

    @RequestMapping("/userDeleteBtn")
    @ResponseBody
    @RequestParameter
    public String userDeleteBtn(HttpServletRequest request){
        return userInfoService.userDeleteBtn(request);
    }

    @RequestMapping("/edit")
    @ResponseBody
    @RequestParameter
    public String edit(HttpServletRequest request){
        return userInfoService.editUser(request);
    }
    @RequestMapping("/New")
    @ResponseBody
    @HttpServlet
    public String NewUser(HttpServletRequest request,HttpServletResponse response){
        return userInfoService.newUser(request,response);
    }

    @RequestMapping("/register")
    @ResponseBody
    @RequestParameter
    public String register(HttpServletRequest req){
        return userInfoService.UserInfoRegister(req);
    }

    @RequestMapping("/change")
    @ResponseBody
    @RequestParameter
    public String changeId(HttpServletRequest request){
        return userInfoService.qiyongUserInfoByid(request);
    }
    @RequestMapping("/deleteUser")
    @ResponseBody
    @RequestParameter
    public String deleteUser(HttpServletRequest request){
        return userInfoService.deleteUser(request);
    }
}

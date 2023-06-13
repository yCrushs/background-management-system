package com.hzlx.controller;

import com.hzlx.annotation.Controller;
import com.hzlx.annotation.RequestMapping;
import com.hzlx.annotation.RequestParameter;
import com.hzlx.annotation.ResponseBody;
import com.hzlx.service.BusinessInfoService;
import com.hzlx.service.impl.BusinessInfoServiceImpl;

import javax.servlet.http.HttpServletRequest;


@Controller
@RequestMapping("/api/business")
public class BusinessInfoCtroller {
    private BusinessInfoService businessService = new BusinessInfoServiceImpl();
    @RequestMapping("/businessList")
    @RequestParameter
    public String userList(HttpServletRequest request){
        businessService.getBusinessList(request);
        return "pages/business_list";
    }

    @RequestMapping("/login")
    @ResponseBody
    @RequestParameter
    public String login(HttpServletRequest request){
        return businessService.login(request);
    }
    @RequestMapping("/showSyslogin")
    @ResponseBody
    @RequestParameter
    public String syslogin(HttpServletRequest request){
        return businessService.syslogin(request);
    }

    @RequestMapping("/getBusiness")
    @ResponseBody
    @RequestParameter
    public String getUser(HttpServletRequest request){
        return businessService.getBusiness(request);
    }

    @RequestMapping("/edit")
    @ResponseBody
    @RequestParameter
    public String edit(HttpServletRequest request){
        return businessService.editBusiness(request);
    }
    @RequestMapping("/New")
    @ResponseBody
    @RequestParameter
    public String NewUser(HttpServletRequest request){
        return businessService.newBusiness(request);
    }
    @RequestMapping("/change")
    @ResponseBody
    @RequestParameter
    public String changeId(HttpServletRequest request){
        return businessService.qiyongBusinessInfoByid(request);
    }
    @RequestMapping("/deleteBusiness")
    @ResponseBody
    @RequestParameter
    public String deleteUser(HttpServletRequest request){
        return businessService.deleteBusiness(request);
    }

    @RequestMapping("/busdeletebtn")
    @ResponseBody
    @RequestParameter
    public String deletebtn(HttpServletRequest request){
        return businessService.busdeletebtn(request);
    }
}

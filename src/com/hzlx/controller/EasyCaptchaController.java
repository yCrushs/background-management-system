package com.hzlx.controller;

import com.hzlx.annotation.*;
import com.hzlx.service.EasyCaptchaService;
import com.hzlx.service.impl.EasyCaptchaServiceImpl;
import com.wf.captcha.ArithmeticCaptcha;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@Controller
@RequestMapping("/api/captcha")
public class EasyCaptchaController {

    private EasyCaptchaService easyCaptchaService=new EasyCaptchaServiceImpl();
    @RequestMapping("/code")
    @HttpServlet
    public void captcha(HttpServletRequest request, HttpServletResponse response){
        easyCaptchaService.captcha(request,response);
    }

    @RequestMapping("/check")
    @RequestParameter
    @ResponseBody
    public String check(HttpServletRequest request){
        return easyCaptchaService.check(request);
    }
}

package com.hzlx.controller;

import com.hzlx.annotation.Controller;
import com.hzlx.annotation.RequestMapping;
import com.hzlx.annotation.RequestParameter;
import com.hzlx.annotation.ResponseBody;
import com.hzlx.service.MenuInfoService;
import com.hzlx.service.impl.MenuInfoServiceImpl;

import javax.servlet.http.HttpServletRequest;

@Controller
@RequestMapping("/api/menu")
public class MenuInfoController {
    private MenuInfoService menuInfoService = new MenuInfoServiceImpl();
    @RequestMapping("/showMenuTree")
    @RequestParameter
    public String showMenuTree(HttpServletRequest request){
        return menuInfoService.showMenu(request);
    }


    @RequestMapping("/menuList")
    @RequestParameter
    public String menuList(HttpServletRequest request){
        menuInfoService.getMenuList(request);
        return "pages/menu_list";
    }

    @RequestMapping("/getMenu")
    @ResponseBody
    @RequestParameter
    public String getMenu(HttpServletRequest request){
        return menuInfoService.getMenu(request);
    }

    @RequestMapping("/edit")
    @ResponseBody
    @RequestParameter
    public String edit(HttpServletRequest request){
        return menuInfoService.editMenu(request);
    }

    @RequestMapping("/deleteMenu")
    @ResponseBody
    @RequestParameter
    public String deleteMenu(HttpServletRequest request){
        return menuInfoService.deleteMenu(request);
    }
    @RequestMapping("/change")
    @ResponseBody
    @RequestParameter
    public String changeId(HttpServletRequest request){
        return menuInfoService.qiyongMenuInfoByid(request);
    }

    @RequestMapping("/New")
    @ResponseBody
    @RequestParameter
    public String NewMenu(HttpServletRequest request){
        return menuInfoService.newMenu(request);
    }



    @RequestMapping("/menudeletebtn")
    @ResponseBody
    @RequestParameter
    public String menudeletebtn(HttpServletRequest request){
        return menuInfoService.menudeletebtn(request);
    }
}

package com.hzlx.service.impl;


import com.hzlx.component.BgmsConfig;
import com.hzlx.dao.MenuInfoDao;
import com.hzlx.dao.impl.MenuInfoDaoImpl;
import com.hzlx.entity.MenuInfo;
import com.hzlx.entity.UserInfo;
import com.hzlx.entity.vo.MenuInfoVo;
import com.hzlx.service.MenuInfoService;
import com.hzlx.utils.BaseResult;

import javax.servlet.http.HttpServletRequest;
import java.util.ArrayList;
import java.util.List;

public class MenuInfoServiceImpl implements MenuInfoService {

    private MenuInfoDao menuInfoDao = new MenuInfoDaoImpl();

    @Override
    public String showMenu(HttpServletRequest request) {
        //获取session中的用户信息
        UserInfo userInfo = (UserInfo) request.getSession().getAttribute(BgmsConfig.SESSION_USER_KEY);
        //组装显示的菜单树
        List<MenuInfoVo> menuInfoVos = assemblyMenuTree(userInfo.getId());
        request.setAttribute(BgmsConfig.CACHE_MENU_LIST,menuInfoVos);
        request.getSession().setAttribute(BgmsConfig.CACHE_MENU_LIST,menuInfoVos);
        return "pages/home";
    }

    @Override
    public void getMenuList(HttpServletRequest request) {
       String keyword= request.getParameter("keyword");
        request.setAttribute(BgmsConfig.MENU_LIST,menuInfoDao.getMenuAll(keyword));
        request.setAttribute(BgmsConfig.FIRST_MENU,menuInfoDao.getMenuInfoByPid(-1));
        request.setAttribute(BgmsConfig.KEYWORD, keyword);
    }

    @Override
    public String getMenu(HttpServletRequest request) {
        //获取用户提交过来的 menuId
        Integer id = null;
        try {
            id = Integer.parseInt(request.getParameter("id"));
        } catch (NumberFormatException e) {
            e.printStackTrace();
            return BaseResult.error(20003,"参数异常");
        }
        if (id==null){
            return BaseResult.error(20001,"请求数据异常");
        }
        MenuInfo menuInfo= menuInfoDao.getMenuInfoById(id);
        return BaseResult.success(menuInfo);
    }

    @Override
    public String editMenu(HttpServletRequest request) {
        Integer id = Integer.parseInt(request.getParameter("id"));
        String title = request.getParameter("title");
        String icon = request.getParameter("icon");

        //TODO 参数校验  如果非空字段为空 给出错误提示
       int rows= menuInfoDao.updateMenuInfoById(id,title,icon);
       if (rows>0){
           return BaseResult.success();
       }else {
           return BaseResult.error(20002,"修改菜单失败");
       }

    }

    @Override
    public String deleteMenu(HttpServletRequest request) {
        Integer id = Integer.parseInt(request.getParameter("id"));
        //TODO 判空
       int rows= menuInfoDao.deleteMenuInfoById(id);
        if (rows>0){
            return BaseResult.success();
        }else {
            return BaseResult.error(20002,"删除菜单失败");
        }
    }

    @Override
    public String qiyongMenuInfoByid(HttpServletRequest request) {
        String id =request.getParameter("id");
        int rows=0;
        if (id.contains(",")){
            String[] split = id.split(",");
             rows=menuInfoDao.qiyongMenuInfoByid(split);
        }else {
            String[] str=new String[1];
            str[0]=id;
             rows=menuInfoDao.qiyongMenuInfoByid(str);
        }
        //TODO 判空

        if (rows>0){
            return BaseResult.success();
        }else {
            return BaseResult.error(20001,"启用失败");
        }
    }

    @Override
    public String newMenu(HttpServletRequest request) {
        String title = request.getParameter("title");
        String icon = request.getParameter("icon");
        String href = request.getParameter("href");
        String pId = request.getParameter("pid");
        //TODO 参数校验  如果非空字段为空 给出错误提示
        int rows= menuInfoDao.newMenuInfoById(title,icon,href,pId);
        if (rows>0){
            return BaseResult.success();
        }else {
            return BaseResult.error(20002,"新增菜单失败");
        }
    }

    @Override
    public String menudeletebtn(HttpServletRequest request) {
        String id =request.getParameter("id");
        int rows=0;
        if (id.contains(",")){
            String[] split = id.split(",");
            rows=menuInfoDao.deleteBtnMenuInfoById(split);
        }else {
            String[] str=new String[1];
            str[0]=id;
            rows=menuInfoDao.deleteBtnMenuInfoById(str);
        }
        //TODO 判空

        if (rows>0){
            return BaseResult.success();
        }else {
            return BaseResult.error(20001,"删除失败");
        }
    }


    private List<MenuInfoVo> assemblyMenuTree(Integer userId){
        List<MenuInfo> oneMenuList = menuInfoDao.getMenuInfoListByPid(userId,-1);
        List<MenuInfoVo> menuList = new ArrayList<>();
        //循环遍历一级菜单
        oneMenuList.forEach(menuInfo -> {
            MenuInfoVo menuInfoVo= menuInfoConvertMenuInfoVo(menuInfo);
            menuInfoVo.setList(menuInfoDao.getMenuInfoListByPid(userId, menuInfoVo.getId()));
            menuList.add(menuInfoVo);
        });
        return menuList;
    }

    /**
     * 将menuinfo 转化为MenuInfoVo
     * @return
     */
    private MenuInfoVo menuInfoConvertMenuInfoVo(MenuInfo menuInfo) {
        MenuInfoVo menuInfoVo = new MenuInfoVo();
        menuInfoVo.setId(menuInfo.getId());
        menuInfoVo.setTitle(menuInfo.getTitle());
        menuInfoVo.setIcon(menuInfo.getIcon());
        menuInfoVo.setHref(menuInfo.getHref());
        menuInfoVo.setPId(menuInfo.getPId());
        menuInfoVo.setCreateTime(menuInfo.getCreateTime());
        menuInfoVo.setStatus(menuInfo.getStatus());
        return menuInfoVo;

    }

}

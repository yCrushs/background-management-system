package com.hzlx.service.impl;

import com.hzlx.component.BgmsConfig;
import com.hzlx.dao.RoleInfoDao;
import com.hzlx.dao.impl.RoleInfoDaoImpl;
import com.hzlx.entity.MenuInfo;
import com.hzlx.entity.RoleInfo;
import com.hzlx.service.RoleInfoService;
import com.hzlx.utils.BaseResult;

import javax.servlet.http.HttpServletRequest;

public class RoleInfoServiceImpl implements RoleInfoService {
    private RoleInfoDao roleInfoDao=new RoleInfoDaoImpl();
    @Override
    public void getRoleList(HttpServletRequest request ) {
        //获取前段传过来的RoleName
        String keyword= request.getParameter(BgmsConfig.KEYWORD);
        request.setAttribute(BgmsConfig.KEYWORD,keyword);
        request.setAttribute(BgmsConfig.ROLE_LIST,roleInfoDao.getRoleInfoListByName(keyword));
    }

    @Override
    public String getRole(HttpServletRequest request) {
        //获取用户提交过来的 roleId
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
        RoleInfo roleInfo= roleInfoDao.getRoleInfoById(id);
        return BaseResult.success(roleInfo);
    }

    @Override
    public String editMenu(HttpServletRequest request) {
        Integer id = Integer.parseInt(request.getParameter("id"));
        String name = request.getParameter("name");

        //TODO 参数校验  如果非空字段为空 给出错误提示
        int rows= roleInfoDao.updateRoleInfoById(id,name);
        if (rows>0){
            return BaseResult.success();
        }else {
            return BaseResult.error(20002,"修改菜单失败");
        }
    }

    @Override
    public String deleteRole(HttpServletRequest request) {
        Integer id = Integer.parseInt(request.getParameter("id"));
        //TODO 判空
        int rows= roleInfoDao.deleteRoleInfoById(id);
        if (rows>0){
            return BaseResult.success();
        }else {
            return BaseResult.error(20002,"删除菜单失败");
        }
    }

    @Override
    public String qiyongRoleInfoByid(HttpServletRequest request) {
        String id =request.getParameter("id");
        int rows=0;
        if (id.contains(",")){
            String[] split = id.split(",");
            rows=roleInfoDao.qiyongRoleInfoByid(split);
        }else {
            String[] str=new String[1];
            str[0]=id;
            rows=roleInfoDao.qiyongRoleInfoByid(str);
        }
        //TODO 判空

        if (rows>0){
            return BaseResult.success();
        }else {
            return BaseResult.error(20001,"启用失败");
        }
    }

    @Override
    public String newRole(HttpServletRequest request) {
        String name = request.getParameter("name");
        //TODO 参数校验  如果非空字段为空 给出错误提示
        int rows= roleInfoDao.newRoleInfoByName(name);
        if (rows>0){
            return BaseResult.success();
        }else {
            return BaseResult.error(20002,"新增菜单失败");
        }
    }

    @Override
    public String roleDeleteBtn(HttpServletRequest request) {
        String id =request.getParameter("id");
        int rows=0;
        if (id.contains(",")){
            String[] split = id.split(",");
            rows=roleInfoDao.roleDeleteBtnByid(split);
        }else {
            String[] str=new String[1];
            str[0]=id;
            rows=roleInfoDao.roleDeleteBtnByid(str);
        }
        //TODO 判空

        if (rows>0){
            return BaseResult.success();
        }else {
            return BaseResult.error(20001,"删除失败");
        }
    }
}

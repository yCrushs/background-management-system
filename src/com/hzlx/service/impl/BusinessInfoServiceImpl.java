package com.hzlx.service.impl;

import com.hzlx.component.BgmsConfig;
import com.hzlx.dao.BusinessInfoDao;
import com.hzlx.dao.SysRegionDao;
import com.hzlx.dao.impl.BusinessInfoDaoImpl;
import com.hzlx.dao.impl.SysRegionDaoImpl;
import com.hzlx.entity.BusinessInfo;
import com.hzlx.entity.SysRegion;
import com.hzlx.service.BusinessInfoService;
import com.hzlx.utils.BaseResult;
import com.hzlx.utils.MD5Utils;
import com.mysql.cj.util.StringUtils;

import javax.servlet.http.HttpServletRequest;
import java.util.List;

public class BusinessInfoServiceImpl implements BusinessInfoService {
    //引入dao层，用户查询数据库
    private BusinessInfoDao businessInfoDao= new BusinessInfoDaoImpl();

    @Override
    public String getBusiness(HttpServletRequest request) {
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
        BusinessInfo businessInfo = businessInfoDao.getBusinessInfoById(id);
        return BaseResult.success(businessInfo);
    }

    @Override
    public String login(HttpServletRequest request) {
        //从请求中获取用户名和密码
        String userName = request.getParameter("userName");
        String password = request.getParameter("password");
        //用户名和密码做非空校验
        if (StringUtils.isNullOrEmpty(userName)|| StringUtils.isNullOrEmpty(password)){
            return BaseResult.error(10001,"用户名或者密码不能为空");
        }
        //给密码加密
        String encryptPwd =  MD5Utils.encryptMD5(password,userName);
        //拿加密后的密码和用户名去数据库里查询用户信息;
        BusinessInfo businessInfo = businessInfoDao.getBusinessInfoByUserNameAndPassword(userName, encryptPwd);
        //如果查询到的 userInfo 为空，则说明用户名和密码不存在，判定为账号或密码错误;
        if (businessInfo==null) {
            return BaseResult.error(10002, "账号或密码错误");
        }
        //用户名登录成功之后，把用户名信息存储下来放到 session作用域中，用户名后续使用
        request.getSession().setAttribute(BgmsConfig.SESSION_USER_KEY,businessInfo);
        return BaseResult.success();
    }

    @Override
    public void getBusinessList(HttpServletRequest request) {
        List<BusinessInfo> BusinessInfoAll = businessInfoDao.getBusinessInfoAll();
        request.getSession().setAttribute(BgmsConfig.BUSINESS_LIST,BusinessInfoAll);
        //获取前段传过来的UserName
        String keyword= request.getParameter(BgmsConfig.KEYWORD);
        request.setAttribute(BgmsConfig.KEYWORD,keyword);
        request.setAttribute(BgmsConfig.BUSINESS_LIST,businessInfoDao.getBusinessInfoListByName(keyword));
    }

    @Override
    public String editBusiness(HttpServletRequest request) {
        Integer id = Integer.parseInt(request.getParameter("id"));
        String name = request.getParameter("name");
        String address = request.getParameter("address");
        Integer status = Integer.parseInt(request.getParameter("status"));

        //TODO 参数校验  如果非空字段为空 给出错误提示
        int rows= businessInfoDao.updateBusinessInfoById(id,name,address,status);
        if (rows>0){
            return BaseResult.success();
        }else {
            return BaseResult.error(20002,"修改菜单失败");
        }
    }

    @Override
    public String newBusiness(HttpServletRequest request) {
        String userName = request.getParameter("username");
        String password = MD5Utils.encryptMD5(request.getParameter("password"), userName);
        String name = request.getParameter("nickname");
        String address = request.getParameter("address");
        Integer statu=0;
        //TODO 参数校验  如果非空字段为空 给出错误提示
        int rows = businessInfoDao.newBusinessInfoByName(userName,password,name,address,statu);
        if (rows>0){
            return BaseResult.success();
        }else {
            return BaseResult.error(20002,"新增菜单失败");
        }
    }

    @Override
    public String qiyongBusinessInfoByid(HttpServletRequest request) {
        String id =request.getParameter("id");
        int rows=0;
        if (id.contains(",")){
            String[] split = id.split(",");
            rows=businessInfoDao.qiyongBusinessInfoByid(split);
        }else {
            String[] str=new String[1];
            str[0]=id;
            rows=businessInfoDao.qiyongBusinessInfoByid(str);
        }
        //TODO 判空

        if (rows>0){
            return BaseResult.success();
        }else {
            return BaseResult.error(20001,"启用失败");
        }
    }

    @Override
    public String deleteBusiness(HttpServletRequest request) {
        Integer id = Integer.parseInt(request.getParameter("id"));
        //TODO 判空
        int rows= businessInfoDao.deleteBusinessInfoById(id);
        if (rows>0){
            return BaseResult.success();
        }else {
            return BaseResult.error(20002,"删除菜单失败");
        }
    }

    @Override
    public String syslogin(HttpServletRequest req) {

        String pid = req.getParameter("pid");

        if (StringUtils.isNullOrEmpty(pid)) {
            return BaseResult.error(2001,"请求参数错误");
        }else {
            SysRegionDao sysRegionDao=new SysRegionDaoImpl();
            List<SysRegion> list =sysRegionDao.getSysRegionByPid(pid);
            return BaseResult.success(list);
        }

    }

    @Override
    public String busdeletebtn(HttpServletRequest request) {
        String id =request.getParameter("id");
        int rows=0;
        if (id.contains(",")){
            String[] split = id.split(",");
            rows=businessInfoDao.deleteBusinessInfoByid(split);
        }else {
            String[] str=new String[1];
            str[0]=id;
            rows=businessInfoDao.deleteBusinessInfoByid(str);
        }
        //TODO 判空

        if (rows>0){
            return BaseResult.success();
        }else {
            return BaseResult.error(20001,"删除失败");
        }
    }
}

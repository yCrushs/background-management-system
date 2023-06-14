package com.hzlx.service.impl;

import com.hzlx.component.BgmsConfig;
import com.hzlx.dao.UserInfoDao;
import com.hzlx.dao.impl.UserInfoDaoImpl;
import com.hzlx.entity.UserInfo;
import com.hzlx.service.UserInfoService;
import com.hzlx.utils.BaseDao;
import com.hzlx.utils.BaseResult;
import com.hzlx.utils.MD5Utils;
import com.mysql.cj.util.StringUtils;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;
import java.util.Map;

public class UserInfoServiceImpl extends BaseDao implements UserInfoService {

    //引入dao层，用户查询数据库
    private UserInfoDao userInfoDao= new UserInfoDaoImpl();

    @Override
    public String getUser(HttpServletRequest request) {
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
        UserInfo userInfo= userInfoDao.getUserInfoById(id);
        return BaseResult.success(userInfo);
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
        UserInfo userInfo = userInfoDao.getUserInfoByUserNameAndPassword(userName, encryptPwd);
        //如果查询到的 userInfo 为空，则说明用户名和密码不存在，判定为账号或密码错误;
        if (userInfo==null) {
            return BaseResult.error(10002, "账号或密码错误");
        }
        //用户名登录成功之后，把用户名信息存储下来放到 session作用域中，用户名后续使用
        request.getSession().setAttribute(BgmsConfig.SESSION_USER_KEY,userInfo);
        return BaseResult.success();
    }

    @Override
    public void getUserList(HttpServletRequest request) {
        List<UserInfo> userInfoAll = userInfoDao.getUserInfoAll();
        request.getSession().setAttribute(BgmsConfig.USER_LIST,userInfoAll);
        //获取前段传过来的UserName
        String keyword= request.getParameter(BgmsConfig.KEYWORD);
        request.setAttribute(BgmsConfig.KEYWORD,keyword);
        request.setAttribute(BgmsConfig.USER_LIST,userInfoDao.getUserInfoListByName(keyword));
    }

    @Override
    public String editUser(HttpServletRequest request) {
        Integer id = Integer.parseInt(request.getParameter("id"));
        String nickName = request.getParameter("nickname");
        String tel = request.getParameter("tel");
        String address = request.getParameter("address");
        Integer sex = Integer.valueOf(request.getParameter("sex"));

        //TODO 参数校验  如果非空字段为空 给出错误提示
        int rows= userInfoDao.updateUserInfoById(id,nickName,tel,address,sex);
        if (rows>0){
            return BaseResult.success();
        }else {
            return BaseResult.error(20002,"修改菜单失败");
        }
    }

    @Override
    public String newUser(HttpServletRequest req,HttpServletResponse resp) {
        String userName = req.getParameter("username");
        resp.setContentType("text/html;charset=utf-8");

        String sql="select count(1) AS cont from t_user_info where user_name=?";
        Map<String, Object> map = selectOneForMap(sql, userName);

        Integer countNum = Integer.parseInt(map.get("cont").toString());
        if (countNum>0){
            try {
                resp.getWriter().write (BaseResult.error(305,"用户名重复"));
                return "";
            } catch (IOException e) {
                throw new RuntimeException(e);
            }
        }

        String password = MD5Utils.encryptMD5(req.getParameter("password"), userName);
        String nickName = req.getParameter("nickName");
        String tel = req.getParameter("tel");
        String address = req.getParameter("address");
        Integer sex =Integer.parseInt(req.getParameter("sex")) ;
        //TODO 参数校验  如果非空字段为空 给出错误提示
        int rows= userInfoDao.newUserInfoByName(userName,password,nickName,tel,address,sex);
        if (rows>0){
            try {
                resp.getWriter().write ( BaseResult.success());
                return "";
            } catch (IOException e) {
                throw new RuntimeException(e);
            }
        }else {
            try {
                resp.getWriter().write ( BaseResult.error(20002,"新增菜单失败"));
                return "";
            } catch (IOException e) {
                throw new RuntimeException(e);
            }

        }
    }

    @Override
    public String qiyongUserInfoByid(HttpServletRequest request) {
        String id =request.getParameter("id");
        int rows=0;
        if (id.contains(",")){
            String[] split = id.split(",");
            rows=userInfoDao.qiyongUserInfoByid(split);
        }else {
            String[] str=new String[1];
            str[0]=id;
            rows=userInfoDao.qiyongUserInfoByid(str);
        }
        //TODO 判空

        if (rows>0){
            return BaseResult.success();
        }else {
            return BaseResult.error(20001,"启用失败");
        }
    }

    @Override
    public String deleteUser(HttpServletRequest request) {
        Integer id = Integer.parseInt(request.getParameter("id"));
        //TODO 判空
        int rows= userInfoDao.deleteUserInfoById(id);
        if (rows>0){
            return BaseResult.success();
        }else {
            return BaseResult.error(20002,"删除菜单失败");
        }
    }

    @Override
    public String userDeleteBtn(HttpServletRequest request) {
        String id =request.getParameter("id");
        int rows=0;
        if (id.contains(",")){
            String[] split = id.split(",");
            rows=userInfoDao.deleteUserInfoBtn(split);
        }else {
            String[] str=new String[1];
            str[0]=id;
            rows=userInfoDao.deleteUserInfoBtn(str);
        }
        //TODO 判空

        if (rows>0){
            return BaseResult.success();
        }else {
            return BaseResult.error(20001,"删除失败");
        }
    }

    @Override
    public String UserInfoRegister(HttpServletRequest req){
        String userName = req.getParameter("username");

        String sql="select count(1) AS cont from t_user_info where user_name=?";
        Map<String, Object> map = selectOneForMap(sql, userName);

        Integer countNum = Integer.parseInt(map.get("cont").toString());
        if (countNum>0){
                return BaseResult.error(305,"用户名重复了");
        }

        String password = MD5Utils.encryptMD5(req.getParameter("password"), userName);
        String nickName = req.getParameter("nickname");
        String tel = req.getParameter("tel");
        String address = req.getParameter("address");
        Integer sex =Integer.parseInt(req.getParameter("sex")) ;
        //TODO 参数校验  如果非空字段为空 给出错误提示
        int rows= userInfoDao.newUserInfoByName(userName,password,nickName,tel,address,sex);
        if (rows>0){
            return BaseResult.success();
        }else {
            return BaseResult.error(305,"注册失败");
        }
    }
}

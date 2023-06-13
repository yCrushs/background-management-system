package com.hzlx.dao.impl;


import com.hzlx.dao.UserInfoDao;
import com.hzlx.entity.RoleInfo;
import com.hzlx.entity.UserInfo;
import com.hzlx.utils.BaseDao;
import com.hzlx.utils.BaseResult;
import com.mysql.cj.util.StringUtils;

import java.util.List;

public class UserInfoDaoImpl extends BaseDao<UserInfo> implements UserInfoDao {

    @Override
    public UserInfo getUserInfoByUserNameAndPassword(String userName, String password) {
        String sql="select * from t_user_info where user_name=? and `password`=?";
        return selectOne(sql, UserInfo.class,userName,password);
    }

    @Override
    public UserInfo getUserInfoById(Integer id) {
        String sql = "select * from t_user_info where id=?";
        return selectOne(sql, UserInfo.class, id);
    }

    @Override
    public List<UserInfo> getUserInfoListByName(String name) {
        String sql = "select * from t_user_info ";
        if (!StringUtils.isNullOrEmpty(name)){
            sql+=" where user_name like concat('%',?,'%')";
            return selectListForObject(sql, UserInfo.class,name);
        }
        return selectListForObject(sql, UserInfo.class);
    }

    @Override
    public int updateUserInfoById(Integer id, String nick_name,String tel,String address ,Integer sex) {
        String sql = "update t_user_info set nick_name=?,tel=?,address=?,sex=?  where id=?";
        return executeUpdate(sql, nick_name,tel,address,sex,id);
    }

    @Override
    public int newUserInfoByName(String userName,String password,String nickName,String tel,String address ,Integer sex) {
        String sql="insert into t_user_info values (default,?,?,?,?,?,?,default,now(),default)";
        return executeUpdate(sql,userName,password,nickName,tel,address,sex);
    }

    @Override
    public int qiyongUserInfoByid(String[] id) {
        StringBuilder sql=new StringBuilder("update t_user_info set `status`=1 where ");
        for (String s : id) {
            sql.append(" id=? or ");
        }
        String sql1=sql.substring(0,sql.length()-3);
        return executeUpdate(sql1,id);
    }

    @Override
    public int deleteUserInfoById(Integer id) {
        String sql = "update t_user_info set `status`=0 where id=?";
        return executeUpdate(sql,id);
    }

    @Override
    public List<UserInfo> getUserInfoAll() {
        return selectListForObject("select * from t_user_info",UserInfo.class);
    }

    @Override
    public int deleteUserInfoBtn(String[] id) {
        StringBuilder sql=new StringBuilder("update t_user_info set `status`=0 where ");
        for (String s : id) {
            sql.append(" id=? or ");
        }
        String sql1=sql.substring(0,sql.length()-3);
        return executeUpdate(sql1,id);
    }
}
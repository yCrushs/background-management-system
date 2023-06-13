package com.hzlx.dao;

import com.hzlx.entity.RoleInfo;
import com.hzlx.entity.UserInfo;

import java.util.List;


public interface UserInfoDao {

    /**
     * 根据用户名和密码  查询用户信息
     * @param userName 用户名
     * @param password 密码
     * @return 用户对象
     */
    UserInfo getUserInfoByUserNameAndPassword(String userName , String password);

    UserInfo getUserInfoById(Integer id);

    List<UserInfo> getUserInfoListByName(String name);

    int updateUserInfoById(Integer id, String nick_name,String tel,String address ,Integer sex);

    int newUserInfoByName(String userName,String password,String nickName,String tel,String address ,Integer sex);

    int qiyongUserInfoByid(String[] id);

    int deleteUserInfoById(Integer id);

    List<UserInfo> getUserInfoAll();

    int deleteUserInfoBtn(String[] id);
}

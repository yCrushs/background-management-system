package com.hzlx.dao;

import com.hzlx.entity.MenuInfo;
import com.hzlx.entity.RoleInfo;

import java.util.List;
import java.util.Map;

public interface RoleInfoDao {

    List<Map<String,Object>> getRoleAll(String keyword);

    List<RoleInfo> getRoleInfoListByName(String name);

    RoleInfo getRoleInfoById(Integer id);

    int updateRoleInfoById(Integer id, String name);

    int deleteRoleInfoById(Integer id);

    int qiyongRoleInfoByid(String[] id);

    int newRoleInfoByName(String name);

    int roleDeleteBtnByid(String[] id);
}

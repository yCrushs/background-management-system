package com.hzlx.dao.impl;

import com.hzlx.dao.RoleInfoDao;
import com.hzlx.entity.MenuInfo;
import com.hzlx.entity.RoleInfo;
import com.hzlx.utils.BaseDao;
import com.mysql.cj.util.StringUtils;

import java.util.List;
import java.util.Map;

public class RoleInfoDaoImpl extends BaseDao<RoleInfo> implements RoleInfoDao {
    @Override
    public List<Map<String, Object>> getRoleAll(String keyword) {
        String sql = "SELECT tmi1.*,tmi2.title as pName\n" +
                "FROM t_menu_info tmi1 \n" +
                "LEFT JOIN t_menu_info tmi2 on tmi2.id =tmi1.p_id";
        if (!StringUtils.isNullOrEmpty(keyword)){
            sql+=" where tmi1.title like concat('%',?,'%')";
            return selectListForMap(sql,keyword);
        }
        return selectListForMap(sql);
    }

    @Override
    public List<RoleInfo> getRoleInfoListByName(String name) {
        String sql = "select * from t_role_info ";
        if (!StringUtils.isNullOrEmpty(name)){
            sql+=" where name like concat('%',?,'%')";
            return selectListForObject(sql, RoleInfo.class,name);
        }
        return selectListForObject(sql, RoleInfo.class);
    }

    @Override
    public RoleInfo getRoleInfoById(Integer id) {
        String sql = "select * from t_role_info where id=?";
        return selectOne(sql, RoleInfo.class, id);
    }


    @Override
    public int updateRoleInfoById(Integer id, String name) {
        String sql = "update t_role_info set name=? where id=?";
        return executeUpdate(sql, name,id);
    }

    @Override
    public int deleteRoleInfoById(Integer id) {
        String sql = "update t_role_info set `status`=0 where id=?";
        return executeUpdate(sql,id);
    }

    @Override
    public int qiyongRoleInfoByid(String[] id) {
        StringBuilder sql=new StringBuilder("update t_role_info set `status`=1 where ");
        for (String s : id) {
            sql.append(" id=? or ");
        }
        String sql1=sql.substring(0,sql.length()-3);
        return executeUpdate(sql1,id);
    }

    @Override
    public int newRoleInfoByName(String name) {
        String sql="insert into t_role_info(id, name, create_time, status) \n" +
                "VALUES(default,?,now(),default) ";
        return executeUpdate(sql,name);
    }

    @Override
    public int roleDeleteBtnByid(String[] id) {
        StringBuilder sql=new StringBuilder("update t_role_info set `status`=0 where ");
        for (String s : id) {
            sql.append(" id=? or ");
        }
        String sql1=sql.substring(0,sql.length()-3);
        return executeUpdate(sql1,id);
    }

}

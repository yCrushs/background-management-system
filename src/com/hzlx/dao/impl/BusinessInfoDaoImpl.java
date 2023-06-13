package com.hzlx.dao.impl;

import com.hzlx.dao.BusinessInfoDao;
import com.hzlx.entity.BusinessInfo;
import com.hzlx.entity.UserInfo;
import com.hzlx.utils.BaseDao;
import com.mysql.cj.util.StringUtils;

import java.util.List;

public class BusinessInfoDaoImpl extends BaseDao<BusinessInfo> implements BusinessInfoDao {

    @Override
    public BusinessInfo getBusinessInfoById(Integer id) {
        String sql = "select * from t_business_info where id=?";
        return selectOne(sql, BusinessInfo.class, id);
    }

    @Override
    public BusinessInfo getBusinessInfoByUserNameAndPassword(String userName, String passowrd) {
        String sql="select * from t_business_info where user_name=? and `password`=?";
        return selectOne(sql, UserInfo.class,userName,passowrd);
    }

    @Override
    public List<BusinessInfo> getBusinessInfoAll() {
        return selectListForObject("select * from t_business_info",BusinessInfo.class);
    }

    @Override
    public List<BusinessInfo> getBusinessInfoListByName(String name) {
        String sql = "select * from t_business_info";
        if (!StringUtils.isNullOrEmpty(name)){
            sql+=" where name like concat('%',?,'%')";
            return selectListForObject(sql, BusinessInfo.class,name);
        }
        return selectListForObject(sql, BusinessInfo.class);
    }

    @Override
    public int updateBusinessInfoById(Integer id, String name,String address,Integer status) {
        String sql = "update t_business_info set name=?,address=?,status=? where id=?";
        return executeUpdate(sql, name,address,status,id);
    }

    @Override
    public int newBusinessInfoByName(String userName, String password, String name,String address,Integer status) {
        String sql="insert into t_business_info values (default,?,?,?,?,now(),?)";
        return executeUpdate(sql,name,userName,password,address,status);
    }

    @Override
    public int qiyongBusinessInfoByid(String[] id) {
        StringBuilder sql=new StringBuilder("update t_business_info set `status`=1 where ");
        for (String s : id) {
            sql.append(" id=? or ");
        }
        String sql1=sql.substring(0,sql.length()-3);
        return executeUpdate(sql1,id);
    }

    @Override
    public int deleteBusinessInfoById(Integer id) {
        String sql = "update t_business_info set `status`=0 where id=?";
        return executeUpdate(sql,id);
    }

    @Override
    public int deleteBusinessInfoByid(String[] id) {
        StringBuilder sql=new StringBuilder("update t_business_info set `status`=0 where ");
        for (String s : id) {
            sql.append(" id=? or ");
        }
        String sql1=sql.substring(0,sql.length()-3);
        return executeUpdate(sql1,id);
    }
}

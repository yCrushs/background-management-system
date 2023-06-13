package com.hzlx.dao;

import com.hzlx.entity.BusinessInfo;
import com.hzlx.entity.UserInfo;

import java.util.List;

public interface BusinessInfoDao {
    BusinessInfo getBusinessInfoById(Integer id);

    BusinessInfo getBusinessInfoByUserNameAndPassword(String userName, String password);

    List<BusinessInfo> getBusinessInfoAll();

    List<BusinessInfo> getBusinessInfoListByName(String name);

    int updateBusinessInfoById(Integer id, String name,String address,Integer status);

    int newBusinessInfoByName(String userName, String password, String name,  String address,Integer status);

    int qiyongBusinessInfoByid(String[] id);

    int deleteBusinessInfoById(Integer id);

    int deleteBusinessInfoByid(String[] id);
}

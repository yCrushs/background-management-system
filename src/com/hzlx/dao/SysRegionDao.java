package com.hzlx.dao;

import com.hzlx.entity.SysRegion;

import java.util.List;

public interface SysRegionDao {
    List<SysRegion> getSysRegionByPid(String pid);

    //查询主记录数
    Integer countAll();

    //分页查询的主要核心
    List<SysRegion> getSysRegions(Integer startIndex, Integer pageSize);
}

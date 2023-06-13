package com.hzlx.dao.impl;

import com.hzlx.dao.SysRegionDao;
import com.hzlx.entity.SysRegion;
import com.hzlx.utils.BaseDao;

import java.util.List;
import java.util.Map;

public class SysRegionDaoImpl extends BaseDao<SysRegion> implements SysRegionDao {
    @Override
    public List<SysRegion> getSysRegionByPid(String pid) {

        return selectListForObject("select * from sys_region where region_parent_id=?", SysRegion.class,pid);

    }

    @Override
    public Integer countAll() {
        String sql="select count(1) as count from sys_region ";
        Map<String, Object> map = selectOneForMap(sql);
        String count = map.get("count").toString();
        return Integer.parseInt(count);
    }

    @Override
    public List<SysRegion> getSysRegions(Integer startIndex, Integer pageSize) {
        String sql="select * from sys_region limit ?,?";
        return selectListForObject(sql, SysRegion.class,startIndex,pageSize);
    }
}

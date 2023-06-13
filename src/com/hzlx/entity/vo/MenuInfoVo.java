package com.hzlx.entity.vo;

import com.hzlx.entity.MenuInfo;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.io.Serializable;
import java.util.List;

//@Data
//@AllArgsConstructor
//@NoArgsConstructor
public class MenuInfoVo extends MenuInfo implements Serializable {
    private List<MenuInfo> list;


    public MenuInfoVo() {
    }

    public MenuInfoVo(List<MenuInfo> list) {
        this.list = list;
    }

    /**
     * 获取
     * @return list
     */
    public List<MenuInfo> getList() {
        return list;
    }

    /**
     * 设置
     * @param list
     */
    public void setList(List<MenuInfo> list) {
        this.list = list;
    }

    public String toString() {
        return "MenuInfoVo{list = " + list + "}";
    }
}

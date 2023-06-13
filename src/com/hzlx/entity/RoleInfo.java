package com.hzlx.entity;

import java.io.Serializable;
import java.util.Date;

public class RoleInfo implements Serializable {
    private Integer id;
    private String name;
    private Date createTime;
    private Integer status;

    public RoleInfo() {
    }

    public RoleInfo(Integer id, String name, Date createTime, Integer status) {
        this.id = id;
        this.name = name;
        this.createTime = createTime;
        this.status = status;
    }

    /**
     * 获取
     * @return id
     */
    public Integer getId() {
        return id;
    }

    /**
     * 设置
     * @param id
     */
    public void setId(Integer id) {
        this.id = id;
    }

    /**
     * 获取
     * @return name
     */
    public String getName() {
        return name;
    }

    /**
     * 设置
     * @param name
     */
    public void setName(String name) {
        this.name = name;
    }

    /**
     * 获取
     * @return createTime
     */
    public Date getCreateTime() {
        return createTime;
    }

    /**
     * 设置
     * @param createTime
     */
    public void setCreateTime(Date createTime) {
        this.createTime = createTime;
    }

    /**
     * 获取
     * @return status
     */
    public Integer getStatus() {
        return status;
    }

    /**
     * 设置
     * @param status
     */
    public void setStatus(Integer status) {
        this.status = status;
    }

    public String toString() {
        return "RoleInfo{id = " + id + ", name = " + name + ", createTime = " + createTime + ", status = " + status + "}";
    }
}

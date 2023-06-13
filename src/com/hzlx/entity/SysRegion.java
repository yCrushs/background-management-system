package com.hzlx.entity;

public class SysRegion {
    private String regionId;
    private String regionName;
    private String regionShortName;
    private String regionCode;
    private String regionParentId;
    private Integer regionLevel;


    public SysRegion() {
    }

    public SysRegion(String regionId, String regionName, String regionShortName, String regionCode, String regionParentId, Integer regionLevel) {
        this.regionId = regionId;
        this.regionName = regionName;
        this.regionShortName = regionShortName;
        this.regionCode = regionCode;
        this.regionParentId = regionParentId;
        this.regionLevel = regionLevel;
    }

    /**
     * 获取
     * @return regionId
     */
    public String getRegionId() {
        return regionId;
    }

    /**
     * 设置
     * @param regionId
     */
    public void setRegionId(String regionId) {
        this.regionId = regionId;
    }

    /**
     * 获取
     * @return regionName
     */
    public String getRegionName() {
        return regionName;
    }

    /**
     * 设置
     * @param regionName
     */
    public void setRegionName(String regionName) {
        this.regionName = regionName;
    }

    /**
     * 获取
     * @return regionShortName
     */
    public String getRegionShortName() {
        return regionShortName;
    }

    /**
     * 设置
     * @param regionShortName
     */
    public void setRegionShortName(String regionShortName) {
        this.regionShortName = regionShortName;
    }

    /**
     * 获取
     * @return regionCode
     */
    public String getRegionCode() {
        return regionCode;
    }

    /**
     * 设置
     * @param regionCode
     */
    public void setRegionCode(String regionCode) {
        this.regionCode = regionCode;
    }

    /**
     * 获取
     * @return regionParentId
     */
    public String getRegionParentId() {
        return regionParentId;
    }

    /**
     * 设置
     * @param regionParentId
     */
    public void setRegionParentId(String regionParentId) {
        this.regionParentId = regionParentId;
    }

    /**
     * 获取
     * @return regionLevel
     */
    public Integer getRegionLevel() {
        return regionLevel;
    }

    /**
     * 设置
     * @param regionLevel
     */
    public void setRegionLevel(Integer regionLevel) {
        this.regionLevel = regionLevel;
    }

    public String toString() {
        return "SysRegion{regionId = " + regionId + ", regionName = " + regionName + ", regionShortName = " + regionShortName + ", regionCode = " + regionCode + ", regionParentId = " + regionParentId + ", regionLevel = " + regionLevel + "}";
    }
}

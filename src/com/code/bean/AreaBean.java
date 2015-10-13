package com.code.bean;

import java.io.Serializable;

/**
 * Created by CodeA on 2015/10/11.
 */
public class AreaBean implements Serializable{
    private int id;
    private String name;
    //林种
    private String forestType;
    //地类
    private String landType;
    //优势树种
    private String treeType;

    private ClassBean classBean;

    public ClassBean getClassBean() {
        return classBean;
    }

    public void setClassBean(ClassBean classBean) {
        this.classBean = classBean;
    }

    public AreaBean() {
    }

    public AreaBean(String name, String forestType, String landType, String treeType) {
        this.name = name;
        this.forestType = forestType;
        this.landType = landType;
        this.treeType = treeType;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getForestType() {
        return forestType;
    }

    public void setForestType(String forestType) {
        this.forestType = forestType;
    }

    public String getLandType() {
        return landType;
    }

    public void setLandType(String lanType) {
        this.landType = lanType;
    }

    public String getTreeType() {
        return treeType;
    }

    public void setTreeType(String treeType) {
        this.treeType = treeType;
    }

    @Override
    public String toString() {
        return "AreaBean{" +
                "id=" + id +
                ", name='" + name + '\'' +
                ", forestType='" + forestType + '\'' +
                ", landType='" + landType + '\'' +
                ", treeType='" + treeType + '\'' +
                ", classBean=" + classBean +
                '}';
    }
}

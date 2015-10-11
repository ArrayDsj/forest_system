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
    private String lanType;
    //优势树种
    private String treeType;

    public AreaBean() {
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

    public String getLanType() {
        return lanType;
    }

    public void setLanType(String lanType) {
        this.lanType = lanType;
    }

    public String getTreeType() {
        return treeType;
    }

    public void setTreeType(String treeType) {
        this.treeType = treeType;
    }
}

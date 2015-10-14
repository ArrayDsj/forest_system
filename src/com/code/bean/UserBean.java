package com.code.bean;

import java.io.Serializable;

public class UserBean implements Serializable{
    private int    id;
    private String name;
    private String password;
    private String realName;
    private int    right;

    public UserBean() {
    }

    public UserBean(String name, String passWord) {
        this.name = name;
        this.password = passWord;
    }

    public UserBean(int id, String realName, int right) {
        this.id = id;
        this.realName = realName;
        this.right = right;
    }

    public UserBean(int id, String name, String passWord, String realName, int right) {
        this.id = id;
        this.name = name;
        this.password = passWord;
        this.realName = realName;
        this.right = right;
    }

    public int getId() {
        return this.id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getName() {
        return this.name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getPassword() {
        return this.password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getRealName() {
        return this.realName;
    }

    public void setRealName(String realName) {
        this.realName = realName;
    }

    public int getRight() {
        return this.right;
    }

    public void setRight(int right) {
        this.right = right;
    }

    @Override
    public String toString() {
        return "UserBean{" +
                "id=" + id +
                ", name='" + name + '\'' +
                ", password='" + password + '\'' +
                ", realName='" + realName + '\'' +
                ", right=" + right +
                '}';
    }
}
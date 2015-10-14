package com.code.bean;

import java.io.Serializable;

/**
 * Created by CodeA on 2015/10/14.
 */
public class DisasterBean implements Serializable{
    private int id;
    private String name;

    public DisasterBean() {
    }

    public DisasterBean(int id, String name) {
        this.id = id;
        this.name = name;
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

    @Override
    public String toString() {
        return "DisasterBean{" +
                "id=" + id +
                ", name='" + name + '\'' +
                '}';
    }
}

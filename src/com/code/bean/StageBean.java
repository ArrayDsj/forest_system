package com.code.bean;

import java.io.Serializable;

/**
 * Created by CodeA on 2015/10/14.
 */
public class StageBean implements Serializable{
    private int id;
    private String name;

    public StageBean() {
    }

    public StageBean( int id, String name) {
        this.name = name;
        this.id = id;
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
        return "StageBean{" +
                "id=" + id +
                ", name='" + name + '\'' +
                '}';
    }
}

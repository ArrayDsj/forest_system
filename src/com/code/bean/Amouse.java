package com.code.bean;

/**
 * Created by CodeA on 2015/10/18.
 * 鼠害bean
 */
public class Amouse {
    //ID
    private int    id;
    //名称
    private String name;
    //食物
    private String food;
    //繁殖
    private String multiply;
    //天敌
    private String sentinel;
    //图片
    private String picture;
    //防治措施；
    private String ctma;
    //主要危害；
    private String MH;


    public Amouse() {
        super();
    }


    public Amouse(String name, String food, String multiply, String sentinel, String picture, String ctma, String mH) {
        this.name = name;
        this.food = food;
        this.multiply = multiply;
        this.sentinel = sentinel;
        this.picture = picture;
        this.ctma = ctma;
        this.MH = mH;
    }

    public Amouse(String name, String food, String multiply, String sentinel, String ctma, String mH) {
        this.name = name;
        this.food = food;
        this.multiply = multiply;
        this.sentinel = sentinel;
        this.ctma = ctma;
        this.MH = mH;
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

    public String getFood() {
        return food;
    }

    public void setFood(String food) {
        this.food = food;
    }

    public String getMultiply() {
        return multiply;
    }

    public void setMultiply(String multiply) {
        this.multiply = multiply;
    }

    public String getSentinel() {
        return sentinel;
    }

    public void setSentinel(String sentinel) {
        this.sentinel = sentinel;
    }

    public String getPicture() {
        return picture;
    }

    public void setPicture(String picture) {
        this.picture = picture;
    }

    public String getCtma() {
        return ctma;
    }

    public void setCtma(String ctma) {
        this.ctma = ctma;
    }

    public String getMH() {
        return MH;
    }

    public void setMH(String mH) {
        MH = mH;
    }


}


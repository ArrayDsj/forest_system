package com.code.bean;

import java.io.Serializable;
import java.util.Date;

/**
 * Created by CodeA on 2015/10/11.
 *
 */
public class ClassBean implements Serializable{
    private int id;
    private String name;
    private String manager;
    private String phone;
    private int number;
    private Date foundDay;
    private String area;

    public ClassBean() {
    }

    public ClassBean(String name, String manager, String phone, int number,Date foundDay,String area) {
        this.name = name;
        this.manager = manager;
        this.phone = phone;
        this.number = number;
        this.foundDay = foundDay;
        this.area = area;
    }

    public String getArea() {
        return area;
    }

    public void setArea(String area) {
        this.area = area;
    }

    public Date getFoundDay() {
        return foundDay;
    }

    public void setFoundDay(Date foundDay) {
        this.foundDay = foundDay;
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

    public String getManager() {
        return manager;
    }

    public void setManager(String manager) {
        this.manager = manager;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public int getNumber() {
        return number;
    }

    public void setNumber(int number) {
        this.number = number;
    }

    @Override
    public String toString() {
        return "ClassBean{" +
                "id=" + id +
                ", name='" + name + '\'' +
                ", manager='" + manager + '\'' +
                ", phone='" + phone + '\'' +
                ", number=" + number +
                ", foundDay=" + foundDay +
                ", areaBean=" + area +
                '}';
    }
}

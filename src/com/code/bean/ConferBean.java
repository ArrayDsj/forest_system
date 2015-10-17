package com.code.bean;

import java.io.Serializable;
import java.util.Date;

/**
 * Created by CodeA on 2015/10/17.
 */
public class ConferBean implements Serializable{
    private int    id;
    private String staff;
    private Date   data;
    private String result;
    private ThingBean thingBean;

    public String getResult() {
        return result;
    }

    public void setResult(String result) {
        this.result = result;
    }

    public ThingBean getThingBean() {
        return thingBean;
    }

    public void setThingBean(ThingBean thingBean) {
        this.thingBean = thingBean;
    }

    public ConferBean() {
    }

    public ConferBean(int id, String staff, Date data) {
        this.id = id;
        this.staff = staff;
        this.data = data;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getStaff() {
        return staff;
    }

    public void setStaff(String staff) {
        this.staff = staff;
    }

    public Date getData() {
        return data;
    }

    public void setData(Date data) {
        this.data = data;
    }

    @Override
    public String toString() {
        return "ConferBean{" +
                "id=" + id +
                ", staff='" + staff + '\'' +
                ", data=" + data +
                ", result='" + result + '\'' +
                ", thingBean=" + thingBean +
                '}';
    }
}

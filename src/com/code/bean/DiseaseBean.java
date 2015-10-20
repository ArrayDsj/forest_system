package com.code.bean;

import java.io.Serializable;

public class DiseaseBean extends DisasterBean implements Serializable {
//病害一览
	private int id;
	private String name;
	//病源
	private String source;
	//发病症状
	private String symptoms;
	//发病规律
	private String regularity;
	//图片
	private String picture;
	//防治措施
	private String control;
	//主要危害
	private String mainharm;

    public DiseaseBean() {
    }

    @Override
    public int getId() {
        return id;
    }

    @Override
    public void setId(int id) {
        this.id = id;
    }

    @Override
    public String getName() {
        return name;
    }

    @Override
    public void setName(String name) {
        this.name = name;
    }

    public String getSource() {
        return source;
    }

    public void setSource(String source) {
        this.source = source;
    }

    public String getSymptoms() {
        return symptoms;
    }

    public void setSymptoms(String symptoms) {
        this.symptoms = symptoms;
    }

    public String getRegularity() {
        return regularity;
    }

    public void setRegularity(String regularity) {
        this.regularity = regularity;
    }

    public String getPicture() {
        return picture;
    }

    public void setPicture(String picture) {
        this.picture = picture;
    }

    public String getControl() {
        return control;
    }

    public void setControl(String control) {
        this.control = control;
    }

    public String getMainharm() {
        return mainharm;
    }

    public void setMainharm(String mainharm) {
        this.mainharm = mainharm;
    }

    @Override
    public String toString() {
        return "DiseaseBean{" +
                "id=" + id +
                ", name='" + name + '\'' +
                ", source='" + source + '\'' +
                ", symptoms='" + symptoms + '\'' +
                ", regularity='" + regularity + '\'' +
                ", picture='" + picture + '\'' +
                ", control='" + control + '\'' +
                ", mainharm='" + mainharm + '\'' +
                '}';
    }
}

package com.code.bean;

import java.io.Serializable;
import java.util.Date;

/**
 * Created by CodeA on 2015/10/13.
 */
public class ThingBean implements Serializable{
    private int    id;
    private String name;
    private String description;
    private Date   foundDay;
    private String loss;
    private String proportion;
    private String photoPath;
    private String scheme;

    private StageBean stage;
    private DisasterBean disasterType;
    private FindwayBean findWay;
    private AreaBean areaBean;

    public ThingBean() {
    }

    public ThingBean(int id) {
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

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public Date getFoundDay() {
        return foundDay;
    }

    public void setFoundDay(Date foundDay) {
        this.foundDay = foundDay;
    }

    public String getLoss() {
        return loss;
    }

    public void setLoss(String loss) {
        this.loss = loss;
    }

    public String getProportion() {
        return proportion;
    }

    public void setProportion(String proportion) {
        this.proportion = proportion;
    }

    public String getPhotoPath() {
        return photoPath;
    }

    public void setPhotoPath(String photoPath) {
        this.photoPath = photoPath;
    }

    public String getScheme() {
        return scheme;
    }

    public void setScheme(String scheme) {
        this.scheme = scheme;
    }

    public StageBean getStage() {
        return stage;
    }

    public void setStage(StageBean stage) {
        this.stage = stage;
    }

    public DisasterBean getDisasterType() {
        return disasterType;
    }

    public void setDisasterType(DisasterBean disasterType) {
        this.disasterType = disasterType;
    }

    public FindwayBean getFindWay() {
        return findWay;
    }

    public void setFindWay(FindwayBean findWay) {
        this.findWay = findWay;
    }

    public AreaBean getAreaBean() {
        return areaBean;
    }

    public void setAreaBean(AreaBean areaBean) {
        this.areaBean = areaBean;
    }

    @Override
    public String toString() {
        return "ThingBean{" +
                "id=" + id +
                ", name='" + name + '\'' +
                ", description='" + description + '\'' +
                ", foundDay=" + foundDay +
                ", loss='" + loss + '\'' +
                ", proportion='" + proportion + '\'' +
                ", photoPath='" + photoPath + '\'' +
                ", scheme='" + scheme + '\'' +
                ", stage=" + stage +
                ", disasterType=" + disasterType +
                ", findWay=" + findWay +
                ", areaBean=" + areaBean +
                '}';
    }
}

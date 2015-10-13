package com.code.bean;

import java.io.Serializable;
import java.util.Date;

/**
 * Created by CodeA on 2015/10/13.
 */
public class ThingBean implements Serializable{
    private int    id;
    private String name;
    //灾情阶段-->也可以再创建一个StageBean对象
    private String stage;
    private String description;
    private Date   foundDay;
    private String loss;
    private String proportion;
    private String photo;
    private String scheme;
    private String disasterType;
    private String findWay;
    private AreaBean areaBean;
}

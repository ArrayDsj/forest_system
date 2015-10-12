package com.code.service;

import com.code.bean.AreaBean;

import java.util.ArrayList;

/**
 * Created by CodeA on 2015/10/11.
 */
public interface AreaService {
    public boolean addArea(AreaBean areaBean);

    //得到分页数据
    public ArrayList<AreaBean> getLimitData(String queryType, String queryStr,int pageNow);

    //得到初始化分页数据
    public ArrayList<AreaBean> getInitData();

}

package com.code.service;

import com.code.bean.AreaBean;

import java.util.ArrayList;

/**
 * Created by CodeA on 2015/10/11.
 */
public interface AreaService {
    public boolean addArea(AreaBean areaBean);

    //得到条件分页数据
    public ArrayList<AreaBean> getLimitData(String queryType, String queryStr,int pageNow, int pageSize);

    //得到初始分页数据
    public ArrayList<AreaBean> getInitData(int pageNow, int pageSize);

    //得到下拉列表数据
    public ArrayList<AreaBean> getAreas();


}

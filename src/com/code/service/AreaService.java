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

    //得到没有条件下的所有记录的总数
    public int getCounts();

    //返回当前条件下满足条件的总个数
    public int getCountsByCondition(String queryType, String queryStr);

    //得到下拉列表数据
    public ArrayList<AreaBean> getAreas();

    public ArrayList<AreaBean> getAllAreas();

    public AreaBean getAreaById(int fk_class);
}

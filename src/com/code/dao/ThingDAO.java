package com.code.dao;

import com.code.bean.ThingBean;

import java.util.ArrayList;

/**
 * Created by CodeA on 2015/10/14.
 */
public interface ThingDAO {
    //无条件的总记录条数
    public int getCounts();
    //无条件的分页记录集合
    public ArrayList<ThingBean> getThings(int pageNow, int pageSize);


    //有条件的总记录条数
    public int getCountsByCondtion(String query, String str);
    //有条件的分页记录集合
    public ArrayList<ThingBean> getThingsByCondtion(String query, String str, int pageNow, int pageSize);

    //添加数据
    public boolean  addThing(ThingBean thingBean);
}

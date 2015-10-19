package com.code.dao;

import com.code.bean.ThingBean;

import java.util.ArrayList;
import java.util.Date;

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

    //查看数据
    public ThingBean getThingById(int id);

    //修改信息
    public int updateThing(ThingBean thingBean);

    public ArrayList<ThingBean> getAreaByTime(Date start, Date end, int pageNow, int pageSize);

    public int  getCountsByTime(Date start, Date end);
}

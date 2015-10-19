package com.code.service;

import com.code.bean.ThingBean;

import java.util.ArrayList;
import java.util.Date;

/**
 * Created by CodeA on 2015/10/14.
 */
public interface ThingService {
    //得到无条件总记录数
    public int getCounts();
    //得到初始化表格数据
    public ArrayList<ThingBean> getInitData(int pageNow,int pageSize);
    //得到条件总记录数
    public int getCountsByCondtion(String queryType, String queryStr);
    //得到条件数据
    public ArrayList<ThingBean> getLimitData(String queryType, String queryStr, int pageNow, int pageSize);

    //查看信息
    public ThingBean getThingById(int id);

    //修改信息
    public boolean updateThing(ThingBean thingBean);

    //按时间查询
    public ArrayList<ThingBean> getAreasByTime(Date start,Date end, int pageNow, int pageSize);

    //按时间查询的总数
    public int getCountsByTime(Date start, Date end);
}

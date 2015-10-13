package com.code.dao;

import com.code.bean.AreaBean;

import java.util.ArrayList;

/**
 * Created by CodeA on 2015/10/11.
 * 对area表的操作
 */
public interface AreaDAO {
    //添加新地区
    public boolean addArea(AreaBean areaBean);
    //得到所有fk_class为空的地区(用于添加班级时初始化地区下拉列表)
    public ArrayList<AreaBean> getAreasByClass();

    //得到没有条件下的所有记录的总数
    public int getCounts();
    //得到没有条件下的所有记录的分页数据
    public ArrayList<AreaBean> getAreas(int pageNow, int pageSize) ;

    //返回当前条件下满足条件的总个数
    public int getCountsByCondition(String queryType, String queryStr);
    //按条件查询(分页查询)
    public ArrayList<AreaBean> getAreasByCondition(String queryType, String queryStr, int pageNow, int pageSize);
}

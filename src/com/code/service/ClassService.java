package com.code.service;

import com.code.bean.ClassBean;

import java.util.ArrayList;

/**
 * Created by CodeA on 2015/10/13.
 */
public interface ClassService {
    public boolean addClass(ClassBean classBean);
    public ClassBean showClass(ClassBean classBean);
    //修改信息
    public boolean updateClass(ClassBean classBean);

    //得到没有条件下的所有记录的总数
    public int getCounts();

    //返回当前条件下满足条件的总个数
    public int getCountsByCondition(String queryType, String queryStr);

    //得到条件分页数据
    public ArrayList<ClassBean> getLimitData(String queryType, String queryStr, int pageNow, int pageSize);

    //得到初始分页数据
    public ArrayList<ClassBean> getInitData(int pageNow, int pageSize);
}

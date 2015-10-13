package com.code.service;

import com.code.bean.ClassBean;

import java.util.ArrayList;

/**
 * Created by CodeA on 2015/10/13.
 */
public interface ClassService {
    public boolean addClass(ClassBean classBean);
    public ClassBean showClass(ClassBean classBean);
    public boolean updateClass(ClassBean classBean);



    //得到条件分页数据
    public ArrayList<ClassBean> getLimitData(String queryType, String queryStr, int pageNow, int pageSize);

    //得到初始分页数据
    public ArrayList<ClassBean> getInitData(int pageNow, int pageSize);
}

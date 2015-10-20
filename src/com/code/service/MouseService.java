package com.code.service;

import com.code.bean.MouseBean;

import java.util.ArrayList;

/**
 * Created by CodeA on 2015/10/20.
 */
public interface MouseService {
    //无条件总记录数
    public int getCounts();

    //无条件所有结果
    public ArrayList<MouseBean> getAllMouses(int pageNow, int pageSize);

    //有条件总记录数
    public int getCountsByCondtion(String query, String str);

    //有条件总集合
    public ArrayList<MouseBean> getAllMousesByCondtion(String query, String str, int pageNow, int pageSize);

    //添加数据
    public boolean addMouses(MouseBean mouseBean);

    //按id查询数据
    public MouseBean getMouseBeanByID(int id);
}

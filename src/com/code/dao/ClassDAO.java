package com.code.dao;

import com.code.bean.ClassBean;

import java.util.ArrayList;

/**
 * Created by CodeA on 2015/10/11.
 */
public interface ClassDAO {
    //添加班级
    public boolean addClass(ClassBean classBean);
    //查看班级信息
    public ClassBean showClass(ClassBean classBean);
    //修改小班信息
    public boolean updateClass(ClassBean classBean);


    //分页查询
    public ArrayList<ClassBean> queryByCondition(ClassBean classBean, int pageNow);
    //得到没有条件下的所有记录的总数
    public int getCounts();
    //得到没有条件下的所有记录的分页数据
    public ArrayList<ClassBean> getClasses(int pageNow, int pageSize);
    //返回当前条件下满足条件的总个数
    public int getCountsByCondition(String queryType, String queryStr);
    //按条件查询(分页查询)
    public ArrayList<ClassBean> getClassesByCondition(String queryType, String queryStr, int pageNow, int pageSize);
}

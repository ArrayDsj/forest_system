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
}

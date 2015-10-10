package com.code.dao;

import com.code.bean.UserBean;

import java.util.ArrayList;

/**
 * Created by CodeA on 2015/10/9.
 */
public interface UserDAO {
    //查询单个用户信息
    public UserBean query(UserBean userBean);

    //查询所有用户信息
    public ArrayList<UserBean> queryAll();

    //修改信息
    public boolean updateUser(UserBean userBean);

    //增加员工
    public boolean addUser(UserBean userBean);

    //删除员工
    public boolean deleteUser(UserBean userBean);
}

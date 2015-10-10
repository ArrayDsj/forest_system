package com.code.service;

import com.code.bean.UserBean;

import java.util.ArrayList;

/**
 * Created by CodeA on 2015/10/9.
 */
public interface UserService {
    //登录
    public UserBean login(UserBean userBean);

    //添加用户
    public boolean addUser(UserBean userBean);

    //删除用户
    public boolean deleteUser(UserBean userBean);

    //修改用户信息
    public boolean updateUser(UserBean userBean);

    //查询所有用户信息
    public ArrayList<UserBean> getAllUsers();

    //分页查询
    public ArrayList<UserBean> getAllUsers(UserBean userBean, int pageNum);
}

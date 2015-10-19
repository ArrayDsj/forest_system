package com.code.service;

import com.code.bean.UserBean;

import java.util.ArrayList;

/**
 * Created by CodeA on 2015/10/9.
 */
public interface UserService {
    //登录
    public UserBean login(UserBean userBean);
    

    //查询所有用户信息
    public ArrayList<UserBean> getAllUsers(int currentPage, int pageSize);
    
    public int getAllNumber();
    
    public int queryPageNumberByCondition(String condition, int pageSize);
    
	public ArrayList<UserBean> queryUserByCondition(int currentPage, String condition, int pageSize);

    //添加用户
    public boolean addUser(UserBean user);

    //删除用户
    public boolean deleteUser(int id);
    
    public UserBean queryUserInfo(int id);

   //修改用户信息
	public boolean updateUser(UserBean user);



	



}

package com.code.dao;

import com.code.bean.UserBean;

import java.util.ArrayList;

/**
 * Created by CodeA on 2015/10/9.
 */
public interface UserDao {
    //查询单个用户信息
    public UserBean query(UserBean userBean);

    //查询所有用户信息
    public ArrayList<UserBean> queryAllUsers(int currentPage, int pageSize);
    
    public int getAllNumber();

	public int getPageNumberByCondition(String condition, int pageSize);

	public ArrayList<UserBean> getUserByCondition(int currentPage, String condition, int pageSize);
	//增加员工
	public boolean addUser(UserBean user);
	//删除员工
	public boolean deleteUser(int id);

	public UserBean getUserInfo(int id);
	//修改信息
	public boolean updateUser(UserBean user);





}

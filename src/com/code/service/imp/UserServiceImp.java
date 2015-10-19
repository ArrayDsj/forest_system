package com.code.service.imp;

import com.code.bean.UserBean;
import com.code.dao.UserDao;
import com.code.dao.imp.UserDaoImp;
import com.code.service.UserService;

import java.util.ArrayList;

/**
 * Created by CodeA on 2015/10/9.
 */
public class UserServiceImp implements UserService {
	
	UserDao udao = new UserDaoImp();
	
    public UserBean login(UserBean userBean) {
    	
        return udao.query(userBean);
    }

	public ArrayList<UserBean> getAllUsers(int currentPage ,int pageSize) {
		// TODO Auto-generated method stub
		return udao.queryAllUsers(currentPage, pageSize);
	}

	public int getAllNumber() {
		// TODO Auto-generated method stub
		return udao.getAllNumber();
	}

	public int queryPageNumberByCondition(String condition, int pageSize) {
		// TODO Auto-generated method stub
		return udao.getPageNumberByCondition(condition,pageSize);
	}

	public ArrayList<UserBean> queryUserByCondition(int currentPage,
			String condition,int pageSize) {
		// TODO Auto-generated method stub
		return udao.getUserByCondition(currentPage,condition,pageSize);
	}

	public boolean addUser(UserBean user) {
		// TODO Auto-generated method stub
		return udao.addUser(user);
	}

	public boolean deleteUser(int id) {
		// TODO Auto-generated method stub
		return udao.deleteUser(id);
	}

	public UserBean queryUserInfo(int id) {
		// TODO Auto-generated method stub
		return udao.getUserInfo(id);
	}

	public boolean updateUser(UserBean user) {
		// TODO Auto-generated method stub
		return udao.updateUser(user);
	}



    
}

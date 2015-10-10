package com.code.service.imp;

import com.code.bean.UserBean;
import com.code.dao.UserDAO;
import com.code.dao.imp.UserDAOImp;
import com.code.service.UserService;

import java.util.ArrayList;

/**
 * Created by CodeA on 2015/10/9.
 */
public class UserServiceImp implements UserService {
    @Override
    public UserBean login(UserBean userBean) {
        UserDAO userDAO = new UserDAOImp();
        return userDAO.query(userBean);
    }

    @Override
    public boolean addUser(UserBean userBean) {
        return false;
    }

    @Override
    public boolean deleteUser(UserBean userBean) {
        return false;
    }

    @Override
    public boolean updateUser(UserBean userBean) {
        return false;
    }

    @Override
    public ArrayList<UserBean> getAllUsers() {
        return null;
    }

    @Override
    public ArrayList<UserBean> getAllUsers(UserBean userBean, int pageNum) {
        return null;
    }
}

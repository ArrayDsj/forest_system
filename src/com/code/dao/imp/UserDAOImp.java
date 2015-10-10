package com.code.dao.imp;

import com.code.bean.UserBean;
import com.code.dao.UserDAO;
import com.code.util.DBUtil;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

/**
 * Created by CodeA on 2015/10/9.
 */
public class UserDAOImp implements UserDAO{
    @Override
    public UserBean query(UserBean userBean) {
        //获得连接
        Connection connection = DBUtil.getConnection();
        //创建sql语句
        String sql = "select * from t_userinfo where f_name = ? and f_password = ?";

        //将连接对象和所有管道对象放在try语句外面,方便关闭
        PreparedStatement ps = null;
        ResultSet rs = null;
        //登录使用预编译的方法
        try {
            ps = connection.prepareStatement(sql);
            ps.setString(1,userBean.getName());
            ps.setString(2,userBean.getPassword());
            rs = ps.executeQuery();

            if(rs.next()){
                //如果是合法用户,封装数据,以后要用
                userBean.setId(rs.getInt("pk_id"));
                userBean.setRealName(rs.getString("f_realname"));
                userBean.setRight(rs.getInt("f_right"));
                return userBean;
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }finally{
            //关闭全部连接
            DBUtil.close(rs,ps,connection);
        }
        //如果没有,返回null
        return null;
    }

    @Override
    public ArrayList<UserBean> queryAll() {
        return null;
    }

    @Override
    public boolean updateUser(UserBean userBean) {
        return false;
    }

    @Override
    public boolean addUser(UserBean userBean) {
        return false;
    }

    @Override
    public boolean deleteUser(UserBean userBean) {
        return false;
    }
}

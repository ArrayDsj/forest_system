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
        //�������
        Connection connection = DBUtil.getConnection();
        //����sql���
        String sql = "select * from t_userinfo where f_name = ? and f_password = ?";

        //�����Ӷ�������йܵ��������try�������,����ر�
        PreparedStatement ps = null;
        ResultSet rs = null;
        //��¼ʹ��Ԥ����ķ���
        try {
            ps = connection.prepareStatement(sql);
            ps.setString(1,userBean.getName());
            ps.setString(2,userBean.getPassword());
            rs = ps.executeQuery();

            if(rs.next()){
                //����ǺϷ��û�,��װ����,�Ժ�Ҫ��
                userBean.setId(rs.getInt("pk_id"));
                userBean.setRealName(rs.getString("f_realname"));
                userBean.setRight(rs.getInt("f_right"));
                return userBean;
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }finally{
            //�ر�ȫ������
            DBUtil.close(rs,ps,connection);
        }
        //���û��,����null
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

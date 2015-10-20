package com.code.dao.imp;

import com.code.bean.MouseBean;
import com.code.dao.MouseDAO;
import com.code.util.DBUtil;

import java.sql.*;
import java.util.ArrayList;

/**
 * Created by CodeA on 2015/10/20.
 */
public class MouseDAOImp implements MouseDAO {

    @Override
    public int getCounts() {
        Connection connection = DBUtil.getConnection();
        String     sql    = "select count(*) from t_amouse";
        int        result = -1;
        Statement  st     = null;
        ResultSet  rs     = null;

        try {
            st = connection.createStatement();
            rs = st.executeQuery(sql);
            if (rs.next()) {
                result = rs.getInt(1);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            DBUtil.close(rs, st, connection);
        }
        return result;
    }

    @Override
    public ArrayList<MouseBean> getAllMouses(int pageNow, int pageSize) {
        Connection             connection  = DBUtil.getConnection();
        ArrayList<MouseBean> all         = new ArrayList<MouseBean>();
        String                 sql         = "select * from t_amouse order by pk_id desc limit " + (pageNow - 1) * pageSize + "," + pageSize;
        Statement              st          = null;
        ResultSet              rs          = null;
        MouseBean            mouseBean = null;
        try {
            st = connection.createStatement();
            rs = st.executeQuery(sql);
            while (rs.next()) {
                mouseBean = new MouseBean();
                mouseBean.setId(rs.getInt("pk_id"));
                mouseBean.setName(rs.getString("f_name"));
                mouseBean.setFood(rs.getString("f_food"));
                mouseBean.setBreed(rs.getString("f_multiply"));
                mouseBean.setEnemy(rs.getString("f_naturalenemies"));
                mouseBean.setPhoto(rs.getString("f_picture"));
                mouseBean.setControlMeasures(rs.getString("f_controlmeasures"));
                mouseBean.setMainHarm(rs.getString("f_mainharm"));

                all.add(mouseBean);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            DBUtil.close(rs, st, connection);
        }
        return all;
    }

    @Override
    public int getCountsByCondtion(String query, String str) {
        Connection connection = DBUtil.getConnection();
        String     sql        = "select count(*) from t_amouse where " + query + " like '%" + str + "%'";
        int        result     = -1;
        Statement  st         = null;
        ResultSet  rs         = null;

        try {
            st = connection.createStatement();
            rs = st.executeQuery(sql);
            if (rs.next()) {
                result = rs.getInt(1);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            DBUtil.close(rs, st, connection);
        }
        return result;
    }

    @Override
    public ArrayList<MouseBean> getAllMousesByCondtion(String query, String str, int pageNow, int pageSize) {
        Connection           connection = DBUtil.getConnection();
        ArrayList<MouseBean> all        = new ArrayList<MouseBean>();
        String sql = "select * from t_amouse where " + query + " like '%" + str + "%' order by pk_id desc limit " + (pageNow - 1) * pageSize + "," + pageSize;
        Statement            st         = null;
        ResultSet            rs         = null;
        MouseBean            mouseBean  = null;
        try {
            st = connection.createStatement();
            rs = st.executeQuery(sql);
            while (rs.next()) {
                mouseBean = new MouseBean();
                mouseBean.setId(rs.getInt("pk_id"));
                mouseBean.setName(rs.getString("f_name"));
                mouseBean.setFood(rs.getString("f_food"));
                mouseBean.setBreed(rs.getString("f_multiply"));
                mouseBean.setEnemy(rs.getString("f_naturalenemies"));
                mouseBean.setPhoto(rs.getString("f_picture"));
                mouseBean.setControlMeasures(rs.getString("f_controlmeasures"));
                mouseBean.setMainHarm(rs.getString("f_mainharm"));
                all.add(mouseBean);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            DBUtil.close(rs, st, connection);
        }
        return all;
    }

    @Override
    public boolean addMouses(MouseBean mouseBean) {
        Connection cont = DBUtil.getConnection();
        String sql = "insert into t_amouse(f_name,f_food,f_multiply,f_naturalenemies,f_picture,f_controlmeasures,f_mainharm)" + "values(?,?,?,?,?,?,?)";
        PreparedStatement ps = null;
        int result = -1;
        try {
            ps = cont.prepareStatement(sql);
            ps.setString(1, mouseBean.getName());
            ps.setString(2, mouseBean.getFood());
            ps.setString(3, mouseBean.getBreed());
            ps.setString(4, mouseBean.getEnemy());
            ps.setString(5, mouseBean.getPhoto());
            ps.setString(6, mouseBean.getControlMeasures());
            ps.setString(7, mouseBean.getMainHarm());
            result = ps.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            DBUtil.close(ps, cont);
        }
        return result == 1;
    }

    @Override
    public MouseBean getMouseBeanByID(int id) {
        Connection           connection = DBUtil.getConnection();
        String sql = "select * from t_amouse where pk_id=" + id;
        Statement            st         = null;
        ResultSet            rs         = null;
        MouseBean            mouseBean  = null;
        try {
            st = connection.createStatement();
            rs = st.executeQuery(sql);
            if (rs.next()) {
                mouseBean = new MouseBean();
                mouseBean.setId(rs.getInt("pk_id"));
                mouseBean.setName(rs.getString("f_name"));
                mouseBean.setFood(rs.getString("f_food"));
                mouseBean.setBreed(rs.getString("f_multiply"));
                mouseBean.setEnemy(rs.getString("f_naturalenemies"));
                mouseBean.setPhoto(rs.getString("f_picture"));
                mouseBean.setControlMeasures(rs.getString("f_controlmeasures"));
                mouseBean.setMainHarm(rs.getString("f_mainharm"));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            DBUtil.close(rs, st, connection);
        }
        return mouseBean;
    }
}

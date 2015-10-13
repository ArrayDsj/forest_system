package com.code.dao.imp;

import com.code.bean.AreaBean;
import com.code.bean.ClassBean;
import com.code.dao.ClassDAO;
import com.code.util.DBUtil;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

/**
 * Created by CodeA on 2015/10/13.
 */
public class ClassDAOImp implements ClassDAO {
    @Override
    public boolean addClass(ClassBean classBean) {
        return false;
    }

    @Override
    public ClassBean showClass(ClassBean classBean) {
        return null;
    }

    @Override
    public boolean updateClass(ClassBean classBean) {
        return false;
    }

    @Override
    public ArrayList<ClassBean> queryByCondition(ClassBean classBean, int pageNow) {
        return null;
    }

    //得到没有条件下的所有记录的总数
    @Override
    public int getCounts() {
        Connection connection = DBUtil.getConnection();
        String    sql    = "select count(*) from t_class";
        Statement st     = null;
        ResultSet rs     = null;
        int       reslut = 0;
        try {
            st = connection.createStatement();
            rs = st.executeQuery(sql);

            if (rs.next()) {
                reslut = rs.getInt(1);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            DBUtil.close(rs, st, connection);
        }
        return reslut;
    }

    //得到没有条件下的所有记录的分页数据
    @Override
    public ArrayList<ClassBean> getClasses(int pageNow, int pageSize) {
        Connection          connection = DBUtil.getConnection();
        ArrayList<ClassBean> all        = new ArrayList<ClassBean>();
        String sql = "select * from t_class \n" +
                "limit " + (pageNow - 1) * pageSize + "," + pageSize;
        Statement st       = null;
        ResultSet rs       = null;
        ClassBean  classBean = null;
        try {
            st = connection.createStatement();
            rs = st.executeQuery(sql);

            while (rs.next()) {
                classBean = new ClassBean();
                classBean.setId(rs.getInt("pk_id"));
                classBean.setName(rs.getString("f_name"));
                classBean.setManager(rs.getString("f_manager"));
                classBean.setPhone(rs.getString("f_phone"));
                classBean.setNumber(rs.getInt("f_number"));
                classBean.setFoundDay(rs.getDate("f_foundday"));
                AreaBean areaBean = new AreaDAOImp().getAreaById(classBean.getId());
                classBean.setAreaBean(areaBean.getName());
                all.add(classBean);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            DBUtil.close(rs, st, connection);
        }
        return all;
    }

    //得到满足条件的记录集合
    @Override
    public int getCountsByCondition(String queryType, String queryStr) {
        Connection connection = DBUtil.getConnection();

        String sql = "select count(*) from t_class where " +
                queryType + " like " + queryStr;

        Statement st     = null;
        ResultSet rs     = null;
        int       reslut = -1;
        try {
            st = connection.createStatement();
            rs = st.executeQuery(sql);

            if (rs.next()) {
                reslut = rs.getInt(1);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            DBUtil.close(rs, st, connection);
        }
        return reslut;
    }

    //得到满足条件的所有记录的总数
    @Override
    public ArrayList<ClassBean> getClassesByCondition(String queryType, String queryStr, int pageNow, int pageSize) {
        Connection          connection = DBUtil.getConnection();
        ArrayList<ClassBean> all        = new ArrayList<ClassBean>();
        String sql = "select * from t_class \n" +
                "where " + queryType + " like " + queryStr + "\n" +
                "limit " + (pageNow - 1) * pageSize + "," + pageSize;
        Statement st       = null;
        ResultSet rs       = null;
        ClassBean classBean = null;
        try {
            st = connection.createStatement();
            rs = st.executeQuery(sql);

            while (rs.next()) {
                classBean = new ClassBean();
                classBean.setId(rs.getInt("pk_id"));
                classBean.setName(rs.getString("f_name"));
                classBean.setManager(rs.getString("f_manager"));
                classBean.setPhone(rs.getString("f_phone"));
                classBean.setNumber(rs.getInt("f_number"));
                classBean.setFoundDay(rs.getDate("f_foundday"));
                all.add(classBean);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            DBUtil.close(rs, st, connection);
        }
        return all;
    }
}

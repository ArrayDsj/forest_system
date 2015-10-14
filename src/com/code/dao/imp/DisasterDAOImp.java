package com.code.dao.imp;

import com.code.bean.DisasterBean;
import com.code.dao.DisasterDAO;
import com.code.util.DBUtil;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

/**
 * Created by CodeA on 2015/10/14.
 */
public class DisasterDAOImp implements DisasterDAO{
    @Override
    public DisasterBean getStageById(int id) {
        Connection connection = DBUtil.getConnection();
        String    sql       = "select * from t_disastertype where pk_id=" + id;
        ResultSet rs        = null;
        Statement st        = null;
        DisasterBean disasterBean = null;

        try {
            st = connection.createStatement();
            rs = st.executeQuery(sql);
            if (rs.next()) {
                disasterBean = new DisasterBean(rs.getInt("pk_id"), rs.getString("f_name"));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            DBUtil.close(rs, st, connection);
        }
        return disasterBean;
    }

    @Override
    public ArrayList<DisasterBean> getAllDisasterBean() {
        Connection           connection = DBUtil.getConnection();
        String               sql        = "select * from t_disastertype";
        ResultSet            rs         = null;
        Statement            st         = null;
        DisasterBean disasterBean  = null;
        ArrayList<DisasterBean> all        = new ArrayList<DisasterBean>();
        try {
            st = connection.createStatement();
            rs = st.executeQuery(sql);
            while (rs.next()) {
                disasterBean = new DisasterBean(rs.getInt("pk_id"), rs.getString("f_name"));
                all.add(disasterBean);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            DBUtil.close(rs, st, connection);
        }
        return all;
    }
}

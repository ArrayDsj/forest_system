package com.code.dao.imp;

import com.code.bean.FindwayBean;
import com.code.dao.FindwayDAO;
import com.code.util.DBUtil;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

/**
 * Created by CodeA on 2015/10/14.
 */
public class FindwayDAOImp implements FindwayDAO {
    @Override
    public FindwayBean getFindwayById(int id) {
        Connection connection = DBUtil.getConnection();
        String     sql       = "select * from t_findway where pk_id=" + id;
        ResultSet  rs        = null;
        Statement  st        = null;
        FindwayBean  findwayBean = null;

        try {
            st = connection.createStatement();
            rs = st.executeQuery(sql);
            if (rs.next()) {
                findwayBean = new FindwayBean(rs.getInt("pk_id"), rs.getString("f_name"));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            DBUtil.close(rs, st, connection);
        }
        return findwayBean;
    }

    @Override
    public ArrayList<FindwayBean> getAllFindways() {
        Connection           connection = DBUtil.getConnection();
        String               sql        = "select * from t_findway";
        ResultSet            rs         = null;
        Statement            st         = null;
        FindwayBean            findwayBean  = null;
        ArrayList<FindwayBean> all        = new ArrayList<FindwayBean>();
        try {
            st = connection.createStatement();
            rs = st.executeQuery(sql);
            while (rs.next()) {
                findwayBean = new FindwayBean(rs.getInt("pk_id"), rs.getString("f_name"));
                all.add(findwayBean);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            DBUtil.close(rs, st, connection);
        }
        return all;
    }
}

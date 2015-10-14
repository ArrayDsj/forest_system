package com.code.dao.imp;

import com.code.bean.StageBean;
import com.code.dao.StageDAO;
import com.code.util.DBUtil;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

/**
 * Created by CodeA on 2015/10/14.
 */
public class StageDAOImp implements StageDAO{
    @Override
    public StageBean getStageById(int id) {
        Connection connection = DBUtil.getConnection();
        String sql = "select * from t_stage where pk_id=" + id;
        ResultSet rs = null;
        Statement st = null;
        StageBean stageBean = null;

        try {
            st = connection.createStatement();
            rs = st.executeQuery(sql);
            if(rs.next()){
                stageBean = new StageBean(rs.getInt("pk_id"), rs.getString("f_name"));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }finally{
            DBUtil.close(rs,st,connection);
        }
        return stageBean;
    }

    @Override
    public ArrayList<StageBean> getAllStages() {
        Connection connection = DBUtil.getConnection();
        String    sql       = "select * from t_stage";
        ResultSet rs        = null;
        Statement st        = null;
        StageBean stageBean = null;
        ArrayList<StageBean> all= new ArrayList<StageBean>();
        try {
            st = connection.createStatement();
            rs = st.executeQuery(sql);
            while (rs.next()) {
                stageBean = new StageBean(rs.getInt("pk_id"), rs.getString("f_name"));
                all.add(stageBean);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            DBUtil.close(rs, st, connection);
        }
        return all;
    }
}

package com.code.dao.imp;

import com.code.bean.DiseaseBean;
import com.code.dao.DiseaseDAO;
import com.code.util.DBUtil;

import java.sql.*;
import java.util.ArrayList;

/**
 * Created by CodeA on 2015/10/20.
 * 病害表的持久层操作
 */
public class DiseaseDAOImp implements DiseaseDAO {
    @Override
    public int getCounts() {
        Connection connection = DBUtil.getConnection();
        String    sql    = "select count(*) from t_diseaselist";
        int       result = -1;
        Statement st     = null;
        ResultSet rs     = null;

        try {
            st = connection.createStatement();
            rs = st.executeQuery(sql);
            if(rs.next()){
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
    public ArrayList<DiseaseBean> getAllDiseases(int pageNow, int pageSize) {
        Connection connection = DBUtil.getConnection();
        ArrayList<DiseaseBean> all = new ArrayList<DiseaseBean>();
        String    sql    = "select * from t_diseaselist order by pk_id desc limit " + (pageNow-1)*pageSize + "," + pageSize;
        Statement st     = null;
        ResultSet rs     = null;
        DiseaseBean diseaseBean = null;
        try {
            st = connection.createStatement();
            rs = st.executeQuery(sql);
            while(rs.next()){
                diseaseBean = new DiseaseBean();
                diseaseBean.setId(rs.getInt("pk_id"));
                diseaseBean.setName(rs.getString("f_name"));
                diseaseBean.setSource(rs.getString("f_source"));
                diseaseBean.setSymptoms(rs.getString("f_symptoms"));
                diseaseBean.setRegularity(rs.getString("f_regularityofdisease"));
                diseaseBean.setPicture(rs.getString("f_picture"));
                diseaseBean.setControl(rs.getString("f_controlmeasures"));
                diseaseBean.setMainharm(rs.getString("f_mainharm"));

                all.add(diseaseBean);
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
        Connection        connection = DBUtil.getConnection();
        String            sql        = "select count(*) from t_diseaselist where "+query+" like '%"+str+"%'";
        int               result     = -1;
        Statement st         = null;
        ResultSet         rs         = null;

        try {
            st = connection.createStatement();
            rs = st.executeQuery(sql);
            if(rs.next()){
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
    public ArrayList<DiseaseBean> getAllDiseasesByCondtion(String query, String str, int pageNow, int pageSize) {
        ArrayList<DiseaseBean> all = new ArrayList<DiseaseBean>();
        Connection        connection = DBUtil.getConnection();
        String            sql        = "select * from t_diseaselist where "+query+" like '%"+str+"%' order by pk_id desc limit " + (pageNow - 1) * pageSize + "," + pageSize;
        Statement st = null;
        ResultSet         rs         = null;

        try {
            st = connection.createStatement();
            rs = st.executeQuery(sql);
            while(rs.next()){
                DiseaseBean diseaseBean = null;
                diseaseBean = new DiseaseBean();
                diseaseBean.setId(rs.getInt("pk_id"));
                diseaseBean.setName(rs.getString("f_name"));
                diseaseBean.setSource(rs.getString("f_source"));
                diseaseBean.setSymptoms(rs.getString("f_symptoms"));
                diseaseBean.setRegularity(rs.getString("f_regularityofdisease"));
                diseaseBean.setPicture(rs.getString("f_picture"));
                diseaseBean.setControl(rs.getString("f_controlmeasures"));
                diseaseBean.setMainharm(rs.getString("f_mainharm"));

                all.add(diseaseBean);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }finally {
            DBUtil.close(rs,st,connection);
        }
        return all;
    }

    @Override
    public boolean addDisease(DiseaseBean diseaseBean) {
        Connection connection = DBUtil.getConnection();
        String     sql = "insert into t_diseaselist(f_name,f_source,f_symptoms," +
                "f_regularityofdisease,f_picture,f_controlmeasures,f_mainharm)" +
                "values(?,?,?,?,?,?,?)";
        PreparedStatement ps = null;
        int result = -1;
        try {
            ps = connection.prepareStatement(sql);
            ps.setString(1, diseaseBean.getName());
            ps.setString(2, diseaseBean.getSource());
            ps.setString(3, diseaseBean.getSymptoms());
            ps.setString(4, diseaseBean.getRegularity());
            ps.setString(5, diseaseBean.getPicture());
            ps.setString(6, diseaseBean.getControl());
            ps.setString(7, diseaseBean.getMainharm());
            result = ps.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            DBUtil.close( ps, connection);
        }
        return result == 1;
    }

    @Override
    public DiseaseBean getDiseaseBeanByID(int id) {
        Connection connection = DBUtil.getConnection();
        String sql = "select * from t_diseaselist where pk_id = " + id;
        Statement st = null;
        ResultSet rs = null;
        DiseaseBean diseaseBean = null;
        try {
            st = connection.createStatement();
            rs = st.executeQuery(sql);
            if (rs.next()) {
                diseaseBean = new DiseaseBean();
                diseaseBean.setId(rs.getInt("pk_id"));
                diseaseBean.setName(rs.getString("f_name"));
                diseaseBean.setSource(rs.getString("f_source"));
                diseaseBean.setSymptoms(rs.getString("f_symptoms"));
                diseaseBean.setRegularity(rs.getString("f_regularityofdisease"));
                diseaseBean.setPicture(rs.getString("f_picture"));
                diseaseBean.setControl(rs.getString("f_controlmeasures"));
                diseaseBean.setMainharm(rs.getString("f_mainharm"));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            DBUtil.close(rs, st, connection);
        }
        return diseaseBean;
    }
}

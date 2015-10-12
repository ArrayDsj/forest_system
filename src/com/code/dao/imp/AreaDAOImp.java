package com.code.dao.imp;

import com.code.bean.AreaBean;
import com.code.bean.ClassBean;
import com.code.dao.AreaDAO;
import com.code.util.DBUtil;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

/**
 * Created by CodeA on 2015/10/11.
 */
public class AreaDAOImp implements AreaDAO{
    @Override
    public boolean addArea(AreaBean areaBean) {
        return false;
    }

    @Override
    public ArrayList<AreaBean> getAllAreasByClass() {
        return null;
    }



    //得到满足条件的所有记录的总数
    @Override
    public int getAreasByCondition(String queryType, String queryStr) {
        if(queryType.equals("name")){
            queryType = "f_name";
        }else {
            queryType = "f_foresttype";
        }
        Connection connection = DBUtil.getConnection();

        String sql = "select count(*) from t_area where " +
                         queryType + "like '%" + queryStr +"%'";

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


    //得到满足条件的记录集合
    @Override
    public ArrayList<AreaBean> getAreasByCondition(String queryType, String queryStr, int pageNow) {
        Connection          connection = DBUtil.getConnection();
        ArrayList<AreaBean> all        = new ArrayList<AreaBean>();
        String sql = "select * from t_area as area join t_class as class\n" +
                "on area.fk_class = class.pk_id limit \n"+
                "where " + queryType + "like '%" + queryStr + "%'\n" +
                (pageNow - 1) * 2 + ",2";
        Statement st       = null;
        ResultSet rs       = null;
        AreaBean  areaBean = null;
        try {
            st = connection.createStatement();
            rs = st.executeQuery(sql);

            while (rs.next()) {
                areaBean = new AreaBean();
                areaBean.setId(rs.getInt("pk_id"));
                areaBean.setName(rs.getString("f_name"));
                areaBean.setForestType(rs.getString("f_foresttype"));
                areaBean.setLandType(rs.getString("f_landtype"));
                areaBean.setTreeType(rs.getString("f_treetype"));
                ClassBean classBean = new ClassBean();
                classBean.setName(rs.getString(8));
                areaBean.setClassBean(classBean);
                all.add(areaBean);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            DBUtil.close(rs, st, connection);
        }
        return all;
    }









    //得到没有条件下的所有记录的总数
    @Override
    public int getAllCounts(){
        Connection connection = DBUtil.getConnection();
        String sql = "select count(*) from t_area";
        Statement st = null;
        ResultSet rs = null;
        int reslut = -1 ;
        try {
            st = connection.createStatement();
            rs = st.executeQuery(sql);

            if(rs.next()){
                reslut = rs.getInt(1);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }finally{
            DBUtil.close(rs,st,connection);
        }
        return reslut;
    }

    //得到没有条件下的所有记录的分页数据
    @Override
    public ArrayList<AreaBean> getAllAreas(int pageNow){
        Connection connection = DBUtil.getConnection();
        ArrayList<AreaBean> all = new ArrayList<AreaBean>();
        String    sql    = "select * from t_area as area join t_class as class\n" +
                           "on area.fk_class = class.pk_id limit " + (pageNow-1)*2 + ",2";
        Statement st     = null;
        ResultSet rs     = null;
        AreaBean areaBean = null;
        try {
            st = connection.createStatement();
            rs = st.executeQuery(sql);

            while (rs.next()) {
                areaBean = new AreaBean();
                areaBean.setId(rs.getInt("pk_id"));
                areaBean.setName(rs.getString("f_name"));
                areaBean.setForestType(rs.getString("f_foresttype"));
                areaBean.setLandType(rs.getString("f_landtype"));
                areaBean.setTreeType(rs.getString("f_treetype"));
                ClassBean classBean = new ClassBean();
                classBean.setName(rs.getString(8));
                areaBean.setClassBean(classBean);
                all.add(areaBean);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            DBUtil.close(rs, st, connection);
        }
        return all;
    }
}

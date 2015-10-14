package com.code.dao.imp;

import com.code.bean.AreaBean;
import com.code.bean.ClassBean;
import com.code.dao.AreaDAO;
import com.code.util.DBUtil;

import java.sql.*;
import java.util.ArrayList;

/**
 * Created by CodeA on 2015/10/11.
 */
public class AreaDAOImp implements AreaDAO{
    @Override
    public boolean addArea(AreaBean areaBean) {
        Connection connection = DBUtil.getConnection();
        String sql = "insert into t_area(f_name,f_foresttype,f_landtype,f_treetype) \n" +
                        "values(?,?,?,?) ";
        PreparedStatement ps = null;
        int result = -1 ;
        try {
            ps = connection.prepareStatement(sql);
            ps.setString(1, areaBean.getName());
            ps.setString(2, areaBean.getForestType());
            ps.setString(3, areaBean.getLandType());
            ps.setString(4, areaBean.getTreeType());
            result = ps.executeUpdate();

        } catch (SQLException e) {
            e.printStackTrace();
        }finally{
            DBUtil.close(ps,connection);
        }
        return result == 1;
    }

    //初始化下拉列表是使用
    @Override
    public ArrayList<AreaBean> getAreasByClass() {
        Connection          connection = DBUtil.getConnection();
        ArrayList<AreaBean> all        = new ArrayList<AreaBean>();
        String sql = "select * from t_area where fk_class is null;";
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
                all.add(areaBean);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            DBUtil.close(rs, st, connection);
        }
        return all;
    }

    //按area表id查找area对象
    public AreaBean getAreaByPkID(int pk_id){
        Connection connection = DBUtil.getConnection();
        String    sql      = "select * from t_area where pk_id = " + pk_id;
        AreaBean  areaBean = new AreaBean();
        Statement st       = null;
        ResultSet rs       = null;
        int       reslut   = 0;
        try {
            st = connection.createStatement();
            rs = st.executeQuery(sql);

            if (rs.next()) {
                areaBean.setId(rs.getInt("pk_id"));
                areaBean.setName(rs.getString("f_name"));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            DBUtil.close(rs, st, connection);
        }
        return areaBean;
    }
    //按小班表的id查找对象
    @Override
    public AreaBean getAreaById(int fk_class) {
        Connection connection = DBUtil.getConnection();
        String sql = "select * from t_area where fk_class = " + fk_class;
        AreaBean areaBean = new AreaBean();
        Statement st     = null;
        ResultSet rs     = null;
        int       reslut = 0;
        try {
            st = connection.createStatement();
            rs = st.executeQuery(sql);

            if (rs.next()) {
                areaBean.setName(rs.getString("f_name"));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            DBUtil.close(rs, st, connection);
        }
        return areaBean;
    }


    //得到没有条件下的所有记录的总数
    @Override
    public int getCounts() {
        Connection connection = DBUtil.getConnection();
        String    sql    = "select count(*) from t_area";
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
    public ArrayList<AreaBean> getAreas(int pageNow, int pageSize) {
        Connection          connection = DBUtil.getConnection();
        ArrayList<AreaBean> all        = new ArrayList<AreaBean>();
        String sql = "select * from t_area as area  left join  t_class as class\n" +
                "on area.fk_class = class.pk_id limit " + (pageNow - 1) * pageSize + "," + pageSize;
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







    //得到满足条件的所有记录的总数
    @Override
    public int getCountsByCondition(String queryType, String queryStr) {
        Connection connection = DBUtil.getConnection();

        String sql = "select count(*) from t_area where " +
                         queryType + " like " + queryStr ;

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
    public ArrayList<AreaBean> getAreasByCondition(String queryType, String queryStr, int pageNow, int pageSize) {
        Connection          connection = DBUtil.getConnection();
        ArrayList<AreaBean> all        = new ArrayList<AreaBean>();
        String sql = "select * from t_area as area  left join  t_class as class\n" +
                "on area.fk_class = class.pk_id  \n"+
                "where area." + queryType + " like " + queryStr + "\n" +
                "limit " + (pageNow - 1) * pageSize + "," + pageSize;
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










}

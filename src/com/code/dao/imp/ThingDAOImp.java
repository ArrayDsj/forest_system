package com.code.dao.imp;

import com.code.bean.*;
import com.code.dao.ThingDAO;
import com.code.util.DBUtil;

import java.sql.*;
import java.util.ArrayList;

/**
 * Created by CodeA on 2015/10/14.
 */
public class ThingDAOImp implements ThingDAO{

    @Override
    public int getCounts() {
        Connection connection = DBUtil.getConnection();
        String sql = "select count(*) from t_thing";
        ResultSet rs = null;
        int result = -1;
        Statement st = null;

        try {
            st = connection.createStatement();
            rs = st.executeQuery(sql);
            if(rs.next()){
                result = rs.getInt(1);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }finally{
            DBUtil.close(rs,st,connection);
        }
        return result;
    }

    @Override
    public int getCountsByCondtion(String query, String str) {
        if(query.equals("f_name")){
            query = "t";
        }
        query += ".f_name";
        Connection connection = DBUtil.getConnection();
        String sql = "select * from \n" +
                "t_thing t, t_findway f, \n" +
                "t_stage s, t_disastertype d, t_area a\n" +
                "where t.fk_findway=f.pk_id\n" +
                "and t.fk_stage=s.pk_id\n" +
                "and t.fk_area=a.pk_id\n" +
                "and t.fk_disastertype=d.pk_id \n" +
                "and " + query + " like " + str + "\n";
        ResultSet rs = null;
        int result = -1;
        Statement st = null;

        try {
            st = connection.createStatement();
            rs = st.executeQuery(sql);
            if (rs.next()) {
                result = rs.getInt(1);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            DBUtil.close(rs,st, connection);
        }
        return result;
    }

    @Override
    public ArrayList<ThingBean> getThings(int pageNow, int pageSize) {
        Connection connection = DBUtil.getConnection();
        String sql = "select * from \n" +
                    "t_thing t, t_findway f, \n" +
                    "t_stage s, t_disastertype d, t_area a\n" +
                    "where t.fk_findway=f.pk_id\n" +
                    "and t.fk_stage=s.pk_id\n" +
                    "and t.fk_area=a.pk_id\n" +
                    "and t.fk_disastertype=d.pk_id \n" +
                    "limit " + (pageNow - 1)*pageSize + "," + pageSize;
        ResultSet rs = null;
        Statement st = null;
        ArrayList<ThingBean> allThings = new ArrayList<ThingBean>();

        ThingBean thingBean = null;
        FindwayBean findwayBean = null;
        StageBean stageBean = null;
        DisasterBean disasterBean = null;
        AreaBean areaBean = null;
        ClassBean classBean = null;

        try {
            st = connection.createStatement();
            rs = st.executeQuery(sql);
            while(rs.next()){
                //方法1:只查询thing表元素数据,再根据数据字段调用其他DAO的方法得到Bean(太浪费资源,不使用)
                //方法2:多张链表查询(sql太复杂)
                //1. 构建thing基本数据
                thingBean = new ThingBean();
                thingBean.setId(rs.getInt("t.pk_id"));
                thingBean.setName(rs.getString("t.f_name"));
                thingBean.setFoundDay(rs.getDate("t.f_foundday"));
                thingBean.setScheme(rs.getString("t.f_scheme"));
                thingBean.setLoss(rs.getString("t.f_loss"));
                thingBean.setDescription(rs.getString("t.f_descript"));
                thingBean.setProportion(rs.getString("t.f_proportion"));
                thingBean.setPhotoPath(rs.getString("t.f_photopath"));

                //2. 构建发现方式数据
                findwayBean = new FindwayBean();
                findwayBean.setId(rs.getInt("f.pk_id"));
                findwayBean.setName(rs.getString("f.f_name"));

                //3. 构建状态数据
                stageBean = new StageBean();
                stageBean.setId(rs.getInt("s.pk_id"));
                stageBean.setName(rs.getString("s.f_name"));

                //4. 构建灾害类型数据
                disasterBean = new DisasterBean();
                disasterBean.setId(rs.getInt("d.pk_id"));
                disasterBean.setName(rs.getString("d.f_name"));

                //5. 构建地区数据
                int areaID = rs.getInt("a.pk_id");
                areaBean = new AreaDAOImp().getAreaByPkID(areaID);

                //6. 组装数据
                thingBean.setFindWay(findwayBean);
                thingBean.setStage(stageBean);
                thingBean.setDisasterType(disasterBean);
                thingBean.setAreaBean(areaBean);

                allThings.add(thingBean);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            DBUtil.close(rs,st, connection);
        }
        return allThings;
    }

    @Override
    public ArrayList<ThingBean> getThingsByCondtion(String query, String str, int pageNow, int pageSize) {
        if (query.equals("f_name")) {
            query = "t";
        }
        query += ".f_name";
        Connection connection = DBUtil.getConnection();
        String sql = "select * from \n" +
                    "t_thing t, t_findway f, \n" +
                    "t_stage s, t_disastertype d, t_area a\n" +
                    "where t.fk_findway=f.pk_id\n" +
                    "and t.fk_stage=s.pk_id\n" +
                    "and t.fk_area=a.pk_id\n" +
                    "and t.fk_disastertype=d.pk_id \n" +
                     "and " + query + " like " + str + "\n" +
                     "limit " + (pageNow - 1) * pageSize + "," + pageSize;;
        ResultSet rs = null;
        Statement st = null;
        ArrayList<ThingBean> allThings = new ArrayList<ThingBean>();
        ThingBean   thingBean   = null;
        FindwayBean findwayBean = null;
        StageBean   stageBean   = null;
        DisasterBean disasterBean = null;
        AreaBean    areaBean    = null;
        ClassBean   classBean   = null;

        try {
            st = connection.createStatement();
            rs = st.executeQuery(sql);
            while (rs.next()) {
                //方法1:只查询thing表元素数据,再根据数据字段调用其他DAO的方法得到Bean(太浪费资源,不使用)
                //方法2:多张链表查询(sql太复杂)
                //1. 构建thing基本数据
                thingBean = new ThingBean();
                thingBean.setId(rs.getInt("t.pk_id"));
                thingBean.setName(rs.getString("t.f_name"));
                thingBean.setFoundDay(rs.getDate("t.f_foundday"));
                thingBean.setScheme(rs.getString("t.f_scheme"));
                thingBean.setLoss(rs.getString("t.f_loss"));
                thingBean.setDescription(rs.getString("t.f_descript"));
                thingBean.setProportion(rs.getString("t.f_proportion"));
                thingBean.setPhotoPath(rs.getString("t.f_photopath"));

                //2. 构建发现方式数据
                findwayBean = new FindwayBean();
                findwayBean.setId(rs.getInt("f.pk_id"));
                findwayBean.setName(rs.getString("f.f_name"));

                //3. 构建状态数据
                stageBean = new StageBean();
                stageBean.setId(rs.getInt("s.pk_id"));
                stageBean.setName(rs.getString("s.f_name"));

                //4. 构建灾害类型数据
                disasterBean = new DisasterBean();
                disasterBean.setId(rs.getInt("d.pk_id"));
                disasterBean.setName(rs.getString("d.f_name"));

                //5. 构建地区数据
                int areaID = rs.getInt("a.pk_id");
                areaBean = new AreaDAOImp().getAreaByPkID(areaID);

                //6. 组装数据
                thingBean.setFindWay(findwayBean);
                thingBean.setStage(stageBean);
                thingBean.setDisasterType(disasterBean);
                thingBean.setAreaBean(areaBean);

                allThings.add(thingBean);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            DBUtil.close(rs, st, connection);
        }
        return allThings;
    }

    @Override
    public boolean addThing(ThingBean thingBean) {
        Connection connection = DBUtil.getConnection();
        String sql = "insert into t_thing(f_name,f_descript,f_foundday," +
                "f_loss,f_proportion,f_scheme,f_photopath,fk_findway,fk_stage,fk_area,fk_disastertype) \n" +
                "values(?,?,?,?,?,?,?,?,?,?,?) ";
        PreparedStatement ps = null;
        int result = -1;
        try {
            ps = connection.prepareStatement(sql);
            ps.setString(1,thingBean.getName());
            ps.setString(2,thingBean.getDescription());
            ps.setDate(3,new java.sql.Date(thingBean.getFoundDay().getTime()));
            ps.setString(4,thingBean.getLoss());
            ps.setString(5,thingBean.getProportion());
            ps.setString(6,thingBean.getScheme());
            ps.setString(7,thingBean.getPhotoPath());
            ps.setInt(8,thingBean.getFindWay().getId());
            ps.setInt(9,thingBean.getStage().getId());
            ps.setInt(10,thingBean.getAreaBean().getId());
            ps.setInt(11,thingBean.getDisasterType().getId());
            result = ps.executeUpdate();

        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            DBUtil.close(ps, connection);
        }
        return result == 1;
    }

    @Override
    public ThingBean getThingById(int id) {
        Connection connection = DBUtil.getConnection();
        String sql = "select * from \n" +
                "t_thing t, t_findway f, \n" +
                "t_stage s, t_disastertype d, t_area a\n" +
                "where t.fk_findway=f.pk_id\n" +
                "and t.fk_stage=s.pk_id\n" +
                "and t.fk_area=a.pk_id\n" +
                "and t.fk_disastertype=d.pk_id \n" +
                "and t.pk_id=" + id;
        ResultSet rs = null;
        Statement st = null;

        ThingBean   thingBean   = null;
        FindwayBean findwayBean = null;
        StageBean   stageBean   = null;
        DisasterBean disasterBean = null;
        AreaBean    areaBean    = null;
        ClassBean   classBean   = null;

        try {
            st = connection.createStatement();
            rs = st.executeQuery(sql);
            if (rs.next()) {
                //方法1:只查询thing表元素数据,再根据数据字段调用其他DAO的方法得到Bean(太浪费资源,不使用)
                //方法2:多张链表查询(sql太复杂)
                //1. 构建thing基本数据
                thingBean = new ThingBean();
                thingBean.setId(rs.getInt("t.pk_id"));
                thingBean.setName(rs.getString("t.f_name"));
                thingBean.setFoundDay(rs.getDate("t.f_foundday"));
                thingBean.setScheme(rs.getString("t.f_scheme"));
                thingBean.setLoss(rs.getString("t.f_loss"));
                thingBean.setDescription(rs.getString("t.f_descript"));
                thingBean.setProportion(rs.getString("t.f_proportion"));
                thingBean.setPhotoPath(rs.getString("t.f_photopath"));
                thingBean.setResult(rs.getString("t.f_result"));

                //2. 构建发现方式数据
                findwayBean = new FindwayBean();
                findwayBean.setId(rs.getInt("f.pk_id"));
                findwayBean.setName(rs.getString("f.f_name"));

                //3. 构建状态数据
                stageBean = new StageBean();
                stageBean.setId(rs.getInt("s.pk_id"));
                stageBean.setName(rs.getString("s.f_name"));

                //4. 构建灾害类型数据
                disasterBean = new DisasterBean();
                disasterBean.setId(rs.getInt("d.pk_id"));
                disasterBean.setName(rs.getString("d.f_name"));

                //5. 构建地区数据
                int areaID = rs.getInt("a.pk_id");
                areaBean = new AreaDAOImp().getAreaByPkID(areaID);

                //6. 组装数据
                thingBean.setFindWay(findwayBean);
                thingBean.setStage(stageBean);
                thingBean.setDisasterType(disasterBean);
                thingBean.setAreaBean(areaBean);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            DBUtil.close(rs, st, connection);
        }
        return thingBean;
    }

    //修改信息
    @Override
    public int updateThing(ThingBean thingBean) {
        String sql = "";
        //1. 当thingBean中的防治方案为null,说明是点击申请专家会审时调用
        // 更改状态值就可以了
        Connection        connection = DBUtil.getConnection();
        PreparedStatement ps         = null;
        try {
            if(thingBean.getScheme() == null || thingBean.getScheme().equals("")){
                sql = "update t_thing set f_status = 1 where pk_id = ?";
                ps = connection.prepareStatement(sql);
                ps.setInt(1, thingBean.getId());
                return ps.executeUpdate();
            }else {
                sql = "update t_thing set f_stage=?, f_scheme=? where pk_id = ? ";
                ps = connection.prepareStatement(sql);
                ps.setInt(1, thingBean.getStage().getId());
                ps.setInt(2, thingBean.getId());
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }finally {
            DBUtil.close(ps, connection);
        }
        return -1;
    }
}

package com.code.dao.imp;

import com.code.bean.AreaBean;
import com.code.bean.ClassBean;
import com.code.dao.ClassDAO;
import com.code.util.DBUtil;

import java.sql.*;
import java.util.ArrayList;

/**
 * Created by CodeA on 2015/10/13.
 */
public class ClassDAOImp implements ClassDAO {
    @Override
    public boolean addClass(ClassBean classBean) {
        Connection connection = DBUtil.getConnection();
        String sql1 = "insert into t_class(f_name,f_manager,f_phone,f_number,f_foundday) \n" +
                    "values(?,?,?,?,?) ";
        String sql2 = "select max(pk_id) as id from t_class";
        String sql3 = "update t_area set fk_class = ? where pk_id = ?;";
        PreparedStatement ps     = null;
        int               result = -1;
        ResultSet resultSet = null;
        try {
            //1. 开启事物处理
            connection.setAutoCommit(false);
            //2. 执行向class表中添加数据
            ps = connection.prepareStatement(sql1);
            ps.setString(1, classBean.getName());
            ps.setString(2, classBean.getManager());
            ps.setString(3, classBean.getPhone());
            ps.setInt(4, classBean.getNumber());
            ps.setDate(5, new java.sql.Date(classBean.getFoundDay().getTime()));
            result = ps.executeUpdate();

            //3. 得到class表中id最大的值(最新的班级绑定到area上)
            int maxId = -1;
            ps = connection.prepareStatement(sql2);
            resultSet = ps.executeQuery();
            if(resultSet.next()){
                maxId = resultSet.getInt(1);
            }

            //4. 得到被选中的下拉列表中的areaID
            int area_pk_id = new AreaDAOImp().getAreaByPkID(Integer.parseInt(classBean.getArea())).getId();
            //5. 向area表中添加class数据
            ps = connection.prepareStatement(sql3);
            ps.setInt(1, maxId);
            ps.setInt(2,area_pk_id);
            result += ps.executeUpdate();

            //6. 提交事物
            connection.commit();
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            DBUtil.close(ps, connection);
        }
        return result == 2;
    }

    @Override
    public ClassBean showClass(ClassBean classBean) {
        int classID = classBean.getId();
        Connection connection = DBUtil.getConnection();
        String    sql = "select * from t_class "+
                    "where pk_id = " + classID;
        Statement st  = null;
        ResultSet rs = null;
        try {
            st = connection.createStatement();
            rs = st.executeQuery(sql);
            while (rs.next()) {
                classBean.setId(rs.getInt("pk_id"));
                classBean.setName(rs.getString("f_name"));
                classBean.setManager(rs.getString("f_manager"));
                classBean.setPhone(rs.getString("f_phone"));
                classBean.setNumber(rs.getInt("f_number"));
                classBean.setFoundDay(rs.getDate("f_foundday"));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return classBean;
    }

    @Override
    public boolean updateClass(ClassBean classBean) {
        int    classID = classBean.getId();
        String manager = classBean.getManager();
        String phone   = classBean.getPhone();
        Connection connection = DBUtil.getConnection();
        PreparedStatement ps = null;
        int result = -1;
        String sql = "update t_class set f_manager = ?,f_phone = ? where pk_id = ?";

        try {
            ps = connection.prepareStatement(sql);
            ps.setString(1, manager);
            ps.setString(2, phone);
            ps.setInt(3, classID);
            result = ps.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }finally {
            DBUtil.close(ps,connection);
        }
        return result == 1;
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
                classBean.setArea(areaBean.getName());
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

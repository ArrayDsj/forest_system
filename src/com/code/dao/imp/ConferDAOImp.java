package com.code.dao.imp;

import com.code.bean.ConferBean;
import com.code.bean.ThingBean;
import com.code.dao.ConferDAO;
import com.code.util.DBUtil;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

/**
 * Created by CodeA on 2015/10/17.
 */
public class ConferDAOImp implements ConferDAO{
    @Override
    public ArrayList<ConferBean> getConferById(int id) {
        Connection connection = DBUtil.getConnection();
        ArrayList<ConferBean> allConfers = new ArrayList<ConferBean>();
        ConferBean conferBean = null;
        ThingBean  thingBean  = null;
        String sql = "select * from t_consult c join t_thing t\n" +
                "on c.fk_thing=t.pk_id\n" +
                "where t.pk_id=" + id + "\n" +
                "order by c.pk_id desc ";
        Statement st = null;
        ResultSet rs = null;

        try {
            st = connection.createStatement();
            rs = st.executeQuery(sql);
            while (rs.next()) {
                conferBean = new ConferBean();
                conferBean.setId(rs.getInt("c.pk_id"));
                conferBean.setStaff(rs.getString("c.f_staff"));
                conferBean.setData(rs.getDate("c.f_time"));
                conferBean.setResult(rs.getString("c.f_result"));
                thingBean = new ThingBean();
                thingBean.setId(rs.getInt("t.pk_id"));
                thingBean.setResult(rs.getString("t.f_result"));
                conferBean.setThingBean(thingBean);
                allConfers.add(conferBean);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            DBUtil.close(rs, st, connection);
        }
        return allConfers;
    }

    @Override
    public boolean addConfer(ConferBean conferBean) {
        Connection connection = DBUtil.getConnection();
        ArrayList<ConferBean> allConfers = new ArrayList<ConferBean>();
        Statement st = null;
        ThingBean  thingBean  = null;
        int res = 0;
        int    thingID = conferBean.getThingBean().getId();
        String result  = conferBean.getThingBean().getResult();
        //1. 向会审表写入记录
        String sql1 = "insert into t_consult(f_result,f_staff,f_time,fk_thing)\n" +
                    "values('"+ result + "','" + conferBean.getStaff() + "','"+ new java.sql.Date(conferBean.getData().getTime()) +"',"+ thingID +")";
        //2. 向事件表写入最新记录
        String sql2 = "update t_thing set f_result = '"+ result +"' where pk_id = " + thingID;
        try {
            // 开启事物处理
            connection.setAutoCommit(false);
            st = connection.createStatement();
            res += st.executeUpdate(sql1);

            res += st.executeUpdate(sql2);

            // 提交事物
            connection.commit();
        } catch (SQLException e) {
            e.printStackTrace();
        }finally {
            DBUtil.close(st,connection);
        }
        return res == 2;
    }
}

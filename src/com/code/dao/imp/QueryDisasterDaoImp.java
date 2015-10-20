package com.code.dao.imp;

import com.code.bean.DisasterBean;
import com.code.dao.QueryDisasterDao;
import com.code.util.DBUtil;

import java.sql.*;
import java.util.ArrayList;

public class QueryDisasterDaoImp implements QueryDisasterDao {

	public ArrayList<DisasterBean> queryDiseaseByValue() {
		// TODO Auto-generated method stub
		ArrayList<DisasterBean> al =new ArrayList<DisasterBean>();
        Connection con = DBUtil.getConnection();
		PreparedStatement ps = null;
		ResultSet rs = null;

		String sql ="select pk_id,f_name from t_diseaselist";
		try {
			ps = con.prepareStatement(sql);
			rs = ps.executeQuery();
			while(rs.next()){
				DisasterBean dis =  new DisasterBean();
				dis.setId(rs.getInt("pk_id"));
				dis.setName(rs.getString("f_name"));
				al.add(dis);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		finally{
			DBUtil.close(rs, ps, con);
			
		}
		return al;
	}

	public ArrayList<DisasterBean> queryMouseByValue() {
		// TODO Auto-generated method stub
		ArrayList<DisasterBean> al = new ArrayList<DisasterBean>();
        Connection con = DBUtil.getConnection();
		PreparedStatement ps = null;
		ResultSet rs = null;

		String sql ="select pk_id,f_name from t_amouse";
		try {
			ps = con.prepareStatement(sql);
			rs = ps.executeQuery();
			while(rs.next()){
				DisasterBean dis =  new DisasterBean();
				dis.setId(rs.getInt("pk_id"));
				dis.setName(rs.getString("f_name"));
				al.add(dis);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		finally{
			DBUtil.close(rs, ps, con);
			
		}
		return al;
	}

	public ArrayList<DisasterBean> queryWormByValue() {
		// TODO Auto-generated method stub
		ArrayList<DisasterBean> al =new ArrayList<DisasterBean>();
        Connection con = DBUtil.getConnection();
		PreparedStatement ps = null;
		ResultSet rs = null;

		String sql ="select pk_id,f_name from t_pestlist";
		try {
			ps = con.prepareStatement(sql);
			rs = ps.executeQuery();
			while(rs.next()){
				DisasterBean dis =  new DisasterBean();
				dis.setId(rs.getInt("pk_id"));
				dis.setName(rs.getString("f_name"));
				al.add(dis);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		finally{
			DBUtil.close(rs, ps, con);
			
		}
		
		return al;
	}

}

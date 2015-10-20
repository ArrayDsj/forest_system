package com.code.dao.imp;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import com.code.bean.ApparatusBean;
import com.code.bean.DrugBean;
import com.code.dao.ApparatusDao;
import com.code.util.DBUtil;

public class ApparatusDaoImp implements ApparatusDao {

	public ArrayList<ApparatusBean> getDrugByPage(int currentPage, int numberPer) {
		// TODO Auto-generated method stub
		ArrayList<ApparatusBean> al = new ArrayList<ApparatusBean>();
        Connection con = DBUtil.getConnection();

		String sql = "select * from t_apparatus order by pk_id desc limit ?,?";
		PreparedStatement ps = null;
		ResultSet rs = null;
		try {
			ps = con.prepareStatement(sql);
			ps.setInt(1, (currentPage - 1) * 4);
			ps.setInt(2, numberPer);
			rs = ps.executeQuery();
			while(rs.next()){
				ApparatusBean ab = new ApparatusBean();
				ab.setMainUse(rs.getString("f_mainuse"));
				ab.setName(rs.getString("f_name"));
				ab.setType(rs.getString("f_preventType"));
				al.add(ab);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally{
			DBUtil.close(rs, ps, con);
		}
		
		return al;
	}

	public int getApparCount() {
		// TODO Auto-generated method stub
		int count = 0;
        Connection con = DBUtil.getConnection();
		PreparedStatement ps = null;
		ResultSet rs = null;

		String sql = "select count(*) as allC from t_apparatus";
		try {
			ps = con.prepareStatement(sql);
			rs = ps.executeQuery();
			while(rs.next()){
				count = rs.getInt("allC");
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally{
			DBUtil.close(rs, ps, con);
		}
		
		
		return count;
	}

	public ArrayList<ApparatusBean> getApparatusByName(String queryVal,
			int currentPage, int numberPer) {
		// TODO Auto-generated method stub
		ArrayList<ApparatusBean> al = new ArrayList<ApparatusBean>();
        Connection con = DBUtil.getConnection();
		PreparedStatement ps =null;
		ResultSet rs = null;

		String sql = "select * from t_apparatus where f_name like '%"+queryVal+"%' order by pk_id desc limit ?,?";
		try {
			ps = con.prepareStatement(sql);
			ps.setInt(1, (currentPage - 1) * 4);
			ps.setInt(2, numberPer);
			rs = ps.executeQuery();
			while(rs.next()){
				ApparatusBean ab = new ApparatusBean();
				ab.setMainUse(rs.getString("f_mainuse"));
				ab.setName(rs.getString("f_name"));
				ab.setType(rs.getString("f_preventType"));
				al.add(ab);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally{
			DBUtil.close(rs, ps, con);
		}
		
		return al;
	}

	public int getApparatusCountByName(String queryVal, int currentPage,
			int numberPer) {
		// TODO Auto-generated method stub
		int count = 0;
        Connection con = DBUtil.getConnection();
		PreparedStatement ps = null;
		ResultSet rs = null;

		String sql = "select count(*) as allC from t_apparatus where f_name like '%"+queryVal+"%'";
		try {
			ps = con.prepareStatement(sql);
			rs = ps.executeQuery();
			while(rs.next()){
				count = rs.getInt("allC");
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally{
			DBUtil.close(rs, ps, con);
		}
		return count;
	}

	public boolean addApparatus(ApparatusBean app) {
		// TODO Auto-generated method stub
        Connection con = DBUtil.getConnection();
		PreparedStatement ps =null;
	

		String sql ="insert into t_apparatus(f_name,f_preventType,f_mainuse) value(?,?,?)";
		try {
			ps = con.prepareStatement(sql);
			ps.setString(1, app.getName());
			ps.setString(2, app.getType());
			ps.setString(3, app.getMainUse());
			ps.executeUpdate();
			return true;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return false;
		}finally{
			DBUtil.close(ps,con);
			
		}
		
	}

	public ArrayList<ApparatusBean> getApparatusByType(String queryVal,
			int currentPage, int numberPer) {
		// TODO Auto-generated method stub
		ArrayList<ApparatusBean> al  =new ArrayList<ApparatusBean>();
        Connection con = DBUtil.getConnection();
		PreparedStatement ps =null;
		ResultSet rs = null;

		String sql ="select * from t_apparatus where f_preventType like '%"+queryVal +"%' limit ?,?";
		try {
			ps = con.prepareStatement(sql);
			ps.setInt(1, (currentPage - 1) * 4);
			ps.setInt(2, numberPer);
			rs = ps.executeQuery();
			while(rs.next()){
				ApparatusBean ab = new ApparatusBean();
				ab.setMainUse(rs.getString("f_mainuse"));
				ab.setName(rs.getString("f_name"));
				ab.setType(rs.getString("f_preventType"));
				al.add(ab);
				
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally{
			DBUtil.close(rs, ps, con);
		}
		
		return al;
	}

	public int getApparatusCountByType(String queryVal, int currentPage,
			int numberPer) {
		// TODO Auto-generated method stub
		int count = 0;
        Connection con = DBUtil.getConnection();
		PreparedStatement ps = null;
		ResultSet rs = null;

		String sql = "select count(*) as allC from t_apparatus where f_preventType like '%"+queryVal+"%'";
		try {
			ps = con.prepareStatement(sql);
			rs = ps.executeQuery();
			while(rs.next()){
				count = rs.getInt("allC");
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally{
			DBUtil.close(rs, ps, con);
		}
		return count;
	}

	public ArrayList<ApparatusBean> getApparatusByType(String queryVal) {
		// TODO Auto-generated method stub
		ArrayList<ApparatusBean> al  =new ArrayList<ApparatusBean>();
        Connection con = DBUtil.getConnection();
		PreparedStatement ps =null;
		ResultSet rs = null;

		String sql ="select * from t_apparatus where f_preventType like '%"+queryVal +"%'";
		try {
			ps = con.prepareStatement(sql);
			rs = ps.executeQuery();
			while(rs.next()){
				ApparatusBean ab = new ApparatusBean();
				ab.setId(rs.getInt("pk_id"));
				ab.setMainUse(rs.getString("f_mainuse"));
				ab.setName(rs.getString("f_name"));
				ab.setType(rs.getString("f_preventType"));
				al.add(ab);
				
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally{
			DBUtil.close(rs, ps, con);
		}
		
		return al;
	}

}

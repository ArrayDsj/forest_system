package com.code.dao.imp;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.code.bean.DiseaseBean;
import com.code.bean.PestBean;
import com.code.dao.DiseaseDao;
import com.code.util.DBUtil;

public class DiseaseDaoImp implements DiseaseDao {
	//增加信息
	public int addDisease(DiseaseBean disease) {
		// TODO Auto-generated method stub
		Connection cont = DBUtil.getConnection();
		String sql = "insert into t_diseaselist(f_name,f_source,f_symptoms,f_regularityofdisease,f_picture,f_controlmeasures,f_mainharm)" +
				"values(?,?,?,?,?,?,?)";
		String sql1="select max(pk_id) as maxid from t_diseaselist";
		PreparedStatement ps = null;
		int result = -1;
		try {
			cont.setAutoCommit(false);
			
			ps = cont.prepareStatement(sql);

			ps.setString(1, disease.getName());
			ps.setString(2, disease.getSource());
			ps.setString(3, disease.getSymptoms());
			ps.setString(4, disease.getROD());
			ps.setString(5, disease.getPicture());
			ps.setString(6, disease.getLMA());
			ps.setString(7, disease.getMainharm());
			result = ps.executeUpdate();
			
			ResultSet rs=ps.executeQuery(sql1);
			
			while(rs.next()){
				result=rs.getInt("maxid");
			}
			
			cont.commit();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			try {
				cont.rollback();
			} catch (SQLException e1) {
				// TODO Auto-generated catch block
				e1.printStackTrace();
			}
			e.printStackTrace();
		}finally{
			DBUtil.close(ps, cont);
		}
		
		return result;
	}
	//得到无条件下的分页数据
	public ArrayList alldisease(int pageNow, int pageSize) {
		// TODO Auto-generated method stub
		ArrayList<DiseaseBean> al = new ArrayList<DiseaseBean>();
		Connection con = DBUtil.getConnection();
		String sql1 = "select * from t_diseaselist order by pk_id desc limit ?,?";
		PreparedStatement ps = null;
		ResultSet rs = null;
		try {
			ps = con.prepareStatement(sql1);
			ps.setInt(1, (pageNow - 1) * 4);
			ps.setInt(2, pageSize);
			rs = ps.executeQuery();
			while (rs.next()) {
				DiseaseBean dl = new DiseaseBean();
				dl.setId(rs.getInt("pk_id"));
				dl.setName(rs.getString("f_name"));
				dl.setSource(rs.getString("f_source"));
				dl.setSymptoms(rs.getString("f_symptoms"));
				dl.setROD(rs.getString("f_regularityofdisease"));
				dl.setPicture(rs.getString("f_picture"));
				dl.setLMA(rs.getString("f_controlmeasures"));
				dl.setMainharm(rs.getString("f_mainharm"));
				al.add(dl);
			}

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			if (ps != null) {
				try {
					ps.close();
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			}
			DBUtil.close(rs, ps,con);
		}
		return al;
	}
	//得到有条件下的总记录条数
	public int Diseases(String con, String value) {
		// TODO Auto-generated method stub
		int row = 0;
		Connection con6 = DBUtil.getConnection();
		PreparedStatement ps = null;
		ResultSet rs = null;
		String sql = "select count(*) as count1 from t_diseaselist where "+con+" like '%"+value+"%'";
		
		try {
			ps = con6.prepareStatement(sql);
			rs = ps.executeQuery();
			while(rs.next()){
				row = rs.getInt("count1");	
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally{
			
			DBUtil.close(rs, ps, con6);
		}
		
		return row;
	}
	//根据ID查询所有信息
	public DiseaseBean getDiseaseById(int id) {
		// TODO Auto-generated method stub
		Connection cont2 = DBUtil.getConnection();
		DiseaseBean pes = new DiseaseBean();
		String sql = "select * from t_diseaselist where pk_id=?";
		
		PreparedStatement ps = null;
		ResultSet rs = null;
		try {
			ps = cont2.prepareStatement(sql);
			ps.setInt(1, id);
			rs = ps.executeQuery();
			while(rs.next()){
				pes.setId(rs.getInt(1));
				pes.setName(rs.getString(2));
				pes.setSource(rs.getString(3));
				pes.setSymptoms(rs.getString(4));
				pes.setROD(rs.getString(5));
				pes.setPicture(rs.getString(6));
				pes.setLMA(rs.getString(7));
				pes.setMainharm(rs.getString(8));
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally{
			DBUtil.close(rs, ps, cont2);
		}
		
		return pes;
	}
	//根据条件查询信息
	public ArrayList getDiseaseInfo(String con, String value,
			int pageNow, int pageSize) {
		// TODO Auto-generated method stub
		ArrayList<DiseaseBean> list = new ArrayList<DiseaseBean>();
		Connection con5 = DBUtil.getConnection();
		PreparedStatement ps = null;
		String sql = "select * from t_diseaselist where"+con+"like'%"+value+"%' limit ?,?" ;
		ResultSet rs = null;
		try {
			ps = con5.prepareStatement(sql);
			ps.setInt(1, (pageSize-1)*pageNow);
			ps.setInt(2, pageNow);
			rs = ps.executeQuery();
			
			while(rs.next()){
				DiseaseBean dl = new DiseaseBean();
				dl.setId(rs.getInt("pk_id"));
				dl.setName(rs.getString("f_name"));
				dl.setSource(rs.getString("f_source"));
				dl.setSymptoms(rs.getString("f_symptoms"));
				dl.setROD(rs.getString("f_regularityofdisease"));
				dl.setPicture(rs.getString("f_picture"));
				dl.setLMA(rs.getString("f_controlmeasures"));
				dl.setMainharm(rs.getString("f_mainharm"));
				list.add(dl);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally{
			
			DBUtil.close(rs, ps, con5);
		}
		
		return list;
		
	}
	//图片
	public boolean updateById(int id, String image1) {
		// TODO Auto-generated method stub
		boolean flag = false;
		Connection cont3 = DBUtil.getConnection();
		String sql3 = "update t_diseaselist set f_picture=? where pk_id=?";
		PreparedStatement ps = null;
		
		try {
			ps = cont3.prepareStatement(sql3);
			ps.setString(1, image1);
			ps.setInt(2, id);
			int row = ps.executeUpdate();
			if(row>0){
				flag = true;
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally{
			
			DBUtil.close(ps, cont3);
		}
		return flag;
	}
	//得到无条件下的总记录条数
	public int DLD() {
		// TODO Auto-generated method stub
		
		int count = 0;
		Connection con = DBUtil.getConnection();
		String sql = "select count(*) as allC from t_diseaselist";
		PreparedStatement ps = null;
		ResultSet rs = null;
		try {
			ps = con.prepareStatement(sql);
			rs = ps.executeQuery();
			while (rs.next()) {
				count = rs.getInt("allC");
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			if (ps != null) {
				try {
					ps.close();
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			}
			DBUtil.close(rs,ps, con);
		}
		return count;
	}

}

package com.code.dao.imp;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import com.code.bean.AmouseBean;
import com.code.bean.DiseaseBean;
import com.code.dao.AmouseDao;
import com.code.util.DBUtil;

public class AmouseDaoimp implements AmouseDao {
	//得到无条件下的总记录条数
	public int AD() {
		// TODO Auto-generated method stub
		int count = 0;
		Connection con = DBUtil.getConnection();
		String sql = "select count(*) as allC from t_amouse";
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
	//得到有条件下的总记录条数
	public int Amouse(String value) {
		// TODO Auto-generated method stub
		int row = 0;
		Connection con6 = DBUtil.getConnection();
		PreparedStatement ps = null;
		ResultSet rs = null;
		String sql = "select count(*) as count1 from t_amouse where f_name like '%"+value+"%'";
		
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
	//增加信息
	public int addAmouse(AmouseBean amouse) {
		// TODO Auto-generated method stub
		Connection cont = DBUtil.getConnection();
		String sql = "insert into t_amouse(f_name,f_food,f_multiply,f_naturalenemies,f_picture,f_controlmeasures,f_mainharm)" +
				"values(?,?,?,?,?,?,?)";
		String sql1="select max(pk_id) as maxid from t_amouse";
		PreparedStatement ps = null;
		int result = -1;
		try {
			cont.setAutoCommit(false);
			
			ps = cont.prepareStatement(sql);

			ps.setString(1, amouse.getName());
			ps.setString(2, amouse.getFood());
			ps.setString(3, amouse.getMultiply());
			ps.setString(4, amouse.getSentinel());
			ps.setString(5, amouse.getPicture());
			ps.setString(6, amouse.getCtma());
			ps.setString(7, amouse.getMH());
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
	public ArrayList<AmouseBean> allAmouse(int pageNow, int pageSize) {
		// TODO Auto-generated method stub
		ArrayList<AmouseBean> amouse3 = new ArrayList<AmouseBean>();
		Connection con = DBUtil.getConnection();
		String sql1 = "select * from t_amouse order by pk_id desc limit ?,?";
		PreparedStatement ps = null;
		ResultSet rs = null;
		try {
			ps = con.prepareStatement(sql1);
			ps.setInt(1, (pageNow - 1) * 4);
			ps.setInt(2, pageSize);
			rs = ps.executeQuery();
			while (rs.next()) {
				AmouseBean dl = new AmouseBean();
				dl.setId(rs.getInt("pk_id"));
				dl.setName(rs.getString("f_name"));
				dl.setFood(rs.getString("f_food"));
				dl.setMultiply(rs.getString("f_multiply"));
				dl.setSentinel(rs.getString("f_naturalenemies"));
				dl.setPicture(rs.getString("f_picture"));
				dl.setCtma(rs.getString("f_controlmeasures"));
				dl.setMH(rs.getString("f_mainharm"));
				amouse3.add(dl);
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
		return amouse3;
	}
	//根据条件查询信息；
	public ArrayList<AmouseBean> getAmouseInfo(String value, int pageNow, int pageSize) {
		// TODO Auto-generated method stub
		ArrayList<AmouseBean> amouse = new ArrayList<AmouseBean>();
		Connection con5 = DBUtil.getConnection();
		PreparedStatement ps = null;
		String sql = "select * from t_diseaselist where f_name like'%"+value+"%' limit ?,?" ;
		ResultSet rs = null;
		try {
			ps = con5.prepareStatement(sql);
			ps.setInt(1, (pageSize-1)*pageNow);
			ps.setInt(2, pageNow);
			rs = ps.executeQuery();

			while(rs.next()){
				AmouseBean dl = new AmouseBean();
				dl.setId(rs.getInt("pk_id"));
				dl.setName(rs.getString("f_name"));
				dl.setFood(rs.getString("f_food"));
				dl.setMultiply(rs.getString("f_multiply"));
				dl.setSentinel(rs.getString("f_naturalenemies"));
				dl.setPicture(rs.getString("f_picture"));
				dl.setCtma(rs.getString("f_controlmeasures"));
				dl.setMH(rs.getString("f_mainharm"));
				amouse.add(dl);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally{

			DBUtil.close(rs, ps, con5);
		}

		return amouse;
	}
	//根据ID查询所有信息
	public AmouseBean getAmouseById(int id) {
		// TODO Auto-generated method stub
		Connection cont2 = DBUtil.getConnection();
		AmouseBean amouse = new AmouseBean();
		String sql = "select * from t_amouse where pk_id=?";

		PreparedStatement ps = null;
		ResultSet rs = null;
		try {
			ps = cont2.prepareStatement(sql);
			ps.setInt(1, id);
			rs = ps.executeQuery();
			while(rs.next()){
				amouse.setId(rs.getInt(1));
				amouse.setName(rs.getString(2));
				amouse.setFood(rs.getString(3));
				amouse.setMultiply(rs.getString(4));
				amouse.setSentinel(rs.getString(5));
				amouse.setPicture(rs.getString(6));
				amouse.setCtma(rs.getString(7));
				amouse.setMH(rs.getString(8));
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally{
			DBUtil.close(rs, ps, cont2);
		}

		return amouse;
	}
	//图片
	public boolean updateById(int id, String image1) {
		// TODO Auto-generated method stub
		boolean flag = false;
		Connection cont3 = DBUtil.getConnection();
		String sql3 = "update t_amouse set f_picture=? where pk_id=?";
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
	public int addAmouse(DiseaseBean diseaselist) {
		// TODO Auto-generated method stub
		return 0;
	}

}

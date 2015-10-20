package com.code.dao.imp;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Date;

import com.code.bean.ApparatusBean;
import com.code.bean.DrugApparatusBean;
import com.code.bean.DrugBean;
import com.code.bean.OutWareHouseBean;
import com.code.dao.OutWareHouseDao;
import com.code.util.DBUtil;

public class OutWareHouseDaoImp implements OutWareHouseDao{

	public ArrayList<OutWareHouseBean> getAllOutWareHouse(int currentPage, int numberPer) {
		// TODO Auto-generated method stub
		ArrayList<OutWareHouseBean> al = new ArrayList<OutWareHouseBean>();
		Connection con = DBUtil.getConnection();
		PreparedStatement ps = null;
		ResultSet rs = null;
		PreparedStatement ps2 = null;
		ResultSet rs2 = null;

		String sql = "select * from t_outwarehouse limit ?,?";
		try {
			ps = con.prepareStatement(sql);
			ps.setInt(1, (currentPage - 1) * 4);
			ps.setInt(2, numberPer);
			rs = ps.executeQuery();
			while(rs.next()){
				OutWareHouseBean out = new OutWareHouseBean();
				out.setTime(rs.getDate("time"));
				out.setConsumingNumber(rs.getString("f_consumingnumber"));
				out.setConsumingClass(rs.getString("f_class"));
				out.setMianUse(rs.getString("f_mainuse"));
				DrugApparatusBean adb = null;
				if(rs.getString("f_type").trim().equals("药剂")){
					String sql2 = "select dr.f_name from t_drug dr join " +
							"t_outwarehouse ou on ou.fk_drug = dr.pk_id and "+rs.getInt("fk_drug")+" = ou.pk_id";
					ps2 = con.prepareStatement(sql2);
					rs2 = ps2.executeQuery();
					adb = new DrugBean();
					while(rs2.next()){
						
						adb.setName(rs2.getString("f_name"));
						
					}

				}
				else if(rs.getString("f_type").trim().equals("器械")){
					String sql3 = "select app.f_name from t_apparatus app join " +
							"t_outwarehouse ou on ou.fk_apparatus = app.pk_id " +
							"and "+rs.getInt("fk_apparatus")+" = app.pk_id";
					ps2 = con.prepareStatement(sql3);
					rs2 = ps2.executeQuery();
					adb = new ApparatusBean();
					while(rs2.next()){
					
					adb.setName(rs2.getString("f_name"));
					
					}
				}
				out.setDab(adb);
				al.add(out);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally{
			if(rs2 !=null && ps2 !=null){
				try {
					rs2.close();
					ps2.close();
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			}
			DBUtil.close(rs, ps, con);
		}
		
		return al;
	}

	public int getAllCount() {
		// TODO Auto-generated method stub
		int count = 0;
        Connection con = DBUtil.getConnection();
		PreparedStatement ps = null;
		ResultSet rs = null;

		String sql = "select count(*) as allC from t_outwarehouse";
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

	public boolean addOutWareHouse(OutWareHouseBean out) {
		
		// TODO Auto-generated method stub
        Connection con = DBUtil.getConnection();
		PreparedStatement ps = null;
		

		if(out.getDab().getName().equals("药剂")){
		String sql = "insert into t_outwarehouse(f_consumingnumber,f_mainuse,f_preventtype,f_type,fk_drug,f_class,time) " +
				"values(?,?,?,?,?,?,?)";
		try {
			ps = con.prepareStatement(sql);
			ps.setString(1, out.getConsumingNumber());
			ps.setString(2, out.getMianUse());
			ps.setString(3, out.getPreventType());
			ps.setString(4, out.getDab().getName());
			ps.setInt(5, out.getType());
			ps.setString(6, out.getConsumingClass());
			ps.setDate(7, new java.sql.Date(out.getTime().getTime()));
			ps.executeUpdate();
			return true;
		} 
		
		catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			
		}
		finally{
			DBUtil.close(ps, con);
		}
		
		}
		else if(out.getDab().getName().equals("器械")){
			String sql = "insert into t_outwarehouse(f_consumingnumber,f_mainuse,f_preventtype,f_type,fk_apparatus,f_class,time) " +
			"values(?,?,?,?,?,?,?)";
			try {
				ps = con.prepareStatement(sql);
				ps.setString(1, out.getConsumingNumber());
				ps.setString(2, out.getMianUse());
				ps.setString(3, out.getPreventType());
				ps.setString(4, out.getDab().getName());
				ps.setInt(5, out.getType());
				ps.setString(6, out.getConsumingClass());
				ps.setDate(7, new java.sql.Date(out.getTime().getTime()));
				ps.executeUpdate();
				return true;
			} 
			
			catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
				
			}
			finally{
				DBUtil.close(ps, con);
			}
		}
		return false;
	}

	public ArrayList<OutWareHouseBean> getOutWareHouseByTime(String start,
			String over,int currentPage, int numberPer) {
		// TODO Auto-generated method stub
		ArrayList<OutWareHouseBean> al = new ArrayList<OutWareHouseBean>();
        Connection con = DBUtil.getConnection();
		PreparedStatement ps = null;
		ResultSet rs = null;
		PreparedStatement ps2 = null;
		ResultSet rs2 = null;

		String sql = "select * from t_outwarehouse where time " +
				"between '"+start+"' and '"+over+"' limit ?,?";
		try {
			ps = con.prepareStatement(sql);
			ps.setInt(1, (currentPage - 1) * 4);
			ps.setInt(2, numberPer);
			rs = ps.executeQuery();
			while(rs.next()){
				OutWareHouseBean out = new OutWareHouseBean();
				out.setTime(rs.getDate("time"));
				out.setConsumingNumber(rs.getString("f_consumingnumber"));
				out.setConsumingClass(rs.getString("f_class"));
				out.setMianUse(rs.getString("f_mainuse"));
				DrugApparatusBean adb = null;
				if(rs.getString("f_type").trim().equals("药剂")){
					String sql2 = "select dr.f_name from t_drug dr join " +
							"t_outwarehouse ou on ou.fk_drug = dr.pk_id and "+rs.getInt("fk_drug")+" = ou.pk_id";
					ps2 = con.prepareStatement(sql2);
					rs2 = ps2.executeQuery();
					adb = new DrugBean();
					while(rs2.next()){
						
						adb.setName(rs2.getString("f_name"));
						
					}

				}
				else if(rs.getString("f_type").trim().equals("器械")){
					String sql3 = "select app.f_name from t_apparatus app join " +
							"t_outwarehouse ou on ou.fk_apparatus = app.pk_id " +
							"and "+rs.getInt("fk_apparatus")+" = app.pk_id";
					ps2 = con.prepareStatement(sql3);
					rs2 = ps2.executeQuery();
					adb = new ApparatusBean();
					while(rs2.next()){
					
					adb.setName(rs2.getString("f_name"));
					
					}
				}
				out.setDab(adb);
				al.add(out);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally{
			if(rs2 !=null && ps2 !=null){
				try {
					rs2.close();
					ps2.close();
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			}
			DBUtil.close(rs, ps, con);
		}
		return al;
	}

	public int getCountByTime(String start, String over) {
		// TODO Auto-generated method stub
		int count = 0;
        Connection con = DBUtil.getConnection();
		PreparedStatement ps = null;
		ResultSet rs = null;

		String sql = "select count(*) as allC from t_outwarehouse  where time " +
				"between '"+start+"' and '"+over+"'";
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
	
}

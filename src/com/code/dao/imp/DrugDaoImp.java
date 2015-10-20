package com.code.dao.imp;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import com.code.bean.DisasterBean;
import com.code.bean.DiseaseBean;
import com.code.bean.DrugBean;
import com.code.bean.MouseBean;
import com.code.bean.WormBean;
import com.code.dao.DrugDao;
import com.code.util.DBUtil;
import com.mysql.jdbc.Driver;

public class DrugDaoImp implements DrugDao {
	//查询所有药剂记录
	public ArrayList<DrugBean> getDrugByPage(int currentPage, int numberPer) {
		// TODO Auto-generated method stub
		ArrayList<DrugBean> al =  new ArrayList<DrugBean>();
		Connection con = DBUtil.getConnection();

		String sql1 = "select * from t_drug order by pk_id desc limit ?,? ";
		PreparedStatement ps =null;
		PreparedStatement ps2 =null;
		ResultSet rs = null;
		ResultSet rs2 = null;
		try {
			ps = con.prepareStatement(sql1);
			ps.setInt(1, (currentPage - 1) * 4);
			ps.setInt(2, numberPer);
			rs = ps.executeQuery();
			
			while(rs.next()){
				DrugBean db = new DrugBean();
				db.setName(rs.getString("f_name"));
				db.setTree(rs.getString("f_tree"));
				DisasterBean dis = null;
				if(rs.getInt("f_type") == 1){
					String sql2 = "select p.f_name from t_pestlist p " +
					"join t_drug d on p.pk_id = " + rs.getInt("f_disasterId") +" "+
					"where d.f_type = 1";
					db.setType("虫害");
					ps2 = con.prepareStatement(sql2);
					rs2 = ps2.executeQuery();
					dis = new WormBean();
					while(rs2.next()){
					
					dis.setName(rs2.getString("f_name"));
					
					}
					
					
				}
				else if(rs.getInt("f_type") == 2){
					String sql3 = "select p.f_name from t_diseaselist p " +
							"join t_drug d on p.pk_id = "+rs.getInt("f_disasterId")+" "+
							"where d.f_type = 2";
					db.setType("病害");
					ps2 = con.prepareStatement(sql3);
					rs2 = ps2.executeQuery();
					
					while(rs2.next()){
						dis = new DiseaseBean();
					dis.setName(rs2.getString("f_name"));
					
					}
					
					
				}
				else{
					String sql4 = "select p.f_name from t_amouse p " +
					"join t_drug d on p.pk_id = "+rs.getInt("f_disasterId")+" " +
					"where d.f_type = 3";
					db.setType("鼠害");
					ps2 = con.prepareStatement(sql4);
					rs2 = ps2.executeQuery();
					
					while(rs2.next()){
						dis = new MouseBean();
					dis.setName(rs2.getString("f_name"));
					
					
					}
				}
				db.setDisBean(dis);
				al.add(db);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		finally{
			if(rs2 != null && ps2 != null){
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
	//得到所有药剂的行数
	public int getDrugCount() {
		// TODO Auto-generated method stub
		//查询出t_drug表中一共有多少行数据
		
		int count = 0;
		Connection con = DBUtil.getConnection();
		PreparedStatement ps = null;
		ResultSet rs = null;
		try {
			Class.forName("com.mysql.jdbc.Driver");
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		String sql = "select count(*) as allC from t_drug";
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
	//添加一个药剂
	public boolean addDrug(DrugBean db) {
		// TODO Auto-generated method stub

        Connection con = DBUtil.getConnection();
		PreparedStatement ps = null;
		
		try {
			Class.forName("com.mysql.jdbc.Driver");
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		String sql = "insert into t_drug(f_name,f_tree,f_type,f_disasterId) value(?,?,?,?)";
		try {
			ps = con.prepareStatement(sql);
			
			ps.setString(1, db.getName());
			ps.setString(2, db.getTree());
			if(db.getType().equals("虫害")){
				ps.setInt(3, 1);
				ps.setInt(4, db.getDisBean().getId());
				ps.executeUpdate();
				return true;
			}
			else if(db.getType().equals("病害")){
				ps.setInt(3, 2);
				ps.setInt(4, db.getDisBean().getId());
				ps.executeUpdate();
				return true;
			}
			else if(db.getType().equals("鼠害")){
				ps.setInt(3, 3);
				ps.setInt(4, db.getDisBean().getId());
				ps.executeUpdate();
				return true;
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		finally{
			DBUtil.close(ps,con);
		}
		return false;
	}
	//通过传入一个灾害类型的ID来查询药剂对象
	public ArrayList<DrugBean> getDrugByTypeId(int TypeId,int currentPage, int numberPer) {
		// TODO Auto-generated method stub
		ArrayList<DrugBean> al =  new ArrayList<DrugBean>();
        Connection con = DBUtil.getConnection();
		PreparedStatement ps = null;
		ResultSet rs = null;
		PreparedStatement ps2 = null;
		ResultSet rs2 = null;

		String sql = "select * from t_drug where f_type = " + TypeId + " limit ?,?";
		try {
			ps = con.prepareStatement(sql);
			ps.setInt(1, (currentPage -1)* 4);
			ps.setInt(2, numberPer);
			rs = ps.executeQuery();
			while(rs.next()){
				DrugBean db = new DrugBean();
				db.setName(rs.getString("f_name"));
				db.setTree(rs.getString("f_tree"));
				DisasterBean dis = null;
				if(rs.getInt("f_type") == 1){
					String sql2 = "select p.f_name from t_pestlist p " +
					"join t_drug d on p.pk_id = " + rs.getInt("f_disasterId")+ " " +
					"where d.f_type = 1";
					db.setType("虫害");
					ps2 = con.prepareStatement(sql2);
					rs2 = ps2.executeQuery();
					while(rs2.next()){
					dis = new WormBean();
					dis.setName(rs2.getString("f_name"));
					
					}
				}
				else if(rs.getInt("f_type") == 2){
					String sql3 = "select p.f_name from t_diseaselist p " +
							"join t_drug d on p.pk_id = "+ rs.getInt("f_disasterId")+ " "+
							"where d.f_type = 2";
					db.setType("病害");
					ps2 = con.prepareStatement(sql3);
					rs2 = ps2.executeQuery();
					while(rs2.next()){
					dis = new DiseaseBean();
					dis.setName(rs2.getString("f_name"));
					
					}
				}
				else{
					String sql4 = "select p.f_name from t_amouse p " +
					"join t_drug d on p.pk_id = " + rs.getInt("f_disasterId") + " "+
					"where d.f_type = 3";
					db.setType("鼠害");
					ps2 = con.prepareStatement(sql4);
					rs2 = ps2.executeQuery();
					while(rs2.next()){
					dis = new MouseBean();
					dis.setName(rs2.getString("f_name"));
					
					}
				}
				db.setDisBean(dis);
				al.add(db);
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally{
			if(rs2 != null && ps2 != null){
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
	//通过传入一个灾害类型的ID来查询药剂对象在数据库中的行数
	public int getDrugCountByTypeID(int TypeID) {
		// TODO Auto-generated method stub
		int count = 0;
        Connection con = DBUtil.getConnection();
		PreparedStatement ps = null;
		ResultSet rs = null;

		String sql = "select count(*) as allC from t_drug where f_type = " + TypeID;
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
	//通过药剂名称来查询药剂
	public ArrayList<DrugBean> getDrugByName(String Val,int currentPage, int numberPer) {
		// TODO Auto-generated method stub
		ArrayList<DrugBean> al = new ArrayList<DrugBean>();
        Connection con = DBUtil.getConnection();
		PreparedStatement ps = null;
		ResultSet rs = null;
		PreparedStatement ps2 =null;
		ResultSet rs2 = null;

		String sql = "select * from t_drug where f_name like '%"+Val+"%' limit ?,?";
		try {
			ps = con.prepareStatement(sql);
			ps.setInt(1, (currentPage - 1) * 4);
			ps.setInt(2, numberPer);
			rs = ps.executeQuery();
			while(rs.next()){
				DrugBean db = new DrugBean();
				db.setName(rs.getString("f_name"));
				db.setTree(rs.getString("f_tree"));
				DisasterBean dis = null;
				if(rs.getInt("f_type") == 1){
					String sql2 = "select p.f_name from t_pestlist p " +
					"join t_drug d on p.pk_id = "+rs.getInt("f_disasterId")+ " "+
					"where d.f_type = 1";
					db.setType("虫害");
					ps2 = con.prepareStatement(sql2);
					rs2 = ps2.executeQuery();
					dis = new WormBean();
					while(rs2.next()){
					
					dis.setName(rs2.getString("f_name"));
					
					}
					
					
				}
				else if(rs.getInt("f_type") == 2){
					String sql3 = "select p.f_name from t_diseaselist p " +
							"join t_drug d on p.pk_id = " + rs.getInt("f_disasterId")+" " +
							"where d.f_type = 2";
					db.setType("病害");
					ps2 = con.prepareStatement(sql3);
					rs2 = ps2.executeQuery();
					
					while(rs2.next()){
						dis = new DiseaseBean();
					dis.setName(rs2.getString("f_name"));
					
					}
					
					
				}
				else{
					String sql4 = "select p.f_name from t_amouse p " +
					"join t_drug d on p.pk_id = " + rs.getInt("f_disasterId")+ " " +
					"where d.f_type = 3";
					db.setType("鼠害");
					ps2 = con.prepareStatement(sql4);
					rs2 = ps2.executeQuery();
					
					while(rs2.next()){
						dis = new MouseBean();
					dis.setName(rs2.getString("f_name"));
					
					
					}
				}
				db.setDisBean(dis);
				al.add(db);
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		finally{
			if(rs2 != null && ps2 != null){
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
	//通过药剂名称来查询药剂在数据库中的行数
	public int getDrugCountByName(String Val) {
		// TODO Auto-generated method stub
		int count = 0;
        Connection con = DBUtil.getConnection();
		PreparedStatement ps = null;
		ResultSet rs = null;

		String sql = "select count(*) as allC from t_drug where f_name like '%"+Val+"%'";
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
	//通过虫病鼠害的名称来查出药剂对象
	public ArrayList<DrugBean> getDrugByDisasterName(String Val,
			int currentPage, int numberPer) {
		// TODO Auto-generated method stub
		ArrayList<DrugBean> al = new ArrayList<DrugBean>();
        Connection con = DBUtil.getConnection();
		PreparedStatement ps = null;
		ResultSet rs = null;
		

		String sql = "(select dr.* from t_drug dr join t_pestlist pe " +
					 "where dr.f_disasterId = pe.pk_id and pe.f_name like '%"+Val+"%') " +
					 "union " +
					 "(select dr.* from t_drug dr join t_diseaselist dis " +
					 "where dr.f_disasterId = dis.pk_id and dis.f_name like '%"+Val+"%') " +
					 "union " +
					 "(select dr.* from t_drug dr join t_amouse mou " +
					 "where dr.f_disasterId = mou.pk_id and mou.f_name like '%"+Val+"%') " +
					 "limit ?,?";
		try {
			ps = con.prepareStatement(sql);
			ps.setInt(1, (currentPage - 1) * 4);
			ps.setInt(2, numberPer);
			rs = ps.executeQuery();
			while(rs.next()){
				DrugBean drug = new DrugBean();
				drug.setName(rs.getString("f_name"));
				drug.setTree(rs.getString("f_tree"));
				DisasterBean db = null;
				if(rs.getInt("f_type") == 1){
					drug.setType("虫害");
					String sql1="select * from t_pestlist where pk_id = "+rs.getString("f_disasterId");
					ps = con.prepareStatement(sql1);
					rs = ps.executeQuery();
					while(rs.next()){
						db= new WormBean();
						db.setName(rs.getString("f_name"));
					}
					
				}
				else if(rs.getInt("f_type") == 2){
					drug.setType("病害");
					String sql2 = "select * from t_diseaselist where pk_id = "+rs.getString("f_disasterId");
					ps = con.prepareStatement(sql2);
					rs = ps.executeQuery();
					while(rs.next()){
						db = new DiseaseBean();
						db.setName(rs.getString("f_name"));
					}
				}else if(rs.getInt("f_type") == 3){
					drug.setType("鼠害");
					String sql3 = "select * from t_amouse where pk_id = "+rs.getString("f_disasterId");
					ps = con.prepareStatement(sql3);
					rs = ps.executeQuery();
					while(rs.next()){
						db = new MouseBean();
						db.setName(rs.getString("f_name"));
					}
				}
				drug.setDisBean(db);
				al.add(drug);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally{
			DBUtil.close(rs, ps, con);
		}
	return al;
	}
	//通过虫病鼠害的名称来查出药剂对象的行数
	
	public int getDrugCountByDisaster(String Val) {
		// TODO Auto-generated method stub
		int count = 0;
        Connection con = DBUtil.getConnection();
		PreparedStatement ps = null;
		ResultSet rs = null;

		String sql = "(select count(*) as allA from t_drug dr join t_pestlist pe " +
		 "where dr.f_disasterId = pe.pk_id and pe.f_name like '%"+Val+"%') " +
		 "union " +
		 "(select count(*) as allB from t_drug dr join t_diseaselist dis " +
		 "where dr.f_disasterId = dis.pk_id and dis.f_name like '%"+Val+"%') " +
		 "union " +
		 "(select count(*) as allC from t_drug dr join t_amouse mou " +
		 "where dr.f_disasterId = mou.pk_id and mou.f_name like '%"+Val+"%') " ;
		
		try {
			ps = con.prepareStatement(sql);
			rs = ps.executeQuery();
			while(rs.next()){
				count = rs.getInt("allA");
				if(count != 0){
					return count;
				}
			}
			while(rs.next()){
				count = rs.getInt("allB");
				if(count != 0){
					return count;
				}
			}
			while(rs.next()){
				count = rs.getInt("allC");
				if(count != 0){
					return count;
				}
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally{
			DBUtil.close(rs, ps, con);
		}
		return 0;
	}
	public ArrayList<DrugBean> getDrugByType(int TypeId) {
		// TODO Auto-generated method stub
		ArrayList<DrugBean> al = new ArrayList<DrugBean>();
        Connection con = DBUtil.getConnection();
		PreparedStatement ps = null;
		ResultSet rs = null;
		PreparedStatement ps2 = null;
		ResultSet rs2 = null;

		String sql = "select * from t_drug where f_type = " + TypeId;
		try {
			ps = con.prepareStatement(sql);
			rs = ps.executeQuery();
			while(rs.next()){
				DrugBean db = new DrugBean();
				db.setId(rs.getInt("pk_id"));
				db.setName(rs.getString("f_name"));
				db.setTree(rs.getString("f_tree"));
				DisasterBean dis = null;
				if(rs.getInt("f_type") == 1){
					String sql2 = "select p.f_name from t_pestlist p " +
					"join t_drug d on p.pk_id = " + rs.getInt("f_disasterId")+ " " +
					"where d.f_type = 1";
					db.setType("虫害");
					ps2 = con.prepareStatement(sql2);
					rs2 = ps2.executeQuery();
					while(rs2.next()){
					dis = new WormBean();
					dis.setName(rs2.getString("f_name"));
				
					}
				}
				else if(rs.getInt("f_type") == 2){
					String sql3 = "select p.f_name from t_diseaselist p " +
							"join t_drug d on p.pk_id = "+ rs.getInt("f_disasterId")+ " "+
							"where d.f_type = 2";
					db.setType("病害");
					ps2 = con.prepareStatement(sql3);
					rs2 = ps2.executeQuery();
					while(rs2.next()){
					dis = new DiseaseBean();
					dis.setName(rs2.getString("f_name"));
					
					}
				}
				else{
					String sql4 = "select p.f_name from t_amouse p " +
					"join t_drug d on p.pk_id = " + rs.getInt("f_disasterId") + " "+
					"where d.f_type = 3";
					db.setType("鼠害");
					ps2 = con.prepareStatement(sql4);
					rs2 = ps2.executeQuery();
					while(rs2.next()){
					dis = new MouseBean();
					dis.setName(rs2.getString("f_name"));
				
					}
				}
				db.setDisBean(dis);
				al.add(db);
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally{
			if(rs2 != null && ps2 != null){
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


}

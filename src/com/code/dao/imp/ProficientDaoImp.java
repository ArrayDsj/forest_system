package com.code.dao.imp;

import com.code.bean.ProficientBean;
import com.code.dao.ProficientDao;
import com.code.util.DBUtil;

import java.sql.*;
import java.util.ArrayList;

public class ProficientDaoImp implements ProficientDao {

	// 实现查询所有专家信息的DB操作
	public ArrayList<ProficientBean> queryAllProfic(int currentPage,
			int pageSize) {
		// TODO Auto-generated method stub
		ArrayList<ProficientBean> allProfic = new ArrayList<ProficientBean>();
		
		Connection con = DBUtil.getConnection();
		
		String sql = "select * from t_proficient where f_status = 1 order by pk_id desc limit "+(currentPage-1)*pageSize +","+pageSize;
		
		try {
			Statement ps = con.createStatement();

			ResultSet rs = ps.executeQuery(sql);
			
			while(rs.next()){
				
				ProficientBean pro = new ProficientBean();
				
				pro.setId(rs.getInt("pk_id"));
				
				pro.setName(rs.getString("f_name"));
				
				pro.setGender(rs.getString("f_gender"));
				
				pro.setBirthday(rs.getString("f_birthday"));
				
				pro.setPhoto(rs.getString("f_photo"));
				
				pro.setSpeciality(rs.getString("f_speciality"));
				
				pro.setDegree(rs.getString("f_degree"));
				
				pro.setPhoneNumber(rs.getString("f_phoneNumber"));
				
				pro.setWorkUnit(rs.getString("f_workUnit"));
				
				pro.setAddress(rs.getString("f_address"));
				
				pro.setEmail(rs.getString("f_email"));
				
				allProfic.add(pro);
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally{
			
			DBUtil.closeCon(con);
			
		}
		
		return allProfic;
	}
	
	//实现查询专家信息的总页数（用pageSize进行分割，计算）的DB操作
	public int getAllNumber(int pageSize) {
		// TODO Auto-generated method stub
		int pageNumber = 0;
		
		Connection con = DBUtil.getConnection();
		
		String sql = "select count(*) from t_proficient where f_status=1";
		
		PreparedStatement ps = null;
		
		try {
			ps= con.prepareStatement(sql);
			
			ResultSet rs = ps.executeQuery();
			
			while(rs.next()){
				
				pageNumber = (int) Math.ceil((rs.getInt("count(*)")*1.00)/pageSize);
				
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally{
			
			DBUtil.closeCon(con);
			
		}
		return pageNumber;
	}
	//实现查询带条件的专家信息的总页数（用pageSize进行分割，计算）的DB操作
	public int getPageNumberByCondition(String condition, String value,
			int pageSize) {
		// TODO Auto-generated method stub
		
		Connection con = DBUtil.getConnection();
		
		int pageNumber = 0;
		
		if(condition.equals("专家姓名")){
			String sql = "select count(*) from t_proficient where f_name like ? and f_status = 1";
			
			try {
				PreparedStatement ps = con.prepareStatement(sql);
			
				ps.setString(1, "%"+value+"%");
				
				ResultSet rs = ps.executeQuery();
				
				while(rs.next()){
					pageNumber = (int) Math.ceil((rs.getInt("count(*)")*1.00)/pageSize);				
				}
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}	finally{
				DBUtil.closeCon(con);
			}	
		}else if(condition.equals("专长")){
			
			String sql = "select count(*) from t_proficient where f_speciality like ? and f_status = 1";

			try {
				PreparedStatement ps = con.prepareStatement(sql);
				
				ps.setString(1, "%"+value+"%");
				
				ResultSet rs = ps.executeQuery();
				
				while(rs.next()){
					pageNumber = (int) Math.ceil((rs.getInt("count(*)")*1.00)/pageSize);				
				}
				
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}finally{
				DBUtil.closeCon(con);
			}
			
		}else if(condition.equals("工作单位")){
			
			String sql = "select count(*) from t_proficient where f_workUnit like ? and f_status = 1";

			try {
				PreparedStatement ps = con.prepareStatement(sql);
				
				ps.setString(1, "%"+value+"%");
				
				ResultSet rs = ps.executeQuery();
				
				while(rs.next()){
					pageNumber = (int) Math.ceil((rs.getInt("count(*)")*1.00)/pageSize);				
				}
				
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}finally{
				DBUtil.closeCon(con);
			}
			
		}
		return pageNumber;
		
	}
	//实现查询带条件的专家信息（用pageSize进行分割，计算）的DB操作
	public ArrayList<ProficientBean> getProficientByCondition(String condition,
			String value, int currentPage, int pageSize) {
		// TODO Auto-generated method stub
		
		ArrayList<ProficientBean> proList = new ArrayList<ProficientBean>();
		
		Connection con = DBUtil.getConnection();
		
		if(condition.equals("专家姓名")){
			
			String sql = "select * from t_proficient where f_name like ? and f_status = 1 order by pk_id desc limit ?,? ";
			
			try {
				PreparedStatement ps = con.prepareStatement(sql);
				
				ps.setString(1, "%"+value+"%");
				
				ps.setInt(2, (currentPage-1)*pageSize);
				
				ps.setInt(3, pageSize);
				
				ResultSet rs = ps.executeQuery();
				
				while(rs.next()){
					
					ProficientBean pro = new ProficientBean();
					
					pro.setId(rs.getInt("pk_id"));
					
					pro.setName(rs.getString("f_name"));
					
					pro.setGender(rs.getString("f_gender"));
					
					pro.setBirthday(rs.getString("f_birthday"));
					
					pro.setPhoto(rs.getString("f_photo"));
					
					pro.setSpeciality(rs.getString("f_speciality"));
					
					pro.setDegree(rs.getString("f_degree"));
					
					pro.setPhoneNumber(rs.getString("f_phoneNumber"));
					
					pro.setWorkUnit(rs.getString("f_workUnit"));
					
					pro.setAddress(rs.getString("f_address"));
					
					pro.setEmail(rs.getString("f_email"));
					
					proList.add(pro);
				}
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}finally{
				DBUtil.closeCon(con);
			}
			
		}else if(condition.equals("专长")){
			
			String sql = "select * from t_proficient where f_speciality like ? and f_status = 1 order by pk_id desc limit ?,? ";
			
			try {
				PreparedStatement ps = con.prepareStatement(sql);
				
				ps.setString(1, "%"+value+"%");
				
				ps.setInt(2, (currentPage-1)*pageSize);
				
				ps.setInt(3, pageSize);
				
				ResultSet rs = ps.executeQuery();
				
				while(rs.next()){
					
					ProficientBean pro = new ProficientBean();
					
					pro.setId(rs.getInt("pk_id"));
					
					pro.setName(rs.getString("f_name"));
					
					pro.setGender(rs.getString("f_gender"));
					
					pro.setBirthday(rs.getString("f_birthday"));
					
					pro.setPhoto(rs.getString("f_photo"));
					
					pro.setSpeciality(rs.getString("f_speciality"));
					
					pro.setDegree(rs.getString("f_degree"));
					
					pro.setPhoneNumber(rs.getString("f_phoneNumber"));
					
					pro.setWorkUnit(rs.getString("f_workUnit"));
					
					pro.setAddress(rs.getString("f_address"));
					
					pro.setEmail(rs.getString("f_email"));
					
					proList.add(pro);
				}
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}finally{
				DBUtil.closeCon(con);
			}
			
		}else if(condition.equals("工作单位")){
			
			String sql = "select * from t_proficient where f_workUnit like ? and f_status = 1 order by pk_id desc limit ?,? ";
			
			try {
				PreparedStatement ps = con.prepareStatement(sql);
				
				ps.setString(1, "%"+value+"%");
				
				ps.setInt(2, (currentPage-1)*pageSize);
				
				ps.setInt(3, pageSize);
				
				ResultSet rs = ps.executeQuery();
				
				while(rs.next()){
					
					ProficientBean pro = new ProficientBean();
					
					pro.setId(rs.getInt("pk_id"));
					
					pro.setName(rs.getString("f_name"));
					
					pro.setGender(rs.getString("f_gender"));
					
					pro.setBirthday(rs.getString("f_birthday"));
					
					pro.setPhoto(rs.getString("f_photo"));
					
					pro.setSpeciality(rs.getString("f_speciality"));
					
					pro.setDegree(rs.getString("f_degree"));
					
					pro.setPhoneNumber(rs.getString("f_phoneNumber"));
					
					pro.setWorkUnit(rs.getString("f_workUnit"));
					
					pro.setAddress(rs.getString("f_address"));
					
					pro.setEmail(rs.getString("f_email"));
					
					proList.add(pro);
				}
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}finally{
				DBUtil.closeCon(con);
			}
			
		}
		return proList;
	}
	//删除被选中的专家的信息
	public boolean deleteProficient(int id) {
		// TODO Auto-generated method stub
		
		Connection con = DBUtil.getConnection();
		
		String sql = "update t_proficient set f_status=0 where pk_id=?";
		
		
		try {
			PreparedStatement ps = con.prepareStatement(sql);
			
			ps.setInt(1, id);
			
			int num = ps.executeUpdate();
			
			if(num>0){
				return true;
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally{
			DBUtil.closeCon(con);
			
		}
		return false;
	}
	//显示被选中的专家的信息
	public ProficientBean getProficientInfo(int id) {
		// TODO Auto-generated method stub
		
		Connection con = DBUtil.getConnection();
		
		String sql = "select * from t_proficient where pk_id = ? and f_status = 1";
		
		ProficientBean pro = null;
		
		try {
			PreparedStatement ps = con.prepareStatement(sql);
			
			ps.setInt(1, id);
			
			ResultSet rs = ps.executeQuery();
			
			while(rs.next()){
				
				pro = new ProficientBean();
				
				pro.setId(rs.getInt("pk_id"));
				
				pro.setName(rs.getString("f_name"));
				
				pro.setGender(rs.getString("f_gender"));
				
				pro.setBirthday(rs.getString("f_birthday"));
				
				pro.setPhoto(rs.getString("f_photo"));
				
				pro.setSpeciality(rs.getString("f_speciality"));
				
				pro.setDegree(rs.getString("f_degree"));
				
				pro.setPhoneNumber(rs.getString("f_phoneNumber"));
				
				pro.setWorkUnit(rs.getString("f_workUnit"));
				
				pro.setAddress(rs.getString("f_address"));
				
				pro.setEmail(rs.getString("f_email"));
				
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally{
			DBUtil.closeCon(con);
			
		}
		
		return pro;
	}
	//修改被选中的专家的信息
	public boolean updateProficient(ProficientBean pro) {
		// TODO Auto-generated method stub
		
		Connection con = DBUtil.getConnection();
		
		String sql = "update t_proficient set f_phoneNumber = ? , f_degree = ? ,f_workUnit = ? ,f_email = ? where pk_id = ?";
		
		try {
			PreparedStatement ps = con.prepareStatement(sql);
			
			ps.setString(1, pro.getPhoneNumber());
			
			ps.setString(2, pro.getDegree());
			
			ps.setString(3, pro.getWorkUnit());
			
			ps.setString(4, pro.getEmail());
			
			ps.setInt(5, pro.getId());
			
			int num = ps.executeUpdate();
			
			if(num>0){
				return true;
				
			}
			
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally{
			DBUtil.closeCon(con);			
		}
		
		return false;
	}
	//添加专家的信息到数据库
	public boolean addProficient(ProficientBean pro) {
		// TODO Auto-generated method stub
		
		Connection con = DBUtil.getConnection();
		
		String sql = "insert into t_proficient(f_name,f_gender,f_birthday,f_photo,f_speciality,f_degree,f_phoneNumber,f_workUnit,f_address,f_email,f_status)values(?,?,?,?,?,?,?,?,?,?,?)";
		
		try {
			PreparedStatement ps = con.prepareStatement(sql);
			
			ps.setString(1, pro.getName());
			ps.setString(2, pro.getGender());
			ps.setString(3, pro.getBirthday());
			ps.setString(4, pro.getPhoto());
			ps.setString(5, pro.getSpeciality());
			ps.setString(6, pro.getDegree());
			ps.setString(7, pro.getPhoneNumber());
			ps.setString(8, pro.getWorkUnit());
			ps.setString(9, pro.getAddress());
			ps.setString(10, pro.getEmail());
			ps.setInt(11, 1);
			
			int num = ps.executeUpdate();
			
			if(num>0){
				return true;
				
				
			}
			
			
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally{
			DBUtil.closeCon(con);
			
		}
		
		
		
		return false;
	}
	

}

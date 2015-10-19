package com.code.dao.imp;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.sql.Date;

import com.code.bean.LogBean;
import com.code.dao.LogDao;
import com.code.util.DBUtil;

public class LogDaoImp implements LogDao {

	public boolean addLog(LogBean log) {
		// TODO Auto-generated method stub
		
		Connection con = DBUtil.getConnection();
		
		String sql = "insert into t_log(f_content,f_date) values(?,?)";		
		
		PreparedStatement ps = null;
		
		try {
			ps = con.prepareStatement(sql);
			
			ps.setString(1, log.getContent());
			
			ps.setTimestamp(2, new Timestamp(log.getDate().getTime()));
			
			int num = ps.executeUpdate();
			
			if(num>0){
				return true;
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally{
			DBUtil.close(ps, con);
		}
	
		return false;
	}

	public int getAllNumber() {
		// TODO Auto-generated method stub
		int pageNumber = 0;
		
		Connection con = DBUtil.getConnection();
		
		String sql = "select count(*) from t_log";
		
		PreparedStatement ps = null;
		
		try {
			ps = con.prepareStatement(sql);
			
			ResultSet rs = ps.executeQuery();
			
			while(rs.next()){
					
				pageNumber = (int)(Math.ceil((rs.getInt("count(*)")*1.00)/4));				
				
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally{
			
			DBUtil.close(ps, con);
			
		}
		
		return pageNumber;
	}

	public ArrayList<LogBean> queryAllLogs(int currentPage, int pageSize) {
		// TODO Auto-generated method stub
		
		Connection con = DBUtil.getConnection();
		
		SimpleDateFormat sim = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		
		ArrayList<LogBean> allLogs = new ArrayList<LogBean>();
		
		String sql = "select * from t_log order by pk_id desc limit ?,?";
		
		PreparedStatement ps = null;
		
		try {
			
			ps=con.prepareStatement(sql);
			
			ps.setInt(1, (currentPage-1)*pageSize);
			
			ps.setInt(2, pageSize);
			
			ResultSet rs = ps.executeQuery();
			
			while(rs.next()){
				
				LogBean log = new LogBean();
				
				log.setContent(rs.getString("f_content"));
				
				log.setDate(rs.getDate("f_date"));
				
				log.setTime(sim.format(rs.getTimestamp("f_date")));
				
				allLogs.add(log);
				
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally{
			DBUtil.close(ps, con);
			
		}
		return allLogs;
	}

	public int getPageNumberByDate(java.util.Date start, java.util.Date end, int pageSize) {
		// TODO Auto-generated method stub
		
		Connection con = DBUtil.getConnection();
		
		String sql = "select count(*) from t_log where f_date between ? and ?";
		
		int pageNumber = 0;
		
		try {
			PreparedStatement ps = con.prepareStatement(sql);
			
			ps.setDate(1, new Date(start.getTime()) );
			
			ps.setDate(2, new Date(end.getTime()));
			
			ResultSet rs = ps.executeQuery();
			
			while(rs.next()){
				
				pageNumber = (int) (Math.ceil((rs.getInt("count(*)")*1.00)/pageSize));
				
			}		
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally{
			DBUtil.closeCon(con);			
		}	
		return pageNumber;
	}


	public ArrayList<LogBean> getLogByDate(int currentPage,
			java.util.Date start, java.util.Date end,int pageSize) {
		// TODO Auto-generated method stub
		
		SimpleDateFormat sim = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		
		ArrayList<LogBean> al = new ArrayList<LogBean>();
		
		Connection con = DBUtil.getConnection();
		
		String sql = "select * from t_log where f_date between ? and ? order by pk_id desc limit ?,?";
		
		try {
			PreparedStatement ps = con.prepareStatement(sql);
			
			ps.setDate(1, new Date(start.getTime()));
			
			ps.setDate(2, new Date(end.getTime()));
			
			ps.setInt(3, (currentPage-1)*pageSize);
			
			ps.setInt(4, pageSize);
			
			ResultSet rs = ps.executeQuery();
			
			while(rs.next()){
				
				LogBean log = new LogBean();
				
				log.setContent(rs.getString("f_content"));
				
				log.setDate(rs.getDate("f_date"));
				
				log.setTime(sim.format(rs.getTimestamp("f_date")));
				
				al.add(log);
				
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally{
			
			DBUtil.closeCon(con);
			
		}
		return al;
	}

}

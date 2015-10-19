package com.code.dao.imp;

import com.code.bean.UserBean;
import com.code.dao.UserDao;
import com.code.util.DBUtil;

import java.sql.*;
import java.util.ArrayList;

/**
 * Created by CodeA on 2015/10/9.
 */
public class UserDaoImp implements UserDao{
	
    public UserBean query(UserBean userBean) {
        //获取连接
        Connection connection = DBUtil.getConnection();
        //创建sql语句
        String sql = "select * from t_userinfo where f_name = ? and f_password = ?";

        //将连接对象和所有管道对象放在try语句外面，方便关闭
        PreparedStatement ps = null;
        ResultSet rs = null;
        //登录使用预编译的方法
        try {
            ps = connection.prepareStatement(sql);
            ps.setString(1,userBean.getName());
            ps.setString(2,userBean.getPassword());
            rs = ps.executeQuery();

            if(rs.next()){
                //如果是合法用户，封装数据，以后要用
                userBean.setId(rs.getInt("pk_id"));
                userBean.setRealName(rs.getString("f_realname"));
                userBean.setDegree(rs.getString("f_degree"));
                return userBean;
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }finally{
            //关闭全部连接
            DBUtil.close(rs,ps,connection);
        }
        //如果没有，返回null
        return null;
    }


	public ArrayList<UserBean> queryAllUsers(int currentPage , int pageSize) {
		// TODO Auto-generated method stub
		
		ArrayList<UserBean> allusers = new ArrayList<UserBean>();
		
		Connection con = DBUtil.getConnection();
				
		String sql = "select * from t_userinfo  where f_status=1 order by pk_id desc limit "+(currentPage-1)*pageSize+" , "+pageSize;
		
		PreparedStatement ps = null;
		
		try {
			ps=con.prepareStatement(sql);
			ResultSet rs = ps.executeQuery();
			while(rs.next()){
				UserBean ub = new UserBean();
				ub.setId(rs.getInt("pk_id"));
				ub.setName(rs.getString("f_name"));
				ub.setPassword(rs.getString("f_password"));
				ub.setRealName(rs.getString("f_realname"));
				ub.setDegree(rs.getString("f_degree"));
				
				allusers.add(ub);			
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally{
			DBUtil.close(ps, con);
		}
		
		return allusers;
	}


	public int getAllNumber() {
		// TODO Auto-generated method stub
		int pageNumber = 0;
		
		Connection con = DBUtil.getConnection();
		
		String sql = "select count(*) from t_userinfo where f_status=1";
		
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


	public int getPageNumberByCondition(String condition, int pageSize) {
		// TODO Auto-generated method stub
		
		Connection con = DBUtil.getConnection();
		
		String sql = "select count(*) from t_userinfo where f_degree = ? and f_status=1";
		
		int pageNumber = 0;
		
		try {
			PreparedStatement ps = con.prepareStatement(sql);
			
			ps.setString(1, condition);
			
			ResultSet rs = ps.executeQuery();
			
			while(rs.next()){
				
				pageNumber = (int)(Math.ceil((rs.getInt("count(*)")*1.00)/pageSize));
					
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally{
			DBUtil.closeCon(con);		
		}
		return pageNumber;
	}


	public ArrayList<UserBean> getUserByCondition(int currentPage,
			String condition,int pageSize) {
		// TODO Auto-generated method stub
		
		ArrayList<UserBean> al = new ArrayList<UserBean>();
		
		Connection con = DBUtil.getConnection();
		
		String sql = "select * from t_userinfo where f_degree = '"+ condition +"' and f_status=1 order by pk_id desc limit "+ (currentPage - 1) * pageSize +","+ pageSize ;
		
		try {
			Statement st = con.createStatement();
			ResultSet rs = st.executeQuery(sql);
			
			while(rs.next()){
				UserBean us = new UserBean();
				
				us.setId(rs.getInt("pk_id"));
				
				us.setName(rs.getString("f_name"));
				
				us.setPassword(rs.getString("f_password"));
				
				us.setRealName(rs.getString("f_realname"));
				
				us.setDegree(rs.getString("f_degree"));
				
				al.add(us);
				
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally{
			DBUtil.closeCon(con);
		}	
		
		return al;
	}


	public boolean addUser(UserBean user) {
		// TODO Auto-generated method stub
		
		
		Connection con = DBUtil.getConnection();
		
		String sql = "insert into t_userinfo(f_name,f_password,f_realname,f_degree,f_status)values(?,?,?,?,?)";
		
		try {
			PreparedStatement ps = con.prepareStatement(sql);
			
			ps.setString(1,user.getName());
			ps.setString(2, user.getPassword());
			ps.setString(3, user.getRealName());
			ps.setString(4, user.getDegree());
			ps.setInt(5, 1);
			
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


	public boolean deleteUser(int id) {
		// TODO Auto-generated method stub
		
		Connection con = DBUtil.getConnection();
		
		String sql = "update t_userinfo set f_status=0 where pk_id=?";
		
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


	public UserBean getUserInfo(int id) {
		// TODO Auto-generated method stub
		
		Connection con = DBUtil.getConnection();
		
		String sql = "select * from t_userinfo where pk_id = ? and f_status = 1";
		
		UserBean us = null;
		try {
			PreparedStatement ps = con.prepareStatement(sql);
			
			ps.setInt(1, id);
			
			ResultSet rs = ps.executeQuery();
			
			while(rs.next()){
				us = new UserBean();
				
				us.setId(rs.getInt("pk_id"));
				
				us.setName(rs.getString("f_name"));
				
				us.setPassword(rs.getString("f_password"));
				
				us.setRealName(rs.getString("f_realname"));
				
				us.setDegree(rs.getString("f_degree"));
				
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally{
			DBUtil.closeCon(con);
			
		}
		return us;
	}


	public boolean updateUser(UserBean user) {
		// TODO Auto-generated method stub
		
		Connection con = DBUtil.getConnection();
		
		String sql = "update t_userinfo set f_password = ? , f_degree = ? where pk_id = ?";
		
		try {
			PreparedStatement ps = con.prepareStatement(sql);
			
			ps.setString(1, user.getPassword());
			
			ps.setString(2, user.getDegree());
			
			ps.setInt(3, user.getId());
			
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

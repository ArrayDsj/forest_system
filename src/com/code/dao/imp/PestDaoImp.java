package com.code.dao.imp;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.code.bean.PestBean;
import com.code.dao.PestDao;
import com.code.util.DBUtil;


public class PestDaoImp implements PestDao {
	//得到无条件下的总记录条数
	public int PL() {
		// TODO Auto-generated method stub
		int count = 0;
		Connection con = DBUtil.getConnection();
		String sql = "select count(*) as allC from t_pestlist";
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
	
	
	//增加信息
	public int addPest(PestBean pest) {
		// TODO Auto-generated method stub
		System.out.println(pest.getLarvapicture());
		System.out.println(pest.getName());
		System.out.println(pest.getAdultpicture());
		Connection cont = DBUtil.getConnection();
		String sql = "insert into t_pestlist(f_name,f_host,f_breed,f_sentinel,f_larvapicture,f_adultpicture,f_control,f_mainharm)" +
				"values(?,?,?,?,?,?,?,?)";
		String sql1="select max(pk_id) as maxid from t_pestlist";
		PreparedStatement ps = null;
		int result = -1;
		try {
			cont.setAutoCommit(false);
			
			ps = cont.prepareStatement(sql);

			ps.setString(1, pest.getName());
			ps.setString(2, pest.getHost());
			ps.setString(3, pest.getBreed());
			ps.setString(4, pest.getSentinel());
			ps.setString(5, pest.getLarvapicture());
			ps.setString(6, pest.getAdultpicture());
			ps.setString(7, pest.getControl());
			ps.setString(8, pest.getMainharm());
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
	public ArrayList allPest(int pageNow, int pageSize) {
		// TODO Auto-generated method stub
		ArrayList<PestBean> al = new ArrayList<PestBean>();
		Connection con = DBUtil.getConnection();
		String sql1 = "select * from t_pestlist order by pk_id desc limit ?,?";
		PreparedStatement ps = null;
		ResultSet rs = null;
		try {
			ps = con.prepareStatement(sql1);
			ps.setInt(1, (pageNow - 1) * 4);
			ps.setInt(2, pageSize);
			rs = ps.executeQuery();
			while (rs.next()) {
				PestBean eb = new PestBean();
				eb.setId(rs.getInt("pk_id"));
				eb.setName(rs.getString("f_name"));
				eb.setHost(rs.getString("f_host"));
				eb.setBreed(rs.getString("f_breed"));
				eb.setSentinel(rs.getString("f_sentinel"));
				eb.setLarvapicture(rs.getString("f_larvapicture"));
				eb.setAdultpicture(rs.getString("f_adultpicture"));
				eb.setControl(rs.getString("f_control"));
				eb.setMainharm(rs.getString("f_mainharm"));
				al.add(eb);
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
	//根据ID查询所有信息
	public PestBean getPestById(int id) {
		// TODO Auto-generated method stub
		Connection cont2 = DBUtil.getConnection();
		PestBean pes = new PestBean();
		String sql = "select * from t_pestlist where pk_id=?";
		
		PreparedStatement ps = null;
		ResultSet rs = null;
		try {
			ps = cont2.prepareStatement(sql);
			ps.setInt(1, id);
			rs = ps.executeQuery();
			while(rs.next()){
				pes.setId(rs.getInt(1));
				pes.setName(rs.getString(2));
				pes.setHost(rs.getString(3));
				pes.setBreed(rs.getString(4));
				pes.setSentinel(rs.getString(5));
				pes.setLarvapicture(rs.getString(6));
				pes.setAdultpicture(rs.getString(7));
				pes.setControl(rs.getString(8));
				pes.setMainharm(rs.getString(9));
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally{
			DBUtil.close(rs, ps, cont2);
		}
		
		return pes;
	}
	//根据条件查询信息；
	public ArrayList getPestInfo(String con, String value,
			int pageNow, int pageSize) {
		// TODO Auto-generated method stub
		ArrayList<PestBean> list = new ArrayList<PestBean>();
		Connection con5 = DBUtil.getConnection();
		PreparedStatement ps = null;
		String sql = "select * from t_pestlist where"+con+"like'%"+value+"%' limit ?,?" ;
		ResultSet rs = null;
		try {
			ps = con5.prepareStatement(sql);
			ps.setInt(1, (pageSize-1)*pageNow);
			ps.setInt(2, pageNow);
			rs = ps.executeQuery();
			
			while(rs.next()){
				PestBean plt = new PestBean();
				plt.setId(rs.getInt("pk_id"));
				plt.setName(rs.getString("f_name"));
				plt.setHost(rs.getString("f_host"));
				plt.setBreed(rs.getString("f_breed"));
				plt.setSentinel(rs.getString("f_sentinel"));
				plt.setLarvapicture(rs.getString("f_larvapicture"));
				plt.setAdultpicture(rs.getString("f_adultpicture"));
				plt.setControl(rs.getString("f_control"));
				plt.setMainharm(rs.getString("f_mainharm"));
				list.add(plt);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally{
			
			DBUtil.close(rs, ps, con5);
		}
		
		return list;
		
	}
	//得到有条件下的总记录条数；
	public int ptst(String con, String value) {
		// TODO Auto-generated method stub
		int row = 0;
		Connection con6 = DBUtil.getConnection();
		PreparedStatement ps = null;
		ResultSet rs = null;
		String sql = "select count(*) as count1 from t_pestlist where "+con+" like '%"+value+"%'";
		
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

//图片
	public boolean updateById(int id, String image1, String image2) {
		// TODO Auto-generated method stub
		boolean flag = false;
		Connection cont3 = DBUtil.getConnection();
		String sql3 = "update t_pestlist set f_larvapicture=?,f_adultpicture=? where pk_id=?";
		PreparedStatement ps = null;
		
		try {
			ps = cont3.prepareStatement(sql3);
			
			ps.setString(1, image1);
			ps.setString(2, image2);
			ps.setInt(3, id);
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

}

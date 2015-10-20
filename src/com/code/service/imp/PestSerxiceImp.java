package com.code.service.imp;

import com.code.bean.PestBean;
import com.code.dao.imp.PestDaoImp;
import com.code.service.PestSerxice;

import java.util.ArrayList;

public class PestSerxiceImp implements PestSerxice {

	public int addPest(PestBean pest) {
		// TODO Auto-generated method stub
		//增加信息
		return new PestDaoImp().addPest(pest);
	}

	public PestBean getPestById(int id) {
		// TODO Auto-generated method stub
		//根据ID查询所有信息
		return new PestDaoImp().getPestById(id);
	}
	//得到无条件下的总记录条数
	public int PL() {
		// TODO Auto-generated method stub
		return new PestDaoImp().PL();
	}
	//得到无条件下的分页数据
	public ArrayList allPest(int pageNow, int pageSize) {
		// TODO Auto-generated method stub
		return new PestDaoImp().allPest(pageNow, pageSize);
	}
	//图片
	public boolean updateById(int id, String image1, String image2) {
		// TODO Auto-generated method stub
		return new PestDaoImp().updateById(id, image1, image2);
	}
	//根据条件查询信息；
	public ArrayList getPestInfo(String con, String value, int pageNow,
			int pageSize) {
		// TODO Auto-generated method stub
		return new PestDaoImp().getPestInfo(con, value, pageNow, pageSize);
	}
	//得到有条件下的总记录条数；
	public int ptst(String con, String value) {
		// TODO Auto-generated method stub
		return new PestDaoImp().ptst(con, value);
	}

	
	
	//实现在无条件查询得到所有页数的接口
	public int queryAllNumber(int pageSize) {
		// TODO Auto-generated method stub
		return new PestDaoImp().getAllNumber(pageSize);
	}
	//实现在无条件查询下得到所有的信息
	public ArrayList<PestBean> queryAllPest(int currentPage, int pageSize) {
		// TODO Auto-generated method stub
		return new PestDaoImp().getAllPest(currentPage,pageSize);
	}

	//实现得到带条件查询时的总页数
	public int queryPageNumberBycondition(String condition, String value,
			int pageSize) {
		// TODO Auto-generated method stub
		return new PestDaoImp().getPageNumberByCondition(condition,value,pageSize);
	}

	//实现得到带条件查询时的所有信息
	public ArrayList<PestBean> queryPestByCondition(String condition,
			String value, int currentPage, int pageSize) {
		// TODO Auto-generated method stub
		return new PestDaoImp().getPestByCondition(condition,value,currentPage,pageSize);
	}

}

package com.code.service;

import com.code.bean.PestBean;

import java.util.ArrayList;

public interface PestSerxice {

	//根据ID查询所有信息
	public PestBean getPestById(int id);
	//增加信息
	public int addPest(PestBean pest);
	//得到无条件下的总记录条数
	public int PL();
	//得到无条件下的分页数据
	public ArrayList allPest(int pageNow, int pageSize);
	//图片
	public boolean updateById(int id, String image1, String image2);
	//得到有条件下的总记录条数；
	public int ptst(String con, String value);
	//根据条件查询信息；
	public ArrayList getPestInfo(String con, String value, int pageNow, int pageSize);
	
	
	
	
	
	//得到无条件查询时总的页数
	public int queryAllNumber(int pageSize);
	//得到无条件查询时的所有信息
	public ArrayList<PestBean> queryAllPest(int currentPage, int pageSize);
	//得到带条件查询时的总页数
	public int queryPageNumberBycondition(String condition, String value, int pageSize);
	//得到带条件查询的所有信息
	public ArrayList<PestBean> queryPestByCondition(String condition, String value, int currentPage, int pageSize);
}

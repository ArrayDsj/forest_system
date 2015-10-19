package com.code.dao;

import com.code.bean.PestBean;

import java.util.ArrayList;

public interface PestDao {

	//得到无条件下的总记录条数
	public int PL();
	//得到无条件下的分页数据
	public ArrayList allPest(int pageNow, int pageSize);
	//得到有条件下的总记录条数；
	public int ptst(String con, String value);
	//根据条件查询信息；
	public ArrayList getPestInfo(String con, String value, int pageNow, int pageSize);
	//图片
	public boolean updateById(int id, String image1, String image2);
	
	//根据ID查询所有信息
	public PestBean getPestById(int id);
	//增加信息
	public int addPest(PestBean pest);
	
	
}

package com.code.service;

import com.code.bean.Amouse;

import java.util.ArrayList;

public interface AmouseService {

	//得到无条件下的总记录条数
	public int AD();
	//得到无条件下的分页数据
	public ArrayList<Amouse> allAmouse(int pageNow, int pageSize);
	//得到有条件下的总记录条数
	public int Amouse(String value);
	//根据条件查询信息；
	public ArrayList<Amouse> getAmouseInfo(String value, int pageNow, int pageSize);
	//根据ID查询所有信息
	public Amouse getAmouseListById(int id);
	//增加信息
	public int addAmouse(Amouse amouse);
	//图片
	public boolean updateById(int id, String image1);
	
}

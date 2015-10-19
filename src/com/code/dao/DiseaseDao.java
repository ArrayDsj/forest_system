package com.code.dao;

import java.util.ArrayList;
import java.util.List;
import com.code.bean.DiseaseBean;

public interface DiseaseDao {
	
	//得到无条件下的总记录条数
	public int DLD();
	//得到无条件下的分页数据
	public ArrayList alldisease(int pageNow, int pageSize);
	//得到有条件下的总记录条数
	public int Diseases(String con, String value);
	//根据条件查询信息；
	public ArrayList getDiseaseInfo(String con, String value, int pageNow, int pageSize);
	//根据ID查询所有信息
	public DiseaseBean getDiseaseById(int id);
	//增加信息
	public int addDisease(DiseaseBean disease);
	//图片
	public boolean updateById(int id, String image1);
}

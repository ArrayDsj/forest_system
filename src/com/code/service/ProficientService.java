package com.code.service;

import com.code.bean.ProficientBean;

import java.util.ArrayList;

public interface ProficientService {
	
	//查询所有的专家信息
	public ArrayList<ProficientBean>  getAllProfic(int currentPage, int pageSize);
	//查询专家信息的总页数（用pageSize进行分割，计算）
	public int getAllNumber(int pageSize);
	//查询带条件的专家信息的总页数（用pageSize进行分割，计算）
	public int queryPageNumberByCondition(String condition, String value, int pageSize);
	//查询带条件的专家信息
	public ArrayList<ProficientBean> queryProficientByCondition(String condition, String value, int currentPage, int pageSize);
	//删除专家
	public boolean deleteProficient(int id);
	//显示被选中专家的信息
	public ProficientBean queryProficientInfo(int id);
	//修改被选中的专家的信息
	public boolean updateProficient(ProficientBean pro);

    public boolean addProficient(ProficientBean proficientBean);

}

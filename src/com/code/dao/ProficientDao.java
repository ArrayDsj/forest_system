package com.code.dao;

import com.code.bean.ProficientBean;

import java.util.ArrayList;

public interface ProficientDao {
	
	//查询所有专家信息
	public ArrayList<ProficientBean>  queryAllProfic(int currentPage, int pageSize);
	//查询专家信息的总页数（用pageSize进行分割，计算）
	public int getAllNumber(int pageSize);
	//查询带条件的专家信息的总页数（用pageSize进行分割，计算）
	public int getPageNumberByCondition(String condition, String value, int pageSize);
	//查询带条件的专家信息（用pageSize进行分割，计算）
	public ArrayList<ProficientBean> getProficientByCondition(String condition, String value, int currentPage, int pageSize);
	//删除专家信息
	public boolean deleteProficient(int id);
	//显示被选中的专家的信息
	public ProficientBean getProficientInfo(int id);
	//修改被选中的专家的信息
	public boolean updateProficient(ProficientBean pro);

    public boolean addProficient(ProficientBean proficientBean);
}

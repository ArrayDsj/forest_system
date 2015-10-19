package com.code.service.imp;

import java.util.ArrayList;

import com.code.bean.ProficientBean;
import com.code.dao.ProficientDao;
import com.code.dao.imp.ProficientDaoImp;
import com.code.service.ProficientService;



public class ProficientServicImp implements ProficientService {
	
	//将调用持久层操作全局化
	ProficientDao pdao = new ProficientDaoImp();
	
	//实现查询所有专家信息的接口
	public ArrayList<ProficientBean> getAllProfic(int currentPage,int pageSize) {
		// TODO Auto-generated method stub
		return pdao.queryAllProfic(currentPage,pageSize);
	}
	//实现查询所有专家信息的总页数接口
	public int getAllNumber(int pageSize) {
		// TODO Auto-generated method stub
		return pdao.getAllNumber(pageSize);
	}
	//实现查询带条件的专家信息的总页数接口
	public int queryPageNumberByCondition(String condition, String value,
			int pageSize) {
		// TODO Auto-generated method stub
		return pdao.getPageNumberByCondition(condition,value,pageSize);
	}
	//实现查询带条件的专家信息的接口
	public ArrayList<ProficientBean> queryProficientByCondition(
			String condition, String value, int currentPage, int pageSize) {
		// TODO Auto-generated method stub
		return pdao.getProficientByCondition(condition,value,currentPage,pageSize);
	}
	//实现删除专家的接口
	public boolean deleteProficient(int id) {
		// TODO Auto-generated method stub
		return pdao.deleteProficient(id);
	}
	//实现显示被选中的专家的接口
	public ProficientBean queryProficientInfo(int id) {
		// TODO Auto-generated method stub
		return pdao.getProficientInfo(id);
	}
	//实现修改被选中的专家的接口
	public boolean updateProficient(ProficientBean pro) {
		// TODO Auto-generated method stub
		return pdao.updateProficient(pro);
	}
	

}

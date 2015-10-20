package com.code.dao;

import java.util.ArrayList;

import com.code.bean.DrugBean;

public interface DrugDao {
	public ArrayList<DrugBean> getDrugByPage(int currentPage, int numberPer);
		
	public int getDrugCount();
	
	public boolean addDrug(DrugBean db);
	
	public ArrayList<DrugBean> getDrugByTypeId(int TypeId, int currentPage, int numberPer);
	
	public int getDrugCountByTypeID(int TypeID);
	
	public ArrayList<DrugBean> getDrugByName(String Val, int currentPage, int numberPer);
	
	public int getDrugCountByName(String Val);
	
	public ArrayList<DrugBean> getDrugByDisasterName(String Val, int currentPage, int numberPer);
	
	public int getDrugCountByDisaster(String Val);
	
	public ArrayList<DrugBean> getDrugByType(int TypeId);
}

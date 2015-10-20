package com.code.dao;

import java.util.ArrayList;

import com.code.bean.ApparatusBean;
import com.code.bean.DrugBean;

public interface ApparatusDao {
	public ArrayList<ApparatusBean> getDrugByPage(int currentPage, int numberPer);
	
	public int getApparCount();
	
	public ArrayList<ApparatusBean> getApparatusByName(String queryVal, int currentPage, int numberPer);
	
	public int getApparatusCountByName(String queryVal, int currentPage, int numberPer);
	
	public boolean addApparatus(ApparatusBean app);
	
	public ArrayList<ApparatusBean> getApparatusByType(String queryVal, int currentPage, int numberPer);

	public int getApparatusCountByType(String queryVal, int currentPage, int numberPer);

	public ArrayList<ApparatusBean> getApparatusByType(String queryVal);
}

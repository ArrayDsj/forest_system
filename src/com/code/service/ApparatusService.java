package com.code.service;

import java.util.ArrayList;

import com.code.bean.ApparatusBean;

public interface ApparatusService {
	public ArrayList<ApparatusBean> getDrugByPage(int currentPage, int numberPer);
	
	public int getApparCount();
	
	public ArrayList<ApparatusBean> getApparatusByName(String queryVal, int currentPage, int numberPer);

	public int getApparatusCountByName(String queryVal, int currentPage, int numberPer);

	public boolean addApparatus(ApparatusBean app);
	
	public ArrayList<ApparatusBean> getApparatusByType(String queryVal, int currentPage, int numberPer);
	
	public int getApparatusCountByType(String queryVal, int currentPage, int numberPer);

	public ArrayList<ApparatusBean> getApparatusByType(String queryVal);
}

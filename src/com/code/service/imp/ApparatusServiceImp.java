package com.code.service.imp;

import java.util.ArrayList;

import org.apache.commons.lang3.StringUtils;

import com.code.bean.ApparatusBean;
import com.code.dao.ApparatusDao;
import com.code.dao.imp.ApparatusDaoImp;
import com.code.service.ApparatusService;

public class ApparatusServiceImp implements ApparatusService {

	public ArrayList<ApparatusBean> getDrugByPage(int currentPage, int numberPer) {
		// TODO Auto-generated method stub
		ApparatusDao ad = new ApparatusDaoImp();
		return ad.getDrugByPage(currentPage, numberPer);
	}

	public int getApparCount() {
		// TODO Auto-generated method stub
		ApparatusDao ad = new ApparatusDaoImp();
		return ad.getApparCount();
		
	}

	public ArrayList<ApparatusBean> getApparatusByName(String queryVal,
			int currentPage, int numberPer) {
		// TODO Auto-generated method stub
		if(StringUtils.isNotBlank(queryVal)){
			ApparatusDao app = new ApparatusDaoImp();
			return app.getApparatusByName(queryVal, currentPage, numberPer);
		}
		else{
			return null;
		}
		
	}

	public int getApparatusCountByName(String queryVal, int currentPage,
			int numberPer) {
		// TODO Auto-generated method stub
		ApparatusDao app = new ApparatusDaoImp();
		
		return app.getApparatusCountByName(queryVal, currentPage, numberPer);
	}

	public boolean addApparatus(ApparatusBean app) {
		// TODO Auto-generated method stub
		if(StringUtils.isNotBlank(app.getName()) &&
				StringUtils.isNotBlank(app.getType()) && 
				StringUtils.isNotBlank(app.getMainUse())){
			ApparatusDao ad = new ApparatusDaoImp();
			return ad.addApparatus(app);
		}
		else{
			return false;
		}
		
	}

	
	public ArrayList<ApparatusBean> getApparatusByType(String queryVal,
			int currentPage, int numberPer) {
		// TODO Auto-generated method stub
		if(StringUtils.isNotBlank(queryVal)){
			ApparatusDao app = new ApparatusDaoImp();
			return app.getApparatusByType(queryVal, currentPage, numberPer);
		}else{
		return null;
		}
	}

	
	public int getApparatusCountByType(String queryVal, int currentPage,
			int numberPer) {
		// TODO Auto-generated method stub
		ApparatusDao ad = new ApparatusDaoImp();
		return ad.getApparatusCountByType(queryVal, currentPage, numberPer);
	}

	public ArrayList<ApparatusBean> getApparatusByType(String queryVal) {
		// TODO Auto-generated method stub
		ApparatusDao ad = new ApparatusDaoImp();
		return ad.getApparatusByType(queryVal);
	}

}

package com.code.service.imp;

import com.code.bean.DrugBean;
import com.code.dao.DrugDao;
import com.code.dao.imp.DrugDaoImp;
import com.code.service.DrugService;

import java.util.ArrayList;

public class DrugServiceImp implements DrugService {

	public ArrayList<DrugBean> getDrugByPage(int currentPage, int numberPer) {
		// TODO Auto-generated method stub
		DrugDao dd = new DrugDaoImp();
		return dd.getDrugByPage(currentPage, numberPer);
	}

	public int getDrugCount() {
		// TODO Auto-generated method stub
		DrugDao dd = new DrugDaoImp();
		return dd.getDrugCount();
	}

	public boolean addDrug(DrugBean db) {
		// TODO Auto-generated method stub
		DrugDao dd = new DrugDaoImp();
		return dd.addDrug(db);
	}

	public ArrayList<DrugBean> getDrugByTypeId(int TypeId,int currentPage, int numberPer) {
		// TODO Auto-generated method stub
		DrugDao dd = new DrugDaoImp();
		return dd.getDrugByTypeId(TypeId,currentPage,numberPer);
	}

	public int getDrugCountByTypeID(int TypeID) {
		// TODO Auto-generated method stub
		DrugDao dd = new DrugDaoImp();
		return dd.getDrugCountByTypeID(TypeID);
	}

	public ArrayList<DrugBean> getDrugByName(String Val, int currentPage,
			int numberPer) {
		// TODO Auto-generated method stub
		DrugDao dd = new DrugDaoImp();
		return dd.getDrugByName(Val, currentPage, numberPer);
	}

	public int getDrugCountByName(String Val) {
		// TODO Auto-generated method stub
		DrugDao dd = new DrugDaoImp();
		return dd.getDrugCountByName(Val);
	}

	public ArrayList<DrugBean> getDrugByDisasterName(String Val,
			int currentPage, int numberPer) {
		// TODO Auto-generated method stub
		DrugDao dd = new DrugDaoImp();
		return dd.getDrugByDisasterName(Val, currentPage, numberPer);
	}

	public int getDrugCountByDisaster(String Val) {
		// TODO Auto-generated method stub
		DrugDao dd = new DrugDaoImp();
		return dd.getDrugCountByDisaster(Val);
	}

	public ArrayList<DrugBean> getDrugByType(int TypeId) {
		// TODO Auto-generated method stub
		DrugDao dd = new DrugDaoImp();
		return dd.getDrugByType(TypeId);
	}

		
}

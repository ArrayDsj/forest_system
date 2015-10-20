package com.code.service.imp;

import com.code.bean.DiseaseBean;
import com.code.dao.imp.DiseaseDaoImp_old;
import com.code.service.DiseaseeService;

import java.util.ArrayList;

public class DiseaseServiceimp_old implements DiseaseeService {

	public int DLD() {
		// TODO Auto-generated method stub
		return new DiseaseDaoImp_old().DLD();
	}
//增加信息
	public int addDisease(DiseaseBean disease) {
		// TODO Auto-generated method stub
		return new DiseaseDaoImp_old().addDisease(disease);
	}

	public ArrayList alldisease(int pageNow, int pageSize) {
		// TODO Auto-generated method stub
		return new DiseaseDaoImp_old().alldisease(pageNow, pageSize);
	}

	public int Diseases(String con, String value) {
		// TODO Auto-generated method stub
		return new DiseaseDaoImp_old().Diseases(con, value);
	}

	public DiseaseBean getDiseaseById(int id) {
		// TODO Auto-generated method stub
		return new DiseaseDaoImp_old().getDiseaseById(id);
	}

	public ArrayList getDiseaseInfo(String con, String value, int pageNow,
			int pageSize) {
		// TODO Auto-generated method stub
		return new DiseaseDaoImp_old().getDiseaseInfo(con, value, pageNow, pageSize);
	}

	public boolean updateById(int id, String image1) {
		// TODO Auto-generated method stub
		return new DiseaseDaoImp_old().updateById(id, image1);
	}

}

package com.code.service.imp;

import java.util.ArrayList;

import com.code.bean.DiseaseBean;
import com.code.dao.imp.DiseaseDaoImp;
import com.code.service.DiseaseeService;

public class DiseaseServiceimp implements DiseaseeService {

	public int DLD() {
		// TODO Auto-generated method stub
		return new DiseaseDaoImp().DLD();
	}
//增加信息
	public int addDisease(DiseaseBean disease) {
		// TODO Auto-generated method stub
		return new DiseaseDaoImp().addDisease(disease);
	}

	public ArrayList alldisease(int pageNow, int pageSize) {
		// TODO Auto-generated method stub
		return new DiseaseDaoImp().alldisease(pageNow, pageSize);
	}

	public int Diseases(String con, String value) {
		// TODO Auto-generated method stub
		return new DiseaseDaoImp().Diseases(con, value);
	}

	public DiseaseBean getDiseaseById(int id) {
		// TODO Auto-generated method stub
		return new DiseaseDaoImp().getDiseaseById(id);
	}

	public ArrayList getDiseaseInfo(String con, String value, int pageNow,
			int pageSize) {
		// TODO Auto-generated method stub
		return new DiseaseDaoImp().getDiseaseInfo(con, value, pageNow, pageSize);
	}

	public boolean updateById(int id, String image1) {
		// TODO Auto-generated method stub
		return new DiseaseDaoImp().updateById(id, image1);
	}

}

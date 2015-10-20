package com.code.service.imp;

import java.util.ArrayList;

import com.code.bean.DisasterBean;
import com.code.bean.DiseaseBean;
import com.code.bean.MouseBean;
import com.code.bean.WormBean;
import com.code.dao.QueryDisasterDao;
import com.code.dao.imp.QueryDisasterDaoImp;
import com.code.service.QueryDisasterService;

public class QueryDisasterServiceImp implements QueryDisasterService {

	public ArrayList<DisasterBean> queryDiseaseByValue() {
		// TODO Auto-generated method stub
		QueryDisasterDao qdd = new QueryDisasterDaoImp();
		return qdd.queryDiseaseByValue();
	}

	public ArrayList<DisasterBean> queryMouseByValue() {
		// TODO Auto-generated method stub
		QueryDisasterDao qdd = new QueryDisasterDaoImp();
		return qdd.queryMouseByValue();
	}

	public ArrayList<DisasterBean> queryWormByValue() {
		// TODO Auto-generated method stub
		QueryDisasterDao qdd = new QueryDisasterDaoImp();
		return qdd.queryWormByValue();
	}

}

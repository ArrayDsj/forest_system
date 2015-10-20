package com.code.service.imp;

import java.util.ArrayList;

import com.code.bean.OutWareHouseBean;
import com.code.dao.OutWareHouseDao;
import com.code.dao.imp.OutWareHouseDaoImp;
import com.code.service.OutWareHouseService;

public class OutWareHouseServiceImp implements OutWareHouseService{

	public ArrayList<OutWareHouseBean> getAllOutWareHouse(int currentPage,
			int numberPer) {
		// TODO Auto-generated method stub
		OutWareHouseDao out = new OutWareHouseDaoImp();
		return out.getAllOutWareHouse(currentPage, numberPer);
	}

	public int getAllCount() {
		// TODO Auto-generated method stub
		OutWareHouseDao out = new OutWareHouseDaoImp();
		return out.getAllCount();
	}

	public boolean addOutWashHouse(OutWareHouseBean out) {
		// TODO Auto-generated method stub
		OutWareHouseDao owh = new OutWareHouseDaoImp();
		return owh.addOutWareHouse(out);
	}

	public ArrayList<OutWareHouseBean> getOutWareHouseByTime(String start,
			String over, int currentPage, int numberPer) {
		// TODO Auto-generated method stub
		OutWareHouseDao out = new OutWareHouseDaoImp();
		return out.getOutWareHouseByTime(start, over, currentPage, numberPer);
	}

	public int getCountByTime(String start, String over) {
		// TODO Auto-generated method stub
		OutWareHouseDao out = new OutWareHouseDaoImp();
		return out.getCountByTime(start, over);
	}

}

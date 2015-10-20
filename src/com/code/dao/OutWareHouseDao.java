package com.code.dao;

import java.util.ArrayList;

import com.code.bean.OutWareHouseBean;

public interface OutWareHouseDao {
	public ArrayList<OutWareHouseBean> getAllOutWareHouse(int currentPage, int numberPer);

	public int getAllCount();
	
	public boolean addOutWareHouse(OutWareHouseBean out);
	
	public ArrayList<OutWareHouseBean> getOutWareHouseByTime(String start, String over, int currentPage, int numberPer);

	public int getCountByTime(String start, String over);
}

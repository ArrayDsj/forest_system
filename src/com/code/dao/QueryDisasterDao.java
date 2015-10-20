package com.code.dao;

import com.code.bean.DisasterBean;

import java.util.ArrayList;

public interface QueryDisasterDao {
	public ArrayList<DisasterBean> queryWormByValue();
	public ArrayList<DisasterBean> queryMouseByValue();
	public ArrayList<DisasterBean> queryDiseaseByValue();
}

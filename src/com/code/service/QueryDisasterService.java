package com.code.service;

import java.util.ArrayList;

import com.code.bean.DisasterBean;
import com.code.bean.DiseaseBean;
import com.code.bean.MouseBean;
import com.code.bean.WormBean;

public interface QueryDisasterService {
	public ArrayList<DisasterBean> queryWormByValue();
	public ArrayList<DisasterBean> queryMouseByValue();
	public ArrayList<DisasterBean> queryDiseaseByValue();
}

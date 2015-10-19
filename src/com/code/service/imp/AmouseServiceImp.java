package com.code.service.imp;

import com.code.bean.Amouse;
import com.code.dao.imp.AmouseDaoimp;
import com.code.service.AmouseService;

import java.util.ArrayList;

public class AmouseServiceImp implements AmouseService {

	public int AD() {
		// TODO Auto-generated method stub
		return new AmouseDaoimp().AD();
	}

	public int Amouse(String value) {
		// TODO Auto-generated method stub
		return new AmouseDaoimp().Amouse(value);
	}

	public int addAmouse(Amouse amouse) {
		// TODO Auto-generated method stub
		return new AmouseDaoimp().addAmouse(amouse);
	}

	public ArrayList allAmouse(int pageNow, int pageSize) {
		// TODO Auto-generated method stub
		return new AmouseDaoimp().allAmouse(pageNow, pageSize);
	}

	public ArrayList getAmouseInfo(String value, int pageNow, int pageSize) {
		// TODO Auto-generated method stub
		return new AmouseDaoimp().getAmouseInfo(value, pageNow, pageSize);
	}

	public Amouse getAmouseListById(int id) {
		// TODO Auto-generated method stub
		return new AmouseDaoimp().getAmouseListById(id);
	}

	public boolean updateById(int id, String image1) {
		// TODO Auto-generated method stub
		return new AmouseDaoimp().updateById(id, image1);
	}

}

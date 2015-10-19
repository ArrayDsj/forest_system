package com.code.service.imp;

import com.code.bean.LogBean;
import com.code.dao.LogDao;
import com.code.dao.imp.LogDaoImp;
import com.code.service.LogService;

import java.util.ArrayList;
import java.util.Date;

public class LogServiceImp implements LogService {

	LogDao ld = new LogDaoImp();
	
	public boolean addLog(LogBean log) {
		// TODO Auto-generated method stub
		return ld.addLog(log);
	}

	public int getAllNumber() {
		// TODO Auto-generated method stub
		return ld.getAllNumber();
	}

	public ArrayList<LogBean> getAllLogs(int currentPage, int pageSize) {
		// TODO Auto-generated method stub
		return ld.queryAllLogs(currentPage, pageSize);
	}

	public int queryPageNumberByDate(Date start, Date end, int pageSize) {
		// TODO Auto-generated method stub
		return ld.getPageNumberByDate(start,end,pageSize);
	}

	public ArrayList<LogBean> queryLogByDate(int currentPage, Date start,
			Date end, int pageSize) {
		// TODO Auto-generated method stub
		return ld.getLogByDate(currentPage,start,end,pageSize);
	}

}

package com.code.dao;

import com.code.bean.LogBean;

import java.util.ArrayList;
import java.util.Date;

public interface LogDao {
	
	public boolean addLog(LogBean log);
	
	public int getAllNumber();

	public ArrayList<LogBean> queryAllLogs(int currentPage, int pageSize);

	public int getPageNumberByDate(Date start, Date end, int pageSize);

	public ArrayList<LogBean> getLogByDate(int currentPage, Date start, Date end, int pageSize);
}

	

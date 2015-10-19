package com.code.service;

import java.util.ArrayList;
import java.util.Date;

import com.code.bean.LogBean;

public interface LogService {
	
	public boolean addLog(LogBean log);
	
	public int getAllNumber();
	
	public ArrayList<LogBean> getAllLogs(int currentPage, int pageSize);

	public int queryPageNumberByDate(Date start, Date end, int pageSize);

	public ArrayList<LogBean> queryLogByDate(int currentPage, Date start, Date end, int pageSize);
}

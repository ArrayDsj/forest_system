package com.code.servlet;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.code.bean.LogBean;
import com.code.service.LogService;
import com.code.service.imp.LogServiceImp;

public class LogQueryServlet extends HttpServlet {
	
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		
		
		int pageSize = Integer.parseInt(this.getServletContext().getInitParameter("pageSize"));
		
		
		int currentPage = -1;
		
		currentPage = Integer.parseInt(req.getParameter("pageNow"));
				
		LogService ls = new LogServiceImp();
		
		if(currentPage == -1){
			
			int pageNumber = ls.getAllNumber();
			
		
			
			//删除日期查询的条件
			req.getSession().removeAttribute("start");
			
			req.getSession().removeAttribute("end");
			
			
			
			req.getSession().setAttribute("pageNumber", pageNumber);
			
			ArrayList<LogBean> logList = ls.getAllLogs(1,pageSize);
			
			req.setAttribute("logList", logList);
			
			req.setAttribute("currentPage", 1);
		
		}else{
			
			ArrayList<LogBean> logList = ls.getAllLogs(currentPage,pageSize);
			
			req.setAttribute("logList", logList);
			
			req.setAttribute("currentPage", currentPage);
			
		}
		
		req.getRequestDispatcher("jsp/systemmessage/logs.jsp").forward(
				req, resp);
		
	}
	
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		this.doGet(req, resp);
	}

}

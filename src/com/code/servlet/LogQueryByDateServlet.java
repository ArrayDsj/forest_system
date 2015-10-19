package com.code.servlet;

import java.io.IOException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.code.bean.LogBean;
import com.code.service.LogService;
import com.code.service.imp.LogServiceImp;

public class LogQueryByDateServlet extends HttpServlet {
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		int currentPage = -1;
		
		int pageSize = Integer.parseInt(this.getServletContext().getInitParameter("pageSize"));
		
		SimpleDateFormat sim = new SimpleDateFormat("yyyy-MM-dd");
		
		Date start = null;
		
		Date end = null;
		
		currentPage = Integer.parseInt(req.getParameter("pageNow"));
		
		LogService ls = new LogServiceImp();
		
		if(currentPage == -1){
			
			try {
				
				start = sim.parse(req.getParameter("start"));
				
				end = sim.parse(req.getParameter("end"));
				
				req.getSession().setAttribute("start", req.getParameter("start"));
				
				req.getSession().setAttribute("end", req.getParameter("end"));
			
			} catch (ParseException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			
			int pageNumber = ls.queryPageNumberByDate(start,end,pageSize);
			
			req.getSession().setAttribute("pageNumber", pageNumber);
			
			ArrayList<LogBean> LogList = ls.queryLogByDate(1,start,end,pageSize);
			
			req.setAttribute("logList", LogList);
			
			req.setAttribute("currentPage", 1);
						
		}else{
			
			try {
				start = sim.parse(req.getSession().getAttribute("start").toString());
			
				end = sim.parse(req.getSession().getAttribute("end").toString());
			
			} catch (ParseException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			
			ArrayList<LogBean> LogList = ls.queryLogByDate(currentPage, start, end,pageSize);
			
			req.setAttribute("logList", LogList);
			
			req.setAttribute("currentPage", currentPage);
			
			
		}
		
		req.getRequestDispatcher("jsp/systemmessage/logs.jsp").forward(req, resp);
		
		
		
		
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		this.doGet(req, resp);
	}
	

}

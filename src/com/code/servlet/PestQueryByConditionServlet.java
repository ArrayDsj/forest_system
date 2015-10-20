package com.code.servlet;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.code.bean.PestBean;
import com.code.service.PestSerxice;
import com.code.service.imp.PestSerxiceImp;

public class PestQueryByConditionServlet extends HttpServlet {
	
	
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		int pageSize = Integer.parseInt(this.getServletContext().getInitParameter("pageSize"));
		
		int currentPage = -1;
		
		String condition = req.getParameter("condition");
		
		String value = req.getParameter("value");
		
		currentPage = Integer.parseInt(req.getParameter("pageNow"));
		
		PestSerxice pestService = new PestSerxiceImp();
		
		if(currentPage==-1){
			req.getSession().setAttribute("condition", condition);
			
			req.getSession().setAttribute("value", value);
			
			int pageNumber = pestService.queryPageNumberBycondition(condition,value,pageSize);
			
			req.getSession().setAttribute("pageNumber", pageNumber);
			
			ArrayList<PestBean> pestList = pestService.queryPestByCondition(condition,value,1,pageSize);
			
			req.setAttribute("pestList", pestList);
			
			req.setAttribute("currentPage", 1);
		}else{
			
			condition = (String)req.getSession().getAttribute("condition");
			
			value = (String) req.getSession().getAttribute("value");
			
			ArrayList<PestBean> pestList =pestService.queryPestByCondition(condition, value, currentPage, pageSize);
		
			req.setAttribute("pestList", pestList);
		
			req.setAttribute("currentPage", currentPage);
		
		}
		
		req.getRequestDispatcher("jsp/datamanagement/wormPanel.jsp").forward(req, resp);
		
		
		
		
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		this.doGet(req, resp);
	}

}

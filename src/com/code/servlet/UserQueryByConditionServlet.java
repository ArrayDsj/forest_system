package com.code.servlet;

import com.code.bean.UserBean;
import com.code.service.UserService;
import com.code.service.imp.UserServiceImp;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.ArrayList;


public class UserQueryByConditionServlet extends HttpServlet {
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		int pageSize = Integer.parseInt(this.getServletContext()
				.getInitParameter("pageSize"));
		
		int currentPage = -1;
		
		String condition = req.getParameter("condition");
		
		currentPage = Integer.parseInt(req.getParameter("pageNow"));
		
		UserService us = new UserServiceImp();
		
		if(currentPage == -1 ){
			
			req.getSession().setAttribute("condition", condition);
			
			int pageNumber = us.queryPageNumberByCondition(condition,pageSize);
			
			req.getSession().setAttribute("pageNumber",pageNumber);
			
			ArrayList<UserBean> al = us.queryUserByCondition(1,condition,pageSize);
			
			req.setAttribute("userList", al);
			
			req.setAttribute("currentPage", 1);
			
		}else{
			

			
			condition = (String) req.getSession().getAttribute("condition");
			
			ArrayList<UserBean> al = us.queryUserByCondition(currentPage,condition,pageSize);
			
			req.setAttribute("userList", al);
			
			req.setAttribute("currentPage", currentPage);
			
		}
		
		req.getRequestDispatcher("jsp/systemmessage/userPanel.jsp").forward(
				req, resp);	
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		this.doGet(req, resp);
	}
	

}

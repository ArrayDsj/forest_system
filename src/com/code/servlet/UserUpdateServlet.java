package com.code.servlet;

import com.code.bean.UserBean;
import com.code.service.UserService;
import com.code.service.imp.UserServiceImp;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

public class UserUpdateServlet extends HttpServlet {
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		int id = Integer.parseInt(req.getParameter("id"));
		
		String password = req.getParameter("confirm");
		
		String degree = req.getParameter("degree");
		
		UserBean user = new UserBean();
		
		user.setId(id);
		
		user.setPassword(password);
		
		user.setDegree(degree);
		
		UserService us = new UserServiceImp();
		
		us.updateUser(user);
		
		req.getRequestDispatcher("userPanel.av?pageNow=-1").forward(req, resp);
		
		
		
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		this.doGet(req, resp);
	}

}

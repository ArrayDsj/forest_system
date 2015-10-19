package com.code.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.code.bean.UserBean;
import com.code.service.UserService;
import com.code.service.imp.UserServiceImp;

public class UserAddServlet extends HttpServlet {
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		// TODO Auto-generated method stub

		String username = req.getParameter("username");

		String password = req.getParameter("password");

		String realname = req.getParameter("realname");

		String degree = req.getParameter("degree");
		
		UserBean user = new UserBean();
		
		user.setName(username);
		
		user.setPassword(password);
		
		user.setDegree(degree);
		
		user.setRealName(realname);
		
		UserService us = new UserServiceImp();
		
		us.addUser(user);
		
		req.getRequestDispatcher("userPanel.av?pageNow=-1").forward(req, resp);
		
		
		
		
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		this.doGet(req, resp);
	}

}

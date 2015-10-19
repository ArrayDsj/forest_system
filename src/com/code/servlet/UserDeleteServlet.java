package com.code.servlet;

import com.code.service.UserService;
import com.code.service.imp.UserServiceImp;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

public class UserDeleteServlet extends HttpServlet {
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		req.getSession().removeAttribute("start");
		req.getSession().removeAttribute("end");
		req.getSession().removeAttribute("condition");
		req.getSession().removeAttribute("value");
		
		int id = Integer.parseInt(req.getParameter("id"));
		
		UserService  us = new UserServiceImp();
		
		us.deleteUser(id);
		
		req.getRequestDispatcher("userPanel.av?pageNow=-1").forward(req, resp);
		
		
		
		
		
		
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		this.doGet(req, resp);
	}

}

package com.code.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.code.bean.ProficientBean;
import com.code.service.ProficientService;
import com.code.service.imp.ProficientServicImp;

public class ProficientUpdateServlet extends HttpServlet {
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		int id = Integer.parseInt(req.getParameter("id"));
		
		String phoneNumber = req.getParameter("phone");
		
		String degree = req.getParameter("degree");
		
		String workUnit = req.getParameter("unit");
		
		String email = req.getParameter("email");
		
		ProficientBean pro = new ProficientBean();
		
		pro.setId(id);
		
		pro.setPhoneNumber(phoneNumber);
		
		pro.setDegree(degree);
		
		pro.setWorkUnit(workUnit);
		
		pro.setEmail(email);
		
		ProficientService proService = new ProficientServicImp();
		
		proService.updateProficient(pro);
		
		req.getRequestDispatcher("ProficientQueryServlet.av?pageNow=-1").forward(req, resp);
		
		
		
		
		
		
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		this.doGet(req, resp);
	}

}

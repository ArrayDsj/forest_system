package com.code.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.code.bean.ProficientBean;
import com.code.service.ProficientService;
import com.code.service.imp.ProficientServicImp;

public class ProficientDeleteServlet extends HttpServlet {
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		req.getSession().removeAttribute("start");
		req.getSession().removeAttribute("end");
		req.getSession().removeAttribute("condition");
		req.getSession().removeAttribute("value");
		
		int id = Integer.parseInt(req.getParameter("id"));
		
		ProficientService proService = new ProficientServicImp();
		
		proService.deleteProficient(id);
		
		req.getRequestDispatcher("ProficientQueryServlet.av?pageNow=1").forward(req, resp);
		
		
		
		
		
		
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		this.doGet(req, resp);
	}

}

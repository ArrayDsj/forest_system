package com.code.servlet;

import com.code.bean.ProficientBean;
import com.code.service.ProficientService;
import com.code.service.imp.ProficientServicImp;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.ArrayList;

public class ProficientQueryServlet extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		int pageSize = Integer.parseInt(this.getServletContext().getInitParameter("pageSize"));
		
		int currentPage = -1;
		
		currentPage = Integer.parseInt(req.getParameter("pageNow"));
		
		ProficientService proService = new ProficientServicImp();
		
		if(currentPage == -1){
			
			int pageNumber = proService.getAllNumber(pageSize);
			
			req.getSession().removeAttribute("start");
			req.getSession().removeAttribute("end");
			req.getSession().removeAttribute("condition");
			req.getSession().removeAttribute("value");
			
			req.getSession().setAttribute("pageNumber", pageNumber);
			
			ArrayList<ProficientBean> proList = proService.getAllProfic(1,pageSize);
			
			req.setAttribute("proList", proList);
			
			req.setAttribute("currentPage", 1);
		
		}else{
			
			ArrayList<ProficientBean> proList = proService.getAllProfic(currentPage,pageSize);
		
			req.setAttribute("proList",proList);
			
			req.setAttribute("currentPage", currentPage);
		}
		
		req.getRequestDispatcher("jsp/expertconsultation/proficientPanel.jsp").forward(req, resp);
		
		
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		this.doGet(req, resp);
	}
	
}

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

public class ProficientQueryByConditionServlet extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		int pageSize = Integer.parseInt(this.getServletContext().getInitParameter("pageSize"));
		
		int currentPage = -1;
		
		String condition = req.getParameter("condition");
		
		String value = req.getParameter("value");
		
		currentPage = Integer.parseInt(req.getParameter("pageNow"));
		
		ProficientService proService = new ProficientServicImp();
		
		if(currentPage == -1){
			
			req.getSession().setAttribute("condition", condition);
			
			req.getSession().setAttribute("value", value);
			
			int pageNumber = proService.queryPageNumberByCondition(condition,value,pageSize);
			
			req.getSession().setAttribute("pageNumber", pageNumber);
			
			ArrayList<ProficientBean> proList = proService.queryProficientByCondition(condition,value,1,pageSize);
			
			req.setAttribute("proList", proList);
			
			req.setAttribute("currentPage", 1);
			
		}else{
			
			//req.getSession().setAttribute("condition", condition);
			//
			//req.getSession().setAttribute("value", value);
            condition = (String)req.getSession().getAttribute("condition");
            value = (String) req.getSession().getAttribute("value");
			
			ArrayList<ProficientBean> proList = proService.queryProficientByCondition(condition, value, currentPage, pageSize);
			
			req.setAttribute("proList", proList);
			
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

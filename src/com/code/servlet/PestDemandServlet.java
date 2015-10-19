package com.code.servlet;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.code.bean.PestBean;
import com.code.service.imp.PestSerxiceImp;

public class PestDemandServlet extends HttpServlet {

	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		this.doPost(req, resp);
	}
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		PestSerxiceImp psci = new PestSerxiceImp();
		
		String condition = req.getParameter("condition");
		String value = req.getParameter("value");
		
	
		if(condition.equals("1")){
			condition = "f_host";
		}else if(condition.equals("0")){
			condition = "f_name";
		}
		
		int currentpage = 1;
		if(req.getParameter("currentpage").toString().equals("1")){
			currentpage = 1;
		}else{
			currentpage = Integer.parseInt(req.getParameter("currenpage"));
		}
		int cunt = psci.ptst(condition, value);
		int pagesize = Integer.parseInt(this.getServletContext().getInitParameter("ShowRowNum"));
		int pageCount=(cunt-1)/pagesize+1;
		ArrayList<PestBean> al = new ArrayList<PestBean>();
		al=psci.getPestInfo(condition, value, cunt, pagesize);
		req.setAttribute("allWorms", al);
		req.setAttribute("currentpage",currentpage);
		req.setAttribute("pagecount",pageCount );
		req.setAttribute("con",condition );
		req.setAttribute("value", value);
		req.setAttribute("condition", "search");
		req.getRequestDispatcher("./jsp/datamanagement/wormPanel.jsp").forward(req, resp);
		
		
		
	}
	
}

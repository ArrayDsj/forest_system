package com.code.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.code.bean.DiseaseBean;
import com.code.bean.PestBean;
import com.code.service.imp.DiseaseServiceimp;
import com.code.service.imp.PestSerxiceImp;

public class DiseaseMageServlet extends HttpServlet {

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
		int rownum = Integer.parseInt(this.getServletContext().getInitParameter("ShowRowNum"));
		DiseaseServiceimp dls = new DiseaseServiceimp();
		int countNumber = dls.DLD();
		int allPage = 0;
		if(countNumber % rownum != 0){
			allPage = countNumber / rownum + 1;
		}else{
			allPage = countNumber / rownum;
		}
		
		//得到当前页号
		int currentPage = 1;
		currentPage = Integer.parseInt(req.getParameter("pageNow1"));
		
		//从数据库得到数据
		ArrayList<DiseaseBean> al = new ArrayList<DiseaseBean>();
		al = dls.alldisease(currentPage,4);
		
		req.setAttribute("allPage", allPage);
		req.setAttribute("currentPage", currentPage);
		req.setAttribute("empList", al);
		req.getRequestDispatcher("jsp/datamanagement/diseasePanel.jsp").forward(req,resp);
	}
}

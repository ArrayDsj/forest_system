package com.code.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.code.bean.AmouseBean;
import com.code.bean.DiseaseBean;
import com.code.service.imp.AmouseServiceImp;
import com.code.service.imp.DiseaseServiceimp;

public class AmouseMageServlet extends HttpServlet {

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

		AmouseServiceImp asi = new AmouseServiceImp();
//		int countNumber = dls.DLD();
		int countNumber = asi.AD();
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
		ArrayList<AmouseBean> al = new ArrayList<AmouseBean>();
		al = asi.allAmouse(currentPage, 4);
		
		req.setAttribute("allPage", allPage);
		req.setAttribute("currentPage", currentPage);
		req.setAttribute("empList", al);
		req.getRequestDispatcher("jsp/datamanagement/mousePanel.jsp").forward(req,resp);
	}

}

package com.code.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.code.bean.PestBean;
import com.code.service.imp.PestSerxiceImp;

public class PestInfoServlet extends HttpServlet {

	
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
		 
		
//		int id = Integer.parseInt(req.getParameter("id"));
//		PestList a = new PestList();
//		PestListSerxiceImp ps = new PestListSerxiceImp();
//		a = ps.getPestListById(id);

		PestSerxiceImp plsi = new PestSerxiceImp();
		PestBean a = plsi.getPestById(Integer.parseInt(req.getParameter("id")));

		a.getName();
		a.getHost();
		a.getBreed();
		a.getSentinel();
		a.getLarvapicture();
		a.getAdultpicture();
		a.getControl();
		a.getMainharm();
//		
//		
//		System.out.println(a.getName());
//		System.out.println(a.getHost());
		req.setAttribute("empManage2",a );
		req.getRequestDispatcher("jsp/datamanagement/wormInfo.jsp").forward(req, resp);
	}
}

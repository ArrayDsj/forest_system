package com.code.servlet;

import com.code.bean.DiseaseBean;
import com.code.service.imp.DiseaseServiceimp_old;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

public class DiseaseInfoServlet extends HttpServlet {

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
		DiseaseServiceimp_old dls = new DiseaseServiceimp_old();
		DiseaseBean a = dls.getDiseaseById(Integer.parseInt(req.getParameter("id")));
		a.getName();
		a.getSource();
		a.getSymptoms();
		//a.getROD();
		a.getPicture();
		//a.getLMA();
		a.getMainharm();
		System.out.println(a.getName());
		req.setAttribute("empManage2",a );
		req.getRequestDispatcher("jsp/datamanagement/diseaseInfo.jsp").forward(req, resp);

	}
}

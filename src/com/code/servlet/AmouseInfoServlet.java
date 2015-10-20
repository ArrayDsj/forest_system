package com.code.servlet;

import com.code.bean.AmouseBean;
import com.code.service.imp.AmouseServiceImp;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

public class AmouseInfoServlet extends HttpServlet {

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

		AmouseServiceImp asi = new AmouseServiceImp();

		AmouseBean a = asi.getAmouseById(Integer.parseInt(req.getParameter("id")));

		req.setAttribute("empManage2",a );
		req.getRequestDispatcher("jsp/datamanagement/mouseInfo.jsp").forward(req, resp);
	}

}

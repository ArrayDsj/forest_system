package com.code.servlet;

import com.code.bean.PestBean;
import com.code.service.imp.PestSerxiceImp;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

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

		PestSerxiceImp plsi = new PestSerxiceImp();
		PestBean a = plsi.getPestById(Integer.parseInt(req.getParameter("id")));
        System.out.println(a);
        req.setAttribute("wormInfo", a );
		req.getRequestDispatcher("jsp/datamanagement/wormInfo.jsp").forward(req, resp);
	}
}

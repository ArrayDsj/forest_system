package com.code.servlet;

import com.code.bean.ApparatusBean;
import com.code.service.ApparatusService;
import com.code.service.imp.ApparatusServiceImp;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

public class AddApparatusServlet extends HttpServlet{
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
			String name = req.getParameter("name");
			String type = req.getParameter("type");
			String mainUse =  req.getParameter("mainUse");
			
			ApparatusBean app = new ApparatusBean();//新建一个器械对像
			app.setName(name);
			app.setType(type);
			app.setMainUse(mainUse);
			
			ApparatusService as = new ApparatusServiceImp();
			as.addApparatus(app);
			
			resp.sendRedirect("apparatus.av?pageNow=1");
		}
}

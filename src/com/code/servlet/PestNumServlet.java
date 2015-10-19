package com.code.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.code.bean.PestBean;
import com.code.service.imp.PestSerxiceImp;

public class PestNumServlet extends HttpServlet {

	
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
//		WormServiceImp wsi=new WormServiceImp();
		PestSerxiceImp pls = new PestSerxiceImp();
        int currentpage=1;
        currentpage=Integer.parseInt(req.getParameter("currentpage"));
        int rowCount=pls.PL();
        int pageSize=Integer.parseInt(this.getServletContext().getInitParameter("ShowRowNum"));
        int pageCount=(rowCount-1)/pageSize+1;
        ArrayList<PestBean> list=new ArrayList<PestBean>();
//        list=pls.getworms(pageSize, currentpage);
        list = pls.allPest(pageSize, currentpage);
        
        req.setAttribute("allWorms", list);
        req.setAttribute("currentPage", currentpage);
        req.setAttribute("pageCount", pageCount);
        req.getRequestDispatcher("./jsp/informationManager/wormPanel.jsp").forward(req,resp);
        
	}
	
}

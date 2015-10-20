package com.code.servlet;

import com.code.bean.PestBean;
import com.code.service.PestSerxice;
import com.code.service.imp.PestSerxiceImp;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.ArrayList;

public class PestMageServlet extends HttpServlet {

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
        //初始化
		int pageSize = Integer.parseInt(this.getServletContext().getInitParameter("pageSize"));
		
		int currentPage = -1;
		
		currentPage = Integer.parseInt(req.getParameter("pageNow"));
		
		PestSerxice pestService = new PestSerxiceImp();
		
		if(currentPage == -1){
			
			int pageNumber = pestService.queryAllNumber(pageSize);
			
			req.getSession().removeAttribute("start");
			req.getSession().removeAttribute("end");
			req.getSession().removeAttribute("condition");
			req.getSession().removeAttribute("value");
			
			req.getSession().setAttribute("pageNumber", pageNumber);
			
			ArrayList<PestBean> pestList = pestService.queryAllPest(1,pageSize);
			
			
			req.setAttribute("pestList", pestList);
			
			req.setAttribute("currentPage", 1);
			
			
		}else{
			
			ArrayList<PestBean> pestList = pestService.queryAllPest(currentPage, pageSize);
			
			req.setAttribute("pestList", pestList);
			
			req.setAttribute("currentPage", currentPage);
			
		}
		
		req.getRequestDispatcher("jsp/datamanagement/wormPanel.jsp").forward(req, resp);
		
//		int countNumber = PLSI.PL();
//		int allPage = 0;
//		if(countNumber % rownum != 0){
//			allPage = countNumber / rownum + 1;
//		}else{
//			allPage = countNumber / rownum;
//		}
		
		//得到当前页号
//		
//		System.out.println(currentPage);
//		
//		
//		//从数据库得到数据
//		ArrayList<PestBean> al = new ArrayList<PestBean>();
//		al = PLSI.allPest(currentPage, 4);
//		
//		req.setAttribute("allPage", allPage);
//		req.setAttribute("currentPage", currentPage);
//		req.setAttribute("empList", al);
//		req.getRequestDispatcher("jsp/datamanagement/wormPanel.jsp").forward(req,resp);
	}
}

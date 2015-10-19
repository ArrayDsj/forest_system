package com.code.servlet;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.code.bean.UserBean;
import com.code.service.UserService;
import com.code.service.imp.UserServiceImp;

public class UserServlet extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		// TODO Auto-generated method stub

		int pageSize = Integer.parseInt(this.getServletContext()
				.getInitParameter("pageSize"));
		// 得到当前页号数
		int currentPage = -1;
		
		currentPage = Integer.parseInt(req.getParameter("pageNow"));
		

		UserService uservice = new UserServiceImp();

		
		if(currentPage == -1){
			// 总页数
			int pageNumber = uservice.getAllNumber();
			
			//删除查询条件
			req.getSession().removeAttribute("start");
			req.getSession().removeAttribute("end");
			req.getSession().removeAttribute("condition");
			req.getSession().removeAttribute("value");
			
			req.getSession().setAttribute("pageNumber", pageNumber);
			
			ArrayList<UserBean> allUserList = uservice.getAllUsers(1,pageSize);
			
			req.setAttribute("userList", allUserList);
			
			req.setAttribute("currentPage", 1);
			
		}else{
			
			ArrayList<UserBean> allUserList = uservice.getAllUsers(currentPage,pageSize);
			
			req.setAttribute("userList", allUserList);
			
			req.setAttribute("currentPage", currentPage);
			
		}
		req.getRequestDispatcher("jsp/systemmessage/userPanel.jsp").forward(
				req, resp);

	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		this.doGet(req, resp);
	}

}

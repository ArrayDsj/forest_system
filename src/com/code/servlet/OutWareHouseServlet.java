package com.code.servlet;

import com.code.bean.OutWareHouseBean;
import com.code.service.OutWareHouseService;
import com.code.service.imp.OutWareHouseServiceImp;
import org.apache.commons.lang3.StringUtils;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.ArrayList;

public class OutWareHouseServlet extends HttpServlet{
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
		int row = Integer.parseInt(this.getServletContext().getInitParameter(
		"PageSize"));
		String start = req.getParameter("start");
		String over = req.getParameter("over");
		
		int currentPage = -1;
		currentPage = Integer.parseInt(req.getParameter("pageNow"));// 当前页数,从表示层传入
		int countNum = 0;
		OutWareHouseService out = new OutWareHouseServiceImp();//new出业务层
		
		ArrayList<OutWareHouseBean> al  =new ArrayList<OutWareHouseBean>();//new出一个出库集合
		if(StringUtils.isNotBlank(start) && StringUtils.isNotBlank(over)){
			al = out.getOutWareHouseByTime(start, over, currentPage, 4);
			countNum = out.getCountByTime(start, over);
		}
		
		else{
		al = out.getAllOutWareHouse(currentPage, 4);//调用业务层返回全部出库对象的方法
		countNum = out.getAllCount();
		}
		int pageNumber = 0;
		if (countNum % row != 0) {
			pageNumber = countNum / row + 1;
		} else {
			pageNumber = countNum / row;
		}
		req.setAttribute("li", al); // 设置属性List，传出药剂集合
		req.setAttribute("pageNumber", pageNumber); // 传出总页数值
		req.setAttribute("currentPage", currentPage); // 传出当前页数值
		req.setAttribute("start", start);
		req.setAttribute("over", over);
		req.getRequestDispatcher("jsp/resourcemanagement/outwarehousePanel.jsp").forward(req, resp);
	}
}

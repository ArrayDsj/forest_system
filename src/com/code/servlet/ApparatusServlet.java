package com.code.servlet;

import com.code.bean.ApparatusBean;
import com.code.service.ApparatusService;
import com.code.service.imp.ApparatusServiceImp;
import org.apache.commons.lang3.StringUtils;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.ArrayList;

public class ApparatusServlet extends HttpServlet{
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
		int row = Integer.parseInt(this.getServletContext().getInitParameter("PageSize"));
		int currentPage =1;
		currentPage = Integer.parseInt(req.getParameter("pageNow"));//当前页数,从表示层传入
		
		int countNum =0;
		
		String queryVal = req.getParameter("Val");// 这是输入框内容的值
		String Value = req.getParameter("Value"); // 这是下拉框中名称对应的值
		
		ApparatusService as  =  new ApparatusServiceImp();//new出业务层
		ArrayList<ApparatusBean> al = new ArrayList<ApparatusBean>();//new出器械对象
		if(StringUtils.isNotBlank(queryVal) && Value.equals("1")){
			al = as.getApparatusByName(queryVal, currentPage, 4);
			countNum = as.getApparatusCountByName(queryVal, currentPage, 4);
		}
		else if(StringUtils.isNotBlank(queryVal) && Value.equals("2")){
			al = as.getApparatusByType(queryVal, currentPage, 4);
			countNum = as.getApparatusCountByType(queryVal, currentPage, 4);
			
		}
		
		else{
			al = as.getDrugByPage(currentPage, 4);//调用业务层，返回器械集合			
			countNum = as.getApparCount();//调用业务层方法，返回器械对象在数据库中存在的总行数
		}
		int pageNumber =0;
		if(countNum % row != 0){
			pageNumber = countNum / row + 1;
		}
		else{
			pageNumber = countNum / row;
		}
		
		req.setAttribute("al", al);    //设置属性List，传出药剂集合
		req.setAttribute("pageNumber",pageNumber);  //传出总页数值
		req.setAttribute("currentPage", currentPage); //传出当前页数值
		req.setAttribute("select", Value);
		req.setAttribute("queryVal", queryVal);
		req.getRequestDispatcher("jsp/resourcemanagement/apparatusPanel.jsp").forward(req, resp);
		
	}
}

package com.code.servlet;

import com.code.bean.DrugBean;
import com.code.service.DrugService;
import com.code.service.imp.DrugServiceImp;
import org.apache.commons.lang3.StringUtils;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.ArrayList;

public class DrugServlet extends HttpServlet {
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
		String queryVal = req.getParameter("Val");// 当输入为虫鼠病害是来进行判断，这是输入框内容的值
		String Value = req.getParameter("Value"); // 这是下拉框中名称对应的值

		int currentPage = -1;
		currentPage = Integer.parseInt(req.getParameter("pageNow"));// 当前页数,从表示层传入

		DrugService ds1 = new DrugServiceImp();

		int countNum = 0;

		// 通过灾害类型的ID查询出药剂类型的集合
		ArrayList<DrugBean> al = new ArrayList<DrugBean>();
		DrugService ds = new DrugServiceImp();
		
		if (StringUtils.isNotBlank(queryVal)  && queryVal.equals("虫害")) {
			
			al = ds.getDrugByTypeId(1, currentPage, 4);
			countNum = ds1.getDrugCountByTypeID(1);
		} else if (StringUtils.isNotBlank(queryVal)  &&queryVal.equals("病害")) {
			
			al = ds.getDrugByTypeId(2, currentPage, 4);
			countNum = ds1.getDrugCountByTypeID(2);
		} else if (StringUtils.isNotBlank(queryVal)  &&queryVal.equals("鼠害")) {
			
			al = ds.getDrugByTypeId(3, currentPage, 4);
			countNum = ds1.getDrugCountByTypeID(3);
		} else if (StringUtils.isNotBlank(queryVal)  &&Value.equals("1")) {
			
			al = ds.getDrugByName(queryVal, currentPage, 4);
			countNum = ds1.getDrugCountByName(queryVal);
		} else if (StringUtils.isNotBlank(queryVal)  &&Value.equals("3")) {
			
			al = ds.getDrugByDisasterName(queryVal, currentPage, 4);
			countNum = ds1.getDrugCountByDisaster(queryVal);
		}
		else{
			al = ds.getDrugByPage(currentPage, 4);
			countNum = ds1.getDrugCount();
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
		req.setAttribute("queryVal", queryVal);
		req.getRequestDispatcher("jsp/resourcemanagement/drugPanel.jsp")
				.forward(req, resp);
		
	}
}

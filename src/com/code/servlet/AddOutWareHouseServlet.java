package com.code.servlet;

import com.code.bean.DrugApparatusBean;
import com.code.bean.OutWareHouseBean;
import com.code.service.OutWareHouseService;
import com.code.service.imp.OutWareHouseServiceImp;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.Date;

public class AddOutWareHouseServlet extends HttpServlet{
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
		String valType = req.getParameter("valType");
		String textDisaster = req.getParameter("textDisaster");
		int typeThing = Integer.parseInt(req.getParameter("typeThing"));
		String typeClass = req.getParameter("typeClass");
		String number = req.getParameter("number");
		String mainUse = req.getParameter("mainUse");
		
		System.out.println(textDisaster);
		System.out.println(typeThing);
		OutWareHouseBean out = new OutWareHouseBean();//new出一个出库对象
		DrugApparatusBean adb = new DrugApparatusBean();//new出库对想中的药剂器械的父类对想
		adb.setName(valType);
		//封装出库对像
		out.setDab(adb);
		out.setConsumingClass(typeClass);
		out.setConsumingNumber(number);
		out.setMianUse(mainUse);
		out.setPreventType(textDisaster);
		out.setTime(new Date());
		out.setType(typeThing);
		
		OutWareHouseService owhs = new OutWareHouseServiceImp();
		
		

		
		if(owhs.addOutWashHouse(out)){
			resp.sendRedirect("outwarehouse.av?pageNow=1");
		}
		
		
	}
}

package com.code.servlet;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.codehaus.jackson.JsonGenerator;
import org.codehaus.jackson.map.ObjectMapper;

import com.code.bean.ApparatusBean;
import com.code.bean.DrugBean;
import com.code.service.ApparatusService;
import com.code.service.DrugService;
import com.code.service.imp.ApparatusServiceImp;
import com.code.service.imp.DrugServiceImp;

public class QueryDrugApparatusServlet extends HttpServlet{
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
		int valDisaster = Integer.parseInt(req.getParameter("valDisaster"));
		String textDisaster = req.getParameter("textDisaster");
		
		ArrayList<Object> obj = new ArrayList<Object>();
		ArrayList<DrugBean>  al  =new ArrayList<DrugBean>();//药剂对象集合
		ArrayList<ApparatusBean> app = new ArrayList<ApparatusBean>();//器械对象集合
		
		DrugService ds = new DrugServiceImp();//药剂查询的业务层
		ApparatusService as = new ApparatusServiceImp();//器械查询的业务层
		if(valType.trim().equals("药剂")){
			al=ds.getDrugByType(valDisaster);
		}
		else if(valType.trim().equals("器械")){
			app = as.getApparatusByType(textDisaster);
		}
		
		obj.add(al);
		obj.add(app);
		
		resp.setCharacterEncoding("utf-8");
		ObjectMapper objectMapper = new ObjectMapper();
		JsonGenerator jsonGenerator = objectMapper.getJsonFactory().createJsonGenerator(resp.getWriter());
		jsonGenerator.writeObject(obj);
		jsonGenerator.flush();
		jsonGenerator.close();
	}
}

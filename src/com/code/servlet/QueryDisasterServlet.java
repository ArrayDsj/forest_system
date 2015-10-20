package com.code.servlet;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.codehaus.jackson.JsonGenerator;
import org.codehaus.jackson.map.ObjectMapper;

import com.code.bean.DisasterBean;
import com.code.service.QueryDisasterService;
import com.code.service.imp.QueryDisasterServiceImp;

public class QueryDisasterServlet extends HttpServlet{
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
		int Val = Integer.parseInt(req.getParameter("Val"));
		ArrayList<DisasterBean> al = null;
		QueryDisasterService qds = new QueryDisasterServiceImp();
		if(Val == 1){
			al = qds.queryWormByValue();
		}
		else if(Val == 2){
			al = qds.queryDiseaseByValue();			
		}
		else if(Val == 3){
			al = qds.queryMouseByValue();
		}
		
		
		
		resp.setCharacterEncoding("utf-8");

		ObjectMapper objectMapper = new ObjectMapper();
		JsonGenerator jsonGenerator = objectMapper.getJsonFactory().createJsonGenerator(resp.getWriter());
		jsonGenerator.writeObject(al);
		jsonGenerator.flush();
		jsonGenerator.close();
	}
}

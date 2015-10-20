package com.code.servlet;

import com.code.bean.DisasterBean;
import com.code.bean.DrugBean;
import com.code.service.DrugService;
import com.code.service.imp.DrugServiceImp;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

public class AddDrugServlet extends HttpServlet{
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
		int type = Integer.parseInt(req.getParameter("type"));
		int disaster = Integer.parseInt(req.getParameter("disaster"));
		String tree = req.getParameter("tree");
		
		DrugBean db = new DrugBean();//药剂对象
		DisasterBean dis = new DisasterBean();//灾害父类对像
		db.setName(name);
		db.setTree(tree);
		if(type == 1){
			db.setType("虫害");
			dis.setId(disaster);
			db.setDisBean(dis);
		}
		else if(type == 2){
			db.setType("病害");
			dis.setId(disaster);
			db.setDisBean(dis);
		}
		else if(type == 3){
			db.setType("鼠害");
			dis.setId(disaster);
			db.setDisBean(dis);
		}
		
			DrugService ds = new DrugServiceImp();
			ds.addDrug(db);

			resp.sendRedirect("drug.av?pageNow=1");
			
		
	}
}

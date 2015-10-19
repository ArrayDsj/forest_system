package com.code.servlet;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.code.bean.ProficientBean;
import com.code.service.ProficientService;
import com.code.service.imp.ProficientServicImp;
import com.jspsmart.upload.File;
import com.jspsmart.upload.SmartUpload;
import com.jspsmart.upload.SmartUploadException;

public class ProficientAddServlet extends HttpServlet {
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		SmartUpload upload = new SmartUpload();
		//初始化
		upload.initialize(this.getServletConfig(), req, resp);
		upload.setAllowedFilesList("gif,jpg,JPG");
		
		try {
			upload.setDeniedFilesList("jsp,asp,php,aspx,html,htm");
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		//文件最大限制
		upload.setMaxFileSize(1024000);
		upload.setTotalMaxFileSize(5000000);
		
		//得到数据
		ProficientBean pro = new ProficientBean();
		pro.setName(new String(upload.getRequest().getParameter("name").getBytes(),"UTF-8"));
		pro.setBirthday(new String(upload.getRequest().getParameter("birthday").getBytes(),"UTF-8"));
		pro.setGender(new String(upload.getRequest().getParameter("gender").getBytes(),"UTF-8"));
		pro.setAddress(new String(upload.getRequest().getParameter("address").getBytes(),"UTF-8"));
		pro.setDegree(new String(upload.getRequest().getParameter("degree").getBytes(),"UTF-8"));
		pro.setEmail(new String(upload.getRequest().getParameter("email").getBytes(),"UTF-8"));
		pro.setSpeciality(new String(upload.getRequest().getParameter("specialty").getBytes(),"UTF-8"));
		pro.setPhoneNumber(new String(upload.getRequest().getParameter("phone").getBytes(),"UTF-8"));
		pro.setWorkUnit(new String(upload.getRequest().getParameter("workUnit").getBytes(),"UTF-8"));
		
		
		ProficientService proService = new ProficientServicImp();
		
		for(int i = 0 ;i<upload.getFiles().getCount();i++){
			File file = upload.getFiles().getFile(i);
			if(file.isMissing()) continue;
			String filename = (int)(Math.random()*100)+""+pro.getBirthday()+"." + file.getFileExt();
			pro.setPhoto(filename);
			
			try {
				file.saveAs("/upload/"+filename);
			} catch (SmartUploadException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		
		//这里将包装好的pro传到业务层进行数据存放！
		
		
		System.out.println(pro.getName());
		System.out.println(pro.getAddress());
		System.out.println(pro.getBirthday());
		System.out.println(pro.getDegree());
		System.out.println(pro.getEmail());
		System.out.println(pro.getPhoneNumber());
		System.out.println(pro.getPhoto());
		System.out.println(pro.getSpeciality());
		System.out.println(pro.getWorkUnit());
	}
	
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		this.doGet(req, resp);
	}
	

}

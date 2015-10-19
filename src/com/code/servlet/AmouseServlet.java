package com.code.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.code.bean.AmouseBean;
import com.code.service.imp.AmouseServiceImp;
import com.jspsmart.upload.SmartUpload;
import com.jspsmart.upload.SmartUploadException;

public class AmouseServlet extends HttpServlet {

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
		SmartUpload su = new SmartUpload();
		//初始化上传(必须)
		su.initialize(this.getServletConfig(), req, resp);
		//定义允许上传文件类型      
		//su.setAllowedFilesList("gif,jpg,rar,zip,doc,txt");   
		//不允许上传文件类型     
		//su.setDeniedFilesList("jsp,asp,php,aspx,html,htm");
		//单个文件最大限制字节数(-1代表不限制)     
		//su.setMaxFileSize(1024000);
		//总共上传文件限制     
		//su.setTotalMaxFileSize(5000000); 
		
		try {
			//上传
			su.upload();
		} catch (SmartUploadException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		AmouseServiceImp asl = new AmouseServiceImp();
		//得到图片
		String filename1 = ""; 
		//得到名称
		String name = new String(su.getRequest().getParameter("name").getBytes(),"UTF-8");
		//得到食物
		String food = new String( su.getRequest().getParameter("food").getBytes(),"UTF-8");
		//得到繁殖
		String breed = new String( su.getRequest().getParameter("breed").getBytes(),"UTF-8");
		//得到天敌
		String enemy = new String( su.getRequest().getParameter("enemy").getBytes(),"UTF-8");
		//得到防治措施
		String action =new String( su.getRequest().getParameter("action").getBytes(),"UTF-8");
		//得到主要危害
		String harm = new String( su.getRequest().getParameter("harm").getBytes(),"UTF-8");
		AmouseBean as = new AmouseBean(name, food, breed, enemy, action, harm);
		int id = 0;
		id = asl.addAmouse(as);
		if(id != 0){
			for(int i = 0; i < su.getFiles().getCount();i++){
				//创建一个com.jspsmart.upload.File包里的File方法，   把上传文件放在一起，在getFile的第几个
				com.jspsmart.upload.File file = su.getFiles().getFile(i);    
				if (file.isMissing()) continue;    	
				//定义上传后另存为的文件名     
				 filename1 =id + "_" + i + "."+ file.getFileExt();
				 System.out.println(filename1);
				//文件另存为
				try {
					//把上传的文件，放入这个文件夹upload
					file.saveAs("/upload1/"+filename1);
					asl.updateById(id, filename1);
				} catch (SmartUploadException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			}
			
			//设置换一个隐藏属性    showPage是名字，empManage是参数  修改他跳转的页面
			req.setAttribute("showPage", "empManage");
			//重定项           跳转到index.jsp这个页面
			req.getRequestDispatcher("jsp/datamanagement/mousePanel.jsp").forward(req, resp);
		}
	
	}
	
}

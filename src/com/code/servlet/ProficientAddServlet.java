package com.code.servlet;

import com.code.bean.ProficientBean;
import com.code.service.ProficientService;
import com.code.service.imp.ProficientServicImp;
import com.jspsmart.upload.File;
import com.jspsmart.upload.SmartUpload;
import com.jspsmart.upload.SmartUploadException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.SQLException;

public class ProficientAddServlet extends HttpServlet {
	
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
        ProficientService proService = new ProficientServicImp();
        String photoPath = "";
        for (int i = 0; i < upload.getFiles().getCount(); i++) {
            File file = upload.getFiles().getFile(i);
            if (file.isMissing()) continue;
            String filename = (int) (Math.random() * 100) + "" + pro.getBirthday() + "." + file.getFileExt();
            pro.setPhoto(filename);

            try {
                file.saveAs("/upload/" + filename);
                photoPath += "/upload/" + filename;
            } catch (SmartUploadException e) {
                // TODO Auto-generated catch block
                e.printStackTrace();
            }
        }
        pro.setPhoto(photoPath);
        pro.setName(upload.getRequest().getParameter("name"));
        pro.setBirthday(upload.getRequest().getParameter("birthday"));
        pro.setGender(upload.getRequest().getParameter("gender"));
        pro.setAddress(upload.getRequest().getParameter("address"));
        pro.setDegree(upload.getRequest().getParameter("degree"));
        pro.setEmail(upload.getRequest().getParameter("email"));
        pro.setSpeciality(upload.getRequest().getParameter("specialty"));
        pro.setPhoneNumber(upload.getRequest().getParameter("phone"));
        pro.setWorkUnit(upload.getRequest().getParameter("workUnit"));
        proService.addProficient(pro);
    }
}

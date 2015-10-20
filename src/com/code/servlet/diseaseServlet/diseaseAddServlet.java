package com.code.servlet.diseaseServlet;

import com.code.bean.DiseaseBean;
import com.code.service.DiseaseService;
import com.code.service.imp.DiseaseServiceImp;
import com.jspsmart.upload.SmartUpload;
import com.jspsmart.upload.SmartUploadException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.net.URLDecoder;

/**
 * Created by CodeA on 2015/10/20.
 */
public class diseaseAddServlet extends HttpServlet{
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        this.doPost(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        System.out.println("diseaseAddServlet.java:success");

        SmartUpload su = new SmartUpload();
        //初始化上传(必须)
        su.initialize(this.getServletConfig(), req, resp);
        //定义允许上传文件类型
        su.setAllowedFilesList("gif,jpg,JPG,png");
        //不允许上传文件类型
        //su.setDeniedFilesList("jsp,asp,php,aspx,html.htm");
        //单个文件最大限制(-1代表不限制)
        //su.setMaxFileSize(1024000);
        //总共上传文件限制
        //su.setTotalMaxFileSize(5000000);
        try {
            su.upload();
        } catch (SmartUploadException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }
        String filename = null;
        for (int i = 0; i < su.getFiles().getCount(); i++) {
            com.jspsmart.upload.File file = su.getFiles().getFile(i);
            if (file.isMissing()) continue;
            //定义上传后另存为的文件名
            filename = Math.random() * 100 + "." + file.getFileExt();
            //文件另存为
            try {
                file.saveAs("/upload/images/disease/" + filename);
            } catch (SmartUploadException e) {
                // TODO Auto-generated catch block
                e.printStackTrace();
            }
        }
        //    //添加数据
        DiseaseBean diseaseBean = new DiseaseBean();
        String name = URLDecoder.decode(su.getRequest().getParameter("name"), "utf-8");
        diseaseBean.setName(name);
        diseaseBean.setPicture(filename);

        String symptoms = URLDecoder.decode(su.getRequest().getParameter("symptoms"), "utf-8");
        diseaseBean.setSymptoms(symptoms);
        String mainharm = URLDecoder.decode(su.getRequest().getParameter("mainharm"), "utf-8");
        diseaseBean.setMainharm(mainharm);
        String source = URLDecoder.decode(su.getRequest().getParameter("source"), "utf-8");
        diseaseBean.setSource(source);
        String regularity = URLDecoder.decode(su.getRequest().getParameter("regularity"), "utf-8");
        diseaseBean.setRegularity(regularity);
        String control = URLDecoder.decode(su.getRequest().getParameter("control"), "utf-8");
        diseaseBean.setControl(control);

        //写数据库
        DiseaseService diseaseService = new DiseaseServiceImp();
        diseaseService.addDisease(diseaseBean);
    }
}

package com.code.servlet.mouseServlet;

import com.code.bean.MouseBean;
import com.code.service.MouseService;
import com.code.service.imp.MouseServiceImp;
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
public class mouseAddServlet extends HttpServlet{
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        this.doPost(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        System.out.println("mouseAdd.java:success");

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
                file.saveAs("/upload/images/mouse/" + filename);
            } catch (SmartUploadException e) {
                // TODO Auto-generated catch block
                e.printStackTrace();
            }
        }
        //    //添加数据
        MouseBean mouseBean = new MouseBean();
        String name = URLDecoder.decode(su.getRequest().getParameter("name"), "utf-8");
        mouseBean.setName(name);
        mouseBean.setPhoto(filename);

        String breed = URLDecoder.decode(su.getRequest().getParameter("breed"), "utf-8");
        mouseBean.setBreed(breed);

        String action = URLDecoder.decode(su.getRequest().getParameter("action"), "utf-8");
        mouseBean.setControlMeasures(action);

        String enemy = URLDecoder.decode(su.getRequest().getParameter("enemy"), "utf-8");
        mouseBean.setEnemy(enemy);

        String harm = URLDecoder.decode(su.getRequest().getParameter("harm"), "utf-8");
        mouseBean.setMainHarm(harm);

        String food = URLDecoder.decode(su.getRequest().getParameter("food"), "utf-8");
        mouseBean.setFood(food);


        //写数据库
        MouseService mouseService = new MouseServiceImp();
        mouseService.addMouses(mouseBean);
    }
}

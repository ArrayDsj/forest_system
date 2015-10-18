package com.code.servlet.thingservlet;

import com.code.bean.*;
import com.code.dao.AreaDAO;
import com.code.dao.ThingDAO;
import com.code.dao.imp.AreaDAOImp;
import com.code.dao.imp.ThingDAOImp;
import com.code.service.DisasterService;
import com.code.service.FindwayService;
import com.code.service.StageService;
import com.code.service.ThingService;
import com.code.service.imp.DisasterServiceImp;
import com.code.service.imp.FindwayServiceImp;
import com.code.service.imp.StageServiceImp;
import com.code.service.imp.ThingServiceImp;
import com.jspsmart.upload.SmartUpload;
import com.jspsmart.upload.SmartUploadException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;


/**
 * Created by CodeA on 2015/10/15.
 */
public class thingAdd extends HttpServlet{
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        doPost(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        System.out.println("thingAdd.java:success");
        String time = req.getParameter("time");
        System.out.println(time);


        /***********************************************/
        // 在thingUpdate.jsp中点击确认修改按钮被调用
        if(req.getParameter("header").equals("confirmUpdate")){
            int thingID = Integer.parseInt(req.getParameter("thingID"));
            int stageID = Integer.parseInt(req.getParameter("stageDataHidden"));
            String scheme = req.getParameter("scheme");

            ThingBean thingBean = new ThingBean();
            thingBean.setId(thingID);
            StageBean stageBean = new StageBean();
            stageBean.setId(stageID);
            thingBean.setStage(stageBean);
            thingBean.setScheme(scheme);
            ThingService thingService = new ThingServiceImp();

            PrintWriter out = resp.getWriter();
            if( thingService.updateThing(thingBean)){
                out.print("{'msg':'success'}");
            } else out.print("{'msg':'defeat'}");
            out.flush();
            out.close();

        }


        /***********************************************/
        //在thingPanel.jsp中点击申请专家会审时调用
        //就是调用updateThing()方法
        else if(req.getParameter("header").equals("askConfer")){
            int thingID = Integer.parseInt(req.getParameter("thingID"));
            ThingBean thingBean = new ThingBean();
            thingBean.setId(thingID);
            ThingService thingService = new ThingServiceImp();
            //resp.setContentType("text/javascript");
            PrintWriter out = resp.getWriter();
            if (thingService.updateThing(thingBean)) {
                out.print("{'msg':'success'}");
            } else out.print("{'msg':'defeat'}");
            out.flush();
            out.close();
        }


        /***********************************************/
        //在thingPanel.jsp中点击添加事件的时候调用
        else if( req.getParameter("header").equals("askAddThing")){
            //初始化
            //得到下拉列表数据
            //1. 灾情阶段数据
            ArrayList<StageBean> stageData = null;
            StageService stageService = new StageServiceImp();
            stageData = stageService.getAllStages();
            //System.out.println(stageData);
            req.setAttribute("stageData", stageData);

            //2. 灾害类型数据
            ArrayList<DisasterBean> disasterData = null;
            DisasterService disasterService = new DisasterServiceImp();
            disasterData = disasterService.getAllDisasterBean();
            //System.out.println(disasterData);
            req.setAttribute("disasterData", disasterData);

            //3. 发现途径数据
            ArrayList<FindwayBean> findwayData = null;
            FindwayService findwayService = new FindwayServiceImp();
            findwayData = findwayService.getAllFindways();
            //System.out.println(findwayData);
            req.setAttribute("findwayData", findwayData);

            //4. 地区数据
            ArrayList<AreaBean> areaData = null;
            AreaDAO areaDAO = new AreaDAOImp();
            areaData = areaDAO.getAllAreas();
            System.out.println(areaData);

            req.setAttribute("areaData", areaData);
            //下拉列表数据转发给thingAdd.jsp
            req.getRequestDispatcher("jsp/disastercontrol/thingAdd.jsp").forward(req, resp);
        }

        /***********************************************/
        //在thingAdd.jsp中点击确认添加按钮时调用
        else if(req.getParameter("header").equals("confirmAdd")){
            SmartUpload su = new SmartUpload();
            //初始化上传(必须)
            su.initialize(this.getServletConfig(), req, resp);
            //定义允许上传文件类型
            su.setAllowedFilesList("gif,jpg,JPG");
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

            //添加数据
            ThingBean thingBean = new ThingBean();
            String name = su.getRequest().getParameter("name");
            thingBean.setName(name);

            //添加时间
            String foundDay = su.getRequest().getParameter("foundDay");
            //字符串转Date
            SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");//小写的mm表示的是分钟
            Date date = new Date();
            try {
                date = sdf.parse(foundDay);
            } catch (ParseException e) {
                e.printStackTrace();
            }
            thingBean.setFoundDay(date);

            /*************************************************************/
            //上传后保存在数据库中的路径
            String inputImgPath = "";
            String filename = null;
            //文件上传
            for (int i = 0; i < su.getFiles().getCount(); i++) {
                com.jspsmart.upload.SmartFile file = su.getFiles().getFile(i);
                if (file.isMissing()) continue;
                //定义上传后另存为的文件名
                filename = i + "." + file.getFileExt();
                //文件另存为
                try {
                    file.saveAs("/upload/" + filename);
                    filename +="&";
                } catch (SmartUploadException e) {
                    // TODO Auto-generated catch block
                    e.printStackTrace();
                }
            }
            inputImgPath = "/upload/" + filename;
            thingBean.setPhotoPath(inputImgPath);

            /*************************************************************/

            String descript = su.getRequest().getParameter("descript");
            thingBean.setDescription(descript);
            String loss = su.getRequest().getParameter("loss");
            thingBean.setLoss(loss);
            String proportion = su.getRequest().getParameter("proportion");
            thingBean.setProportion(proportion);
            String scheme = su.getRequest().getParameter("scheme");
            thingBean.setScheme(scheme);

            int stageID = Integer.parseInt(su.getRequest().getParameter("stageDataHidden"));
            StageBean stageBean = new StageBean();
            stageBean.setId(stageID);

            //转换
            String str = su.getRequest().getParameter("areaDataHidden");
            String[] strArr = str.split("&");
            str = strArr[0];
            int areaDataID = Integer.parseInt(str);

            AreaBean areaBean = new AreaBean();
            areaBean.setId(areaDataID);
            int findwayDataID = Integer.parseInt(su.getRequest().getParameter("findwayDataHidden"));
            FindwayBean findwayBean = new FindwayBean();
            findwayBean.setId(findwayDataID);
            int disasterDataID = Integer.parseInt(su.getRequest().getParameter("disasterDataHidden"));
            DisasterBean disasterBean = new DisasterBean();
            disasterBean.setId(disasterDataID);
            thingBean.setStage(stageBean);
            thingBean.setAreaBean(areaBean);
            thingBean.setDisasterType(disasterBean);
            thingBean.setFindWay(findwayBean);
            //写数据库
            System.out.println("写数据库");
            ThingDAO thingDAO = new ThingDAOImp();
            thingDAO.addThing(thingBean);
        }
    }
}

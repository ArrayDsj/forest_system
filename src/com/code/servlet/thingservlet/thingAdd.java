package com.code.servlet.thingservlet;

import com.code.bean.*;
import com.code.dao.AreaDAO;
import com.code.dao.ThingDAO;
import com.code.dao.imp.AreaDAOImp;
import com.code.dao.imp.ThingDAOImp;
import com.code.service.DisasterService;
import com.code.service.FindwayService;
import com.code.service.StageService;
import com.code.service.imp.DisasterServiceImp;
import com.code.service.imp.FindwayServiceImp;
import com.code.service.imp.StageServiceImp;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
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
        if(time != null){
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
        else{
            //添加数据
            ThingBean thingBean = new ThingBean();

            String name = req.getParameter("name");
            thingBean.setName(name);

            String foundDay = req.getParameter("foundDay");
            SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");//小写的mm表示的是分钟
            Date date = null;
            try {
                date = sdf.parse(foundDay);
            } catch (ParseException e) {
                e.printStackTrace();
            }
            thingBean.setFoundDay(date);

            String inputImg = req.getParameter("inputImg");

            String descript = req.getParameter("descript");
            thingBean.setDescription(descript);
            String loss = req.getParameter("loss");
            thingBean.setLoss(loss);
            String proportion = req.getParameter("proportion");
            thingBean.setProportion(proportion);
            String scheme = req.getParameter("scheme");
            thingBean.setScheme(scheme);

            int stageID = Integer.parseInt(req.getParameter("stageDataHidden"));
            StageBean stageBean = new StageBean();
            stageBean.setId(stageID);

            //转换
            String str = req.getParameter("areaDataHidden");
            String[] strArr = str.split("&");
            str = strArr[0];
            int areaDataID = Integer.parseInt(str);

            AreaBean areaBean = new AreaBean();
            areaBean.setId(areaDataID);
            int findwayDataID = Integer.parseInt(req.getParameter("findwayDataHidden"));
            FindwayBean findwayBean = new FindwayBean();
            findwayBean.setId(findwayDataID);
            int disasterDataID = Integer.parseInt(req.getParameter("disasterDataHidden"));
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

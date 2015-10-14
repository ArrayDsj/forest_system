package com.code.servlet.thingservlet;

import com.code.bean.AreaBean;
import com.code.bean.DisasterBean;
import com.code.bean.FindwayBean;
import com.code.bean.StageBean;
import com.code.dao.AreaDAO;
import com.code.dao.imp.AreaDAOImp;
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
import java.util.ArrayList;

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
}

package com.code.servlet.thingservlet;

import com.code.bean.*;
import com.code.dao.AreaDAO;
import com.code.dao.imp.AreaDAOImp;
import com.code.service.DisasterService;
import com.code.service.FindwayService;
import com.code.service.StageService;
import com.code.service.ThingService;
import com.code.service.imp.DisasterServiceImp;
import com.code.service.imp.FindwayServiceImp;
import com.code.service.imp.StageServiceImp;
import com.code.service.imp.ThingServiceImp;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
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
        System.out.println(req.getParameter("header"));
        /************************************************/
        //在thingPanel.jsp中点击添加事件的时候调用
        if ("askAddThing".equals(req.getParameter("header"))) {

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



        /***********************************************/
        // 在thingUpdate.jsp中点击确认修改按钮被调用
        else if("confirmUpdate".equals(req.getParameter("header"))){
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
        else if("askConfer".equals(req.getParameter("header"))){
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

    }
}

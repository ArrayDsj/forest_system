package com.code.servlet.thingservlet;

import com.code.bean.ConferBean;
import com.code.bean.StageBean;
import com.code.bean.ThingBean;
import com.code.service.ConferService;
import com.code.service.StageService;
import com.code.service.ThingService;
import com.code.service.imp.ConferServiceImpl;
import com.code.service.imp.StageServiceImp;
import com.code.service.imp.ThingServiceImp;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.ArrayList;

/**
 * Created by CodeA on 2015/10/16.
 */
public class thingShow extends HttpServlet{
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        this.doPost(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        System.out.println("thingShow.java:success");

        int id = Integer.parseInt(req.getParameter("thingID"));

        //查询数据库
        ThingService thingService = new ThingServiceImp();
        ThingBean thingBean = thingService.getThingById(id);
        req.setAttribute("thingBean", thingBean);

        if(req.getParameter("header").equals("updateThing")){
            //在thingPanel.jsp中点击修改信息时被调用
            //初始化
            //得到下拉列表数据
            //1. 灾情阶段数据
            ArrayList<StageBean> stageData = null;
            StageService stageService = new StageServiceImp();
            stageData = stageService.getAllStages();

            req.setAttribute("stageData", stageData);
            req.getRequestDispatcher("jsp/disastercontrol/thingUpdate.jsp").forward(req, resp);

        } else if(req.getParameter("header").equals("conferShow")){
            //初始化会商表
            ArrayList<ConferBean> allConfers = null;
            ConferService conferService = new ConferServiceImpl();
            //通过thing的id查找所有的会审记录
            allConfers = conferService.getConferById(id);
            if (allConfers != null) {
                req.setAttribute("allConfers", allConfers);
                req.setAttribute("info", "have");
            }else req.setAttribute("info", "null");
            req.getRequestDispatcher("jsp/expertconsultation/conferAdd.jsp").forward(req, resp);
        }
        else if(req.getParameter("header").equals("showThing")){
            req.getRequestDispatcher("jsp/disastercontrol/thingInfo.jsp").forward(req, resp);
        }
    }
}

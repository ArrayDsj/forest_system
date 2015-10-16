package com.code.servlet.thingservlet;

import com.code.bean.ThingBean;
import com.code.service.ThingService;
import com.code.service.imp.ThingServiceImp;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

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

        int id = Integer.parseInt(req.getParameter("id"));
        //查询数据库
        ThingService thingService = new ThingServiceImp();
        ThingBean thingBean = thingService.getThingById(id);
        req.setAttribute("thingBean",thingBean);
        req.getRequestDispatcher("jsp/disastercontrol/thingInfo.jsp").forward(req,resp);
    }
}

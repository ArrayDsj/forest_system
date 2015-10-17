package com.code.servlet.conferServlet;

import com.code.bean.ThingBean;
import com.code.service.ThingService;
import com.code.service.imp.ThingServiceImp;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.ArrayList;

/**
 * Created by CodeA on 2015/10/17.
 */
public class conferDataLoad extends HttpServlet{
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        System.out.println("conferDataLoad.java:success");
        // 数据引用
        ArrayList<ThingBean> allThings = null;
        //调用业务
        ThingService thingService = new ThingServiceImp();
        // 得到查询条件
        String query = "f_status";
        String str = "1";
        allThings = thingService.getLimitData(query, str, 1, 1);
        if (allThings != null) {
            req.setAttribute("allThings", allThings);
            req.setAttribute("info", "have");
        } else req.setAttribute("info", "null");
        req.getRequestDispatcher("jsp/expertconsultation/conferPanel.jsp").forward(req, resp);

    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        this.doPost(req, resp);
    }
}

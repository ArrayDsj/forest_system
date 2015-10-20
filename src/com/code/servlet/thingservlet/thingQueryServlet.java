package com.code.servlet.thingservlet;

import com.code.bean.ThingBean;
import com.code.service.ThingService;
import com.code.service.imp.ThingServiceImp;

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
 * Created by CodeA on 2015/10/19.
 */
public class thingQueryServlet extends HttpServlet{
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        this.doPost(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        System.out.println("thingTime.av:success");
        // 初始页
        int pageNow = 1;
        //记录总条数
        int counts = 0;
        //总页数
        int pageNum = 0;
        //分页大小
        int pageSize = 2;

        //得到当前页数
        pageNow = Integer.parseInt(req.getParameter("pageNow"));

        // 数据引用
        ArrayList<ThingBean> allThings = null;
        //调用业务
        ThingService thingService = new ThingServiceImp();
        // 得到查询条件
        String start = req.getParameter("start");
        String end = req.getParameter("end");
        SimpleDateFormat sdf  = new SimpleDateFormat("yyyy-MM-dd");//小写的mm表示的是分钟
        Date startTime = new Date();
        Date endTime = new Date();
        try {
            startTime = sdf.parse(start);
            endTime = sdf.parse(end);
        } catch (ParseException e) {
            e.printStackTrace();
        }

        allThings = thingService.getAreasByTime(startTime, endTime, pageNow, pageSize);
        counts = thingService.getCountsByTime(startTime, endTime);
        pageNum = (int) Math.ceil(counts / (pageSize * 1.0));
        req.setAttribute("allThings", allThings);
        req.setAttribute("pageNum", pageNum);
        req.setAttribute("pageNow", pageNow);
        req.getRequestDispatcher("jsp/disastercontrol/thingPanel.jsp").forward(req, resp);
    }
}

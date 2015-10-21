package com.code.servlet.thingservlet;

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
 * Created by CodeA on 2015/10/14.
 */
public class thingDataLoad extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        doPost(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setCharacterEncoding("UTF-8");
        System.out.println("thingDataLoad.java:success");
        ArrayList<ThingBean> allThings = null;
        //调用业务
        ThingService thingService = new ThingServiceImp();
        //1. 当前页
        int pageNow = 1;
        //2. 分页大小
        int pageSize = Integer.parseInt(this.getServletContext().getInitParameter("pageSize"));
        //3. 总页数
        int pageNum = 1;
        //4. 总记录数
        int counts = 0;
        //第一次加载
        pageNow = Integer.parseInt(req.getParameter("pageNow"));
        String query = req.getParameter("query");
        String str = req.getParameter("str");
        counts = thingService.getCountsByCondtion(query, str);
        System.out.println(counts);
        allThings = thingService.getLimitData(query, str, pageNow, pageSize);
        System.out.println(allThings.size());
        pageNum = (int) Math.ceil(counts / (pageSize * 1.0));

        req.setAttribute("pageNow", pageNow);
        req.setAttribute("pageNum", pageNum);
        req.setAttribute("allThings", allThings);

        //给panel设置
        req.setAttribute("query", query);
        req.setAttribute("str", str);

        req.getRequestDispatcher("jsp/disastercontrol/thingPanel.jsp").forward(req, resp);
    }
}

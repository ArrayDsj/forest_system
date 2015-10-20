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







        //// 初始页
        //int pageNow = 1;
        ////记录总条数
        //int counts = 0;
        ////总页数
        //int pageNum = 0;
        ////分页大小
        //int pageSize = 2;
        ////得到当前页数
        //pageNow = Integer.parseInt(req.getParameter("pageNow"));
        //// 数据引用
        //
        //// 得到查询条件
        //String query = req.getParameter("query");
        //
        ////1. 判断有无条件(无条件,初始化;有条件,按条件分页查询)
        //if (query == null) {
        //    //按无条件查询数据
        //    counts = thingService.getCounts();
        //    allThings = thingService.getInitData(pageNow, pageSize);
        //} else {
        //    //按条件查询
        //    String str = req.getParameter("str");
        //    str = new String(str.getBytes(), "UTF-8");
        //    counts = thingService.getCountsByCondtion(query, str);
        //    allThings = thingService.getLimitData(query, str, pageNow, pageSize);
        //}
        //
        //if (allThings != null) {
        //    //计算总页数
        //    pageNum = (int) Math.ceil(counts / (pageSize * 1.0));
        //    req.setAttribute("pageNum", pageNum);
        //    req.setAttribute("pageNow", pageNow);
        //    req.setAttribute("allThings", allThings);
        //} else req.setAttribute("info", "无数据");
        ////System.out.println(allThings.get(0));
        ////2. 跳转到areaPanel.jsp





        req.getRequestDispatcher("jsp/disastercontrol/thingPanel.jsp").forward(req, resp);
    }
}

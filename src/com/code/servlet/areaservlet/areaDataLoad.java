package com.code.servlet.areaservlet;

import com.code.bean.AreaBean;
import com.code.service.AreaService;
import com.code.service.imp.AreaServiceImp;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.ArrayList;

/**
 * Created by CodeA on 2015/10/12.
 * 每次点击index.jsp中的areaPanel将调用此servlet
 * 负责初始化数据
 */
public class areaDataLoad extends HttpServlet{
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        doPost(req,resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setCharacterEncoding("UTF-8");
        System.out.println("areaDataLoad.java:success");
        AreaService areaService = new AreaServiceImp();
        ArrayList<AreaBean> allAreas = null;
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
        counts = areaService.getCountsByCondition(query, str);
        System.out.println(counts);
        allAreas = areaService.getLimitData(query, str, pageNow, pageSize);
        System.out.println(allAreas.size());
        pageNum = (int) Math.ceil(counts / (pageSize * 1.0));
        req.setAttribute("pageNow", pageNow);
        req.setAttribute("pageNum", pageNum);
        req.setAttribute("allAreas", allAreas);
        //给panel设置
        req.setAttribute("query", query);
        req.setAttribute("str", str);
        req.getRequestDispatcher("jsp/disastercontrol/areaPanel.jsp").forward(req, resp);


        //// 初始页
        //int pageNow = 1;
        ////得到当前页数
        //pageNow = Integer.parseInt(req.getParameter("pageNow"));
        ////记录总条数
        //int counts = 0;
        ////总页数
        //int pageNum = 0;
        ////分页大小
        //int pageSize = 2;
        //// 数据
        //ArrayList<AreaBean> allAreas = null;
        //
        //// 得到查询条件
        //String query = req.getParameter("query");
        //System.out.println(query);
        //1. 判断有无条件(无条件,初始化;有条件,按条件分页查询)
        //if(query == null){
        //    //按无条件查询数据
        //    counts = areaService.getCounts();
        //    allAreas = areaService.getInitData(pageNow, pageSize);
        //    pageNum = (int) Math.ceil(counts / (pageSize * 1.0));
        //    req.setAttribute("allAreas", allAreas);
        //    req.setAttribute("pageNum", pageNum);
        //    req.setAttribute("pageNow", pageNow);
        //    req.setAttribute("query", "");
        //    req.setAttribute("str", "");
        //    req.setAttribute("queryText","区域名称");
        //    req.setAttribute("queryValue","f_name");
        //    req.setAttribute("option","noQuery");
        //    req.getRequestDispatcher("jsp/disastercontrol/areaPanel.jsp").forward(req, resp);
        //}
        //else if(query.equals("noQuery")){ //无条件分页按钮调用
        //    counts = areaService.getCounts();
        //    allAreas = areaService.getInitData(pageNow, pageSize);
        //    pageNum = (int) Math.ceil(counts / (pageSize * 1.0));
        //    req.setAttribute("allAreas", allAreas);
        //    req.setAttribute("pageNum", pageNum);
        //    req.setAttribute("pageNow", pageNow);
        //    req.setAttribute("queryText", "区域名称");
        //    req.setAttribute("queryValue", "f_name");
        //    req.setAttribute("option", "noQuery");
        //
        //    req.getRequestDispatcher("jsp/disastercontrol/areaPanel.jsp").forward(req, resp);
        //}
        //else {//有条件分页按钮调用
        //    //按条件查询
        //    String str = req.getParameter("str");
        //    str = new String(str.getBytes(),"UTF-8");
        //    System.out.println(str);
        //    counts = areaService.getCountsByCondition(query, str);
        //    //有条件查询
        //    allAreas = areaService.getLimitData(query, str, pageNow,pageSize);
        //    pageNum = (int) Math.ceil(counts / (pageSize * 1.0));
        //    req.setAttribute("allAreas", allAreas);
        //    req.setAttribute("pageNum", pageNum);
        //    req.setAttribute("pageNow", pageNow);
        //    req.setAttribute("query", query);
        //    req.setAttribute("str", str);
        //    req.setAttribute("option", "haveQuery");
        //    req.setAttribute("queryText", req.getParameter("queryText"));
        //    req.setAttribute("queryValue", req.getParameter("queryValue"));
        //    req.getRequestDispatcher("jsp/disastercontrol/areaPanel.jsp").forward(req, resp);
        //}

    }
}

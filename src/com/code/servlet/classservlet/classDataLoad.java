package com.code.servlet.classservlet;

import com.code.bean.ClassBean;
import com.code.dao.imp.AreaDAOImp;
import com.code.service.ClassService;
import com.code.service.imp.ClassServiceImp;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.ArrayList;

/**
 * Created by CodeA on 2015/10/13.
 */
public class classDataLoad extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        doPost(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        System.out.println("classDataLoad.java:success");
        req.setCharacterEncoding("UTF-8");
        //分页条件
        ClassService classService = new ClassServiceImp();
        ArrayList<ClassBean> allClasses = null;
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
        counts = classService.getCountsByCondition(query, str);
        System.out.println(counts);
        allClasses = classService.getLimitData(query, str, pageNow, pageSize);
        System.out.println(allClasses.size());
        pageNum = (int) Math.ceil(counts / (pageSize * 1.0));
        req.setAttribute("pageNow", pageNow);
        req.setAttribute("pageNum", pageNum);
        req.setAttribute("allClasses", allClasses);
        //给panel设置
        req.setAttribute("query", query);
        req.setAttribute("str", str);




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
        //ArrayList<ClassBean> allClasses = null;
        //// 得到查询条件
        //String query = req.getParameter("query");
        //String option = req.getParameter("option");
        ////1. 判断有无条件(无条件,初始化;有条件,按条件分页查询)
        ////if (query == null) {
        //if ("init".equals(req.getParameter("option")) || "noQuery".equals(req.getParameter("option")) ){
        //    //按无条件查询数据
        //    counts = classService.getCounts();
        //    allClasses = classService.getInitData(pageNow, 2);
        //    req.getSession().setAttribute("option","noQuery");
        //
        //} else {
        //    //有条件查询
        //    String str = req.getParameter("str");
        //    str = new String(str.getBytes(), "UTF-8");
        //    counts = classService.getCountsByCondition(query, str);
        //    allClasses = classService.getLimitData(query, str, pageNow, pageSize);
        //    req.getSession().setAttribute("option", "haveQuery");
        //    req.getSession().setAttribute("query", query);
        //    req.getSession().setAttribute("str", str);
        //    resp.getWriter().print("{'query':'"+query+"','str':'"+str+"'}");
        //    //req.setAttribute("query",query);
        //    //req.setAttribute("str",str);
        //}
        //if (allClasses != null) {
        //    //计算总页数
        //    pageNum = (int) Math.ceil(counts / (pageSize * 1.0));
        //    req.setAttribute("allClasses", allClasses);
        //} else req.setAttribute("info", "null");
        //req.setAttribute("pageNum", pageNum);
        //req.setAttribute("pageNow", pageNow);
        /**
         * 得到没有班级管理的地区的数量
         */
        int countsNoClass = new AreaDAOImp().getAreasByClass().size();
        req.setAttribute("countsNoClass", countsNoClass);
        req.getRequestDispatcher("jsp/disastercontrol/classPanel.jsp").forward(req, resp);
    }
}

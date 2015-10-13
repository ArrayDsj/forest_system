package com.code.servlet.classservlet;

import com.code.bean.ClassBean;
import com.code.dao.ClassDAO;
import com.code.dao.imp.ClassDAOImp;
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
public class classDataLoad extends HttpServlet{
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
        // 初始页
        int pageNow = 1;
        //得到当前页数
        pageNow = Integer.parseInt(req.getParameter("pageNow"));
        //记录总条数
        int counts = 0;
        //总页数
        int pageNum = 0;
        //分页大小
        int pageSize = 2;
        // 数据
        ArrayList<ClassBean> allClasses = null;

        // 得到查询条件
        String query = req.getParameter("query");
        //1. 判断有无条件(无条件,初始化;有条件,按条件分页查询)
        if (query == null) {
            //按无条件查询数据
            allClasses = classService.getInitData(pageNow, pageSize);

        } else {

            //有条件查询
            String str = req.getParameter("str");
            str = new String(str.getBytes(), "UTF-8");
            allClasses = classService.getLimitData(query, str, pageNow, pageSize);
        }

        if (allClasses != null) {
            //counts = allClasses.get(allClasses.size() - 1).getId();

            ClassDAO classDAO = new ClassDAOImp();
            //1. 得到总记录数
            counts = classDAO.getCounts();
            //计算总页数
            pageNum = (int) Math.ceil(counts / (pageSize * 1.0));
            req.setAttribute("pageNum", pageNum);
            req.setAttribute("pageNow", pageNow);
            req.setAttribute("allClasses", allClasses);
        } else req.setAttribute("info", "无数据");
        //2. 跳转到classPanel.jsp
        req.getRequestDispatcher("jsp/disastercontrol/classPanel.jsp").forward(req, resp);
    }
}
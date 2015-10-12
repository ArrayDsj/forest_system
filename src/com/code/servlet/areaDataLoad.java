package com.code.servlet;

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
 */
public class areaDataLoad extends HttpServlet{
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        doPost(req,resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        System.out.println("areaDataLoad.java:success");

        // 得到查询条件
        String query = req.getParameter("query");
        System.out.println(query);
        //1. 得到初始化数据
        AreaService areaService = new AreaServiceImp();
        // 初始页
        int pageNow = 1;
        // 数据
        ArrayList<AreaBean> all = null;
        if(query ==null){
            //按无条件查询数据
            all = areaService.getInitData();
            req.setAttribute("allAreas", all);
        }else{
            //有条件查询
            String str = req.getParameter("str");
            all = areaService.getLimitData(query,str,pageNow);
            if(all == null){
                req.setAttribute("info","无数据");
            }
            req.setAttribute("allAreas",all);
        }
        //2. 跳转到areaPanel.jsp
        req.getRequestDispatcher("jsp/disastercontrol/areaPanel.jsp").forward(req, resp);
    }
}

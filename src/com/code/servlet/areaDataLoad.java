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
        AreaService areaService = new AreaServiceImp();
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
        System.out.println(pageNow);
        // 数据
        ArrayList<AreaBean> all = null;

        // 得到查询条件
        String query = req.getParameter("query");
        System.out.println(query);
        //1. 判断有无条件(无条件,初始化;有条件,按条件分页查询)
        if(query ==null){
            //按无条件查询数据
            all = areaService.getInitData(pageNow,pageSize);
            if(all != null){
                counts = all.get(all.size()-1).getId();
                //计算总页数
                pageNum = (int)Math.ceil(counts / (pageSize * 1.0));
                req.setAttribute("pageNum",pageNum);
                req.setAttribute("pageNow",pageNow);
                req.setAttribute("allAreas", all);

            }else
                req.setAttribute("info", "无数据");
        }else{
            //有条件查询
            String str = req.getParameter("str");
            all = areaService.getLimitData(query, str, pageNow);
            if (all != null) {
                counts = all.get(all.size() - 1).getId();
                req.setAttribute("allAreas", all);
            }else
                req.setAttribute("info", "无数据");
        }
        //2. 跳转到areaPanel.jsp
        req.getRequestDispatcher("jsp/disastercontrol/areaPanel.jsp").forward(req, resp);
    }
}

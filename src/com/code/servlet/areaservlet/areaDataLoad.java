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
        // 初始页
        int pageNow = 1;
        //得到当前页数
        pageNow = Integer.parseInt(req.getParameter("pageNow"));
        //记录总条数
        int counts = 0;
        //总页数
        int pageNum = 0;
        //分页大小
        int pageSize = 1;
        // 数据
        ArrayList<AreaBean> allAreas = null;

        // 得到查询条件
        String query = req.getParameter("query");

        //1. 判断有无条件(无条件,初始化;有条件,按条件分页查询)
        if(query == null){
            //按无条件查询数据
            allAreas = areaService.getInitData(pageNow,pageSize);
        }else{
            //按条件查询
            String str = req.getParameter("str");
            str = new String(str.getBytes(),"UTF-8");
            //有条件查询
            allAreas = areaService.getLimitData(query, str, pageNow,pageSize);
        }

        if (allAreas != null) {
            counts = allAreas.get(allAreas.size() - 1).getId();
            //计算总页数
            pageNum = (int) Math.ceil(counts / (pageSize * 1.0));
            req.setAttribute("pageNum", pageNum);
            req.setAttribute("pageNow", pageNow);
            req.setAttribute("allAreas", allAreas);
        } else req.setAttribute("info", "无数据");
        System.out.println(allAreas.get(0));
        //2. 跳转到areaPanel.jsp
        req.getRequestDispatcher("jsp/disastercontrol/areaPanel.jsp").forward(req, resp);
    }
}

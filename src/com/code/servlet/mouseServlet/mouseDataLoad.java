package com.code.servlet.mouseServlet;

import com.code.bean.MouseBean;
import com.code.service.MouseService;
import com.code.service.imp.MouseServiceImp;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.ArrayList;

/**
 * Created by CodeA on 2015/10/18.
 */
public class mouseDataLoad extends HttpServlet{
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        this.doPost(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        System.out.println("mouseDataLoad.java:success");
        MouseService mouseService = new MouseServiceImp();
        ArrayList<MouseBean> allMouses = null;
        //1. 当前页
        int pageNow = Integer.parseInt(req.getParameter("pageNow"));
        //2. 分页大小
        int pageSize = Integer.parseInt(this.getServletContext().getInitParameter("pageSize"));
        //3. 总页数
        int pageNum = 1;
        //4. 总记录数
        int counts = 0;

        //5. 初始化
        String option = req.getParameter("option");
        if ("init".equals(option)) {
            System.out.println("init");
            //读取数据库
            counts = mouseService.getCounts();
            if (counts != 0) {
                allMouses = mouseService.getAllMouses(pageNow, pageSize);
                pageNum = (int) Math.ceil(counts / (pageSize * 1.0));
            } else req.setAttribute("status", 0);
        }

        req.setAttribute("pageNow", pageNow);
        req.setAttribute("pageNum", pageNum);
        req.setAttribute("allMouses", allMouses);

        req.getRequestDispatcher("jsp/datamanagement/mousePanel.jsp").forward(req,resp);
    }
}

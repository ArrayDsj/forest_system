package com.code.servlet;

import com.code.bean.AmouseBean;
import com.code.dao.imp.AmouseDaoimp;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.ArrayList;

/**
 * Created by CodeA on 2015/10/20.
 */
public class MouseServletByQuery extends HttpServlet{
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        this.doPost(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        int pageNow = Integer.parseInt(req.getParameter("pageNow"));
        int pageSize = 2;
        String query = req.getParameter("query");
        ArrayList<AmouseBean> allMouses =  new AmouseDaoimp().getAmouseInfo(query, pageNow, pageSize);

        int counts = new AmouseDaoimp().Amouse(query);
        int pageNum = (int) Math.ceil(counts / (pageSize * 1.0));
        req.setAttribute("pageNum", pageNum);
        req.setAttribute("pageNow", pageNow);
        req.setAttribute("allMouses", allMouses);

        req.getRequestDispatcher("jsp/datamanagement/mousePanel.jsp").forward(req, resp);
    }
}

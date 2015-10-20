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
 * Created by CodeA on 2015/10/21.
 */
public class mouseByQuery extends HttpServlet{
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        this.doPost(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        int pageNow = Integer.parseInt(req.getParameter("pageNow"));
        String query = req.getParameter("query");
        int pageSize = Integer.parseInt(this.getServletContext().getInitParameter("pageSize"));
        MouseService mouseService = new MouseServiceImp();
        int counts = 0;
        counts = mouseService.getCountsByCondtion("", query);
        ArrayList<MouseBean> allMouses = null;
        int pageNum = 1;
        //4. 总记录数
        if(counts != 0){
            allMouses = mouseService.getAllMousesByCondtion("", query, pageNow, pageSize);
            pageNum = (int) Math.ceil(counts / (pageSize * 1.0));
        }
        req.setAttribute("pageNow", pageNow);
        req.setAttribute("pageNum", pageNum);
        req.setAttribute("allMouses", allMouses);

        req.setAttribute("query",query);
        req.getRequestDispatcher("jsp/datamanagement/mousePanel.jsp").forward(req, resp);

    }
}

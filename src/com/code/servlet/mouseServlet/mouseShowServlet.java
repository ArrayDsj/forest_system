package com.code.servlet.mouseServlet;

import com.code.bean.MouseBean;
import com.code.service.MouseService;
import com.code.service.imp.MouseServiceImp;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

/**
 * Created by CodeA on 2015/10/20.
 */
public class mouseShowServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        this.doPost(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        System.out.println("mouseShow.java:success");

        int            selectID    = Integer.parseInt(req.getParameter("selectID"));
        MouseService mouseService = new MouseServiceImp();
        MouseBean mouseBean = mouseService.getMouseBeanByID(selectID);
        req.setAttribute("mouseBean", mouseBean);
        req.getRequestDispatcher("jsp/datamanagement/mouseInfo.jsp").forward(req, resp);
    }
}
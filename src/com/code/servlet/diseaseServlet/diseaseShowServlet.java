package com.code.servlet.diseaseServlet;

import com.code.bean.DiseaseBean;
import com.code.service.DiseaseService;
import com.code.service.imp.DiseaseServiceImp;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

/**
 * Created by CodeA on 2015/10/20.
 */
public class diseaseShowServlet extends HttpServlet{
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        this.doPost(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        System.out.println("diseaseShowServlet.java:success");
        int selectID = Integer.parseInt(req.getParameter("selectID"));
        DiseaseService diseaseService = new DiseaseServiceImp();
        DiseaseBean diseaseBean = diseaseService.getDiseaseBeanByID(selectID);
        req.setAttribute("diseaseBean", diseaseBean);
        req.getRequestDispatcher("jsp/datamanagement/diseaseInfo.jsp").forward(req,resp);
    }
}

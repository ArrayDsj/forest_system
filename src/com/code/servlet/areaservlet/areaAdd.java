package com.code.servlet.areaservlet;

import com.code.bean.AreaBean;
import com.code.service.AreaService;
import com.code.service.imp.AreaServiceImp;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

/**
 * Created by CodeA on 2015/10/13.
 */
public class areaAdd extends HttpServlet{
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        doPost(req,resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String landType = req.getParameter("hidden");
        String forestType = req.getParameter("forestType");
        String name = req.getParameter("name");
        String treeType = req.getParameter("treeType");
        AreaBean areaAdd = new AreaBean(name, forestType, landType, treeType);

        AreaService areaService = new AreaServiceImp();

        if(areaService.addArea(areaAdd)){
            req.setAttribute("showPage","areaPanel");
            req.getRequestDispatcher("jsp/index.jsp").forward(req, resp);
        }
    }
}

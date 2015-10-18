package com.code.servlet.classservlet;

import com.code.bean.AreaBean;
import com.code.bean.ClassBean;
import com.code.service.AreaService;
import com.code.service.ClassService;
import com.code.service.imp.AreaServiceImp;
import com.code.service.imp.ClassServiceImp;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

/**
 * Created by CodeA on 2015/10/18.
 */
public class ClassShow extends HttpServlet{
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        this.doPost(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        System.out.println("ClassShow.java:success");

        int classID = Integer.parseInt(req.getParameter("classID"));
        ClassService classService = new ClassServiceImp();
        ClassBean classBean = new ClassBean();
        classBean.setId(classID);
        classBean = classService.showClass(classBean);
        req.setAttribute("classBean", classBean);
        AreaService areaService = new AreaServiceImp();

        AreaBean areaBean = areaService.getAreaById(classID);
        req.setAttribute("areaBean", areaBean);
        if(("showClass").equals(req.getParameter("header"))){
            req.getRequestDispatcher("jsp/disastercontrol/classShow.jsp").forward(req, resp);
        }else if(("updateClass").equals(req.getParameter("header"))) {
            req.getRequestDispatcher("jsp/disastercontrol/classUpdate.jsp").forward(req, resp);
        }
    }
}

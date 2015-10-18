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
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.Date;

/**
 * Created by CodeA on 2015/10/14.
 */
public class classAdd extends HttpServlet{
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        doPost(req,resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        System.out.println("classAdd.java:success");

        if("confirmAdd".equals(req.getParameter("option"))){
            //在classAdd中点击添加按钮时调用
            String name = req.getParameter("name");
            String phone = req.getParameter("phone");
            String manager = req.getParameter("manager");
            int number = Integer.parseInt(req.getParameter("number"));
            //areaID
            String area = req.getParameter("area");
            ClassBean classBean = new ClassBean(name, manager, phone, number,new Date(), area);
            ClassService classService = new ClassServiceImp();

            PrintWriter out = resp.getWriter();
            if (classService.addClass(classBean)) {
                out.print("{'msg':'success'}");
            } else out.print("{'msg':'defeat'}");
            out.flush();
            out.close();

        }
        else if("askAddClass".equals(req.getParameter("header"))) {//初始化下拉列表
            AreaService areaService = new AreaServiceImp();
            ArrayList<AreaBean> allSelects =  areaService.getAreas();
            req.setAttribute("allSelects", allSelects);
            req.getRequestDispatcher("jsp/disastercontrol/classAdd.jsp").forward(req, resp);
        }
        else if("confirmUpdate".equals(req.getParameter("header"))){
            int classID = Integer.parseInt(req.getParameter("classID"));
            String manager = req.getParameter("manager");
            String phone = req.getParameter("phone");
            ClassBean classBean = new ClassBean();
            classBean.setId(classID);
            classBean.setManager(manager);
            classBean.setPhone(phone);
            ClassService classService = new ClassServiceImp();

            PrintWriter out = resp.getWriter();
            if (classService.updateClass(classBean)) {
                out.print("{'msg':'success'}");
            } else out.print("{'msg':'defeat'}");
            out.flush();
            out.close();
        }
    }
}

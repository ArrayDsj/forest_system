package com.code.servlet.diseaseServlet;

import com.code.bean.DiseaseBean;
import com.code.service.DiseaseService;
import com.code.service.imp.DiseaseServiceImp;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.ArrayList;

/**
 * Created by CodeA on 2015/10/20.
 * 病害处理类  负责初始化数据和条件查询跳转数据处理
 */
public class diseaseDataLoad extends HttpServlet{
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        this.doPost(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        System.out.println("diseaseDataLoad.java:success");
        DiseaseService diseaseService = new DiseaseServiceImp();
        ArrayList<DiseaseBean> allDiseases = null;
        //1. 当前页
        int pageNow = 1;
        //2. 分页大小
        int pageSize = Integer.parseInt(this.getServletContext().getInitParameter("pageSize"));
        //3. 总页数
        int pageNum = 1;
        //4. 总记录数
        int counts = 0;

        ////5. 初始化
        //String option = req.getParameter("option");
        //if("init".equals(option)){
        //    System.out.println("init");
        //    //读取数据库
        //    counts = diseaseService.getCounts();
        //    if(counts != 0){
        //        allDiseases = diseaseService.getAllDiseases(pageNow, pageSize);
        //        pageNum = (int) Math.ceil(counts / (pageSize * 1.0));
        //    }else req.setAttribute("status", 0);
        //}
        //
        //else{//条件查询
        //    pageNow = Integer.parseInt(req.getParameter("pageNow"));
        //    counts = diseaseService.getCountsByCondtion(req.getParameter("query"), req.getParameter("str"));
        //    if(counts != 0){
        //        allDiseases = diseaseService.getAllDiseasesByCondtion(req.getParameter("query"), req.getParameter("str"),pageNow, pageSize);
        //        pageNum = (int) Math.ceil(counts / (pageSize * 1.0));
        //    }
        //}


        //第一次加载
        pageNow = Integer.parseInt(req.getParameter("pageNow"));
        String query = req.getParameter("query");
        String str = req.getParameter("str");
        counts = diseaseService.getCountsByCondtion(query, str);
        System.out.println(counts);
        allDiseases = diseaseService.getAllDiseasesByCondtion(query, str, pageNow, pageSize);
        System.out.println(allDiseases.size());
        pageNum = (int) Math.ceil(counts / (pageSize * 1.0));

        req.setAttribute("pageNow", pageNow);
        req.setAttribute("pageNum", pageNum);
        req.setAttribute("allDiseases", allDiseases);


        //给panel设置
        req.setAttribute("query",query);
        req.setAttribute("str",str);

        req.getRequestDispatcher("jsp/datamanagement/diseasePanel.jsp").forward(req,resp);
    }
}

package com.code.servlet.conferServlet;

import com.code.bean.ConferBean;
import com.code.bean.ThingBean;
import com.code.service.ConferService;
import com.code.service.imp.ConferServiceImpl;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.Date;

/**
 * Created by CodeA on 2015/10/17.
 */
public class ConferAdd extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        System.out.println("conferAdd.java:success");

        // 得到查询条件
        int    thingID = Integer.parseInt(req.getParameter("thingID"));
        String staff   = req.getParameter("staff");
        String result  = req.getParameter("result");

        ConferBean conferBean = new ConferBean();
        conferBean.setStaff(staff);
        conferBean.setData(new Date());
        //时间和字符串的转换
        /********************************/
        SimpleDateFormat df    = new SimpleDateFormat("yyyy-MM-dd HH:MM:ss");
        java.util.Date   uDate = new java.util.Date();
        System.out.println("uDate: " + uDate);
        java.sql.Date sDate = new java.sql.Date(uDate.getTime());
        System.out.println("sDate: " + sDate);
        String strDate = df.format(sDate);
        System.out.println("strDate: " + strDate);

        /********************************/

        String addTime = "New: " + sDate;


        //会审记录表有一个result字段  一个事件多个会审记录表
        conferBean.setResult(result);
        ThingBean thingBean = new ThingBean();
        thingBean.setId(thingID);
        //事件记录表有一个result字段  每次保存最新的会审记录
        thingBean.setResult(result);
        conferBean.setThingBean(thingBean);
        //调用业务
        ConferService conferService = new ConferServiceImpl();
        PrintWriter out = resp.getWriter();
        if (conferService.addConfer(conferBean)) out.print("{'msg':'success','addTime':'"+ addTime +"'}");
        else out.print("{'msg':'defeat'}");
        out.flush();
        out.close();
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        this.doPost(req, resp);
    }
}

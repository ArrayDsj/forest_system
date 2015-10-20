package com.code.servlet;

import com.code.bean.LogBean;
import com.code.bean.UserBean;
import com.code.service.LogService;
import com.code.service.UserService;
import com.code.service.imp.LogServiceImp;
import com.code.service.imp.UserServiceImp;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.Date;

/**
 * Created by CodeA on 2015/10/9.
 */
public class LoginServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        doPost(req,resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        //从login.jsp请求中得到数据
        String username = req.getParameter("username");
        String password = req.getParameter("password");

        //封装数据
        UserBean loginUser = new UserBean();
        loginUser.setName(username);
        loginUser.setPassword(password);

        //请求服务
        UserService userService = new UserServiceImp();
        loginUser = userService.login(loginUser);
        if(loginUser != null){
            
        	req.getSession().setAttribute("loginUser", loginUser);
        	
        	LogBean log = new LogBean();
        	
        	log.setContent(loginUser.getDegree()+loginUser.getRealName()+"成功登录");
        	
        	log.setDate(new Date());
        	
        	LogService ls = new LogServiceImp();
        	
        	ls.addLog(log);
        	req.getRequestDispatcher("jsp/index.jsp").forward(req,resp);

        }else{
        	
        	LogBean log = new LogBean();
        	
        	log.setContent("IP地址"+req.getHeader("Host")+"非法登录");
        	
        	log.setDate(new Date());
        	
        	LogService ls = new LogServiceImp();
        	
        	ls.addLog(log);

            req.setAttribute("info", "用户名或密码有误！");

            req.getRequestDispatcher("login.jsp").forward(req, resp);
        }
    }
}

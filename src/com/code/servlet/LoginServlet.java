package com.code.servlet;

import com.code.bean.UserBean;
import com.code.service.UserService;
import com.code.service.imp.UserServiceImp;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

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

        //��login.jsp�����еõ�����
        String username = req.getParameter("username");
        String password = req.getParameter("password");

        //��װ����
        UserBean loginUser = new UserBean();
        loginUser.setName(username);
        loginUser.setPassword(password);

        //�������
        UserService userService = new UserServiceImp();
        loginUser = userService.login(loginUser);
        if(loginUser != null){
            req.setAttribute("loginUser",loginUser);
            //req.getRequestDispatcher("jsp/index.jsp").forward(req,resp);
            resp.sendRedirect(req.getContextPath()+"/jsp/index.jsp");
        }else{
            req.setAttribute("info", "�û�����������");
            req.getRequestDispatcher("login.jsp").forward(req, resp);
        }
    }
}

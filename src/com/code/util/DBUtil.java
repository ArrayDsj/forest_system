package com.code.util;

import org.apache.tomcat.dbcp.dbcp2.BasicDataSource;

import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

public class DBUtil implements ServletContextListener {
    private static BasicDataSource ds;

    public void contextInitialized(ServletContextEvent servletContextEvent) {
        String driverClass = servletContextEvent.getServletContext().getInitParameter("driver");
        String userName = servletContextEvent.getServletContext().getInitParameter("username");
        String passWord = servletContextEvent.getServletContext().getInitParameter("password");
        String url      = servletContextEvent.getServletContext().getInitParameter("url");

        int initialSize = Integer.parseInt(servletContextEvent.getServletContext().getInitParameter("initialSize"));

        int maxIdle = Integer.parseInt(servletContextEvent.getServletContext().getInitParameter("maxIdle"));

        int minIdle = Integer.parseInt(servletContextEvent.getServletContext().getInitParameter("minIdle"));

        ds = new BasicDataSource();
        ds.setDriverClassName(driverClass);
        ds.setUrl(url);
        ds.setUsername(userName);
        ds.setPassword(passWord);
        ds.setInitialSize(initialSize);
        ds.setMaxIdle(maxIdle);
        ds.setMinIdle(minIdle);

        servletContextEvent.getServletContext().setAttribute("dataSource", ds);
    }

    public void contextDestroyed(ServletContextEvent servletContextEvent) {
        if (ds == null) return;
        try {
            ds.close();
        } catch (SQLException e) {
            System.out.println("连接池关闭失败");
            e.printStackTrace();
        }
    }

    public static Connection getConnection() {
        Connection con = null;
        try {
            con = ds.getConnection();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return con;
    }

    //查询操作用到的关闭连接方法
    public static void close(ResultSet resultSet, Statement statement,  Connection connection) {
        if(resultSet != null){
            try {
                resultSet.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
        if(statement != null){
            try {
                statement.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
        if(connection != null){
            try {
                connection.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
    }

    //更新操作用到的关闭连接方法
    public static void close(Statement statement, Connection connection) {
        if (statement != null) {
            try {
                statement.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
        if (connection != null) {
            try {
                connection.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
    }
}
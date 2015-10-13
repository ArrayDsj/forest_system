package com.code.filter;

/**
 * Created by CodeA on 2015/10/13.
 */
/**
 * 文件名: CharsetFilter.java
 * 功  能: 中文过滤器
 * 作  者: 把酒临江
 * 日  期: 2004-11-25
 * 版  权: 把酒临江
 * 备  注:
 */

import javax.servlet.ServletRequest;
import javax.servlet.*;
import java.io.IOException;

/**
 * 字符转换，使用utf-8格式的模板，模板中有非英文字符，请使用字符过虑功能
 * 需要在Web.xml文件中设置，设置形式如下：
 <filter>
 <filter-name>CharsetFilter</filter-name>
 <filter-class>com.lovo.filter.CharsetFilter</filter-class>
 <init-param>
 <param-name>encoding</param-name>
 <param-value>utf-8</param-value>
 </init-param>
 <init-param>
 <param-name>ignore</param-name>
 <param-value>true</param-value>
 </init-param>
 </filter>
 <filter-mapping>
 <filter-name>CharsetFilter</filter-name>
 <url-pattern>*.do</url-pattern>
 </filter-mapping>
 <filter-mapping>
 <filter-name>CharsetFilter</filter-name>
 <url-pattern>*.jsp</url-pattern>
 </filter-mapping>
 */


public class CharsetFilter implements Filter {

    protected String encoding = null;

    protected FilterConfig filterConfig = null;

    protected boolean ignore = true;

    public void destroy() {

        this.encoding = null;
        this.filterConfig = null;

    }

    public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException {
        if (ignore || (request.getCharacterEncoding() == null)) {
            String encoding = selectEncoding(request);
            if (encoding != null) request.setCharacterEncoding(encoding);
            response.setCharacterEncoding(encoding);
        }
        chain.doFilter(request, response);
    }

    public void init(FilterConfig filterConfig) throws ServletException {

        this.filterConfig = filterConfig;
        this.encoding = filterConfig.getInitParameter("encoding");
        String value = filterConfig.getInitParameter("ignore");
        if (value == null) this.ignore = true;
        else if (value.equalsIgnoreCase("true")) this.ignore = true;
        else if (value.equalsIgnoreCase("yes")) this.ignore = true;
        else this.ignore = false;
    }

    protected String selectEncoding(ServletRequest request) {
        return (this.encoding);
    }
}

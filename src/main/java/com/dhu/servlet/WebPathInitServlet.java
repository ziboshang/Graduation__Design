package com.dhu.servlet;


import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;


@WebServlet(urlPatterns = {},loadOnStartup =2 )
public class WebPathInitServlet extends HttpServlet{
    @Override
    public void init(ServletConfig config) throws ServletException {
        //整体应用上下文当中存储了一个ctx 用它来存储上下文路径
        config.getServletContext().setAttribute("ctx",config.getServletContext().getContextPath());
        super.init(config);
    }
}

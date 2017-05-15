package com.school.web.controller;

import com.school.dao.UserDao;
import com.school.dao.impl.UserDaoImpl;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.io.PrintWriter;

/**
 * Created by zheng1718 on 17-4-24.
 */
public class RegisterServlet extends HttpServlet{
    private static final long serialVersionUID = 1L;

    public void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();

        String username=request.getParameter("username");
        String userpwd=request.getParameter("userpwd");
        System.out.println(username+" "+userpwd);

        HttpSession session = request.getSession(false);
        if(session!=null)
            session.setAttribute("name", username);

        UserDao userDao = new UserDaoImpl();
        if(userDao.add(username, userpwd)){
            RequestDispatcher rd=request.getRequestDispatcher("loginPage.jsp");
            rd.forward(request,response);
        }
        else{
            out.print("<p style=\"color:red\">Sorry username has been occupied!</p>");
            RequestDispatcher rd=request.getRequestDispatcher("registerPage.jsp");
            rd.include(request,response);
        }
        out.close();
    }
    public void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
            doPost(request, response);
        }
}

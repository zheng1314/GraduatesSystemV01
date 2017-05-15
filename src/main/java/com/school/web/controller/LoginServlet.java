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

/**
 * Created by zheng1718 on 17-4-24.
 */
public class LoginServlet extends HttpServlet{
    private static final long serialVersionUID = 1L;

    public void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");

        String username=request.getParameter("username");
        String userpwd=request.getParameter("userpwd");
        System.out.println(username+" "+userpwd);

        HttpSession session = request.getSession(false);
        if(session!=null)
            session.setAttribute("name", username);
        System.out.println(username);

        UserDao userDao = new UserDaoImpl();
        if(userDao.find(username, userpwd)){
            RequestDispatcher rd=request.getRequestDispatcher("/WEB-INF/homePage.jsp");
            rd.forward(request,response);
        }
        else{
            RequestDispatcher rd=request.getRequestDispatcher("loginPage.jsp");
            rd.include(request,response);
        }
    }
    public void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        doPost(request, response);
    }
}

package com.school.web.controller;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

/**
 * Created by zheng1718 on 17-5-1.
 */
public class LogoutServlet extends HttpServlet{
    public void doPost(HttpServletRequest request, HttpServletResponse response)
             throws ServletException, IOException {
                request.getSession().removeAttribute("name");

                request.getRequestDispatcher("loginPage.jsp").forward(request, response);
             }

    public void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
                 doPost(request, response);
             }
}

package com.school.web.controller;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

/**
 * Created by zheng1718 on 17-5-7.
 */
public class ShowServlet extends HttpServlet {
    public void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String action = request.getParameter("action").trim();	//得到请求动作
        if(action.equals("DE")){
            request.getRequestDispatcher("/WEB-INF/ShowDEPage.jsp").forward(request, response);
        }else if(action.equals("AI")) {
            request.getRequestDispatcher("/WEB-INF/ShowAIPage.jsp").forward(request, response);
        }else if(action.equals("CS")) {
            request.getRequestDispatcher("/WEB-INF/ShowCSPage.jsp").forward(request, response);
        }else if(action.equals("GP")) {
            request.getRequestDispatcher("/WEB-INF/ShowGPPage.jsp").forward(request, response);
        }else if(action.equals("GI")) {
            request.getRequestDispatcher("/WEB-INF/ShowGIPage.jsp").forward(request, response);
        }

    }

    public void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        doPost(request, response);
    }
}
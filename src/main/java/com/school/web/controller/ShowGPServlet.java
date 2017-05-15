package com.school.web.controller;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

/**
 * Created by zheng1718 on 17-5-15.
 */
public class ShowGPServlet extends HttpServlet {
    public void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String action = request.getParameter("action").trim();	//得到请求动作
        if(action.equals("list")) {
            request.getRequestDispatcher("/WEB-INF/ShowGradePoint/list.jsp").forward(request, response);
        }else if(action.equals("add")) {
            request.getRequestDispatcher("/WEB-INF/ShowGradePoint/add.jsp").forward(request, response);
        }else if(action.equals("edit")) {
            request.getRequestDispatcher("/WEB-INF/ShowGradePoint/edit.jsp").forward(request, response);
        }else if(action.equals("del")) {
            request.getRequestDispatcher("/WEB-INF/ShowGradePoint/del.jsp").forward(request, response);
        }
    }

    public void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        doPost(request, response);
    }
}

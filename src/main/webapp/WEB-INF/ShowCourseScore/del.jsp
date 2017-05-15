<%@ page import="com.school.utils.DBConn" %>
<%@ page import="java.sql.SQLException" %><%--
  Created by IntelliJ IDEA.
  User: zheng1718
  Date: 17-5-15
  Time: 上午9:32
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%

    DBConn dbConn = new DBConn();
    String sid = request.getParameter("name");

    try {
        if (dbConn != null) {
            String sql = "delete from course_score where sid = '" + sid + "'";
            System.out.println(sql);
            dbConn.doDelete(sql);
        }dbConn.close();
    }catch (SQLException e) {
        e.printStackTrace();
    }
%>

<%@ page import="java.sql.*" %>
<%@ page import="com.school.utils.DBConn" %>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%

    DBConn dbConn = new DBConn();
    String sid = request.getParameter("name");

    try {
        if (dbConn != null) {
            String sql = "delete from DegreeExam where sid = '" + sid + "'";
            System.out.println(sql);
            dbConn.doDelete(sql);
        }dbConn.close();
    }catch (SQLException e) {
        e.printStackTrace();
    }
%>

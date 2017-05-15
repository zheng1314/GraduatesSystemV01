<%@ page import="com.school.utils.DBConn" %>
<%@ page import="java.sql.ResultSet" %>
<%@ page import="java.sql.SQLException" %><%--
  Created by IntelliJ IDEA.
  User: zheng1718
  Date: 17-5-15
  Time: 上午9:08
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String college = request.getParameter("college");
    String major = request.getParameter("major");
    String classes = request.getParameter("classes");
    String sid = request.getParameter("sid");
    String gender = request.getParameter("gender");
    float total_credit = Float.parseFloat(request.getParameter("total_credit"));
    float learned_credit = Float.parseFloat(request.getParameter("learned_credit"));
    float point = Float.parseFloat(request.getParameter("point"));
    float notlearned_credit = Float.parseFloat(request.getParameter("notlearned_credit"));
    String graduation_audit = request.getParameter("graduation_audit");
    String degree_audit = request.getParameter("degree_audit");

    DBConn dbConn = new DBConn();
    ResultSet resultSet;
    String username = session.getAttribute("name").toString();
    int uid;

    resultSet = dbConn.doSelect("select uid from user_auths where username = '" + username+"'");
    if(resultSet.next()) {
        uid = Integer.parseInt(resultSet.getString("uid"));
        System.out.println(uid);
    }else {
        System.out.println("uid failed");
        return;
    }

    try {
        if (dbConn != null) {
            String sql = "update grade_point set uid = '" + uid +
                    "', college = '" + college + "', major = '" + major +
                    "', classes = '" + classes + "', gender = '" + gender +
                    "', total_credit = '" + total_credit + "', learned_credit = '" + learned_credit +
                    "', point = '" + point + "', notlearned_credit = '" + notlearned_credit +
                    "', graduation_audit = '" + graduation_audit + "', degree_audit = '" + degree_audit +
                    "' where sid = '" + sid + "'";
            dbConn.doUpdate(sql);
            System.out.println(sql);
            dbConn.close(resultSet);
        }
    }catch (SQLException e) {
            e.printStackTrace();
    }
%>

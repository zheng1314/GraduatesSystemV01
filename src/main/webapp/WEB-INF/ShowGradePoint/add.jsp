<%@ page import="com.school.utils.DBConn" %>
<%@ page import="java.sql.ResultSet" %>
<%@ page import="java.sql.SQLException" %><%--
  Created by IntelliJ IDEA.
  User: zheng1718
  Date: 17-5-15
  Time: 上午8:40
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
            String sql = "insert into grade_point(uid, college, major, classes, sid, gender, total_credit, learned_credit, point, notlearned_credit, graduation_audit, degree_audit)" +
                    " values ('" + uid + "','" + college + "','" + major + "','" +
                    classes + "','" + sid + "','" + gender + "','" +
                    total_credit + "','" + learned_credit + "','" + point + "','" +
                    notlearned_credit + "','" + graduation_audit + "','" + degree_audit + "','" + "')";
            dbConn.doInsert(sql);
            System.out.println(sql);
            dbConn.close(resultSet);
        }
    }catch (SQLException e) {
        e.printStackTrace();
    }
%>

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
    String course = request.getParameter("course");
    String credit = request.getParameter("credit");
    String hours = request.getParameter("hours");
    String classes = request.getParameter("classes");
    String sid = request.getParameter("sid");
    String gender = request.getParameter("gender");
    String score = request.getParameter("score");
    String course_nature = request.getParameter("course_nature");
    String test_nature = request.getParameter("test_nature");
    String learn_term = request.getParameter("learn_term");

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
            String sql = "update course_score set uid = '" + uid +
                    "', college = '" + college + "', course = '" + course +
                    "', credit = '" + credit + "', hours = '" + hours +
                    "', classes = '" + classes + "', gender = '" + gender +
                    "', score = '" + score + "', course_nature = '" + course_nature +
                    "', test_nature = '" + test_nature + "', learn_term = '" + learn_term +
                    "' where sid = '" + sid + "'";
            dbConn.doUpdate(sql);
            System.out.println(sql);
            dbConn.close(resultSet);
        }
    }catch (SQLException e) {
            e.printStackTrace();
    }
%>

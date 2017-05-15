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
    String grade = request.getParameter("grade");
    String classes = request.getParameter("classes");
    String major = request.getParameter("major");
    String exam_name = request.getParameter("exam_name");
    String sid = request.getParameter("sid");
    String gender = request.getParameter("gender");
    String pass = request.getParameter("pass");
    float score = Float.parseFloat(request.getParameter("score"));

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
            String sql = "update degree_exam set uid = '" + uid + "', college = '" + college +
                    "', grade = '" + grade + "', classes = '" + classes + "', major = '" + major +
                    "', exam_name = '" + exam_name + "', gender = '" + gender + "', pass = '" + pass +
                    "', score = '" + score + "' where sid = '" + sid + "'";
            dbConn.doUpdate(sql);
            System.out.println(sql);
            dbConn.close(resultSet);
        }
    }catch (SQLException e) {
            e.printStackTrace();
    }
%>

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
    String gender = request.getParameter("gender");
    String employment = request.getParameter("employment");
    String major = request.getParameter("major");
    String sid = request.getParameter("sid");


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
            String sql = "insert into graduation_info(gender, employment, major, sid, uid)" +
                    " values ('" + gender + "','" + employment + "','" + major +
                    "','" + sid  + "','" + uid  +"')";
            dbConn.doInsert(sql);
            System.out.println(sql);
            dbConn.close(resultSet);
        }
    }catch (SQLException e) {
        e.printStackTrace();
    }
%>

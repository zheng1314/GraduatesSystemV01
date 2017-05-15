<%@ page import="java.sql.*" %>
<%@ page import="com.school.utils.DBConn" %>
<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2015/4/13
  Time: 11:59
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%

    String SId = request.getParameter("sid");
    String College = request.getParameter("college");
    String Classes = request.getParameter("classes");
    String Grade = request.getParameter("grade");
    String ExamName = request.getParameter("examName");
    float Score = Float.parseFloat(request.getParameter("Score"));
    String Gender = request.getParameter("gender");
    String Major = request.getParameter("major");
    String Pass = request.getParameter("pass");
    //System.out.println(SId + College + Classes + Grade + ExamName + Score + Gender + Major + Pass);

    DBConn dbConn = new DBConn();

    if (dbConn != null) {
        String sql = "update DegreeExam set College = '" + College +
                "', Classes ='" + Classes + "', Grade = '" + Grade +
                "',ExamName = '" + ExamName + "', Score = '" + Score +
                "', Gender = '" +  Gender + "', Major = '" + Major +
                "', Pass = '" + Pass + "' where SId = '" + SId +"'";
        //System.out.println(sql);
        dbConn.doUpdate(sql);
    }
%>

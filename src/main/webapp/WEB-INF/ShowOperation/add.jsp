<%@ page import="java.sql.*" %>
<%@ page import="com.school.utils.DBConn" %>

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

    DBConn dbConn = new DBConn();

    if (dbConn != null) {
        String sql = "insert into DegreeExam(SId, College, Classes, Grade, ExamName, Score, Gender, Major, Pass)" +
                " values ('" + SId +"','"+ College +"','" + Classes +"','"+
                Grade + "','"+ ExamName +"','"+ Score +"','"+
                Gender +"','"+ Major +"','"+ Pass +"')";
        dbConn.doInsert(sql);
        System.out.println(sql);
    }
%>

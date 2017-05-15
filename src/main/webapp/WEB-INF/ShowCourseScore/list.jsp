<%@ page import="java.util.List" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.sql.ResultSet" %>
<%@ page import="com.school.utils.DBConn" %>
<%@ page import="com.school.model.award_info" %>
<%@ page import="java.sql.SQLException" %>
<%@ page import="java.util.Map" %>
<%@ page import="java.util.HashMap" %>
<%@ page import="com.google.gson.Gson" %>
<%@ page import="com.school.model.course_score" %><%--
  Created by IntelliJ IDEA.
  User: zheng1718
  Date: 17-5-15
  Time: 下午1:54
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    ResultSet resultSet = null;
    DBConn dbConn = new DBConn();
    String table = "course_score";

    String draw = "0";
    draw = request.getParameter("draw");
    String start = request.getParameter("start");
    String length = request.getParameter("length");

    String recordsTotal = "0";

    String recordsFiltered = "0";
    String[] cols = {"","college","course","credit","hours","classes","sid","gender","score","course_nature","test_nature","learn_term"};

    String orderColumn = "0";
    orderColumn = request.getParameter("order[0][column]");
    orderColumn = cols[Integer.parseInt(orderColumn)];

    String orderDir = "asc";
    orderDir = request.getParameter("order[0][dir]");

    String searchValue = request.getParameter("search[value]");
    List<String> sArray = new ArrayList<String>();
    if (!searchValue.equals("")) {
        sArray.add(" college like '%" + searchValue + "%'");
        sArray.add(" course like '%" + searchValue + "%'");
        sArray.add(" credit like '%" + searchValue + "%'");
        sArray.add(" hours like '%" + searchValue + "%'");
        sArray.add(" classes like '%" + searchValue + "%'");
        sArray.add(" sid like '%" + searchValue + "%'");
        sArray.add(" gender like '%" + searchValue + "%'");
        sArray.add(" score like '%" + searchValue + "%'");
        sArray.add(" course_nature like '%" + searchValue + "%'");
        sArray.add(" test_nature like '%" + searchValue + "%'");
        sArray.add(" learn_term like '%" + searchValue + "%'");
    }
    String individualSearch = "";
    if(sArray.size() == 1) {
        individualSearch = sArray.get(0);
    }else if(sArray.size() > 1) {
        for(int i = 0; i < sArray.size()-1; i++) {
            individualSearch += sArray.get(i) + " or ";
        }
        individualSearch += sArray.get(sArray.size()-1);
    }
    List<course_score> courseScores = new ArrayList<course_score>();
    course_score courseScore;
    try {
        if(dbConn != null) {
            String recordsFilteredSql = "select count(1) as recordsFiltered from " + table;
            resultSet = dbConn.doSelect(recordsFilteredSql);
            String recordsTotalSql = "select count(1) as recordsTotal from " + table;
            resultSet = dbConn.doSelect(recordsTotalSql);
            while (resultSet.next()) {
                recordsTotal = resultSet.getString("recordsTotal");
            }

            String searchSQL = "";
            String sql = "SELECT * FROM " + table;
            if (individualSearch != "") {
                searchSQL = " where " + individualSearch;
            }
            sql += searchSQL;
            recordsFilteredSql += searchSQL;
            sql += " order by " + orderColumn + " " + orderDir;
            recordsFilteredSql += " order by " + orderColumn + " " + orderDir;
            sql += " limit " + start + ", " + length;

            resultSet = dbConn.doSelect(sql);
            while (resultSet.next()) {
                courseScore = new course_score();
                courseScore.setCollege(resultSet.getString("college"));
                courseScore.setCourse(resultSet.getString("course"));
                courseScore.setCredit(Float.parseFloat(resultSet.getString("credit")));
                courseScore.setHours(Float.parseFloat(resultSet.getString("hours")));
                courseScore.setClasses(resultSet.getString("classes"));
                courseScore.setSid(resultSet.getString("sid"));
                courseScore.setGender(resultSet.getString("gender"));
                courseScore.setScore(resultSet.getString("score"));
                courseScore.setCourse_nature(resultSet.getString("course_nature"));
                courseScore.setTest_nature(resultSet.getString("test_nature"));
                courseScore.setLearn_term(resultSet.getString("learn_term"));

                courseScores.add(courseScore);
            }

            if (searchValue != "") {
                resultSet = dbConn.doSelect(recordsFilteredSql);
                while (resultSet.next()) {
                    recordsFiltered = resultSet.getString("recordsFiltered");
                }
            } else {
                recordsFiltered = recordsTotal;
            }
        }
        dbConn.close(resultSet);
    }catch (SQLException e) {
        e.printStackTrace();
    }finally {
        Map<Object, Object> info = new HashMap<Object, Object>();
        info.put("data", courseScores);
        info.put("recordsTotal", recordsTotal);
        info.put("recordsFiltered", recordsFiltered);
        info.put("draw", draw);
        String json = new Gson().toJson(info);
        out.write(json);
    }
%>

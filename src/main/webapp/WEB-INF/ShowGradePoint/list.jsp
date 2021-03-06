<%@ page import="java.util.List" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.sql.ResultSet" %>
<%@ page import="com.school.utils.DBConn" %>
<%@ page import="com.school.model.award_info" %>
<%@ page import="java.sql.SQLException" %>
<%@ page import="java.util.Map" %>
<%@ page import="java.util.HashMap" %>
<%@ page import="com.google.gson.Gson" %>
<%@ page import="com.school.model.grade_point" %><%--
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
    String table = "grade_point";

    String draw = "0";
    draw = request.getParameter("draw");
    String start = request.getParameter("start");
    String length = request.getParameter("length");

    String recordsTotal = "0";

    String recordsFiltered = "0";
    String[] cols = {"","sid","major","award"};

    String orderColumn = "0";
    orderColumn = request.getParameter("order[0][column]");
    orderColumn = cols[Integer.parseInt(orderColumn)];

    String orderDir = "asc";
    orderDir = request.getParameter("order[0][dir]");

    String searchValue = request.getParameter("search[value]");
    List<String> sArray = new ArrayList<String>();
    if (!searchValue.equals("")) {
        sArray.add(" college like '%" + searchValue + "%'");
        sArray.add(" major like '%" + searchValue + "%'");
        sArray.add(" classes like '%" + searchValue + "%'");
        sArray.add(" sid like '%" + searchValue + "%'");
        sArray.add(" gender like '%" + searchValue + "%'");
        sArray.add(" total_credit like '%" + searchValue + "%'");
        sArray.add(" learned_credit like '%" + searchValue + "%'");
        sArray.add(" point like '%" + searchValue + "%'");
        sArray.add(" notlearned_credit like '%" + searchValue + "%'");
        sArray.add(" graduation_audit like '%" + searchValue + "%'");
        sArray.add(" degree_audit like '%" + searchValue + "%'");
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
    List<grade_point> gradePoints = new ArrayList<grade_point>();
    grade_point gradePoint;
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
                gradePoint = new grade_point();
                gradePoint.setCollege(resultSet.getString("college"));
                gradePoint.setMajor(resultSet.getString("major"));
                gradePoint.setClasses(resultSet.getString("classes"));
                gradePoint.setSid(resultSet.getString("sid"));
                gradePoint.setGender(resultSet.getString("gender"));
                gradePoint.setTotal_credit(Float.parseFloat(resultSet.getString("total_credit")));
                gradePoint.setLearned_credit(Float.parseFloat(resultSet.getString("learned_credit")));
                gradePoint.setPoint(Float.parseFloat(resultSet.getString("point")));
                gradePoint.setNotlearned_credit(Float.parseFloat(resultSet.getString("notlearned_credit")));
                gradePoint.setGraduation_audit(resultSet.getString("graduation_audit"));
                gradePoint.setDegree_audit(resultSet.getString("degree_audit"));

                gradePoints.add(gradePoint);
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
        info.put("data", gradePoints);
        info.put("recordsTotal", recordsTotal);
        info.put("recordsFiltered", recordsFiltered);
        info.put("draw", draw);
        String json = new Gson().toJson(info);
        out.write(json);
    }
%>

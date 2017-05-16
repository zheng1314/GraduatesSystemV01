<%@ page import="java.util.List" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.sql.ResultSet" %>
<%@ page import="com.school.utils.DBConn" %>
<%@ page import="com.school.model.award_info" %>
<%@ page import="java.sql.SQLException" %>
<%@ page import="java.util.Map" %>
<%@ page import="java.util.HashMap" %>
<%@ page import="com.google.gson.Gson" %><%--
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
    String table = "award_info";

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
        sArray.add(" sid like '%" + searchValue + "%'");
        sArray.add(" major like '%" + searchValue + "%'");
        sArray.add(" award like '%" + searchValue + "%'");
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
    List<award_info> awardInfos = new ArrayList<award_info>();
    award_info awardInfo;
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
                awardInfo = new award_info();
                awardInfo.setSid(resultSet.getString("sid"));
                awardInfo.setMajor(resultSet.getString("major"));
                awardInfo.setAward(resultSet.getString("award"));

                awardInfos.add(awardInfo);
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
        info.put("data", awardInfos);
        info.put("recordsTotal", recordsTotal);
        info.put("recordsFiltered", recordsFiltered);
        info.put("draw", draw);
        String json = new Gson().toJson(info);
        out.write(json);
    }
%>

<%@ page import="com.google.gson.Gson" %>
<%@ page import="com.school.model.DegreeExam" %>
<%@ page import="com.school.utils.DBConn" %>
<%@ page import="java.sql.ResultSet" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.util.HashMap" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.Map"%>
<%@ page import="java.sql.SQLException" %>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%

    ResultSet resultSet;
    //Statement stmt = null;
    DBConn dbConn = new DBConn();
    String table = "DegreeExam";

    //获取请求次数
    String draw = "0";
    draw = request.getParameter("draw");
    //数据起始位置
    String start = request.getParameter("start");
    //数据长度
    String length = request.getParameter("length");

    //总记录数
    String recordsTotal = "0";

    //过滤后记录数
    String recordsFiltered = "";

    //定义列名
    String[] cols = {"","SId", "College", "Classes", "Grade", "ExamName", "Score", "Gender", "Major", "Pass"};
    //获取客户端需要那一列排序
    String orderColumn = "0";
    orderColumn = request.getParameter("order[0][column]");
    orderColumn = cols[Integer.parseInt(orderColumn)];
    //获取排序方式 默认为asc
    String orderDir = "asc";
    orderDir = request.getParameter("order[0][dir]");

   /* Map map = request.getParameterMap();
    Iterator<String> iter = map.keySet().iterator();
    while (iter.hasNext()) {
        String key = iter.next();
        System.out.println("key=" + key);
        String[] value = (String[]) map.get(key);
        System.out.print("value=");
        for (String v : value) {
//            out.print(v + "  ") ;
            System.out.println(v + "  ");
        }
    }*/

    //获取用户过滤框里的字符
    String searchValue = request.getParameter("search[value]");

    List<String> sArray = new ArrayList<String>();
    if (!searchValue.equals("")) {
        sArray.add(" SId like '%" + searchValue + "%'");
        sArray.add(" College like '%" + searchValue + "%'");
        sArray.add(" Classes like '%" + searchValue + "%'");
        sArray.add(" Grade like '%" + searchValue + "%'");
        sArray.add(" ExamName like '%" + searchValue + "%'");
        sArray.add(" Score like '%" + searchValue + "%'");
        sArray.add(" Gender like '%" + searchValue + "%'");
        sArray.add(" Major like '%" + searchValue + "%'");
        sArray.add(" Pass like '%" + searchValue + "%'");
    }

    String individualSearch = "";
    if (sArray.size() == 1) {
        individualSearch = sArray.get(0);
    } else if (sArray.size() > 1) {
        for (int i = 0; i < sArray.size() - 1; i++) {
            individualSearch += sArray.get(i) + " or ";
        }
        individualSearch += sArray.get(sArray.size() - 1);
    }

    List<DegreeExam> cet4scores = new ArrayList<DegreeExam>();
    DegreeExam cet4score;
    try {
    if (dbConn != null) {
        /*String sqlAll = "select * from DegreeExam";
        resultSet = dbConn.doSelect(sqlAll);
        while(resultSet.next()) {
            cet4score = new DegreeExam();
            cet4score.setSId(resultSet.getString("SId"));
            cet4score.setCollege(resultSet.getString("College"));
            cet4score.setClasses(resultSet.getString("classes"));
            cet4score.setGrade(resultSet.getString("grade"));
            cet4score.setExamName(resultSet.getString("examName"));
            cet4score.setScore(Float.parseFloat(resultSet.getString("Score")));
            cet4score.setGender(resultSet.getString("classes"));
            cet4score.setMajor(resultSet.getString("major"));
            cet4score.setPass(resultSet.getString("pass"));

            cet4scores.add(cet4score);
            //System.out.println(cet4score.getSId()+" "+cet4score.getScore());
        }*/
        String recordsFilteredSql = "select count(1) as recordsFiltered from " + table;
        //stmt = conn.createStatement();
        resultSet = dbConn.doSelect(recordsFilteredSql);
        //获取数据库总记录数
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
            cet4score = new DegreeExam();
            cet4score.setSId(resultSet.getString("SId"));
            cet4score.setCollege(resultSet.getString("College"));
            cet4score.setClasses(resultSet.getString("classes"));
            cet4score.setGrade(resultSet.getString("grade"));
            cet4score.setExamName(resultSet.getString("examName"));
            cet4score.setScore(Float.parseFloat(resultSet.getString("Score")));
            cet4score.setGender(resultSet.getString("gender"));
            cet4score.setMajor(resultSet.getString("major"));
            cet4score.setPass(resultSet.getString("pass"));

            cet4scores.add(cet4score);
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
    }catch (SQLException e) {
        e.printStackTrace();
    }finally {

        Map<Object, Object> info = new HashMap<Object, Object>();
        info.put("data", cet4scores);
        info.put("recordsTotal", recordsTotal);
        info.put("recordsFiltered", recordsFiltered);
        info.put("draw", draw);
        String json = new Gson().toJson(info);
        out.write(json);
    }
%>

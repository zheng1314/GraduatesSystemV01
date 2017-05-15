package com.school.utils;

import com.school.model.DegreeExam;
import com.school.utils.ReadExcel;
import org.apache.poi.openxml4j.exceptions.InvalidFormatException;

import java.io.IOException;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

/**
 * Created by zheng1718 on 17-5-4.
 */
public class SaveDE2DB {
    private DBConn dbConn;
    private ResultSet resultSet;

    @SuppressWarnings({ "rawtypes" })
    public void save(String path) throws IOException, SQLException {
        System.out.println("SaveDE2DB start work!");
        ReadExcel xlsMain = new ReadExcel();
        DegreeExam cet4score1;
        try {
            List<DegreeExam> list = xlsMain.readXls(path);

        dbConn = new DBConn();
        List l = new ArrayList();

        for (int i = 0; i < list.size(); i++) {
            cet4score1 = list.get(i);
            resultSet = dbConn.doSelect(SELECT_STUDENT_SQL + "'%" + cet4score1.getSId() + "%'");
            //List l = DbUtil.selectOne(SELECT_STUDENT_SQL + "'%" + cet4score1.getSId() + "%'", cet4score1);
            while(resultSet.next()){
                if(resultSet.getString("SId").equals(cet4score1.getSId()) && resultSet.getString("Score").equals(cet4score1.getScore())){
                    l.add(1);
                    System.out.println(1 + cet4score1.getSId() + cet4score1.getScore());
                }else{
                    l.add(0);
                    System.out.println(0 + cet4score1.getSId() + cet4score1.getScore());
                }
            }
            if (!l.contains(1)) {
                dbConn.doInsert("insert into DegreeExam(SId, College, Classes, Grade, ExamName, Score, Gender, Major, Pass)" +
                        " values ('" + cet4score1.getSId() +"','"+ cet4score1.getCollege() +"','" + cet4score1.getClasses() +"','"+
                        cet4score1.getGrade()+"','"+cet4score1.getExamName()+"','"+cet4score1.getScore()+"','"+
                        cet4score1.getGender()+"','"+cet4score1.getMajor()+"','"+ cet4score1.getPass()+"')");
                System.out.println(cet4score1.getSId());
            } else {
                System.out.println("The Record was Exist : Id. = " + cet4score1.getSId() + " , Score = " + cet4score1.getScore() + ", and has been throw away!");
            }
        }
        }catch (InvalidFormatException infe) {
            System.out.println("infeexception");
        }
        System.out.println("SaveDE2DB stop work!");

    }
    // sql
    public static final String INSERT_STUDENT_SQL = "insert into t_student(no, name, age, score) values(?, ?, ?, ?)";
    public static final String UPDATE_STUDENT_SQL = "update t_student set no = ?, name = ?, age= ?, score = ? where id = ? ";
    public static final String SELECT_STUDENT_ALL_SQL = "select id,no,name,age,score from t_student";
    public static final String SELECT_STUDENT_SQL = "select * from DegreeExam where SId like ";
}

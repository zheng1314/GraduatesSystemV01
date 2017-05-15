package com.school.utils;

import com.school.model.*;
import org.apache.poi.openxml4j.exceptions.InvalidFormatException;

import java.io.IOException;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

/**
 * Created by zheng1718 on 17-5-12.
 */
public class Save2DB {
    private DBConn dbConn;
    private ResultSet resultSet;
    private List l;

    public void save(String path, String action, String username) throws IOException, SQLException, Exception {
        int uid;
        ReadExcelFiles xlsMain = new ReadExcelFiles();
        dbConn = new DBConn();
        //System.out.println("username is:" + username);
        resultSet = dbConn.doSelect("select uid from user_auths where username = '" + username+"'");
        if(resultSet.next()) {
            uid = Integer.parseInt(resultSet.getString("uid"));
            System.out.println(uid);
        }else {
            System.out.println("uid failed");
            return;
        }
        if(action.equals("award_info")) {
            System.out.println("start award_info!");
            award_info awardInfo;
            try {
                List<award_info> list = xlsMain.readAIXls(path);
                for (int i = 0; i < list.size(); i++) {
                    awardInfo = list.get(i);
                    resultSet = dbConn.doSelect("select * from award_info where uid = '" + String.valueOf(uid)
                            + "' AND sid=  '" + awardInfo.getSid()
                            + "' AND award = '" + awardInfo.getAward() + "'");
                    l = new ArrayList();
                    while(resultSet.next()){
                        if(resultSet.getString("uid").equals(String.valueOf(uid))
                                && resultSet.getString("sid").equals(awardInfo.getSid())
                                && resultSet.getString("award").equals(awardInfo.getAward())){
                            l.add(1);
                            System.out.println(awardInfo.getSid() + awardInfo.getAward() );
                        }else{
                            l.add(0);
                        }
                    }
                    if (!l.contains(1)) {
                        dbConn.doInsert("insert into award_info(uid, sid, major, award)" +
                                " values ('" + uid + "','" + awardInfo.getSid() +"','"+
                                awardInfo.getMajor() +"','" + awardInfo.getAward() + "')");
                    } else {
                        System.out.println("The Record was Exist : Id. = " + awardInfo.getSid());
                    }
                }dbConn.close(resultSet);
                System.out.println("stop award_info!");
            }catch(InvalidFormatException infe) {
                System.out.println("award_info InvalidFormatException exception!!!");
            }
        }
        if(action.equals("course_score")) {
            course_score courseScore;
            try {
                List<course_score> list = xlsMain.readCSXls(path);
                for (int i = 0; i < list.size(); i++) {
                    courseScore = list.get(i);
                    l = new ArrayList();
                    resultSet = dbConn.doSelect("select * from course_score where uid = '" + String.valueOf(uid)
                            + "' AND sid = '" + courseScore.getSid()
                            + "' AND course = '" + courseScore.getCourse() + "'");
                    while(resultSet.next()){
                        if(resultSet.getString("uid").equals(String.valueOf(uid))
                                && resultSet.getString("sid").equals(courseScore.getSid())
                                && resultSet.getString("course").equals(courseScore.getCourse())){
                            l.add(1);
                        }else{
                            l.add(0);
                        }
                    }
                    if (!l.contains(1)) {
                        dbConn.doInsert("insert into course_score(uid, college, course, credit, hours, classes, sid, gender, score, course_nature, test_nature, learn_term)" +
                                " values ('" + uid + "','" + courseScore.getCollege() +"','"+ courseScore.getCourse() +"','" + courseScore.getCredit() +"','"+
                                courseScore.getHours()+"','"+courseScore.getClasses()+"','"+courseScore.getSid()+"','"+ courseScore.getGender() + "','"+
                                courseScore.getScore()+"','"+courseScore.getCourse_nature()+"','"+ courseScore.getTest_nature()+ "','"+courseScore.getLearn_term()+"')");
                    } else {
                        System.out.println("The Record was Exist : Id. = " + courseScore.getSid() + " , Score = " + courseScore.getScore() + ", and has been throw away!");
                    }
                }dbConn.close(resultSet);
            }catch(InvalidFormatException infe) {
                System.out.println("course_score InvalidFormatException exception!!!");
            }
        }
        if(action.equals("degree_exam")) {
            degree_exam degreeExam;
            try {
                List<degree_exam> list = xlsMain.readDEXls(path);
                for (int i = 0; i < list.size(); i++) {
                    degreeExam = list.get(i);
                    l = new ArrayList();
                    resultSet = dbConn.doSelect("select * from degree_exam where uid = '" + String.valueOf(uid)
                            + "' AND sid = '" + degreeExam.getSid()
                            + "' AND exam_name = '" + degreeExam.getExam_name() + "'");
                    while(resultSet.next()){
                        if(resultSet.getString("uid").equals(String.valueOf(uid))
                                && resultSet.getString("Sid").equals(degreeExam.getSid())
                                && resultSet.getString("exam_name").equals(degreeExam.getExam_name())){
                            l.add(1);
                        }else{
                            l.add(0);
                        }
                    }
                    if (!l.contains(1)) {
                        dbConn.doInsert("insert into degree_exam(uid, college, grade, major, classes, exam_name, sid, gender, pass, score)" +
                                " values ('" + uid + "','" + degreeExam.getCollege() +"','"+ degreeExam.getGrade() +"','" + degreeExam.getMajor() +"','"+
                                degreeExam.getClasses()+"','"+degreeExam.getExam_name()+"','"+degreeExam.getSid()+"','"+
                                degreeExam.getGender()+"','"+degreeExam.getPass()+"','"+ degreeExam.getScore()+"')");
                        System.out.println(degreeExam.getSid());
                    } else {
                        System.out.println("The Record was Exist : Id. = " + degreeExam.getSid() + " , Score = " + degreeExam.getScore() + ", and has been throw away!");
                    }
                }dbConn.close(resultSet);
            }catch(InvalidFormatException infe) {
                System.out.println("degree_exam InvalidFormatException exception!!!");
            }
        }
        if(action.equals("grade_point")) {
            grade_point gradePoint;
            try {
                List<grade_point> list = xlsMain.readGPXls(path);
                for (int i = 0; i < list.size(); i++) {
                    gradePoint = list.get(i);
                    l = new ArrayList();
                    resultSet = dbConn.doSelect("select * from grade_point where uid = '" + String.valueOf(uid)
                            + "' AND sid=  '" + gradePoint.getSid() + "'");
                    while(resultSet.next()){
                        if(resultSet.getString("uid").equals(String.valueOf(uid))
                                && resultSet.getString("Sid").equals(gradePoint.getSid())){
                            l.add(1);
                        }else{
                            l.add(0);
                        }
                    }
                    if (!l.contains(1)) {
                        dbConn.doInsert("insert into grade_point(uid, college, major, classes, sid, gender, total_credit, learned_credit, point, notlearned_credit, graduation_audit, degree_audit)" +
                                " values ('" + uid + "','" + gradePoint.getCollege() +"','"+ gradePoint.getMajor() +"','" + gradePoint.getClasses() +"','"+
                                gradePoint.getSid()+"','"+gradePoint.getGender()+"','"+gradePoint.getTotal_credit()+"','"+
                                gradePoint.getLearned_credit()+"','"+gradePoint.getPoint()+"','"+ gradePoint.getNotlearned_credit()+"','"+
                                gradePoint.getGraduation_audit()+ "','"+ gradePoint.getDegree_audit()+"')");
                    } else {
                        System.out.println("The Record was Exist : Id. = " + gradePoint.getSid());
                    }
                }dbConn.close(resultSet);
            } catch(InvalidFormatException infe) {
                System.out.println("grade_point InvalidFormatException exception!!!");
            }
        }
        if(action.equals("graduation_info")) {
            graduation_info graduationInfo;
            try {
                List<graduation_info> list = xlsMain.readGIXls(path);
                for (int i = 0; i < list.size(); i++) {
                    graduationInfo = list.get(i);
                    l = new ArrayList();
                    resultSet = dbConn.doSelect("select * from graduation_info where uid = '" + String.valueOf(uid)
                            + "' AND sid=  '" + graduationInfo.getSid()  + "'");
                    while(resultSet.next()){
                        if(resultSet.getString("uid").equals(String.valueOf(uid))
                                && resultSet.getString("Sid").equals(graduationInfo.getSid())){
                            l.add(1);
                        }else{
                            l.add(0);
                        }
                    }
                    if (!l.contains(1)) {
                        dbConn.doInsert("insert into graduation_info(uid, gender, employment, major, sid)" +
                                " values ('" + uid + "','" + graduationInfo.getGender() +"','"+ graduationInfo.getEmployment() +"','" +
                                graduationInfo.getMajor() +"','" + graduationInfo.getSid()+"')");
                        //System.out.println(i);
                    } else {
                        System.out.println("The Record was Exist : Id. = " + graduationInfo.getSid());
                    }
                }dbConn.close(resultSet);
            } catch(InvalidFormatException infe) {
                System.out.println("graduation_info InvalidFormatException exception!!!");
            }
        }
    }
}

package com.school.model;

/**
 * Created by zheng1718 on 17-5-4.
 */
public class DegreeExam {
    private String SId;
    private String College;
    private String Classes;
    private String Grade;
    private String ExamName;
    private float Score;
    private String Gender;
    private String Major;
    private String Pass;

    public DegreeExam() {}

    public DegreeExam(String sid, String college, String classes, String grade, String examName, float score,
                      String gender, String major, String pass) {
        SId = sid;
        College = college;
        Classes = classes;
        Grade = grade;
        ExamName = examName;
        Score = score;
        Gender = gender;
        Major = major;
        Pass = pass;
    }

    public String getPass() {
        return Pass;
    }

    public void setPass(String pass) {
        Pass = pass;
    }

    public String getClasses() {
        return Classes;
    }

    public void setClasses(String classes) {
        Classes = classes;
    }
    public String getCollege() {
        return College;
    }

    public void setCollege(String college) {
        College = college;
    }

    public String getGrade() {
        return Grade;
    }

    public void setGrade(String grade) {
        Grade = grade;
    }

    public String getExamName() {
        return ExamName;
    }

    public void setExamName(String examName) {
        ExamName = examName;
    }

    public float getScore() {
        return Score;
    }

    public void setScore(float score) {
        Score = score;
    }

    public String getGender() {
        return Gender;
    }

    public void setGender(String gender) {
        Gender = gender;
    }

    public String getMajor() {
        return Major;
    }

    public void setMajor(String major) {
        Major = major;
    }

    public String getSId() {

        return SId;
    }

    public void setSId(String SId) {
        this.SId = SId;
    }
}

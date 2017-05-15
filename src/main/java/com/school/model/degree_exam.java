package com.school.model;

/**
 * Created by zheng1718 on 17-5-11.
 */
public class degree_exam {
    private int uid;
    private String college;
    private String grade;
    private String major;
    private String classes;
    private String exam_name;
    private String sid;
    private String gender;
    private String pass;
    private float score;

    public degree_exam() {}

    public int getUid() {
        return uid;
    }

    public void setUid(int uid) {
        this.uid = uid;
    }

    public String getCollege() {
        return college;
    }

    public void setCollege(String college) {
        this.college = college;
    }

    public String getGrade() {
        return grade;
    }

    public void setGrade(String grade) {
        this.grade = grade;
    }

    public String getMajor() {
        return major;
    }

    public void setMajor(String major) {
        this.major = major;
    }

    public String getClasses() {
        return classes;
    }

    public void setClasses(String classes) {
        this.classes = classes;
    }

    public String getExam_name() {
        return exam_name;
    }

    public void setExam_name(String exam_name) {
        this.exam_name = exam_name;
    }

    public String getSid() {
        return sid;
    }

    public void setSid(String sid) {
        this.sid = sid;
    }

    public String getGender() {
        return gender;
    }

    public void setGender(String gender) {
        this.gender = gender;
    }

    public String getPass() {
        return pass;
    }

    public void setPass(String pass) {
        this.pass = pass;
    }

    public float getScore() {
        return score;
    }

    public void setScore(float score) {
        this.score = score;
    }

    public degree_exam(int uid, String college, String grade,
                       String major, String classes, String exam_name, String sid,
                       String gender, String pass, float score) {

        this.uid = uid;

        this.college = college;
        this.grade = grade;
        this.major = major;
        this.classes = classes;
        this.exam_name = exam_name;
        this.sid = sid;
        this.gender = gender;
        this.pass = pass;
        this.score = score;
    }
}

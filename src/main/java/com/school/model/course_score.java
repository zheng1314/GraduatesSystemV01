package com.school.model;

/**
 * Created by zheng1718 on 17-5-11.
 */
public class course_score {
    private int uid;
    private String college;
    private String course;
    private float credit;
    private float hours;
    private String classes;
    private String sid;
    private String gender;
    private String score;
    private String course_nature;
    private String test_nature;
    private String learn_term;

    public course_score() {}

    public course_score(int uid, String college, String course,
        float credit, float hours, String classes, String sid, String gender,
        String score, String course_nature, String test_nature, String learn_term) {

        this.uid = uid;
        this.college = college;
        this.course = course;
        this.credit = credit;
        this.hours = hours;
        this.classes = classes;
        this.sid = sid;
        this.gender = gender;
        this.score = score;
        this.course_nature = course_nature;
        this.test_nature = test_nature;
        this.learn_term = learn_term;
    }

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

    public String getCourse() {
        return course;
    }

    public void setCourse(String course) {
        this.course = course;
    }

    public float getCredit() {
        return credit;
    }

    public void setCredit(float credit) {
        this.credit = credit;
    }

    public float getHours() {
        return hours;
    }

    public void setHours(float hours) {
        this.hours = hours;
    }

    public String getClasses() {
        return classes;
    }

    public void setClasses(String classes) {
        this.classes = classes;
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

    public String getScore() {
        return score;
    }

    public void setScore(String score) {
        this.score = score;
    }

    public String getCourse_nature() {
        return course_nature;
    }

    public void setCourse_nature(String course_nature) {
        this.course_nature = course_nature;
    }

    public String getTest_nature() {
        return test_nature;
    }

    public void setTest_nature(String test_nature) {
        this.test_nature = test_nature;
    }

    public String getLearn_term() {
        return learn_term;
    }

    public void setLearn_term(String learn_term) {
        this.learn_term = learn_term;
    }
}

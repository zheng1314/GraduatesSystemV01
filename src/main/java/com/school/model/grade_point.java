package com.school.model;

/**
 * Created by zheng1718 on 17-5-11.
 */
public class grade_point {
    private int uid;
    private String college;
    private String major;
    private String classes;
    private String sid;
    private String gender;
    private float total_credit;
    private float learned_credit;
    private float point;
    private float notlearned_credit;
    private String graduation_audit;
    private String degree_audit;


    public grade_point() {}

    public grade_point(int uid, String college, String major, String classes,
        String sid, String gender, float total_credit, float learned_credit,
        float point, float notlearned_credit, String graduation_audit,String degree_audit) {

        this.uid = uid;
        this.college = college;
        this.major = major;
        this.classes = classes;
        this.sid = sid;
        this.gender = gender;
        this.total_credit = total_credit;
        this.learned_credit = learned_credit;
        this.point = point;
        this.notlearned_credit = notlearned_credit;
        this.graduation_audit = graduation_audit;
        this.degree_audit = degree_audit;
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

    public float getTotal_credit() {
        return total_credit;
    }

    public void setTotal_credit(float total_credit) {
        this.total_credit = total_credit;
    }

    public float getLearned_credit() {
        return learned_credit;
    }

    public void setLearned_credit(float learned_credit) {
        this.learned_credit = learned_credit;
    }

    public float getPoint() {
        return point;
    }

    public void setPoint(float point) {
        this.point = point;
    }

    public float getNotlearned_credit() {
        return notlearned_credit;
    }

    public void setNotlearned_credit(float notlearned_credit) {
        this.notlearned_credit = notlearned_credit;
    }

    public String getGraduation_audit() {
        return graduation_audit;
    }

    public void setGraduation_audit(String graduation_audit) {
        this.graduation_audit = graduation_audit;
    }

    public String getDegree_audit() {
        return degree_audit;
    }

    public void setDegree_audit(String degree_audit) {
        this.degree_audit = degree_audit;
    }
}

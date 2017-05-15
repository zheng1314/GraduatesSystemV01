package com.school.model;

/**
 * Created by zheng1718 on 17-5-11.
 */
public class award_info {
    private int uid;
    private String sid;
    private String major;
    private String award;

    public award_info() {
    }

    public award_info(int uid, String sid, String major, String award) {
        this.uid = uid;
        this.sid = sid;
        this.major = major;
        this.award = award;
    }

    public int getUid() {
        return uid;
    }

    public void setUid(int uid) {
        this.uid = uid;
    }

    public String getSid() {
        return sid;
    }

    public void setSid(String sid) {
        this.sid = sid;
    }

    public String getMajor() {
        return major;
    }

    public void setMajor(String major) {
        this.major = major;
    }

    public String getAward() {
        return award;
    }

    public void setAward(String award) {
        this.award = award;
    }
}

package com.school.model;

/**
 * Created by zheng1718 on 17-5-11.
 */
public class graduation_info {
    private String gender;
    private String employment;
    private String major;
    private String sid;
    private int uid;

    public graduation_info() {}

    public graduation_info(String gender, String employment, String major, String sid, int uid) {
        this.gender = gender;
        this.employment = employment;
        this.major = major;
        this.sid = sid;
        this.uid = uid;
    }

    public String getGender() {
        return gender;
    }

    public void setGender(String gender) {
        this.gender = gender;
    }

    public String getEmployment() {
        return employment;
    }

    public void setEmployment(String employment) {
        this.employment = employment;
    }

    public String getMajor() {
        return major;
    }

    public void setMajor(String major) {
        this.major = major;
    }

    public String getSid() {
        return sid;
    }

    public void setSid(String sid) {
        this.sid = sid;
    }

    public int getUid() {
        return uid;
    }

    public void setUid(int uid) {
        this.uid = uid;
    }
}

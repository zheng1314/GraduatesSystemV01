package com.school.model;

/**
 * Created by zheng1718 on 17-5-11.
 */
public class user_auths {
    private int uid;
    private String username;
    private String password;

    public user_auths() {}
    public user_auths(int uid, String username, String password) {
        this.uid = uid;
        this.username = username;
        this.password = password;
    }

    public int getUid() {
        return uid;
    }

    public void setUid(int uid) {
        this.uid = uid;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }
}

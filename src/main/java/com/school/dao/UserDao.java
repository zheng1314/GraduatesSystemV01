package com.school.dao;

import com.school.model.User;

/**
 * Created by ZHENG1617
 */

public interface UserDao {

    boolean add(String userName, String userPwd);
    boolean find(String userName);
    boolean find(String userName, String userPwd);
}

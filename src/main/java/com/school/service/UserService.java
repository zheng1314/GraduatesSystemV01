package com.school.service;

import com.school.model.User;

import java.util.List;

/**
 * Created by Zhangxq on 2016/7/15.
 */
public interface UserService {
    void registerUser(User user);
    boolean loginUser(String username, String userpwd);
}

package com.school.service.impl;

import com.school.dao.UserDao;
import com.school.dao.impl.UserDaoImpl;
import com.school.model.User;
import com.school.service.UserService;

/**
 * Created by ZHENG1718.
 */


public class UserServiceImpl implements UserService {

    private UserDao userDao = new UserDaoImpl();
    public void registerUser(User user) {
        if(userDao.find(user.getUserName())){
            System.out.println("用户已存在！");
            return;
        }userDao.add(user.getUserName(), user.getUserPwd());
    }

    public boolean loginUser(String username, String userpwd) {
        if(userDao.find(username))
            return userDao.find(username,userpwd);
        else
            return false;
    }
}

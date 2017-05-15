package com.school.dao.impl;

import com.school.dao.UserDao;
import com.school.model.User;
import com.school.utils.*;

import java.sql.ResultSet;
import java.sql.SQLException;

public class UserDaoImpl implements UserDao {
        private DBConn dbConn;
        private ResultSet resultSet;

    public boolean find(String userName) {
        System.out.println("select * from user where username='"+userName+"';");
        dbConn = new DBConn();
        resultSet = dbConn.doSelect("select * from user_auths where username='"+userName+"'");
        try {
                return resultSet.next();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }
    public boolean find(String userName, String userPwd) {
        dbConn = new DBConn();
        resultSet = dbConn.doSelect("select * from user_auths where userName='"+userName+"' AND password='"+ userPwd +"'" );
        try {
            return resultSet.next();
        }catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }

    public boolean add(String username, String userpwd) {
        if(find(username,userpwd)){
            System.out.println("看看find后是否false？");
            return false;
        }
        else {
            System.out.println("看看find为true是否执行？");
            dbConn = new DBConn();
            dbConn.doInsert("insert into user_auths (username, password) values('" + username +"', '" + userpwd + "')");
            return true;
        }
    }
}

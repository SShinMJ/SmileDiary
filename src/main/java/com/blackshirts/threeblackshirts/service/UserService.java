package com.blackshirts.threeblackshirts.service;

import com.blackshirts.threeblackshirts.data.User;

import java.util.List;

public interface UserService {
    void insertUser(User user);
    List<User> selectUserInfo();
    User getUserInfoByUseremail(String useremail);
}

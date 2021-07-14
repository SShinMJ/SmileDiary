package com.blackshirts.threeblackshirts.service;

import com.blackshirts.threeblackshirts.data.User;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.List;

public interface UserService {
    void insertUser(User user);
    boolean emailcheck(User user);
    boolean loginCheck(User user);
//    void setCookie(HttpServletResponse response)
//    boolean cookieCheck(HttpServletRequest request);
    List<User> selectUserInfo();
    User getUserInfoByUseremail(String useremail);
}

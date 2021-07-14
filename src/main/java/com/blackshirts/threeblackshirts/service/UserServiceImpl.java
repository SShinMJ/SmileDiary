package com.blackshirts.threeblackshirts.service;

import com.blackshirts.threeblackshirts.data.User;
import com.blackshirts.threeblackshirts.repository.UserRep;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.*;

@Service
public class UserServiceImpl implements UserService {

    private static final Logger log = LoggerFactory.getLogger(UserServiceImpl.class);

    private UserRep rep;

    public UserServiceImpl(UserRep rep) {
        this.rep = rep;
    }

    @Override
    public void insertUser(User user) {
        rep.insertUser(user);
    }

    public boolean emailcheck(User user) {
        if(getUserInfoByUseremail(user.getUseremail()) == null)
            return true;
        else
            return false;
    }
    @Override
    public boolean loginCheck(User user) {
        User checkUser = getUserInfoByUseremail(user.getUseremail());
        return checkUser.getUserpassword().equals(user.getUserpassword());
    }

    @Override
    public User getUserInfoByUseremail(String useremail) {
        return rep.selectUserInfoByUseremail(useremail);
    }

//    @Override
//    public void setCookie(HttpServletResponse response){
//        log.info("COOKIE CHECK");
//        Cookie cookie =new Cookie("userCookie",null); 	//userCookie라는 이름의 쿠키 생성
//        cookie.setComment("로그인 확인");		//해당 쿠키가 어떤 용도인지 커멘트
//        cookie.setMaxAge(60*60*24*365);			//해당 쿠키의 유효시간을 설정 (초 기준)
//        response.addCookie(cookie);
//    }
//
//    @Override
//    public boolean cookieCheck(HttpServletRequest request){
//        String user = null;
//        Cookie[] cookie = request.getCookies();
//
//        for(Cookie c : cookie){
//            if(c.getName().equals("userCookie")) {
//                user = c.getValue();
//                System.out.println("쿠기 : " + user);
//            }
//        }
//        if(user == null){
//            System.out.println("쿠키가 없습니다.");
//            return true;
//        }
//        else
//            return false;
//    }

    // repository는 DB와 연결되므로 이름지을 때 CRUD를 이용하고
    // 다른데에서는 get/set등을 이용
    // 메서드는 이름에서 내용을 유추할 수 있게
    @Override
    public List<User> selectUserInfo() {
        List<User> list = rep.selectUserInfo();
//        for(User u : list)
//            System.out.println(u);
        return list;
    }
}

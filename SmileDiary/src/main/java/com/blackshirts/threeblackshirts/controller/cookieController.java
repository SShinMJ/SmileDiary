package com.blackshirts.threeblackshirts.controller;

import com.blackshirts.threeblackshirts.data.User;
import com.blackshirts.threeblackshirts.utility.cookieUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@RestController
public class cookieController {

    private static final Logger log = LoggerFactory.getLogger(MainController.class);

    @Autowired
    private cookieUtil cookieUtil;

    @PostMapping("/user/cookieinsert")
    public void cookieInsert(HttpServletResponse response, @RequestBody User user){
        log.info("COOKIE INSERT");
        cookieUtil.setCookie(response, user);
    }

    @PostMapping("/user/cookiecheck")
    public boolean cookieCheck(HttpServletRequest request){
        log.info("COOKIE CHECK");
        return cookieUtil.cookieCheck(request);
    }

    @PostMapping("/user/cookiedelete")
    public void cookieDelete(HttpServletResponse response) {
        log.info("COOKIE DELETE");
        cookieUtil.deleteCookie(response);
    }

    @PostMapping("/user/cookiecheckpwd")
    public boolean cookieCheckPassword(HttpServletRequest request){
        log.info("COOKIE CHECK");
        return cookieUtil.cookieCheckPwd(request);
    }

    @PostMapping("/user/cookiedeletepwd")
    public void cookieDeletePassword(HttpServletResponse response) {
        log.info("COOKIE DELETE");
        cookieUtil.deleteCookiePwd(response);
    }
}

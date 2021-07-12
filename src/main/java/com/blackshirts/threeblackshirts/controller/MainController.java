package com.blackshirts.threeblackshirts.controller;

import com.blackshirts.threeblackshirts.data.User;
import com.blackshirts.threeblackshirts.service.UserServiceImpl;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import java.util.List;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

//@RestController // 데이터를 반환하는 어노테이션
@Controller // 페이지를 반환하는 어노테이션
public class MainController {

    private static final Logger log = LoggerFactory.getLogger(MainController.class);

    @Autowired
    private UserServiceImpl userService;

    // localhost:8080/
    @GetMapping("/")
    public String main() {
        log.debug("MAIN");
        return "main";
    }

    //localhost:8080/sign_up
    @GetMapping("/sign_up")
    public String sign_up() {
        log.info("SIGN_UP");
        return "sign_up";
    }

    @GetMapping("/find_user")
    public String find_user() {
        log.info("FIND_USER");
        return "find_user";
    }

    @ResponseBody // 데이터를 보냄
    @GetMapping("/users")
    public List<User> user() {
        log.error("USERS");
        // controller > service > repository > service > controller
        return userService.selectUserInfo();
    }

    @ResponseBody
    @GetMapping("/user")
    public User getUser(@RequestParam String useremail) {
        log.info("USER");
        return userService.getUserInfoByUseremail(useremail);
    }

    @ResponseBody
    @GetMapping("/insert")  //PostMapping으로 바꾸면 POST로 받는것?
    public void insert(User user) {
        userService.insertUser(user);
        System.out.println("INSERT");
    }
}

package com.blackshirts.threeblackshirts.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

@Controller // 페이지를 반환하는 어노테이션
public class PageController {

    private static final Logger log = LoggerFactory.getLogger(MainController.class);

    // localhost:8080/user/signin
    @GetMapping("/user/signin")
    public String main() {
        log.info("SIGN_IN");
        return "signin";
    }

    @GetMapping("/user/signup")
    public String signup() {
        log.info("SIGN_UP");
        return "signup";
    }

    @GetMapping("/user/finduser")
    public String finduser() {
        log.info("FIND_USER");
        return "finduser";
    }

    @GetMapping("/user/authcomplete")
    public String authcomplete() {
        log.info("AUTHENTICATION_COMPLETED");
        return "authcomplete";
    }

    @GetMapping("/user/changepwd")
    public String changepwd() {
        log.info("PASSWORD_CHANGE");
        return "changepwd";
    }

    @GetMapping("/diarymain")
    public String diarymain() {
        log.info("DIARY_MAIN");
        return "diarymain";
    }

    @GetMapping("/infopage")
    public String infopage() {
        log.info("INFORMATION_SETTING_PAGE");
        return "infopage";
    }

    @GetMapping("/diarysetting")
    public String diarysetting() {
        log.info("DIARY_SETTING_PAGE");
        return "diarysetting";
    }

    @GetMapping("/extrapage")
    public String extraPage() {
        log.info("EXTRA_PAGE");
        return "extrapage";
    }
}

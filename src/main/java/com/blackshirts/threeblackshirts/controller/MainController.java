package com.blackshirts.threeblackshirts.controller;

import com.blackshirts.threeblackshirts.data.User;
import com.blackshirts.threeblackshirts.service.UserServiceImpl;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.*;

import java.util.List;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

//@RestController // 데이터를 반환하는 어노테이션
@Controller // 페이지를 반환하는 어노테이션
public class MainController {

    private static final Logger log = LoggerFactory.getLogger(MainController.class);

    @Autowired
    private UserServiceImpl userService;

    // localhost:8080/
    @GetMapping("/sign_in")
    public String main() {
        log.debug("SIGN_IN");
        return "sign_in";
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

    @GetMapping("/diary_main")
    public String diary_main() {
        log.info("DIARY_MAIN");
        return "diary_main";
    }

    @ResponseBody // 데이터를 보냄
    @PostMapping("/users") //사용자 정보를 다룰 땐 Post
    public List<User> user() {
        log.error("USERS");
        // controller > service > repository > service > controller
        return userService.selectUserInfo();
    }

    @ResponseBody
    @PostMapping("/user") //RequestParam = HttpServletRequest 객체와 같은 역할
    public boolean getUser(@RequestBody User user) { //로그인
        log.info("USER");
        return userService.emailcheck(user);
    }

    @ResponseBody
    @PostMapping("/insert")
    public void insert(@RequestBody User user) { //회원가입
        userService.insertUser(user);
        log.info("INSERT");
    }

    @ResponseBody
    @PostMapping("/logincheck")
    public boolean login(@RequestBody User user){
        log.info("USER_CHECK");
        return userService.loginCheck(user);
    }

    @ResponseBody
    @PostMapping("/cookieinsert")
    public void cookieinsert(HttpServletResponse response){
        log.info("COOKIE INSERT");
        Cookie cookie =new Cookie("userCookie",null); 	//userCookie라는 이름의 쿠키 생성
        cookie.setComment("로그인 확인");		//해당 쿠키가 어떤 용도인지 커멘트
        cookie.setMaxAge(60*60*24*365);		//해당 쿠키의 유효시간을 설정 (초 기준)
        cookie.setPath("/"); // 모든 경로에서 접근 가능 하도록 설정
        response.addCookie(cookie);
    }

    @ResponseBody
    @PostMapping("/cookieCheck")
    public boolean cookieCheck(HttpServletRequest request){
        log.info("COOKIE CHECK");
        String user = null;
        Cookie[] cookie = request.getCookies();

        for(Cookie c : cookie){
            if(c.getName().equals("userCookie")) { //로그인시 저장된 쿠키 이름 = userCookie
                user = c.getValue();               //따라서 userCookie라는 쿠키가 있는지 확인
            }
        }
        if(user == null){
            return true;
        }
        else
            return false;
    }

    @ResponseBody
    @PostMapping("/cookieDelete")
    public void cookieDelete(HttpServletResponse response) {
        //원래 쿠키의 이름이 userCookie 이었다면, value를 null로 처리.
        Cookie cookie = new Cookie("userCookie", null);
        cookie.setMaxAge(0); // 쿠키의 expiration 타임을 0으로 하여 없앤다.
        cookie.setPath("/"); // 모든 경로에서 삭제 됬음을 알린다.
        response.addCookie(cookie);
    }

}

package com.blackshirts.threeblackshirts.controller;

import com.blackshirts.threeblackshirts.data.User;
import com.blackshirts.threeblackshirts.service.UserServiceImpl;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@RestController  //@ResponseBody가 기본으로 포함됨
public class UserController {

    private static final Logger log = LoggerFactory.getLogger(MainController.class);

    @Autowired
    private UserServiceImpl userService;

    // @ResponseBody 데이터를 보냄
    @PostMapping("/user/users") //사용자 정보를 다룰 땐 Post
    public List<User> user() {
        log.error("USERS");
        // controller > service > repository > service > controller
        return userService.selectUserInfo();
    }

    @PostMapping("/user/usernickname") //RequestParam = HttpServletRequest 객체와 같은 역할
    public boolean getUserNickname(@RequestBody User user) { //로그인
        log.info("USER NICKNAME CHECK");
        return userService.nickNameCheck(user);
    }


    @PostMapping("/user/useremail") //RequestParam = HttpServletRequest 객체와 같은 역할
    public boolean getUserEmail(@RequestBody User user) { //로그인
        log.info("USER EMAIL CHECK");
        log.info(user.toString());
        return userService.emailCheck(user);
    }

    @PostMapping("/user/insert")
    public void insert(@RequestBody User user) { //회원가입
        userService.insertUser(user);
        log.info("INSERT");
    }

    @PostMapping("/user/sendemailauth")
    public void sendEmailAuth(@RequestBody User user) { //회원가입
        userService.emailAuthentication(user);
        log.info("SEND EMAIL");
    }

    @GetMapping("/user/emailAuthentication")
    public ModelAndView emailAuthentication(@RequestParam Map<String, String> map, ModelAndView mav) {
        //email, authKey 가 일치할경우 authStatus 업데이트
        userService.updateAuthStatus(map);
        log.info("AUTHENTICATION");
        mav.addObject("display", "/authcomplete.jsp");
        mav.setViewName("/authcomplete");
        return mav;
    }

    @PostMapping("/user/checkauthentication")
    public int checkAuthentication(@RequestBody User user){
        log.info("AUTHENTICATION CHECK");
        log.info(user.toString());
        return userService.checkAuth(user);
    }

    @PostMapping("/user/logincheck")
    public boolean login(@RequestBody User user){
        log.info("USER_CHECK");
        return userService.loginCheck(user);
    }

    @PostMapping("/user/findid")
    public String findUserId(@RequestBody User user) {
        log.info("FIND ID");
        return userService.findId(user);
    }

    @PostMapping("/user/findpwd")
    public boolean findUserPassword(@RequestBody User user) {
        log.info("FIND PASSWORD");
        return userService.findPassword(user);
    }

    @PostMapping("/user/comfirmmailcode")
    public boolean comfrimMailCode(@RequestBody User user, HttpServletResponse response) {
        log.info("COMFIRM MAIL CODE");
        log.info(user.getUseremail());
        log.info(user.getAuthKey());
        return userService.comfirmCode(user, response);
    }

    @PostMapping("/user/changepwd")
    public void changePassword(@RequestBody User user, HttpServletRequest request) {
        log.info("CHANGE PASSWORD");
        log.info(user.getUserpassword());
        userService.changePwd(user, request);
    }

    @PostMapping("/user/infoinsert")
    public void infoInsert(@RequestBody User user) { //회원가입
        log.info("USER INFO UPDATE");
        userService.userInfoUpdate(user);
    }

    @PostMapping("/user/userinfocheck")
        public String[] userInfoCheck(@RequestBody User user) {
        log.info("USER INFO CHECK");
        return userService.userInfoCheck(user);
    }
}

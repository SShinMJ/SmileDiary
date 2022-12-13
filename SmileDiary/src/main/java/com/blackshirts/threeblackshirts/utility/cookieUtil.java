package com.blackshirts.threeblackshirts.utility;
import com.blackshirts.threeblackshirts.data.User;
import com.blackshirts.threeblackshirts.repository.UserRep;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Component;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@Component
public class cookieUtil {

    private static final Logger log = LoggerFactory.getLogger(cookieUtil.class);

    private UserRep rep;

    public cookieUtil(UserRep rep) {
        this.rep = rep;
    }

    public User getUserInfoByUseremail(String user_email) {
        return rep.selectUserInfoByUseremail(user_email);
    }

    public void setCookie(HttpServletResponse response, User user) {
        log.info("SET_COOKIE");
        User user_check = getUserInfoByUseremail(user.getUseremail());
        Cookie cookie = new Cookie("userCookie",user_check.getUserNickname());//userCookie라는 이름의 쿠키 생성
        cookie.setComment("로그인 확인");        //해당 쿠키가 어떤 용도인지 커멘트
        cookie.setMaxAge(60 * 60 * 24 * 365);        //해당 쿠키의 유효시간을 설정 (초 기준)
        cookie.setPath("/"); // 모든 경로에서 접근 가능 하도록 설정
        response.addCookie(cookie);
    }

    public boolean cookieCheck(HttpServletRequest request) {
        log.info("cookieCheck");
        String user = null;
        Cookie[] cookie = request.getCookies();

        for (Cookie c : cookie) {
            if (c.getName().equals("userCookie")) { //로그인시 저장된 쿠키 이름 = userCookie
                user = c.getValue();               //따라서 userCookie라는 쿠키가 있는지 확인
                log.info(user);
            }
        }
        if (user == null) {
            return true;
        } else {
            return false;
        }
    }

    public void deleteCookie(HttpServletResponse response) {
        log.info("DELETE_COOKIE");
        //원래 쿠키의 이름이 userCookie 이었다면, value를 null로 처리.
        Cookie cookie = new Cookie("userCookie", null);
        cookie.setMaxAge(0); // 쿠키의 expiration 타임을 0으로 하여 없앤다.
        cookie.setPath("/"); // 모든 경로에서 삭제 됬음을 알린다.
        response.addCookie(cookie);
    }

    public void setCookieForChangePwd(HttpServletResponse response, String user_email) {
        log.info("SET_COOKIE");
        Cookie cookie = new Cookie("ChangePWD",user_email);
        cookie.setComment("코드 인증 성공. 비밀번호 변경 가능 상태.");
        cookie.setPath("/"); // 모든 경로에서 접근 가능 하도록 설정
        response.addCookie(cookie);
    }

    public boolean cookieCheckPwd(HttpServletRequest request) {
        log.info("cookieCheck");
        String user = null;
        Cookie[] cookie = request.getCookies();

        for (Cookie c : cookie) {
            if (c.getName().equals("ChangePWD")) {
                user = c.getValue();
                log.info(user);
            }
        }
        if (user == null) {
            return true;
        } else
            return false;
    }

    public void deleteCookiePwd(HttpServletResponse response) {
        log.info("DELETE_COOKIE");
        //원래 쿠키의 이름이 userCookie 이었다면, value를 null로 처리.
        Cookie cookie = new Cookie("ChangePWD", null);
        cookie.setMaxAge(0); // 쿠키의 expiration 타임을 0으로 하여 없앤다.
        cookie.setPath("/"); // 모든 경로에서 삭제 됬음을 알린다.
        response.addCookie(cookie);
    }
}

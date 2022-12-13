package com.blackshirts.threeblackshirts.controller;

import com.blackshirts.threeblackshirts.data.TokenResponse;
import com.blackshirts.threeblackshirts.service.OauthService;
import com.blackshirts.threeblackshirts.service.UserService;
import lombok.extern.slf4j.Slf4j;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

@Controller
@CrossOrigin(origins = "*", allowedHeaders = "*")
@Slf4j
public class OauthController {

    private static final String ENDPOINT = "https://accounts.google.com/o/oauth2/v2/auth";
    private static final String CLIENT_ID = "571818594297-dkommrfriha4uqc6hnu3pgo0qktrltu4.apps.googleusercontent.com";
    private static final String REDIRECT_URI = "http://localhost:8080/auth/google/callback";
    private static final String RESPONSE_TYPE = "code";
    private static final String SCOPE = "https://www.googleapis.com/auth/userinfo.email https://www.googleapis.com/auth/userinfo.profile";

    private UserService userService;

    public OauthController(UserService userService) {
        this.userService = userService;
    }

    //사용자로부터 SNS 로그인 요청을 Social Login Type 을 받아 처리
    @GetMapping(value = "/auth/google")
    public String socialLogin() {
        return "redirect:" + ENDPOINT + "?client_id=" + CLIENT_ID + "&redirect_uri=" + REDIRECT_URI
                + "&response_type=" + RESPONSE_TYPE + "&scope=" + SCOPE;
    }

    /**
     * Social Login API Server 요청에 의한 callback을 처리
     * code : API Server 로부터 넘어오는 code
     * @return SNS Login 요청 결과로 받은 Json 형태의 String 문자열 (access_token, refresh_token 등)
     */
    @GetMapping(value = "/auth/google/callback")
    public String oauthLogin(String code) {
        String token = userService.oauthLogin(code);
        return "redirect:/diarymain";
    }
//    @GetMapping(value = "/google/callback")
//    public ResponseEntity<TokenResponse> oauthLogin(String code) {
//        String token = userService.oauthLogin(code);
//        return new ResponseEntity(new TokenResponse(token, "bearer"), HttpStatus.OK);
//    }
}

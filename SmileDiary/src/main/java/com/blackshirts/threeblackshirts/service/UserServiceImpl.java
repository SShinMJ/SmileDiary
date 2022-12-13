package com.blackshirts.threeblackshirts.service;

import com.blackshirts.threeblackshirts.data.DiarySetting;
import com.blackshirts.threeblackshirts.data.GoogleUser;
import com.blackshirts.threeblackshirts.data.OAuthToken;
import com.blackshirts.threeblackshirts.data.User;
import com.blackshirts.threeblackshirts.repository.DiarySettingRep;
import com.blackshirts.threeblackshirts.repository.UserRep;
import com.blackshirts.threeblackshirts.utility.cookieUtil;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Service;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.*;

@Service
public class UserServiceImpl implements UserService {

    private static final Logger log = LoggerFactory.getLogger(UserServiceImpl.class);

    private UserRep rep;
    private OauthService oauthService;
    private JwtTokenProvider jwtTokenProvider;
    private DiarySettingRep diarySet;

    @Autowired
    private AuthService mss;

    @Autowired
    private cookieUtil cookieUtil;

    public UserServiceImpl(UserRep rep, OauthService oauthService, JwtTokenProvider jwtTokenProvider, DiarySettingRep diarySet) {
        this.rep = rep;
        this.oauthService = oauthService;
        this.jwtTokenProvider = jwtTokenProvider;
        this.diarySet = diarySet;
    }

    @Override
    public void insertUser(User user) {
        log.info("USER INSERT");
        rep.insertUser(user);
        log.info("DIARYSETTING INSERT");
        log.info(user.getUserNickname());
        diarySet.insertdefalt(user.getUserNickname());
    }

    @Override
    public void emailAuthentication(User user) {
        //랜덤키 생성 및 이메일 전송
        String auth_Key = mss.sendAuthMail(user.getUseremail());
        log.info("EMAIL SEND COMPLIETE");
        //DB에 authKey 업데이트
        rep.insertAuthKey(auth_Key, user.getUseremail());
        log.info("AUTHKEY INSERT");
    }

    @Override
    public void updateAuthStatus(Map map) {
        String strKey = (String) map.get("authKey");
        String stremail = (String) map.get("email");
        log.info(strKey);
        log.info(stremail);
        if (getUserInfoByUseremail(stremail) != null) {
            User user_check = getUserInfoByUseremail(stremail);
            log.info(user_check.getAuthKey());
            log.info(user_check.getUseremail());
            if (user_check.getAuthKey().equals(strKey)) {
                rep.insertAuthStatus(stremail);
            }
        }
    }

    @Override
    public int checkAuth(User user) {
        User checkUser = getUserInfoByUseremail(user.getUseremail());
        return checkUser.getAuthStatus();
    }

    @Override
    public User getUserInfoByUseremail(String user_email) {
        return rep.selectUserInfoByUseremail(user_email);
    }

    @Override
    public User getUserInfoByUserNickname(String user_nickname) {
        return rep.selectUserInfoByUserNickname(user_nickname);
    }

    // repository는 DB와 연결되므로 이름지을 때 CRUD를 이용하고
    // 다른데에서는 get/set등을 이용
    // 메서드는 이름에서 내용을 유추할 수 있게
    @Override
    public List<User> selectUserInfo() {
        List<User> list = rep.selectUserInfo();
        for (User u : list)
            System.out.println(u);
        return list;
    }

    public boolean nickNameCheck(User user) {
        if (getUserInfoByUserNickname(user.getUserNickname()) == null)
            return true;
        else
            return false;
    }

    public boolean emailCheck(User user) {
        if (getUserInfoByUseremail(user.getUseremail()) == null)
            return true;
        else
            return false;
    }

    @Override
    public boolean loginCheck(User user) {
        User checkUser = getUserInfoByUseremail(user.getUseremail());
        if (checkUser.getUserpassword().equals(user.getUserpassword()))
            return true;
        else
            return false;
    }

    public String findId(User user) {
        log.info("FIND Id");
        if (getUserInfoByUserNickname(user.getUserNickname()) != null) {
            User checkUser = getUserInfoByUserNickname(user.getUserNickname());
            if (checkUser.getUserpassword().equals(user.getUserpassword())) {
                return checkUser.getUseremail();
            } else
                return "0";
        } else
            return "0";
    }

    public boolean findPassword(User user) {
        log.info("FIND PWD");
        if (getUserInfoByUserNickname(user.getUserNickname()) != null) {
            User checkUser = getUserInfoByUserNickname(user.getUserNickname());
            if (checkUser.getUseremail().equals(user.getUseremail())) {
                String auth_Key = mss.sendPwdMail(checkUser);
                log.info("EMAIL SEND COMPLIETE");
                //DB에 authKey 업데이트
                rep.insertAuthKey(auth_Key, checkUser.getUseremail());
                log.info("AUTHKEY INSERT");
                return true;
            } else
                return false;
        } else
            return false;
    }

    public boolean comfirmCode(User user, HttpServletResponse response) {
        if (getUserInfoByUseremail(user.getUseremail()) != null) {
            log.info("COMFIRM CODE");
            User checkUser = getUserInfoByUseremail(user.getUseremail());
            log.info(checkUser.getAuthKey());
            log.info(user.getAuthKey());
            if (checkUser.getAuthKey().equals(user.getAuthKey())) {
                cookieUtil.setCookieForChangePwd(response, checkUser.getUseremail());
                return true;
            } else
                return false;
        } else
            return false;
    }

    @Override
    public void changePwd(User user, HttpServletRequest request) {
        log.info("change password");
        Cookie[] cookie = request.getCookies();
        String user_email = "";

        for (Cookie c : cookie) {
            if (c.getName().equals("ChangePWD")) {
                user_email = c.getValue();
                log.info(user_email);
            }
        }

        user.setUseremail(user_email);
        log.info(user.getUseremail());

        if (getUserInfoByUseremail(user.getUseremail()) != null) {
            User changeUser = getUserInfoByUseremail(user.getUseremail());
            rep.changePassword(changeUser.getUseremail(), user.getUserpassword());
        }
    }

    @Override
    public String oauthLogin(String code) {
        ResponseEntity<String> accessTokenResponse = oauthService.createPostRequest(code);
        OAuthToken oAuthToken = oauthService.getAccessToken(accessTokenResponse);
        log.info("Access Token: {}", oAuthToken.getAccessToken());

        ResponseEntity<String> userInfoResponse = oauthService.createGetRequest(oAuthToken);
        GoogleUser googleUser = oauthService.getUserInfo(userInfoResponse);
        log.info("Google User Name: {}", googleUser.getName());

        String social_email = googleUser.getEmail();
        if (getUserInfoByUseremail(social_email) == null) {
            signUp(googleUser, oAuthToken);
        }
        return jwtTokenProvider.createToken(social_email);
    }

    @Override
    public void signUp(GoogleUser googleUser, OAuthToken oAuthToken) {
        User user = googleUser.toUser(oAuthToken.getAccessToken());
        rep.insertUser(user);
    }

    @Override
    public void userInfoUpdate(User user){
        if (getUserInfoByUserNickname(user.getUserNickname()) != null) {
            rep.infochange(user);
        }
    }

    @Override
    public String[] userInfoCheck(User user) {
        String[] user_info = new String[6];
        if (getUserInfoByUserNickname(user.getUserNickname()) != null) {
            User checkUser = getUserInfoByUserNickname(user.getUserNickname());
            if(checkUser.getUserinfoMBTI() != null){
                user_info[0] = checkUser.getUserinfoMBTI();
            }
            else{
                user_info[0] = "";
            }
            if(checkUser.getUserinfoAstro() != null){
                user_info[1] = checkUser.getUserinfoAstro();
            }
            else{
                user_info[1] = "";
            }
            if(checkUser.getUserinfoBtype() != null){
                user_info[2] = checkUser.getUserinfoBtype();
            }
            else{
                user_info[2] = "";
            }
            if(checkUser.getUserinfoFavclr() != null){
                user_info[3] = checkUser.getUserinfoFavclr();
            }
            else{
                user_info[3] = "";
            }
            if(checkUser.getUserinfoBday() != null){
                user_info[4] = checkUser.getUserinfoBday();
            }
            else{
                user_info[4] = "";
            }
            if(checkUser.getUserinfoGender() != null){
                user_info[5] = checkUser.getUserinfoGender();
            }
            else{
                user_info[5] = "";
            }
        }
        return user_info;
    }
}
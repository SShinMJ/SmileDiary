package com.blackshirts.threeblackshirts.service;

import com.blackshirts.threeblackshirts.data.GoogleUser;
import com.blackshirts.threeblackshirts.data.OAuthToken;
import com.blackshirts.threeblackshirts.data.User;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.List;
import java.util.Map;

public interface UserService {
    void insertUser(User user);
    void emailAuthentication(User user);
    void updateAuthStatus(Map map);
    int checkAuth(User user);
    List<User> selectUserInfo();
    boolean nickNameCheck(User user);
    boolean emailCheck(User user);
    boolean loginCheck(User user);
    User getUserInfoByUseremail(String user_email);
    User getUserInfoByUserNickname(String user_nickname);
    String findId(User user);
    boolean findPassword(User user);
    boolean comfirmCode(User user, HttpServletResponse response);
    void changePwd(User user, HttpServletRequest request);
    String oauthLogin(String code);
    void signUp(GoogleUser googleUser, OAuthToken oAuthToken);
    void userInfoUpdate(User user);
    String[] userInfoCheck(User user);
}

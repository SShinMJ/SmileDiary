package com.blackshirts.threeblackshirts.repository;

import com.blackshirts.threeblackshirts.data.DiarySetting;
import com.blackshirts.threeblackshirts.data.User;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper
public interface UserRep {
    List<User> selectUserInfo();
    void insertUser(User user);
    void insertAuthKey(String auth_key, String user_email);
    void insertAuthStatus(String user_email);
    //    User selectUserInfo(String user_email);
    User selectUserInfoByUseremail(String user_email);
    User selectUserInfoByUserNickname(String user_nickname);
    void changePassword(String user_email, String user_password);
    void infochange(User user);
}


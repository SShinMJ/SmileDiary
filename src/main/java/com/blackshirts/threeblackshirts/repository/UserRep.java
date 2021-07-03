package com.blackshirts.threeblackshirts.repository;

import com.blackshirts.threeblackshirts.data.User;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper
public interface UserRep {
    List<User> selectUserInfo();
    void insertUser(User user);
    User selectUserInfo(String useremail);
}

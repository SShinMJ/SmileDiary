package com.blackshirts.threeblackshirts.service;

import com.blackshirts.threeblackshirts.controller.MainController;
import com.blackshirts.threeblackshirts.data.User;
import com.blackshirts.threeblackshirts.repository.UserRep;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;

import java.util.*;

@Service
public class UserServiceImpl implements UserService {

    private static final Logger log = LoggerFactory.getLogger(UserServiceImpl.class);

    private UserRep rep;

    public UserServiceImpl(UserRep rep) {
        this.rep = rep;
    }

    @Override
    public void insertUser(User user) {
        rep.insertUser(user);
    }

    @Override
    public User getUserInfoByUseremail(String useremail) {
        return rep.selectUserInfo(useremail);
    }

    // repository는 DB와 연결되므로 이름지을 때 CRUD를 이용하고
    // 다른데에서는 get/set등을 이용
    // 메서드는 이름에서 내용을 유추할 수 있게
    @Override
    public List<User> selectUserInfo() {
        List<User> list = rep.selectUserInfo();
        for(User u : list)
            System.out.println(u);
        return list;
    }
}

package com.blackshirts.threeblackshirts.repository;

import com.blackshirts.threeblackshirts.data.User;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

//DAO인터페이스 : 향후 DB가 변경되더라도 DAO만 변경해서 처리할 수 있는 장점이 있다.
@Mapper
public interface UserRep {
    List<User> selectUserInfo();
    //insertUser를 호출할 때 ~Mapper.xml에서 User 객체를 호출한다.
    // == #{useremail},#{userpassword} 등을 사용할 수 있다.
    void insertUser(User user);
    User selectUserInfo(String useremail);
}

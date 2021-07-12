package com.blackshirts.threeblackshirts.data;

//도메인 클래스(VO객체) : 데이터베이스의 member테이블의 컬럼과 클래스의 변수명을 일치시켜
//맵핑하여 DB와 접근하는 클래스
//출처: https://min-it.tistory.com/8 [MIN-IT]
public class User {
    private String useremail;
    private String userpassword;

    @Override
    public String toString() {
        return "User{" +
                "useremail='" + useremail + '\'' +
                ", userpassword='" + userpassword + '\'' +
                '}';
    }

    public String getUseremail() {
        return useremail;
    }

    public void setUseremail(String useremail) {
        this.useremail = useremail;
    }

    public String getUserpassword() {
        return userpassword;
    }

    public void setUserpassword(String userpassword) {
        this.userpassword = userpassword;
    }
}

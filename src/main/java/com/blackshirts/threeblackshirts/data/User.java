package com.blackshirts.threeblackshirts.data;

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

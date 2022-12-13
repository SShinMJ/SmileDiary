package com.blackshirts.threeblackshirts.data;

import com.fasterxml.jackson.annotation.JsonCreator;
import com.fasterxml.jackson.annotation.JsonProperty;
import lombok.AllArgsConstructor;
import lombok.NoArgsConstructor;

@NoArgsConstructor
@AllArgsConstructor
public class User {
    private String user_nickname;
    private String user_email;
    private String user_password;
    private String auth_key;
    private int auth_status;
    private String userinfo_mbti;
    private String userinfo_astro;
    private String userinfo_btype;
    private String userinfo_favclr;
    private String userinfo_bday;
    private String userinfo_gender;

    //
//    public User(String user_nickname, String user_email, String user_password){
//        this.user_nickname = user_nickname;
//        this.user_email = user_email;
//        this.user_password = user_password;
//    }

    @JsonCreator
    public User(@JsonProperty("user_nickname") String user_nickname,
                @JsonProperty("user_email") String user_email,
                @JsonProperty("user_password") String user_password,
                @JsonProperty("auth_key") String auth_key,
                @JsonProperty("userinfo_mbti") String userinfo_mbti,
                @JsonProperty("userinfo_astro") String userinfo_astro,
                @JsonProperty("userinfo_btype") String userinfo_btype,
                @JsonProperty("userinfo_favclr") String userinfo_favclr,
                @JsonProperty("userinfo_bday") String userinfo_bday,
                @JsonProperty("userinfo_gender") String userinfo_gender) {
        this.user_nickname = user_nickname;
        this.user_email = user_email;
        this.user_password = user_password;
        this.auth_key = auth_key;
        this.userinfo_mbti = userinfo_mbti;
        this.userinfo_astro = userinfo_astro;
        this.userinfo_btype = userinfo_btype;
        this.userinfo_favclr = userinfo_favclr;
        this.userinfo_bday = userinfo_bday;
        this.userinfo_gender = userinfo_gender;

    }

    public User(String name, String email, String accessToken) {
        this.user_nickname = name;
        this.user_email = email;
        this.user_password = accessToken;
    }

    @Override
    public String toString() {
        return "User{" +
                "user_nickname='" + user_nickname + '\'' +
                ", user_email='" + user_email + '\'' +
                ", user_password='" + user_password + '\'' +
                '}';
    }

    public String getUserNickname() {
        return user_nickname;
    }
    public void setUserNickname(String user_nickname) {
        this.user_nickname = user_nickname;
    }
    public String getUseremail() {
        return user_email;
    }
    public void setUseremail(String user_email) {
        this.user_email = user_email;
    }
    public String getUserpassword() {
        return user_password;
    }
    public void setUserpassword(String user_password) {
        this.user_password = user_password;
    }
    public void setAuthKey(String auth_key) { this.auth_key = auth_key; }
    public String getAuthKey() { return auth_key; }
    public void setAuthStatus(int auth_status) { this.auth_status = auth_status; }
    public int getAuthStatus() { return auth_status; }
    public String getUserinfoMBTI() {
        return userinfo_mbti;
    }
    public String getUserinfoAstro() {
        return userinfo_astro;
    }
    public String getUserinfoBtype() {
        return userinfo_btype;
    }
    public String getUserinfoFavclr() {
        return userinfo_favclr;
    }
    public String getUserinfoBday() {
        return userinfo_bday;
    }
    public String getUserinfoGender() {
        return userinfo_gender;
    }

//    @Override
//    public boolean equals(Object obj) {
//        if (this == obj)
//            return true;
//        if (obj == null)
//            return false;
//        if (getClass() != obj.getClass())
//            return false;
//        User other = (User) obj;
//        if (useremail == null) {
//            if (other.useremail != null)
//                return false;
//        } else if (!useremail.equals(other.useremail))
//            return false;
//        if (userpassword == null) {
//            if (other.userpassword != null)
//                return false;
//        } else if (!userpassword.equals(other.userpassword))
//            return false;
//        return true;
//    }
//
//    @Override
//    public int hashCode() {
//        final int prime = 31;
//        int result = 1;
//        result = prime * result + ((useremail == null) ? 0 : useremail.hashCode());
//        result = prime * result + ((userpassword == null) ? 0 : userpassword.hashCode());
//        return result;
//    }
}

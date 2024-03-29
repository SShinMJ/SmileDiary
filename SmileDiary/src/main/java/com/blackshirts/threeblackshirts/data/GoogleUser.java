package com.blackshirts.threeblackshirts.data;

//액세스토큰을 사용해 받아 온 구글 사용자 정보를 담기 위한 클래스
public class GoogleUser {

    public String id;
    public String email;
    public Boolean verifiedEmail;
    public String name;
    public String givenName;
    public String familyName;
    public String picture;
    public String locale;

    public GoogleUser() {
    }

    public GoogleUser(String id, String email, Boolean verifiedEmail, String name, String givenName, String familyName, String picture, String locale) {
        this.id = id;
        this.email = email;
        this.verifiedEmail = verifiedEmail;
        this.name = name;
        this.givenName = givenName;
        this.familyName = familyName;
        this.picture = picture;
        this.locale = locale;
    }

    public User toUser(String accessToken) {
        return new User(name, email, accessToken);
    }

    public String getId() {
        return id;
    }

    public String getEmail() {
        return email;
    }

    public Boolean getVerifiedEmail() {
        return verifiedEmail;
    }

    public String getName() {
        return name;
    }

    public String getGivenName() {
        return givenName;
    }

    public String getFamilyName() {
        return familyName;
    }

    public String getPicture() {
        return picture;
    }

    public String getLocale() {
        return locale;
    }
}
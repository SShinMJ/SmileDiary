package com.blackshirts.threeblackshirts.data;

//액세스토큰 정보를 담기 위한 클래스
public class OAuthToken {

    private String accessToken;
    private String expiresIn;
    private String idToken;
    private String refreshToken;
    private String scope;
    private String tokenType;

    public OAuthToken() {
    }

    public OAuthToken(String accessToken, String expiresIn, String idToken, String refreshToken, String scope, String tokenType) {
        this.accessToken = accessToken;
        this.expiresIn = expiresIn;
        this.idToken = idToken;
        this.refreshToken = refreshToken;
        this.scope = scope;
        this.tokenType = tokenType;
    }

    public String getAccessToken() {
        return accessToken;
    }

    public String getExpiresIn() {
        return expiresIn;
    }

    public String getIdToken() {
        return idToken;
    }

    public String getRefreshToken() {
        return refreshToken;
    }

    public String getScope() {
        return scope;
    }

    public String getTokenType() {
        return tokenType;
    }
}

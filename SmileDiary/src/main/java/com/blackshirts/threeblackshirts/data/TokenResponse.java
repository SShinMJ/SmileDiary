package com.blackshirts.threeblackshirts.data;

//OAuth토큰을 담기 위한 클래스. (OAuth토큰 안에 액세스토큰이 들어 있다)
public class TokenResponse {

    private String accessToken;
    private String tokenType;

    public TokenResponse(String accessToken, String tokenType) {
        this.accessToken = accessToken;
        this.tokenType = tokenType;
    }

    public String getAccessToken() {
        return accessToken;
    }

    public String getTokenType() {
        return tokenType;
    }
}

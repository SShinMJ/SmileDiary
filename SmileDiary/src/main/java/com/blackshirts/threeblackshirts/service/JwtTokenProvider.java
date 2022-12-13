package com.blackshirts.threeblackshirts.service;

import io.jsonwebtoken.Claims;
import io.jsonwebtoken.Jws;
import io.jsonwebtoken.Jwts;
import io.jsonwebtoken.SignatureAlgorithm;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Component;

import java.util.Base64;
import java.util.Date;

//JWT토큰과 관련된 작업을 담당하는 클래스
//토큰 생성, 토큰에서 (유저)정보 추출, 토큰 유효성 확인
@Component
public class JwtTokenProvider {

    private static final Logger log = LoggerFactory.getLogger(UserServiceImpl.class);

    private String secretKey;
    private long validityInMilliseconds;

    public JwtTokenProvider(@Value("&{security.jwt.token.secret-key}") String secretKey, @Value("${security.jwt.token.expire-length}") long validityInMilliseconds) {
        this.secretKey = Base64.getEncoder().encodeToString(secretKey.getBytes());
        this.validityInMilliseconds = validityInMilliseconds;
    }

    // 토큰 생성
    public String createToken(String id) {
        Claims claims = Jwts.claims().setSubject(String.valueOf(id));

        Date now = new Date();
        Date validity = new Date(now.getTime() + validityInMilliseconds); // 유효기간 계산 (지금으로부터 + 유효시간)
        log.info("now: {}", now);
        log.info("validity: {}", validity);

        return Jwts.builder()
                .setClaims(claims) // sub 설정
                .setIssuedAt(now)
                .setExpiration(validity)
                .signWith(SignatureAlgorithm.HS256, secretKey) // 암호화방식?
                .compact();
    }

    // 토큰에서 값 추출
    public Long getSubject(String token) {
        return Long.valueOf(Jwts.parser()
                .setSigningKey(secretKey)
                .parseClaimsJws(token)
                .getBody()
                .getSubject());
    }

    // 유효한 토큰인지 확인
    public boolean validateToken(String token) {
        Jws<Claims> claims = Jwts.parser().setSigningKey(secretKey).parseClaimsJws(token);
        return !claims.getBody().getExpiration().before(new Date());
    }
}
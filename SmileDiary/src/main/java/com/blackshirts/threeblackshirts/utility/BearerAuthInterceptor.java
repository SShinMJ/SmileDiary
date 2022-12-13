package com.blackshirts.threeblackshirts.utility;

import com.blackshirts.threeblackshirts.service.JwtTokenProvider;
import com.blackshirts.threeblackshirts.service.UserServiceImpl;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.dao.EmptyResultDataAccessException;
import org.springframework.stereotype.Component;
import org.springframework.web.servlet.HandlerInterceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

//AppConfig에 등록할 인터셉터의 구현체
@Component
public class BearerAuthInterceptor implements HandlerInterceptor {

    private static final Logger log = LoggerFactory.getLogger(UserServiceImpl.class);

    private AuthorizationExtractor authorizationExtractor;
    private JwtTokenProvider jwtTokenProvider;

    public BearerAuthInterceptor(AuthorizationExtractor authorizationExtractor, JwtTokenProvider jwtTokenProvider) {
        this.authorizationExtractor = authorizationExtractor;
        this.jwtTokenProvider = jwtTokenProvider;
    }

    @Override
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) {
        log.info(">>> interceptor.preHandle 호출");
        String token = authorizationExtractor.extract(request, "Bearer");
        if (token.isEmpty()) {
            throw new EmptyResultDataAccessException(0);
        }

        if (!jwtTokenProvider.validateToken(token)) {
            throw new IllegalArgumentException("유효하지 않은 토큰");
        }

        Long id = jwtTokenProvider.getSubject(token);
        request.setAttribute("id", id);
        return true;
    }
}
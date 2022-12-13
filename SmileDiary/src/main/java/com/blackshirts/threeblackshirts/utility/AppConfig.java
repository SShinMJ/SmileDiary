package com.blackshirts.threeblackshirts.utility;

import com.blackshirts.threeblackshirts.service.UserServiceImpl;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.InterceptorRegistry;
import org.springframework.web.servlet.config.annotation.ResourceHandlerRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

//(JWT 토큰 검증을 위한) 인터셉터를 등록하는 클래스
//addInterceptors()에 등록된 URL에서만 토큰을 검증하게 됨
@Configuration
public class AppConfig implements WebMvcConfigurer {

    private static final Logger log = LoggerFactory.getLogger(UserServiceImpl.class);

    private final BearerAuthInterceptor bearerAuthInterceptor;

    public AppConfig(BearerAuthInterceptor bearerAuthInterceptor) { // 인터셉터 구현체를 만들어 등록함
        this.bearerAuthInterceptor = bearerAuthInterceptor;
    }

    @Override
    public void addInterceptors(InterceptorRegistry registry) {
        log.info(">>> 인터셉터 등록");
        registry.addInterceptor(bearerAuthInterceptor).addPathPatterns("/api/booking")
                .addPathPatterns("/api/booking/{bookingId}")
                .addPathPatterns("/api/rooms/{userId}/wish/{roomId}");
    }

    @Override
    public void addResourceHandlers(ResourceHandlerRegistry registry) {
        // Mac: path = "/Users/jules/deploy/board/storage";
        // ▶ file:////Users/jules/deploy/board/storage
        // JSP 인식되는 경로: http://localhost:8000/board/storage";
        // JSP 인식되는 경로를 위해서 addResourceHandler 추가
        registry.addResourceHandler("/board/storage/**").addResourceLocations("file:///" + Utility.getUploadDir());
    }

}
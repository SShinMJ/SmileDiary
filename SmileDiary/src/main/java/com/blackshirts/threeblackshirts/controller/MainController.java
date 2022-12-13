package com.blackshirts.threeblackshirts.controller;

import com.blackshirts.threeblackshirts.data.User;
import com.blackshirts.threeblackshirts.service.UserServiceImpl;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

//@RestController // 데이터를 반환하는 어노테이션
@Controller // 페이지를 반환하는 어노테이션
public class MainController {

    private static final Logger log = LoggerFactory.getLogger(MainController.class);

    @Autowired
    private UserServiceImpl userService;

}

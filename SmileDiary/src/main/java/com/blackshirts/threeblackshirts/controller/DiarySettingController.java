package com.blackshirts.threeblackshirts.controller;

import com.blackshirts.threeblackshirts.data.DiarySetting;
import com.blackshirts.threeblackshirts.service.DiarySettingServiceimpl;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class DiarySettingController {

    private static final Logger log = LoggerFactory.getLogger(MainController.class);

    @Autowired
    private DiarySettingServiceimpl diarySettingService;

    @PostMapping("/diarysetting/catagorycolorcheck")
    public int[] categoryColorCheck(@RequestBody DiarySetting user_setting){
        log.info("CATEGORY_COLOR_CHECK");
        return diarySettingService.categoryColorCheck(user_setting);
    }

    @PostMapping("/diarysetting/themecolorcheck")
    public String[] themeColorCheck(@RequestBody DiarySetting user_setting){
        log.info("THEME_COLOR_CHECK");
        return diarySettingService.themeColorCheck(user_setting);
    }

    @PostMapping("/diarysetting/fontcolorcheck")
    public String fontColorCheck(@RequestBody DiarySetting user_setting){
        log.info("FONT_COLOR_CHECK");
        return diarySettingService.fontColorCheck(user_setting);
    }

    @PostMapping("/diarysetting/categorycheck")
    public boolean categoryCheck(@RequestBody DiarySetting user_setting){
        log.info("CATEGORY_CHECK");
        return diarySettingService.categoryCounter(user_setting);
    }

    @PostMapping("/diarysetting/categorytrue")
    public void categoryTure(@RequestParam("user_nickname") String user_nickname, @RequestParam("category_name") String category_name){
        log.info("CATEGORY_EDIT_TURE");
        diarySettingService.categoryChangeTure(user_nickname, category_name);
    }

    @PostMapping("/diarysetting/categoryfalse")
    public void categoryFalse(@RequestParam("user_nickname") String user_nickname, @RequestParam("category_name") String category_name){
        log.info("CATEGORY_EDIT_FALSE");
        log.info(user_nickname + " and " + category_name);
        diarySettingService.categoryChangeFalse(user_nickname, category_name);
    }

    @PostMapping("/diarysetting/themechange")
    public void themeChange(DiarySetting user_setting){
        log.info("DIARY_THEME_CHANGE");
        diarySettingService.themecolorChange(user_setting);
    }

    @PostMapping("/diarysetting/fontchange")
    public void fontChange(DiarySetting user_setting){
        log.info("DIARY_FONT_CHANGE");
        diarySettingService.fontTypeChange(user_setting);
    }

}

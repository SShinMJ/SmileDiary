package com.blackshirts.threeblackshirts.service;

import com.blackshirts.threeblackshirts.controller.ResourceController;
import com.blackshirts.threeblackshirts.data.DiarySetting;
import com.blackshirts.threeblackshirts.repository.DiarySettingRep;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;

@Service
public class DiarySettingServiceimpl implements diarySettingService {

    private static final Logger log = LoggerFactory.getLogger(ResourceController.class);

    private DiarySettingRep rep;

    public DiarySettingServiceimpl(DiarySettingRep rep) {
        this.rep = rep;
    }

    @Override
    public DiarySetting getUserCtgByUserNickname(String user_nickname) {
        return rep.selectByUserNickname(user_nickname);
    }

    @Override
    public int[] categoryColorCheck(DiarySetting user_setting){
        log.info("categoryColorCheck");
        int[] ctg_user_color = new int[5];
        DiarySetting diary_setting = getUserCtgByUserNickname(user_setting.getUser_nickname());
        ctg_user_color[0] = diary_setting.getCtg_diary();
        ctg_user_color[1] = diary_setting.getCtg_photo();
        ctg_user_color[2] = diary_setting.getCtg_calendar();
        ctg_user_color[3] = diary_setting.getCtg_todo();
        ctg_user_color[4] = diary_setting.getCtg_guest();
        return ctg_user_color;
    }

    @Override
    public boolean categoryCounter(DiarySetting user_setting){
        DiarySetting DiarySetting = getUserCtgByUserNickname(user_setting.getUser_nickname());
        if(DiarySetting.getCtg_count() == 1)
            return false;
        return true;
    }

    @Override
    public void categoryChangeTure(String user_nickname, String category_name){
        log.info(user_nickname + " AND " + category_name);
        if(category_name.equals("category_diary"))
            rep.ctgDiaryTrue(user_nickname);
        else if(category_name.equals("category_photo"))
            rep.ctgPhotoTrue(user_nickname);
        else if(category_name.equals("category_calendar"))
            rep.ctgCalendarTrue(user_nickname);
        else if(category_name.equals("category_todo"))
            rep.ctgTodoTrue(user_nickname);
        else if(category_name.equals("category_guest"))
            rep.ctgGuestTrue(user_nickname);
        else
            log.info("Category name err");
    }

    @Override
    public void categoryChangeFalse(String user_nickname, String category_name){
        log.info(user_nickname + " AND " + category_name);
        if(category_name.equals("category_diary"))
            rep.ctgDiaryFalse(user_nickname);
        else if(category_name.equals("category_photo"))
            rep.ctgPhotoFalse(user_nickname);
        else if(category_name.equals("category_calendar"))
            rep.ctgCalendarFalse(user_nickname);
        else if(category_name.equals("category_todo"))
            rep.ctgTodoFalse(user_nickname);
        else if(category_name.equals("category_guest"))
            rep.ctgGuestFalse(user_nickname);
        else
            log.info("Category name err");
    }

    @Override
    public void themecolorChange(DiarySetting user_setting){
        log.info(user_setting.gettheme_type() + " " + user_setting.getBack_color() + " " + user_setting.getCover_color() + " " +
                user_setting.getPage_color() + " " + user_setting.getBookmark_color());
        rep.themechange(user_setting);
    }

    @Override
    public String[] themeColorCheck(DiarySetting user_setting){
        log.info("Theme Color Check");
        String[] theme_user_color = new String[5];
        DiarySetting diary_setting = getUserCtgByUserNickname(user_setting.getUser_nickname());
        theme_user_color[0] = String.valueOf(diary_setting.gettheme_type());
        theme_user_color[1] = diary_setting.getBack_color();
        theme_user_color[2] = diary_setting.getCover_color();
        theme_user_color[3] = diary_setting.getPage_color();
        theme_user_color[4] = diary_setting.getBookmark_color();
        return theme_user_color;
    }

    @Override
    public void fontTypeChange(DiarySetting user_setting){
        rep.fontchange(user_setting);
    }

    @Override
    public String fontColorCheck(DiarySetting user_setting){
        log.info("Font Color Check");
        String font_user_color = "";
        DiarySetting diary_setting = getUserCtgByUserNickname(user_setting.getUser_nickname());
        font_user_color = diary_setting.getFont_type();
        return font_user_color;
    }
}

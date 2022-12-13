package com.blackshirts.threeblackshirts.service;

import com.blackshirts.threeblackshirts.data.DiarySetting;

public interface diarySettingService {
    DiarySetting getUserCtgByUserNickname(String user_nickname);
    int[] categoryColorCheck(DiarySetting user_setting);
    boolean categoryCounter(DiarySetting user_setting);
    void categoryChangeTure(String user_setting, String category_name);
    void categoryChangeFalse(String user_setting, String category_name);
    void themecolorChange(DiarySetting user_setting);
    String[] themeColorCheck(DiarySetting user_setting);
    void fontTypeChange(DiarySetting user_setting);
    String fontColorCheck(DiarySetting user_setting);
}

package com.blackshirts.threeblackshirts.repository;

import com.blackshirts.threeblackshirts.data.DiarySetting;
import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface DiarySettingRep {
    void insertdefalt(String user_nickname);
    DiarySetting selectByUserNickname(String user_nickname);
    void ctgDiaryTrue(String user_nickname);
    void ctgPhotoTrue(String user_nickname);
    void ctgCalendarTrue(String user_nickname);
    void ctgTodoTrue(String user_nickname);
    void ctgGuestTrue(String user_nickname);
    void ctgDiaryFalse(String user_nickname);
    void ctgPhotoFalse(String user_nickname);
    void ctgCalendarFalse(String user_nickname);
    void ctgTodoFalse(String user_nickname);
    void ctgGuestFalse(String user_nickname);
    void themechange(DiarySetting diarySetting);
    void fontchange(DiarySetting diarySetting);
}

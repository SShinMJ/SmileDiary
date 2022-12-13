<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.-1 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
    <link rel="stylesheet" type="text/css" href="/css/bootstrap/bootstrap.css">
    <link rel="stylesheet" type="text/css" href="/css/diary_setting_style.css">
    <title>My Diary</title>
</head>
<script
        src="https://code.jquery.com/jquery-3.6.0.min.js"
        integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4="
        crossorigin="anonymous">
</script>
<body>
<div id="div_load_img">
    <img src="/css/img/loadingimg.gif" style="width: 150px; height: 150px;">
</div>


<div id="container">
    <div id="main_header">
        <div id="main_header_title">
            <h1 style="width: 300px" onclick="toMain()">Smile Diary :)</h1>
        </div>
        <!--
        <div class="wrap_btn" id="profilebtn" onclick="toInfo()">
            <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-person-bounding-box" viewBox="0 0 16 16">
                <path d="M1.5 1a.5.5 0 0 0-.5.5v3a.5.5 0 0 1-1 0v-3A1.5 1.5 0 0 1 1.5 0h3a.5.5 0 0 1 0 1h-3zM11 .5a.5.5 0 0 1 .5-.5h3A1.5 1.5 0 0 1 16 1.5v3a.5.5 0 0 1-1 0v-3a.5.5 0 0 0-.5-.5h-3a.5.5 0 0 1-.5-.5zM.5 11a.5.5 0 0 1 .5.5v3a.5.5 0 0 0 .5.5h3a.5.5 0 0 1 0 1h-3A1.5 1.5 0 0 1 0 14.5v-3a.5.5 0 0 1 .5-.5zm15 0a.5.5 0 0 1 .5.5v3a1.5 1.5 0 0 1-1.5 1.5h-3a.5.5 0 0 1 0-1h3a.5.5 0 0 0 .5-.5v-3a.5.5 0 0 1 .5-.5z"/>
                <path d="M3 14s-1 0-1-1 1-4 6-4 6 3 6 4-1 1-1 1H3zm8-9a3 3 0 1 1-6 0 3 3 0 0 1 6 0z"/>
            </svg>
            이미지 클릭시 profilepage.jsp로 이동, 프로필 관련 설정
        </div>
        -->
        <div class="wrap_btn" id="notification">
            <svg xmlns="http://www.w3.org/2000/svg" width="25" height="25" fill="currentColor" class="bi bi-bell-fill" viewBox="0 0 16 16">
                <path d="M8 16a2 2 0 0 0 2-2H6a2 2 0 0 0 2 2zm.995-14.901a1 1 0 1 0-1.99 0A5.002 5.002 0 0 0 3 6c0 1.098-.5 6-2 7h14c-1.5-1-2-5.902-2-7 0-2.42-1.72-4.44-4.005-4.901z"/>
            </svg>
            <!--이미지 클릭시 diarymain.jsp로 이동, 메인페이지로 이동-->
        </div>
        <div class="wrap_btn" id="infobtn" onclick="toInfo()">
            <svg xmlns="http://www.w3.org/2000/svg" width="25" height="25" fill="currentColor" class="bi bi-gear-fill" viewBox="0 0 16 16">
                <path d="M9.405 1.05c-.413-1.4-2.397-1.4-2.81 0l-.1.34a1.464 1.464 0 0 1-2.105.872l-.31-.17c-1.283-.698-2.686.705-1.987 1.987l.169.311c.446.82.023 1.841-.872 2.105l-.34.1c-1.4.413-1.4 2.397 0 2.81l.34.1a1.464 1.464 0 0 1 .872 2.105l-.17.31c-.698 1.283.705 2.686 1.987 1.987l.311-.169a1.464 1.464 0 0 1 2.105.872l.1.34c.413 1.4 2.397 1.4 2.81 0l.1-.34a1.464 1.464 0 0 1 2.105-.872l.31.17c1.283.698 2.686-.705 1.987-1.987l-.169-.311a1.464 1.464 0 0 1 .872-2.105l.34-.1c1.4-.413 1.4-2.397 0-2.81l-.34-.1a1.464 1.464 0 0 1-.872-2.105l.17-.31c.698-1.283-.705-2.686-1.987-1.987l-.311.169a1.464 1.464 0 0 1-2.105-.872l-.1-.34zM8 10.93a2.929 2.929 0 1 1 0-5.86 2.929 2.929 0 0 1 0 5.858z"/>
            </svg>
            <!--이미지 클릭시 settingpage.jsp로 이동, 다이어리 관련 설정-->
        </div>
        <div class="wrap_btn" id="logout">
            <svg xmlns="http://www.w3.org/2000/svg" width="27" height="25" fill="currentColor" class="bi bi-box-arrow-right" viewBox="0 0 16 16">
                <path fill-rule="evenodd" d="M10 12.5a.5.5 0 0 1-.5.5h-8a.5.5 0 0 1-.5-.5v-9a.5.5 0 0 1 .5-.5h8a.5.5 0 0 1 .5.5v2a.5.5 0 0 0 1 0v-2A1.5 1.5 0 0 0 9.5 2h-8A1.5 1.5 0 0 0 0 3.5v9A1.5 1.5 0 0 0 1.5 14h8a1.5 1.5 0 0 0 1.5-1.5v-2a.5.5 0 0 0-1 0v2z"/>
                <path fill-rule="evenodd" d="M15.854 8.354a.5.5 0 0 0 0-.708l-3-3a.5.5 0 0 0-.708.708L14.293 7.5H5.5a.5.5 0 0 0 0 1h8.793l-2.147 2.146a.5.5 0 0 0 .708.708l3-3z"/>
            </svg>
        </div>
    </div>

    <div id="main">
        <div id="diary">
            <div id="blank"></div>
            <div id="left_page" class="page">
                <div class="page_content">
                    <div class="setting_content">
                        <div class="setting_name">
                            카테고리 숨기기<hr style="margin-top: 5px; height: 2px">
                        </div>
                        <div id="category_item_box">
                            <button class='category_btn' id="category_diary" value='일기장' onclick="categoryEdit(this.id)">일기장</button>
                            <button class='category_btn' id="category_photo" value='사진첩' onclick="categoryEdit(this.id)">사진첩</button>
                            <button class='category_btn' id="category_calendar" value='달력' onclick="categoryEdit(this.id)">달력</button>
                            <button class='category_btn' id="category_todo" value='할일' onclick="categoryEdit(this.id)">할일</button>
                            <button class='category_btn' id="category_guest" value='방명록' onclick="categoryEdit(this.id)">방명록</button>
                        </div>
                    </div>

                    <div class="setting_content">
                        <div class="setting_name">
                            테마 색상<hr style="margin-top: 5px; height: 2px">
                        </div>
                        <div id="theme_type">
                            <div class="theme_type">
                            <label><input type="radio" id="template" name="theme" value="template" checked>&nbsp;&nbsp;&nbsp;&nbsp;기본 템플릿&nbsp;&nbsp;&nbsp;&nbsp;</label>
                                <div class="template_content" id="template_theme" style="display:inline;">
                                    <input type="text" name="theme_type" value="1" style="display: none" id="theme_template">
                                    <select id="color_list" name="color_list">
                                        <option value="blue">파랑</option>
                                        <option value="pink">분홍</option>
                                        <option value="purple">보라</option>
                                        <option value="yellow">노랑</option>
                                        <option value="black_white">흑백</option>
                                    </select>
                                    &nbsp;&nbsp;&nbsp;
                                    <button class="submit" id="template_submit" value="저장"onclick="templateColor()">저장</button>
                                </div>
                            </div>
                            <br>
                            <div class="theme_type">
                                <label><input type="radio" class="theme_type" id="custom" name="theme" value="custom">&nbsp;&nbsp;&nbsp;&nbsp;사용자 지정</label><br>
                                <div class="template_content" id="custom_theme" style="display: none">
                                    <iframe id="iframe1" name="iframe1" style="display:none"></iframe>
                                    <form action="/diarysetting/themechange" method="post" target="iframe1" name="theme_form" id="theme_form">
                                        <input type="text" name="user_nickname" value="" style="display: none" id="user_nickname">
                                        <input type="text" name="theme_type" value="0" style="display: none" id="theme_custom">
                                        <label class="theme_type_custom">
                                            바탕&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                            <input type="color" id="back_color" name="back_color" value="#c8dfe9">
                                            &nbsp;&nbsp;&nbsp;&nbsp;
                                            <span id="back_color_status"></span>
                                        </label><br>
                                        <label class="theme_type_custom">
                                            표지&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                            <input type="color" id="cover_color" name="cover_color" value="#a4c6de">
                                            &nbsp;&nbsp;&nbsp;&nbsp;
                                            <span id="cover_color_status"></span>
                                        </label><br>
                                        <label class="theme_type_custom">
                                            속지&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                            <input type="color" id="page_color" name="page_color" value="#eaebf1">
                                            &nbsp;&nbsp;&nbsp;&nbsp;
                                            <span id="page_color_status"></span>
                                        </label><br>
                                        <label class="theme_type_custom">
                                            책갈피&nbsp;&nbsp;&nbsp;
                                            <input type="color" id="bookmark_color" name="bookmark_color" value="#c8dfe9">
                                            &nbsp;&nbsp;&nbsp;&nbsp;
                                            <span id="bookmark_color_status"></span>
                                        </label><br>
                                        <!--<input type="submit" class="submit" id="custom_submit" value="저장">-->
                                        <input type="button" class="submit" id="custom_submit" value="저장">
                                    </form>
                                </div>
                            </div>

                        </div>
                    </div>
                </div>
            </div>

            <div id="right_page" class="page">
                <div class="page_content">
                    <div class="setting_content">
                        <div class="setting_name">
                            글꼴 변경<hr style="margin-top: 5px; height: 2px">
                        </div>
                        <div id="menu_font_contentbox">
                            <div id="menu_font_content_present">
                                <h5>글꼴</h5> <span id="user_setted_font">현재적용된 글꼴</span>
                                <button class="btn btn-info" id="present_font_btn" type="button" onclick="fontChange()">바꾸기</button>
                            </div>
                            <div id="menu_font_content_edit" style="display: none">
                                <label>
                                    <select id="font_select" onclick="fontSelect()">
                                        <option selected  value="EliceDigitalBaeum_Bold" style="font-family: 'EliceDigitalBaeum_Bold'">엘리스 디지털 배움체</option>
                                        <option value="GangwonEdu_OTFBoldA" style="font-family: 'GangwonEdu_OTFBoldA'">강원교육모두체</option>
                                        <option value="KyoboHandwriting2020A" style="font-family: 'KyoboHandwriting2020A'">교보손글씨체</option>
                                        <option value="KOTRAHOPE" style="font-family: 'KOTRAHOPE'">코트라희망체</option>
                                        <option value="MaruBuri-Regular" style="font-family: 'MaruBuri-Regular'">마루 부리체</option>
                                    </select>
                                </label>
                                <button class="btn btn-dark" type="button" onclick="fontChangeSave()">저장</button>
                                <button class="btn btn-light" type="button" onclick="fontChangeCancle()">취소</button>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

            <div id="category">
                <div id="category_title">

                </div>
                <div id="category_item_container">
                    <div class="category_item" id="toBoard" onclick="toBoard()">
                        <label>일기장</label>
                    </div>
                    <div class="category_item" id="toAlbum" onclick="toAlbum()">
                        <label>사진첩</label>
                    </div>
                    <div class="category_item" id="toCalendar" onclick="toCalendar()">
                        <label>달력</label>
                    </div>
                    <div class="category_item" id="toTodo" onclick="toTodo()">
                        <label>할 일</label>
                    </div>
                    <div class="category_item" id="toGuest" onclick="toGuest()">
                        <label>방명록</label>
                    </div>
                    <div class="category_item" id="toSetting" onclick="toSetting()">
                        <label>설정</label>
                    </div>
                </div>
            </div>
        </div>


    </div>
</div>
<script>

    window.onload = function (){
        $("#div_load_img").hide();
        document.getElementsByName("user_nickname").value = user_nickname;
    }
    $(document).ready(function() {
        $.ajax({
            url: "/user/cookiecheck",
            type: "POST",
            contentType: "application/json; charset-utf-8",
            success: function (data) {
                if(data) {
                    alert("로그인을 해주세요");
                    goSignIn();
                }
            },
            error: function () {
                alert("err");
            }
        })
        $('#logout').click(function() {
            $.ajax({
                url: "/user/cookiedelete",
                type: "POST",
                success: function () {
                    alert("로그아웃 되었습니다.");
                    goSignIn();
                },
                error: function () {
                    alert("err");
                }
            })
        })

        var button = document.getElementById("custom_submit");
        button.addEventListener("click", function () {
            document.getElementById("user_nickname").value = user_nickname;

            $("#theme_form").submit()
            window.location.reload()
        });

        $("#template").click(function() {
            document.getElementById("template_theme").style.display = "inline";
            document.getElementById("custom_theme").style.display = "none";
        });
        $("#custom").click(function() {
            document.getElementById("custom_theme").style.display = "";
            document.getElementById("template_theme").style.display = "none";
        });
    })

    //모든 페이지에 추가---------------------------------------------
    var user_nickname = getCookie();
    var ctg_diary_color = '0';
    var ctg_photo_color = '0';
    var ctg_calendar_color = '0';
    var ctg_todo_color = '0';
    var ctg_guest_color = '0';
    $.ajax({
        url: "/diarysetting/catagorycolorcheck",
        type: "POST",
        contentType: "application/json; charset-utf-8",
        data: JSON.stringify({user_nickname: user_nickname}),
        success: function (data) {
            if(data) {
                console.log(data);
                var ctg_diary_color = data[0];
                ctgUserColor("category_diary", ctg_diary_color);
                ctgUserSet("toBoard", ctg_diary_color);
                var ctg_photo_color = data[1];
                ctgUserColor("category_photo", ctg_photo_color);
                ctgUserSet("toAlbum", ctg_photo_color);
                var ctg_calendar_color = data[2];
                ctgUserColor("category_calendar", ctg_calendar_color);
                ctgUserSet("toCalendar", ctg_calendar_color);
                var ctg_todo_color = data[3];
                ctgUserColor("category_todo", ctg_todo_color);
                ctgUserSet("toTodo", ctg_todo_color);
                var ctg_guest_color = data[4];
                ctgUserColor("category_guest", ctg_guest_color);
                ctgUserSet("toGuest", ctg_guest_color);
            }
        },
        error: function () {
            alert("catagory color check err");
        }
    })

    function ctgUserColor(target_name, target_status){
        if(target_status == '0'){
            document.getElementById(target_name).style.backgroundColor = '#C1C1C1FF';
        }
        else if(target_status == '1') {
            document.getElementById(target_name).style.backgroundColor = '#6b6b6b';
        }
        else
            alert("ctg User Color err");
    }

    function ctgUserSet(target_name, target_status){
        if(target_status == '0'){
            document.getElementById(target_name).style.display = "none";
        }
        else if(target_status == '1') {
            document.getElementById(target_name).style.display = "";
        }
        else
            alert("ctg User Color err");
    }

    $.ajax({
        url: "/diarysetting/themecolorcheck",
        type: "POST",
        contentType: "application/json; charset-utf-8",
        data: JSON.stringify({user_nickname: user_nickname}),
        success: function (data) {
            if(data) {
                console.log(data);
                if(data[0] == "1"){
                    var ele = document.getElementsByName('theme');
                    ele[0].checked = true;
                    ele[1].checked = false;
                    document.getElementById("template_theme").style.display = "inline";
                    document.getElementById("custom_theme").style.display = "none";
                }
                else if(data[0] == "0"){
                    var ele = document.getElementsByName('theme');
                    ele[1].checked = true;
                    ele[0].checked = false;
                    document.getElementById("custom_theme").style.display = "";
                    document.getElementById("template_theme").style.display = "none";
                }

                var back_color = data[1];
                document.body.style.backgroundColor = back_color;
                document.getElementById("back_color").value = back_color;
                document.getElementById("back_color_status").innerText = "기존 색상 : " + back_color;
                var cover_color = data[2];
                document.getElementById("diary").style.backgroundColor = cover_color;
                document.getElementById("cover_color").value = cover_color;
                document.getElementById("cover_color_status").innerText = "기존 색상 : " + cover_color;
                var page_color = data[3];
                document.getElementsByClassName("page")[0].style.backgroundColor = page_color;
                document.getElementsByClassName("page")[1].style.backgroundColor = page_color;
                document.getElementById("page_color").value = page_color;
                document.getElementById("page_color_status").innerText = "기존 색상 : " + page_color;
                var bookmark_color = data[4];
                document.getElementsByClassName("category_item")[0].style.backgroundColor = bookmark_color;
                document.getElementsByClassName("category_item")[1].style.backgroundColor = bookmark_color;
                document.getElementsByClassName("category_item")[2].style.backgroundColor = bookmark_color;
                document.getElementsByClassName("category_item")[3].style.backgroundColor = bookmark_color;
                document.getElementsByClassName("category_item")[4].style.backgroundColor = bookmark_color;
                document.getElementsByClassName("category_item")[5].style.backgroundColor = bookmark_color;
                document.getElementById("bookmark_color").value = bookmark_color;
                document.getElementById("bookmark_color_status").innerText = "기존 색상 : " + bookmark_color;
            }
        },
        error: function () {
            alert("theme color check err");
        }
    })

    //글꼴 불러오기
    $.ajax({
        url: "/diarysetting/fontcolorcheck",
        type: "POST",
        contentType: "application/json; charset-utf-8",
        data: JSON.stringify({user_nickname: user_nickname}),
        success: function (data) {
            if(data) {
                console.log(data);
                document.getElementById('diary').style.fontFamily = data;
                if(data == "EliceDigitalBaeum_Bold"){
                    document.getElementById('user_setted_font').innerText = "엘리스 디지털 배움체";
                }
                else if(data == "GangwonEdu_OTFBoldA"){
                    document.getElementById('user_setted_font').innerText = "강원교육모두체";
                }
                else if(data == "KyoboHandwriting2020A"){
                    document.getElementById('user_setted_font').innerText = "교보손글씨체";
                }
                else if(data == "KOTRAHOPE"){
                    document.getElementById('user_setted_font').innerText = "코트라희망체";
                }
                else if(data == "MaruBuri-Regular"){
                    document.getElementById('user_setted_font').innerText = "마루 부리체";
                }
            }
        },
        error: function () {
            alert("Font color check err");
        }
    })
    //---------------------------------------------------------------

    function goSignIn(){
        location.href = "/user/signin";
    }

    function toBoard(){
        location.href = "/board/listpage";
    }

    function toMain(){
        location.href = "/diarymain";
    }

    function toInfo(){
        location.href = "/infopage";
    }

    function toAlbum(){
        location.href = "/extrapage";
    }

    function toCalendar(){
        location.href = "/extrapage";
    }

    function toTodo(){
        location.href = "/extrapage";
    }

    function toGuest(){
        location.href = "/extrapage";
    }

    function toSetting(){
        location.href = "/diarysetting";
    }

    function categoryEdit(target_id){
        console.log(target_id);
        var name = document.getElementById(target_id);
        var target = name.style.backgroundColor;
        console.log(target);
        console.log(user_nickname);
        if(target == 'rgb(193, 193, 193)'){
            $.ajax({
                url: "/diarysetting/categorytrue",
                type: "POST",
                data: {user_nickname: user_nickname, category_name: target_id},
                success:function(){
                    document.getElementById(target_id).style.backgroundColor = '#6b6b6b';
                    window.location.reload()
                },
                error: function () {
                    alert("category edit err");
                }
            })
        }
        else if(target == 'rgb(107, 107, 107)'){
            console.log("파란버튼 클릭")
            $.ajax({
                url: "/diarysetting/categorycheck",
                type: "POST",
                contentType: "application/json; charset=EUC-KR",
                data: JSON.stringify({user_nickname: user_nickname}),
                success:function(data){
                    if(data) {
                        $.ajax({
                            url: "/diarysetting/categoryfalse",
                            type: "POST",
                            data: {user_nickname: user_nickname, category_name: target_id},
                            success:function(){
                                document.getElementById(target_id).style.backgroundColor = '#C1C1C1FF';
                                window.location.reload()
                            },
                            error: function () {
                                alert("category edit err");
                            }
                        })
                    }
                    else {
                        alert("카테고리는 최소 하나 이상 존재하여야 합니다.");
                    }
                },
                error: function () {
                    alert("category check err");
                }
            })
        }
        else{
            alert("categoryEdit err");
        }
    }

    function templateColor(){
        var target = document.getElementById("color_list");
        if(target.options[target.selectedIndex].value == "blue"){
            var back_color = "#c8dfe9";
            var cover_color = "#a4c6de";
            var page_color = "#eaebf1";
            var bookmark_color = "#c8dfe9";
        }
        else if(target.options[target.selectedIndex].value == "pink"){
            var back_color = "#e9c8c8";
            var cover_color = "#dfa5a5";
            var page_color = "#f3eded";
            var bookmark_color = "#e9c8c8";
        }
        else if(target.options[target.selectedIndex].value == "purple"){
            var back_color = "#e2c8e9";
            var cover_color = "#bca4df";
            var page_color = "#f2edf3";
            var bookmark_color = "#e0c8e9";
        }
        else if(target.options[target.selectedIndex].value == "yellow") {
            var back_color = "#e7e9c8";
            var cover_color = "#dbdc79";
            var page_color = "#f2f3ed";
            var bookmark_color = "#e9e9c8";
        }
        else if(target.options[target.selectedIndex].value == "black_white"){
                var back_color = "#d9d9d9";
                var cover_color = "#303030";
                var page_color = "#ffffff";
                var bookmark_color = "#d9d9d9";
        }
        else{
            alert("template color err");
            return;
        }

        $.ajax({
            url: "/diarysetting/themechange",
            type: "POST",
            data: {user_nickname: user_nickname, back_color: back_color, theme_type: 1
                , cover_color: cover_color, page_color: page_color, bookmark_color: bookmark_color},
            success:function(){
                window.location.reload()
            },
            error: function () {
                alert("category edit err");
            }
        })
    }

    // 쿠키 가져오기 함수
    function getCookie() {
        cName = 'userCookie' + '=';
        var cookieData = document.cookie;
        var start = cookieData.indexOf(cName);
        var cValue = '';
        if(start != -1){
            start += cName.length;
            var end = cookieData.indexOf(';', start);
            if(end == -1)end = cookieData.length;
            cValue = cookieData.substring(start, end);
        }
        return unescape(cValue);
    }

    function fontChange(){
        document.getElementById('menu_font_content_edit').style.display = 'inline-block';
    }

    var select_font = '';
    function fontSelect(){
        var target = document.getElementById("font_select");
        if(target.options[target.selectedIndex].value == "EliceDigitalBaeum_Bold"){
            document.getElementById('font_select').style.fontFamily = 'EliceDigitalBaeum_Bold';
            select_font = 'EliceDigitalBaeum_Bold';
        }
        else if(target.options[target.selectedIndex].value == "GangwonEdu_OTFBoldA"){
            document.getElementById('font_select').style.fontFamily = 'GangwonEdu_OTFBoldA';
            select_font = 'GangwonEdu_OTFBoldA';
        }
        else if(target.options[target.selectedIndex].value == "KyoboHandwriting2020A"){
            document.getElementById('font_select').style.fontFamily = 'KyoboHandwriting2020A';
            select_font = 'KyoboHandwriting2020A';
        }
        else if(target.options[target.selectedIndex].value == "KOTRAHOPE") {
            document.getElementById('font_select').style.fontFamily = 'KOTRAHOPE';
            select_font = 'KOTRAHOPE';
        }
        else if(target.options[target.selectedIndex].value == "MaruBuri-Regular"){
            document.getElementById('font_select').style.fontFamily = 'MaruBuri-Regular';
            select_font = 'MaruBuri-Regular';
        }
        else{
            alert("template font err");
            return;
        }
    }

    function fontChangeSave(){
        $.ajax({
            url: "/diarysetting/fontchange",
            type: "POST",
            data: {user_nickname: user_nickname, font_type: select_font},
            success:function(){
                window.location.reload()
            },
            error: function () {
                alert("font edit err");
            }
        })
    }

    function fontChangeCancle(){
        document.getElementById('menu_font_content_edit').style.display = 'none';
    }

</script>
</body>
</html>
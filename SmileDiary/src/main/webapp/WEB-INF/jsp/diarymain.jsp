<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.-1 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <link rel="stylesheet" type="text/css" href="/css/bootstrap/bootstrap.css">
    <link rel="stylesheet" type="text/css" href="/css/diary_main_style.css">
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
            �̹��� Ŭ���� profilepage.jsp�� �̵�, ������ ���� ����
        </div>
        -->
        <div class="wrap_btn" id="notification">
            <svg xmlns="http://www.w3.org/2000/svg" width="25" height="25" fill="currentColor" class="bi bi-bell-fill" viewBox="0 0 16 16">
                <path d="M8 16a2 2 0 0 0 2-2H6a2 2 0 0 0 2 2zm.995-14.901a1 1 0 1 0-1.99 0A5.002 5.002 0 0 0 3 6c0 1.098-.5 6-2 7h14c-1.5-1-2-5.902-2-7 0-2.42-1.72-4.44-4.005-4.901z"/>
            </svg>
            <!--�̹��� Ŭ���� diarymain.jsp�� �̵�, ������������ �̵�-->
        </div>
        <div class="wrap_btn" id="infobtn" onclick="toInfo()">
            <svg xmlns="http://www.w3.org/2000/svg" width="25" height="25" fill="currentColor" class="bi bi-gear-fill" viewBox="0 0 16 16">
                <path d="M9.405 1.05c-.413-1.4-2.397-1.4-2.81 0l-.1.34a1.464 1.464 0 0 1-2.105.872l-.31-.17c-1.283-.698-2.686.705-1.987 1.987l.169.311c.446.82.023 1.841-.872 2.105l-.34.1c-1.4.413-1.4 2.397 0 2.81l.34.1a1.464 1.464 0 0 1 .872 2.105l-.17.31c-.698 1.283.705 2.686 1.987 1.987l.311-.169a1.464 1.464 0 0 1 2.105.872l.1.34c.413 1.4 2.397 1.4 2.81 0l.1-.34a1.464 1.464 0 0 1 2.105-.872l.31.17c1.283.698 2.686-.705 1.987-1.987l-.169-.311a1.464 1.464 0 0 1 .872-2.105l.34-.1c1.4-.413 1.4-2.397 0-2.81l-.34-.1a1.464 1.464 0 0 1-.872-2.105l.17-.31c.698-1.283-.705-2.686-1.987-1.987l-.311.169a1.464 1.464 0 0 1-2.105-.872l-.1-.34zM8 10.93a2.929 2.929 0 1 1 0-5.86 2.929 2.929 0 0 1 0 5.858z"/>
            </svg>
            <!--�̹��� Ŭ���� settingpage.jsp�� �̵�, ���̾ ���� ����-->
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
                <div id="main_pic_area">
                    <div id="main_pic">
                        <img id="title_img" src="/css/img/smile_diary_simple.png" alt="" style="object-fit: contain"/>
                    </div>
                </div>
                <div id="main_intro_area">
                    <div id="main_intro_detail">
                        <div class="main_intro_detail_class" id="mbti">
                            <div class="main_intro_detail_class_pic" id="user_mbti"> ����� </div>
                            <div class="main_intro_detail_class_name"> MBTI </div>
                        </div>
                        <div class="main_intro_detail_class" id="astro">
                            <div class="main_intro_detail_class_pic" id="user_astro"> ����� </div>
                            <div class="main_intro_detail_class_name"> ���ڸ� </div>
                        </div>
                        <div class="main_intro_detail_class" id="fav_color">
                            <div class="main_intro_detail_class_pic" id="user_fav_color"> ����� </div>
                            <div class="main_intro_detail_class_name"> �����ϴ� �� </div>
                        </div>
                    </div>
                </div>

            </div>

            <div id="right_page" class="page">
                <div id="calendar_area">
                    <div id="calendar_area_dates">
                        <jsp:include page="calendar.jsp"/>
                    </div>

                </div>

                <div id="daily_checkup_area">

                    <div id="daily_mood_area">
                        <div class="daily_mood">
                            <div class="daily_mood_img"></div>
                            <div class="daily_mood_check">
                                <label>
                                    <input type="radio" name="daily_mood_happy">
                                </label>
                            </div>
                        </div>

                        <div class="daily_mood">
                            <div class="daily_mood_img"></div>
                            <div class="daily_mood_check">
                                <label>
                                    <input type="radio" name="daily_mood_sad">
                                </label>

                            </div>
                        </div>

                        <div class="daily_mood">
                            <div class="daily_mood_img"></div>
                            <div class="daily_mood_check">
                                <label>
                                    <input type="radio" name="daily_mood_mad">
                                </label>

                            </div>
                        </div>
                    </div>

                    <div id="daily_todo">
                        <div id="daily_todo_title">
                            <h4>TO DO</h4>
                        </div>
                        <div id="daily_todo_list">
                            <div class="daily_todo_list_content">
                                <span>todo 1</span>
                                <label>
                                    <input type="checkbox">
                                </label>
                            </div>

                            <div class="daily_todo_list_content">
                                <span>todo 2</span>
                                <label>
                                    <input type="checkbox">
                                </label>
                            </div>

                            <div class="daily_todo_list_content">
                                <span>todo 3</span>
                                <label>
                                    <input type="checkbox">
                                </label>
                            </div>

                            <div class="daily_todo_list_content">
                                <span>todo 4</span>
                                <label>
                                    <input type="checkbox">
                                </label>
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
                        <label>�ϱ���</label>
                    </div>
                    <div class="category_item" id="toAlbum" onclick="toAlbum()">
                        <label>����ø</label>
                    </div>
                    <div class="category_item" id="toCalendar" onclick="toCalendar()">
                        <label>�޷�</label>
                    </div>
                    <div class="category_item" id="toTodo" onclick="toTodo()">
                        <label>�� ��</label>
                    </div>
                    <div class="category_item" id="toGuest" onclick="toGuest()">
                        <label>�����</label>
                    </div>
                    <div class="category_item" id="toSetting" onclick="toSetting()">
                        <label>����</label>
                    </div>
                </div>
            </div>
        </div>


    </div>
</div>

<script>

    window.onload = function (){
        $("#div_load_img").hide();
    }
    $(document).ready(function() {
        $.ajax({
            url: "/user/cookiecheck",
            type: "POST",
            contentType: "application/json; charset-utf-8",
            success: function (data) {
                if(data) {
                    alert("�α����� ���ּ���");
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
                    alert("�α׾ƿ� �Ǿ����ϴ�.");
                    goSignIn();
                },
                error: function () {
                    alert("err");
                }
            })
        })
    })
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

    //��� �������� �߰�---------------------------------------------
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
                ctgUserSet("toBoard", ctg_diary_color);
                var ctg_photo_color = data[1];
                ctgUserSet("toAlbum", ctg_photo_color);
                var ctg_calendar_color = data[2];
                ctgUserSet("toCalendar", ctg_calendar_color);
                var ctg_todo_color = data[3];
                ctgUserSet("toTodo", ctg_todo_color);
                var ctg_guest_color = data[4];
                ctgUserSet("toGuest", ctg_guest_color);
            }
        },
        error: function () {
            alert("catagory color check err");
        }
    })

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
                var back_color = data[1];
                document.body.style.backgroundColor = back_color;
                document.getElementById("main").style.backgroundColor = back_color;
                var cover_color = data[2];
                document.getElementById("diary").style.backgroundColor = cover_color;
                var page_color = data[3];
                document.getElementsByClassName("page")[0].style.backgroundColor = page_color;
                document.getElementsByClassName("page")[1].style.backgroundColor = page_color;
                var bookmark_color = data[4];
                document.getElementsByClassName("category_item")[0].style.backgroundColor = bookmark_color;
                document.getElementsByClassName("category_item")[1].style.backgroundColor = bookmark_color;
                document.getElementsByClassName("category_item")[2].style.backgroundColor = bookmark_color;
                document.getElementsByClassName("category_item")[3].style.backgroundColor = bookmark_color;
                document.getElementsByClassName("category_item")[4].style.backgroundColor = bookmark_color;
                document.getElementsByClassName("category_item")[5].style.backgroundColor = bookmark_color;
            }
        },
        error: function () {
            alert("theme color check err");
        }
    })

    //�۲� �ҷ�����
    $.ajax({
        url: "/diarysetting/fontcolorcheck",
        type: "POST",
        contentType: "application/json; charset-utf-8",
        data: JSON.stringify({user_nickname: user_nickname}),
        success: function (data) {
            if(data) {
                console.log(data);
                document.getElementById('diary').style.fontFamily = data;
            }
        },
        error: function () {
            alert("Font color check err");
        }
    })

    //����� ���� �ҷ�����
    $.ajax({
        url: "/user/userinfocheck",
        type: "POST",
        contentType: "application/json; charset-utf-8",
        data: JSON.stringify({user_nickname: user_nickname}),
        success: function (data) {
            if(data != null) {
                if(data[0] != ""){
                    console.info(data[0]);
                    document.getElementById('user_mbti').innerText = data[0];
                }
                if(data[1] != ""){
                    console.info(data[1]);
                    document.getElementById('user_astro').innerText = data[1]+"��";
                }
                if(data[3] != ""){
                    console.info(data[3]);
                    document.getElementById('user_fav_color').innerText = data[3];
                }
            }
        },
        error: function () {
            alert("user info check err");
        }
    })

    // ��Ű �������� �Լ�
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
    //---------------------------------------------------------------

</script>

<script type="text/javascript" src="/bootstrapjs/bootstrap.js"></script>
</body>
</html>
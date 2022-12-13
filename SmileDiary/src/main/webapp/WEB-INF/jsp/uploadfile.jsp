<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
    <link rel="stylesheet" type="text/css" href="/css/post_detail_style.css">
    <title>upload file</title>

    <script>
        function registerFile() {
            $.ajax({
                type: "POST",
                enctype: "multipart/form-data",
                url: "/uploadfile",
                data: formData,
                processData: false,
                contentType: false,
                success: function (data) {
                    if (JSON.parse(data)['result'] == "OK") {
                        window.close();
                        alert("파일업로드 성공");
                    } else
                        alert("파일업로드 실패");
                },
                error: function (xhr, status, error) {
                    alert("코드가 잘못되었음");
                    return false;
                }
            });
            return false;
        }
    </script>
</head>
<body>
<div class="upload_container" style="margin : 70px;">
    <h2>파일업로드</h2>
    <form name="dataForm" id="dataForm" onsubmit="return registerFile()">

        <button id="btn-upload" type="button" class="btn btn-default">파일 추가</button>
        <input id="filenameMF" multiple="multiple" type="file" class="form-control" name="filenameMF">
        <span style="font-size:10px; color: gray;">※첨부파일은 최대 3개까지 등록이 가능합니다.</span> <br/>

        <span>첨부 파일</span>
        <div class="data_file_txt" id="data_file_txt" style="margin:40px;"></div>
        <button type="submit" class="btn btn-default">전송</button>
    </form>
</div>

<script>
    //모든 페이지에 추가---------------------------------------------
    // var user_nickname = getCookie();
    // var ctg_diary_color = '0';
    // var ctg_photo_color = '0';
    // var ctg_calender_color = '0';
    // var ctg_todo_color = '0';
    // var ctg_guest_color = '0';
    // $.ajax({
    //     url: "/diarysetting/catagorycolorcheck",
    //     type: "POST",
    //     contentType: "application/json; charset-utf-8",
    //     data: JSON.stringify({user_nickname: user_nickname}),
    //     success: function (data) {
    //         if(data) {
    //             console.log(data);
    //             var ctg_diary_color = data[0];
    //             ctgUserSet("toBoard", ctg_diary_color);
    //             var ctg_photo_color = data[1];
    //             ctgUserSet("toAlbum", ctg_photo_color);
    //             var ctg_calender_color = data[2];
    //             ctgUserSet("toCalendar", ctg_calender_color);
    //             var ctg_todo_color = data[3];
    //             ctgUserSet("toTodo", ctg_todo_color);
    //             var ctg_guest_color = data[4];
    //             ctgUserSet("toGuest", ctg_guest_color);
    //         }
    //     },
    //     error: function () {
    //         alert("catagory color check err");
    //     }
    // })
    //
    // function ctgUserSet(target_name, target_status){
    //     if(target_status == '0'){
    //         document.getElementById(target_name).style.display = "none";
    //     }
    //     else if(target_status == '1') {
    //         document.getElementById(target_name).style.display = "";
    //     }
    //     else
    //         alert("ctg User Color err");
    // }
    //
    // $.ajax({
    //     url: "/diarysetting/themecolorcheck",
    //     type: "POST",
    //     contentType: "application/json; charset-utf-8",
    //     data: JSON.stringify({user_nickname: user_nickname}),
    //     success: function (data) {
    //         if(data) {
    //             var back_color = data[1];
    //             document.body.style.backgroundColor = back_color;
    //             document.getElementById("main").style.backgroundColor = back_color;
    //             var cover_color = data[2];
    //             document.getElementById("diary").style.backgroundColor = cover_color;
    //             var page_color = data[3];
    //             document.getElementsByClassName("page")[0].style.backgroundColor = page_color;
    //             document.getElementsByClassName("page")[1].style.backgroundColor = page_color;
    //             var bookmark_color = data[4];
    //             document.getElementsByClassName("category_item")[0].style.backgroundColor = bookmark_color;
    //             document.getElementsByClassName("category_item")[1].style.backgroundColor = bookmark_color;
    //             document.getElementsByClassName("category_item")[2].style.backgroundColor = bookmark_color;
    //             document.getElementsByClassName("category_item")[3].style.backgroundColor = bookmark_color;
    //             document.getElementsByClassName("category_item")[4].style.backgroundColor = bookmark_color;
    //             document.getElementsByClassName("category_item")[5].style.backgroundColor = bookmark_color;
    //         }
    //     },
    //     error: function () {
    //         alert("theme color check err");
    //     }
    // })
    //
    // // 쿠키 가져오기 함수
    // function getCookie() {
    //     cName = 'userCookie' + '=';
    //     var cookieData = document.cookie;
    //     var start = cookieData.indexOf(cName);
    //     var cValue = '';
    //     if(start != -1){
    //         start += cName.length;
    //         var end = cookieData.indexOf(';', start);
    //         if(end == -1)end = cookieData.length;
    //         cValue = cookieData.substring(start, end);
    //     }
    //     return unescape(cValue);
    // }
    //---------------------------------------------------------------
</script>
</body>
</html>

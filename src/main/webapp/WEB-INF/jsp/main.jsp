<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR" %>
<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.DriverManager" %>
<%@ page import="java.sql.PreparedStatement" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.-1 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
    <title>Main</title>
</head>
<script
        src="https://code.jquery.com/jquery-3.6.0.slim.js"
        integrity="sha256-HwWONEZrpuoh951cQD1ov2HUK5zA5DwJ1DNUXaM6FsY="
        crossorigin="anonymous"></script>
<script>
    function checkemail(str)    {
        var reg_email = /^([0-9a-zA-Z_\.-]+)@([0-9a-zA-Z_-]+)(\.[0-9a-zA-Z_-]+){1,2}$/;
        if(reg_email.test(str))
            return true;
        else
            return false;
    }
    function checkpassword(str) {
        var reg_pwd = /^(?=.*?[a-z])(?=.*?[0-9]).{8,}$/;
        if(reg_pwd.test(str))
            return true;
        else
            return false;
    }

    $(document).ready(function() {
        $('#submit').click(function() {
            var useremail = $('#useremail').val();
            var userpassword = $('#userpassword').val();
            if(checkemail(useremail)) {   //이메일 형식 체크
                if(checkpassword(userpassword)) { //비밀번호 형식 체크
                    console.log(useremail + "\t" + userpassword);
                    // //1.orcle driver 로딩...
                    // // lib폴더에 ojdbc6.jar을 복사해서 넣어야 실행가능
                    // Class.forName("oracle.jdbc.driver.OracleDriver");
                    //
                    // //2.DB연결
                    // // 첫번째 매개변수는 오라클주소, 두번째매게변수 사용자ID, 세번째 사용자패스워드
                    // Connection conn = DriverManager.getConnection("jdbc:oracle:thin:@localhost:3306:xe","root","217151");
                    // //3.쿼리실행문장 준비
                    // //insert쿼리 실행문장을 넣어줍니다.
                    // PreparedStatement user = conn.prepareStatement("insert into user(useremail, userpassword)values(?, ?)");
                    // //values값을 셋팅
                    // user.setInt(1, s_id);
                    // user.setString(2, s_pwd);
                    // //4.쿼리실행
                    // user.executeUpdate();

                    // $.ajax({
                    //     url: '데이터를 보낼 곳 url',
                    //     type: 'post',
                    //     data: {"id": useremail,
                    //         "pwd": userpassword},
                    //     success: function (data) {
                    //         alert("데이터 전송이 성공적으로 끝났을 때 실행");
                    //     }
                    // });

                }
                else
                    alert('비밀번호는 8자 이상이어야 하며, 숫자/소문자를 포함해야 합니다.');
            }
            else
                alert('잘못된 이메일 형식입니다.');
        })
    })
</script>
<body>
USEREMAIL
<input type="text" id="useremail"/> <br>
USERPASSWORD
<input type="password" id="userpassword"/> <br>
<button id="submit">SUBMIT</button>
</body>
</html>
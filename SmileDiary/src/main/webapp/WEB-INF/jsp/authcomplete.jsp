<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.-1 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
    <link rel="stylesheet" type="text/css" href="/css/auth_complete_style.css">
    <title>Authorization Complete</title>
</head>
<script
        src="https://code.jquery.com/jquery-3.6.0.min.js"
        integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4="
        crossorigin="anonymous">

</script>
<body>
<div class="container">
    <div class="main">
        <h2>�����մϴ�! �̸��� ������ �Ϸ�Ǿ����ϴ�.</h2><br><br>
        ���� �α����� �����մϴ�.<br><br>
        <div>
            <button id="goto_login">�α����Ϸ� ����</button>
        </div>
    </div>
</div>
<script>
    $(document).ready(function() {
        $('#goto_login').click(function() {
            location.href = "/user/signin";
        })
    })
</script>
</body>
</html>
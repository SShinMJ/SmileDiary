<!--�ҽ� ��ó : https://minipol.tistory.com/entry/HTML-JAVA-%EC%9D%8C%EB%A0%A5-%EC%9C%A4%EB%8B%AC-%EA%B0%84%EC%A7%80-%EA%B3%B5%ED%9C%B4%EC%9D%BC-%EB%8B%AC%EB%A0%A5-%EC%86%8C%EC%8A%A4#google_vignette -->

<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.-1 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
    <title>My Diary</title>
</head>
<script
        src="https://code.jquery.com/jquery-3.6.0.min.js"
        integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4="
        crossorigin="anonymous">
</script>
<script>
<center style="width: 500px; height: 400px">
    <script type="text/javascript">
        var rege_0_type = "calendar";
        var rege_0_1 = "";
        var rege_0_2 = "";
    </script>

    <style type="text/css">
        <!--
        a:link { text-decoration: none;}
        a:visited { text-decoration: none;}
        TD { text-align: center; vertical-align: middle;}
        .CalHead { font:bold 8pt Arial; color: white;}
        .CalCell { font:8pt Arial; cursor: hand;}
        .HeadBtn { vertical-align:middle; height:22px; width:18px; font:10pt Fixedsys;}
        .HeadBox { vertical-align:middle; font-size:10px;}
        .Today { font:bold 10pt Arial; color:white;}
        -->
    </style>

    <script type=text/javascript>
        var yearSelect;
        var monthSelect;
        var oYearSelect;
        var todayDate;


        if (typeof(headerfooter_time_year) != "undefined")
        {
            /* ������ ��¥�� ���� ��¥�� ���� */
            todayDate = new Date(
                headerfooter_time_year, headerfooter_time_month - 1,
                headerfooter_time_day, headerfooter_time_hour,
                headerfooter_time_minute, headerfooter_time_second);
        }
        else
            todayDate = new Date();

        function getToDate(){
            var date = new Date();
            var year = date.getFullYear();
            var month = (date.getMonth()+1);
            var day = date.getDate();
            var weekday= new Array('��','��','ȭ','��','��','��','��');
            var wkd= date.getDay();
            toDay_yearmonth.innerText = year+"�� "+month+"��";
            toDay_day.innerText = day;
            toDay_weekday.innerText = weekday[wkd]+"����";
        }


        function getLunarDate(){
            var date = new Date();
            var year = date.getFullYear();
            var month = (date.getMonth()+1);
            var day = date.getDate();
            var date = lunarCalc(year, month, day, 1);
            toDay_con.innerText = "���� " + (date.leapMonth ? "��" : "") + date.month + "�� " + date.day + "��";
        }


        //���º�ȯ �Լ�
        function conversion(){
            var year = a.value;
            var monty = b.value;
            var day = c.value;
            lunarCalc(a, b, c, 1, 0);
        }


        //���º�ȯ �Լ�
        function conversion(){
            var year = a.value;
            var monty = b.value;
            var day = c.value;
            lunarCalc(a, b, c, 1, 0);
        }



        function memorialDay(name, month, day, solarLunar, holiday, type)
        {
            this.name = name;
            this.month = month;
            this.day = day;
            this.solarLunar = solarLunar;
            this.holiday = holiday; /* true : ������ false : �Ȼ����� */
            this.type = type; /* true : real time setting */
            this.techneer = true;
        }


        //�ų� �ݺ��Ǵ� �����
        var memorialDays = Array (
            new memorialDay("����", 1, 1, 1, true),
            new memorialDay("", 12, 0, 2, true, true), /* �ǽð����� ������ */
            new memorialDay("����", 1, 1, 2, true),
            new memorialDay("", 1, 2, 2, true),
            new memorialDay("3��1��", 3, 1, 1, true),
            new memorialDay("��ó�Կ��ų�", 4, 8, 2, true),
            new memorialDay("��̳�", 5, 5, 1, true),
            new memorialDay("������", 6, 6, 1, true),
            new memorialDay("������", 8, 15, 1, true),
            new memorialDay("", 8, 14, 2, true),
            new memorialDay("�߼�", 8, 15, 2, true),
            new memorialDay("", 8, 16, 2, true),
            new memorialDay("��õ��", 10, 3, 1, true),
            new memorialDay("�ѱ۳�", 10, 9, 1, true),
            new memorialDay("��ź��", 12, 25, 1, true),


            new memorialDay("�����뺸��", 1, 15, 2, false),
            new memorialDay("2��28����ȭ������", 2, 28, 1, false),
            new memorialDay("�������ǳ�", 3, 3, 1, false),
            new memorialDay("3��8�����ǰű����", 3, 8, 1, false),
            new memorialDay("3��15�ǰű����", 3, 15, 1, false),
            new memorialDay("����� ��", 3, 18, 1, false),
            new memorialDay("���ؼ�ȣ�ǳ�", 3, 27, 1, false),
            new memorialDay("�ĸ���<br>�ѽ�", 4, 5, 1, false),
            new memorialDay("�ܿ�", 5, 5, 2, false),
            new memorialDay("�����ǳ�", 10, 1, 1, false),
            new memorialDay("6��25������", 6, 25, 1, false),
            new memorialDay("�߷�Ÿ�ε���", 2, 14, 1, false),
            new memorialDay("���ǳ�", 3, 22, 1, false),
            new memorialDay("������", 4, 1, 1, false),
            new memorialDay("4��3������߳���<br>������ ��", 4, 3, 1 , false),
            new memorialDay("�����ǳ�", 4, 7, 1 , false),
            new memorialDay("���ѹα�<br>�ӽ����μ�����", 4, 11, 1 , false),
            new memorialDay("4��19���������", 4, 19, 1 , false),
            new memorialDay("������ǳ�", 4, 20, 1 , false),
            new memorialDay("�����ǳ�", 4, 21, 1 , false),
            new memorialDay("��������ǳ�", 4, 22, 1 , false),
            new memorialDay("���ǳ�", 4, 25, 1 , false),
            new memorialDay("�湫��ź����", 4, 28, 1, false),
            new memorialDay("�ٷ����ǳ�", 5, 1, 1, false),
            new memorialDay("����̳�", 5, 8, 1, false),
            new memorialDay("�������ǳ�", 5, 10, 1, false),
            new memorialDay("���г�����������", 5, 11, 1, false),
            new memorialDay("�����ǳ�", 5, 15, 1, false),
            new memorialDay("5��18 ����ȭ���", 5, 18, 1, false),
            new memorialDay("�߸��ǳ�", 5, 19, 1, false),
            new memorialDay("�κ��ǳ�", 5, 21, 1, false),
            new memorialDay("�ٴ��ǳ�", 5, 31, 1, false),
            new memorialDay("�Ǻ��ǳ�", 6, 1, 1, false),
            new memorialDay("ȯ���ǳ�", 6, 5, 1, false),
            new memorialDay("6��10������������", 6, 10, 1, false),
            new memorialDay("6��25������", 6, 25, 1, false),
            new memorialDay("ö���ǳ�", 6, 28, 1, false),
            new memorialDay("ĥ��ĥ��", 7, 7, 2, false),
            new memorialDay("������ȣ�ǳ�", 7, 8, 1, false),
            new memorialDay("������", 7, 17, 1, false),
            new memorialDay("�����ǳ�", 10, 2, 1, false),
            new memorialDay("���������ǳ�", 10, 2, 1, false),
            new memorialDay("���ⱺ���ǳ�<br>", 10, 8, 1, false),
            new memorialDay("ü���ǳ�", 10, 15, 1, false),
            new memorialDay("��ȭ�ǳ�", 10, 17, 1, false),
            new memorialDay("�����ǳ�", 10, 21, 1, false),
            new memorialDay("����������", 10, 24, 1, false),
            new memorialDay("�����ǳ�", 10, 27, 1, false),
            new memorialDay("�����ǳ�", 10, 28, 1, false),
            new memorialDay("������ġ�ǳ�", 10, 29, 1, false),
            new memorialDay("�л�����������", 11, 3, 1, false),
            new memorialDay("�ҹ��ǳ�", 11, 9, 1, false),
            new memorialDay("������ǳ�", 11, 11, 1, false),
            new memorialDay("���������ǳ�", 11, 17, 1, false),
            new memorialDay("�Һ����ǳ�", 12, 3, 1, false),
            new memorialDay("�����ǳ�", 12, 5, 1, false),
            new memorialDay("���ڷ��ǳ�", 12, 27, 1, false)
        );


        //Ư�� ������ ��¥�θ� �� ����� �Ǵ� �ų� �ݺ��Ǵ��� ��¥�� �ұ�Ģ�ϰ� �ٲ�� ������� �̰��� �Է��Ѵ�.
        function yearmemorialDay(name, year, month, day, solarLunar, holiday, type)
        {
            this.name = name;
            this.year = year;
            this.month = month;
            this.day = day;
            this.solarLunar = solarLunar;
            this.holiday = holiday; /* true : ������ false : �Ȼ����� */
            this.type = type; /* true : real time setting */
            this.techneer = true;
        }


        var yearmemorialDays = Array (
            new yearmemorialDay("��ü������", 2020, 1, 27, 1, true),
            new yearmemorialDay("��21�� ��ȸ�ǿ� ����", 2020, 4, 15, 1, true),
            new yearmemorialDay("��ü������", 2021, 8, 16, 1, true),
            new yearmemorialDay("��ü������", 2021, 10, 4, 1, true),
            new yearmemorialDay("��ü������", 2021, 10, 11, 1, true),
            new yearmemorialDay("��20�� ����� ����", 2022, 3, 9, 1, true),
            new yearmemorialDay("��ü������", 2022, 9, 12, 1, true),
            new yearmemorialDay("��ü������", 2021, 10, 10, 1, true),
            new yearmemorialDay("��ü������", 2024, 2, 12, 1, true),
            new yearmemorialDay("��22�� ��ȸ�ǿ� ����", 2024, 4, 10, 1, true),
            new yearmemorialDay("��ü������", 2023, 1, 24, 1, true),
            new yearmemorialDay("��ü������", 2024, 5, 6, 1, true),
            new yearmemorialDay("��ü������", 2025, 5, 6, 1, true),
            new yearmemorialDay("��ü������", 2025, 10, 8, 1, true),
            new yearmemorialDay("��ü������", 2026, 8, 17, 1, true),
            new yearmemorialDay("��ü������", 2026, 10, 5, 1, true),
            new yearmemorialDay("��ü������", 2027, 2, 9, 1, true),
            new yearmemorialDay("��21�� ����� ����", 2027, 3, 3, 1, true),
            new yearmemorialDay("��ü������", 2027, 8, 16, 1, true),
            new yearmemorialDay("��ü������", 2027, 10, 4, 1, true),
            new yearmemorialDay("��ü������", 2027, 10, 11, 1, true),
            new yearmemorialDay("��23�� ��ȸ�ǿ� ����", 2028, 4, 12, 1, true),
            new yearmemorialDay("��ü������", 2029, 5, 7, 1, true),
            new yearmemorialDay("��ü������", 2029, 9, 24, 1, true),
            new yearmemorialDay("��ü������", 2030, 2, 5, 1, true),
            new yearmemorialDay("��ü������", 2030, 5, 6, 1, true),
            new yearmemorialDay("��21�� ����� ����", 2032, 3, 3, 1, true),
            new yearmemorialDay("��24�� ��ȸ�ǿ� ����", 2032, 4, 14, 1, true),
            new yearmemorialDay("��ü������", 2032, 8, 16, 1, true),
            new yearmemorialDay("��ü������", 2032, 9, 21, 1, true),
            new yearmemorialDay("��ü������", 2032, 10, 4, 1, true),
            new yearmemorialDay("��ü������", 2032, 10, 11, 1, true),
            new yearmemorialDay("��ü������", 2033, 2, 2, 1, true),
            new yearmemorialDay("��ü������", 2033, 10, 10, 1, true),
            new yearmemorialDay("��ü������", 2034, 2, 21, 1, true),
            new yearmemorialDay("��ü������", 2035, 5, 7, 1, true),
            new yearmemorialDay("��ü������", 2035, 9, 18, 1, true)
        );

        function myDate(year, month, day, leapMonth)
        {
            this.year = year;
            this.month = month;
            this.day = day;
            this.leapMonth = leapMonth;
        }


        // ���� ������ (��� - ������ :1,  ū��:2 )
        // (������ �ִ� �� - ����� �۰� ���޵� ������ :3 , ����� �۰� ������ ũ�� : 4)
        // (������ �ִ� �� - ����� ũ�� ������ ������ :5,  ��ް� ������ ��� ũ�� : 6)
        var lunarMonthTable = [
            [1, 2, 2, 1, 2, 1, 2, 1, 2, 1, 1, 2],
            [2, 1, 2, 5, 2, 1, 2, 1, 2, 1, 2, 1],
            [1, 2, 2, 1, 2, 1, 2, 2, 1, 2, 1, 2], /* 1801 */
            [1, 1, 2, 1, 2, 1, 2, 2, 2, 1, 2, 1],
            [2, 3, 2, 1, 2, 1, 2, 2, 1, 2, 2, 1],
            [2, 1, 1, 2, 1, 1, 2, 2, 1, 2, 2, 2],
            [1, 2, 1, 2, 1, 3, 2, 1, 2, 2, 2, 1],
            [2, 2, 1, 2, 1, 1, 1, 2, 1, 2, 2, 1],
            [2, 2, 2, 1, 1, 2, 1, 1, 2, 1, 2, 2],
            [1, 2, 2, 1, 5, 2, 1, 2, 1, 1, 2, 1],
            [2, 2, 1, 2, 2, 1, 2, 1, 2, 1, 1, 2],
            [1, 2, 1, 2, 2, 1, 2, 2, 1, 2, 1, 2],
            [1, 1, 5, 2, 1, 2, 2, 1, 2, 2, 1, 2], /* 1811 */
            [1, 1, 2, 1, 2, 1, 2, 1, 2, 2, 2, 1],
            [2, 1, 2, 1, 1, 1, 2, 1, 2, 2, 2, 1],
            [2, 5, 2, 1, 1, 1, 2, 1, 2, 2, 1, 2],
            [2, 2, 1, 1, 2, 1, 1, 2, 1, 2, 1, 2],
            [2, 2, 1, 2, 1, 5, 1, 2, 1, 2, 1, 2],
            [2, 1, 2, 2, 1, 2, 1, 2, 1, 1, 2, 1],
            [2, 1, 2, 2, 1, 2, 2, 1, 2, 1, 1, 2],
            [1, 2, 1, 5, 2, 2, 1, 2, 2, 1, 2, 1],
            [1, 2, 1, 2, 1, 2, 1, 2, 2, 2, 1, 2],
            [1, 1, 2, 1, 1, 2, 1, 2, 2, 2, 1, 2], /* 1821 */
            [2, 1, 5, 1, 1, 2, 1, 2, 2, 1, 2, 2],
            [2, 1, 2, 1, 1, 1, 2, 1, 2, 1, 2, 2],
            [2, 1, 2, 1, 2, 1, 4, 1, 2, 1, 2, 2],
            [2, 1, 2, 1, 2, 1, 1, 2, 1, 2, 1, 2],
            [2, 1, 2, 2, 1, 2, 1, 1, 2, 1, 2, 1],
            [2, 1, 2, 2, 4, 1, 2, 1, 2, 1, 2, 1],
            [2, 1, 2, 1, 2, 2, 1, 2, 1, 2, 1, 2],
            [1, 2, 1, 2, 1, 2, 1, 2, 2, 1, 2, 2],
            [1, 1, 2, 3, 2, 1, 2, 2, 1, 2, 2, 2],
            [1, 1, 2, 1, 1, 2, 1, 2, 1, 2, 2, 2], /* 1831 */
            [1, 2, 1, 2, 1, 1, 2, 1, 5, 2, 2, 2],
            [1, 2, 1, 2, 1, 1, 2, 1, 2, 1, 2, 2],
            [1, 2, 2, 1, 2, 1, 1, 2, 1, 2, 1, 2],
            [1, 2, 2, 1, 2, 5, 1, 2, 1, 2, 1, 2],
            [1, 2, 1, 2, 2, 1, 2, 1, 2, 1, 2, 1],
            [2, 1, 2, 1, 2, 1, 2, 2, 1, 2, 1, 2],
            [1, 2, 1, 5, 1, 2, 2, 1, 2, 2, 1, 2],
            [1, 2, 1, 1, 2, 1, 2, 1, 2, 2, 2, 1],
            [2, 1, 2, 1, 1, 2, 1, 2, 1, 2, 2, 2],
            [1, 2, 4, 1, 1, 2, 1, 2, 1, 2, 2, 1],   /* 1841 */
            [2, 2, 1, 2, 1, 1, 2, 1, 2, 1, 2, 1],
            [2, 2, 2, 1, 2, 1, 4, 1, 2, 1, 2, 1],
            [2, 2, 1, 2, 1, 2, 1, 2, 1, 2, 1, 2],
            [1, 2, 1, 2, 2, 1, 2, 1, 2, 1, 2, 1],
            [2, 1, 2, 1, 5, 2, 1, 2, 2, 1, 2, 1],
            [2, 1, 1, 2, 1, 2, 1, 2, 2, 2, 1, 2],
            [1, 2, 1, 1, 2, 1, 2, 1, 2, 2, 2, 1],
            [2, 1, 2, 3, 2, 1, 2, 1, 2, 1, 2, 2],
            [2, 1, 2, 1, 1, 2, 1, 1, 2, 2, 1, 2],
            [2, 2, 1, 2, 1, 1, 2, 3, 2, 1, 2, 2],   /* 1851 */
            [2, 1, 2, 2, 1, 1, 2, 1, 2, 1, 1, 2],
            [2, 1, 2, 2, 1, 2, 1, 2, 1, 2, 1, 2],
            [1, 2, 1, 2, 1, 2, 5, 2, 1, 2, 1, 2],
            [1, 1, 2, 1, 2, 2, 1, 2, 2, 1, 2, 1],
            [2, 1, 1, 2, 1, 2, 1, 2, 2, 2, 1, 2],
            [1, 2, 1, 1, 5, 2, 1, 2, 1, 2, 2, 2],
            [1, 2, 1, 1, 2, 1, 1, 2, 2, 1, 2, 2],
            [2, 1, 2, 1, 1, 2, 1, 1, 2, 1, 2, 2],
            [2, 1, 6, 1, 1, 2, 1, 1, 2, 1, 2, 2],
            [1, 2, 2, 1, 2, 1, 2, 1, 2, 1, 1, 2],   /* 1861 */
            [2, 1, 2, 1, 2, 2, 1, 5, 2, 1, 1, 2],
            [1, 2, 2, 1, 2, 1, 2, 2, 1, 2, 1, 2],
            [1, 1, 2, 1, 2, 1, 2, 2, 1, 2, 2, 1],
            [2, 1, 1, 2, 4, 1, 2, 2, 1, 2, 2, 1],
            [2, 1, 1, 2, 1, 1, 2, 2, 1, 2, 2, 2],
            [1, 2, 1, 1, 2, 1, 1, 2, 1, 2, 2, 2],
            [1, 2, 2, 3, 2, 1, 1, 2, 1, 2, 2, 1],
            [2, 2, 2, 1, 1, 2, 1, 1, 2, 1, 2, 1],
            [2, 2, 2, 1, 2, 1, 2, 1, 1, 5, 2, 1],
            [2, 2, 1, 2, 2, 1, 2, 1, 2, 1, 1, 2],   /* 1871 */
            [1, 2, 1, 2, 2, 1, 2, 1, 2, 2, 1, 2],
            [1, 1, 2, 1, 2, 4, 2, 1, 2, 2, 1, 2],
            [1, 1, 2, 1, 2, 1, 2, 1, 2, 2, 2, 1],
            [2, 1, 1, 2, 1, 1, 2, 1, 2, 2, 2, 1],
            [2, 2, 1, 1, 5, 1, 2, 1, 2, 2, 1, 2],
            [2, 2, 1, 1, 2, 1, 1, 2, 1, 2, 1, 2],
            [2, 2, 1, 2, 1, 2, 1, 1, 2, 1, 2, 1],
            [2, 2, 4, 2, 1, 2, 1, 1, 2, 1, 2, 1],
            [2, 1, 2, 2, 1, 2, 2, 1, 2, 1, 1, 2],
            [1, 2, 1, 2, 1, 2, 5, 2, 2, 1, 2, 1],   /* 1881 */
            [1, 2, 1, 2, 1, 2, 1, 2, 2, 1, 2, 2],
            [1, 1, 2, 1, 1, 2, 1, 2, 2, 2, 1, 2],
            [2, 1, 1, 2, 3, 2, 1, 2, 2, 1, 2, 2],
            [2, 1, 1, 2, 1, 1, 2, 1, 2, 1, 2, 2],
            [2, 1, 2, 1, 2, 1, 1, 2, 1, 2, 1, 2],
            [2, 2, 1, 5, 2, 1, 1, 2, 1, 2, 1, 2],
            [2, 1, 2, 2, 1, 2, 1, 1, 2, 1, 2, 1],
            [2, 1, 2, 2, 1, 2, 1, 2, 1, 2, 1, 2],
            [1, 5, 2, 1, 2, 2, 1, 2, 1, 2, 1, 2],
            [1, 2, 1, 2, 1, 2, 1, 2, 2, 1, 2, 2],   /* 1891 */
            [1, 1, 2, 1, 1, 5, 2, 2, 1, 2, 2, 2],
            [1, 1, 2, 1, 1, 2, 1, 2, 1, 2, 2, 2],
            [1, 2, 1, 2, 1, 1, 2, 1, 2, 1, 2, 2],
            [2, 1, 2, 1, 5, 1, 2, 1, 2, 1, 2, 1],
            [2, 2, 2, 1, 2, 1, 1, 2, 1, 2, 1, 2],
            [1, 2, 2, 1, 2, 1, 2, 1, 2, 1, 2, 1],
            [2, 1, 5, 2, 2, 1, 2, 1, 2, 1, 2, 1],
            [2, 1, 2, 1, 2, 1, 2, 2, 1, 2, 1, 2],
            [1, 2, 1, 1, 2, 1, 2, 5, 2, 2, 1, 2],
            [1, 2, 1, 1, 2, 1, 2, 1, 2, 2, 2, 1],   /* 1901 */
            [2, 1, 2, 1, 1, 2, 1, 2, 1, 2, 2, 2],
            [1, 2, 1, 2, 3, 2, 1, 1, 2, 2, 1, 2],
            [2, 2, 1, 2, 1, 1, 2, 1, 1, 2, 2, 1],
            [2, 2, 1, 2, 2, 1, 1, 2, 1, 2, 1, 2],
            [1, 2, 2, 4, 1, 2, 1, 2, 1, 2, 1, 2],
            [1, 2, 1, 2, 1, 2, 2, 1, 2, 1, 2, 1],
            [2, 1, 1, 2, 2, 1, 2, 1, 2, 2, 1, 2],
            [1, 5, 1, 2, 1, 2, 1, 2, 2, 2, 1, 2],
            [1, 2, 1, 1, 2, 1, 2, 1, 2, 2, 2, 1],
            [2, 1, 2, 1, 1, 5, 1, 2, 2, 1, 2, 2],   /* 1911 */
            [2, 1, 2, 1, 1, 2, 1, 1, 2, 2, 1, 2],
            [2, 2, 1, 2, 1, 1, 2, 1, 1, 2, 1, 2],
            [2, 2, 1, 2, 5, 1, 2, 1, 2, 1, 1, 2],
            [2, 1, 2, 2, 1, 2, 1, 2, 1, 2, 1, 2],
            [1, 2, 1, 2, 1, 2, 2, 1, 2, 1, 2, 1],
            [2, 3, 2, 1, 2, 2, 1, 2, 2, 1, 2, 1],
            [2, 1, 1, 2, 1, 2, 1, 2, 2, 1, 2, 2],
            [1, 2, 1, 1, 2, 1, 5, 2, 1, 2, 2, 2],
            [1, 2, 1, 1, 2, 1, 1, 2, 2, 1, 2, 2],
            [2, 1, 2, 1, 1, 2, 1, 1, 2, 1, 2, 2],   /* 1921 */
            [2, 1, 2, 2, 3, 2, 1, 1, 2, 1, 2, 2],
            [1, 2, 2, 1, 2, 1, 2, 1, 1, 2, 1, 2],
            [2, 1, 2, 1, 2, 2, 1, 2, 1, 2, 1, 1],
            [2, 1, 2, 5, 2, 1, 2, 2, 1, 2, 1, 2],
            [1, 1, 2, 1, 2, 1, 2, 2, 1, 2, 2, 1],
            [2, 1, 1, 2, 1, 2, 1, 2, 2, 1, 2, 2],
            [1, 5, 1, 2, 1, 1, 2, 2, 1, 2, 2, 2],
            [1, 2, 1, 1, 2, 1, 1, 2, 1, 2, 2, 2],
            [1, 2, 2, 1, 1, 5, 1, 2, 1, 2, 2, 1],
            [2, 2, 1, 2, 1, 2, 1, 1, 2, 1, 2, 1],   /* 1931 */
            [2, 2, 2, 1, 2, 1, 2, 1, 1, 2, 1, 2],
            [1, 2, 2, 1, 6, 1, 2, 1, 2, 1, 1, 2],
            [1, 2, 1, 2, 2, 1, 2, 1, 2, 2, 1, 2],
            [1, 1, 2, 1, 2, 1, 2, 2, 1, 2, 2, 1],
            [2, 1, 4, 1, 1, 2, 2, 1, 2, 2, 2, 1],
            [2, 1, 1, 2, 1, 1, 2, 1, 2, 2, 2, 1],
            [2, 2, 1, 1, 2, 1, 4, 1, 2, 2, 1, 2],
            [2, 2, 1, 1, 2, 1, 1, 2, 1, 2, 1, 2],
            [2, 2, 1, 2, 1, 2, 1, 1, 2, 1, 2, 1],
            [2, 2, 1, 2, 2, 4, 1, 1, 2, 1, 2, 1],   /* 1941 */
            [2, 1, 2, 2, 1, 2, 2, 1, 1, 2, 1, 2],
            [1, 2, 1, 2, 1, 2, 2, 1, 2, 1, 2, 1],
            [2, 1, 2, 4, 1, 2, 1, 2, 2, 1, 2, 2],
            [1, 1, 2, 1, 1, 2, 1, 2, 2, 2, 1, 2],
            [2, 1, 1, 2, 1, 1, 2, 1, 2, 2, 1, 2],
            [2, 5, 1, 2, 1, 1, 2, 1, 2, 1, 2, 2],
            [2, 1, 2, 1, 2, 1, 1, 2, 1, 2, 1, 2],
            [2, 1, 2, 2, 1, 2, 3, 2, 1, 2, 1, 2],
            [1, 2, 2, 2, 1, 2, 1, 1, 2, 1, 2, 1],
            [2, 1, 2, 2, 1, 2, 1, 2, 1, 2, 1, 2],   /* 1951 */
            [1, 2, 1, 2, 4, 1, 2, 2, 1, 2, 1, 2],
            [1, 2, 1, 1, 2, 2, 1, 2, 2, 1, 2, 2],
            [1, 1, 2, 1, 1, 2, 1, 2, 2, 1, 2, 2],
            [2, 1, 4, 1, 1, 2, 1, 2, 1, 2, 2, 2],
            [1, 2, 1, 2, 1, 1, 2, 1, 2, 1, 2, 2],
            [2, 1, 2, 1, 2, 1, 1, 5, 2, 1, 2, 2],
            [1, 2, 2, 1, 2, 1, 1, 2, 1, 2, 1, 2],
            [1, 2, 2, 1, 2, 1, 2, 1, 2, 1, 2, 1],
            [2, 1, 2, 1, 2, 5, 2, 1, 2, 1, 2, 1],
            [2, 1, 2, 1, 2, 1, 2, 2, 1, 2, 1, 2],   /* 1961 */
            [1, 2, 1, 1, 2, 1, 2, 2, 1, 2, 2, 1],
            [2, 1, 2, 3, 2, 1, 2, 1, 2, 2, 2, 1],
            [2, 1, 2, 1, 1, 2, 1, 2, 1, 2, 2, 2],
            [1, 2, 1, 2, 1, 1, 2, 1, 1, 2, 2, 2],
            [1, 2, 5, 2, 1, 1, 2, 1, 1, 2, 2, 1],
            [2, 2, 1, 2, 2, 1, 1, 2, 1, 2, 1, 2],
            [1, 2, 1, 2, 2, 1, 5, 2, 1, 2, 1, 2],
            [1, 2, 1, 2, 1, 2, 2, 1, 2, 1, 2, 1],
            [2, 1, 1, 2, 1, 2, 2, 1, 2, 2, 1, 2],
            [1, 2, 1, 1, 5, 2, 1, 2, 2, 2, 1, 2],   /* 1971 */
            [1, 2, 1, 1, 2, 1, 2, 1, 2, 2, 2, 1],
            [2, 1, 2, 1, 1, 2, 1, 1, 2, 2, 1, 2],
            [2, 2, 1, 5, 1, 2, 1, 1, 2, 2, 1, 2],
            [2, 2, 1, 2, 1, 1, 2, 1, 1, 2, 1, 2],
            [2, 2, 1, 2, 1, 2, 1, 5, 1, 2, 1, 2],
            [2, 1, 2, 2, 1, 2, 1, 2, 1, 2, 1, 1],
            [2, 1, 2, 2, 1, 2, 2, 1, 2, 1, 2, 1],
            [2, 1, 1, 2, 1, 6, 1, 2, 2, 1, 2, 1],
            [2, 1, 1, 2, 1, 2, 1, 2, 2, 1, 2, 2],
            [1, 2, 1, 1, 2, 1, 1, 2, 2, 1, 2, 2],   /* 1981 */
            [2, 1, 2, 3, 2, 1, 1, 2, 1, 2, 2, 2],
            [2, 1, 2, 1, 1, 2, 1, 1, 2, 1, 2, 2],
            [2, 1, 2, 2, 1, 1, 2, 1, 1, 5, 2, 2],
            [1, 2, 2, 1, 2, 1, 2, 1, 1, 2, 1, 2],
            [1, 2, 2, 1, 2, 2, 1, 2, 1, 2, 1, 1],
            [2, 1, 2, 1, 2, 5, 2, 2, 1, 2, 1, 2],
            [1, 1, 2, 1, 2, 1, 2, 2, 1, 2, 2, 1],
            [2, 1, 1, 2, 1, 2, 1, 2, 1, 2, 2, 2],
            [1, 2, 1, 1, 5, 1, 2, 2, 1, 2, 2, 2],
            [1, 2, 1, 1, 2, 1, 1, 2, 1, 2, 2, 2],   /* 1991 */
            [1, 2, 2, 1, 1, 2, 1, 1, 2, 1, 2, 2],
            [1, 2, 5, 2, 1, 2, 1, 1, 2, 1, 2, 1],
            [2, 2, 2, 1, 2, 1, 2, 1, 1, 2, 1, 2],
            [1, 2, 2, 1, 2, 1, 2, 5, 2, 1, 1, 2],
            [1, 2, 1, 2, 2, 1, 2, 1, 2, 2, 1, 1],
            [2, 1, 2, 1, 2, 1, 2, 2, 1, 2, 2, 1],
            [2, 1, 1, 2, 3, 2, 2, 1, 2, 2, 2, 1],
            [2, 1, 1, 2, 1, 1, 2, 1, 2, 2, 2, 1],
            [2, 2, 1, 1, 2, 1, 1, 2, 1, 2, 2, 1],
            [2, 2, 1, 5, 2, 1, 1, 2, 1, 2, 1, 2],   /* 2001 */
            [2, 2, 1, 2, 1, 2, 1, 1, 2, 1, 2, 1],
            [2, 2, 1, 2, 2, 1, 2, 1, 1, 2, 1, 2],
            [1, 5, 2, 2, 1, 2, 1, 2, 1, 2, 1, 2],
            [1, 2, 1, 2, 1, 2, 2, 1, 2, 1, 2, 1],
            [2, 1, 2, 1, 2, 1, 5, 2, 2, 1, 2, 2],
            [1, 1, 2, 1, 1, 2, 1, 2, 2, 2, 1, 2],
            [2, 1, 1, 2, 1, 1, 2, 1, 2, 2, 1, 2],
            [2, 2, 1, 1, 5, 1, 2, 1, 2, 1, 2, 2],
            [2, 1, 2, 1, 2, 1, 1, 2, 1, 2, 1, 2],
            [2, 1, 2, 2, 1, 2, 1, 1, 2, 1, 2, 1],   /* 2011 */
            [2, 1, 2, 5, 2, 2, 1, 1, 2, 1, 2, 1],
            [2, 1, 2, 2, 1, 2, 1, 2, 1, 2, 1, 2],
            [1, 2, 1, 2, 1, 2, 1, 2, 5, 2, 1, 2],
            [1, 2, 1, 1, 2, 1, 2, 2, 2, 1, 2, 1],
            [2, 1, 2, 1, 1, 2, 1, 2, 2, 1, 2, 2],
            [1, 2, 1, 2, 1, 4, 1, 2, 1, 2, 2, 2],
            [1, 2, 1, 2, 1, 1, 2, 1, 2, 1, 2, 2],
            [2, 1, 2, 1, 2, 1, 1, 2, 1, 1, 2, 2],
            [2, 1, 2, 5, 2, 1, 1, 2, 1, 2, 1, 2],
            [1, 2, 2, 1, 2, 1, 2, 1, 2, 1, 2, 1],   /* 2021 */
            [2, 1, 2, 1, 2, 2, 1, 2, 1, 2, 1, 2],
            [1, 5, 2, 1, 2, 1, 2, 2, 1, 2, 1, 2],
            [1, 2, 1, 1, 2, 1, 2, 2, 1, 2, 2, 1],
            [2, 1, 2, 1, 1, 5, 2, 1, 2, 2, 2, 1],
            [2, 1, 2, 1, 1, 2, 1, 2, 1, 2, 2, 2],
            [1, 2, 1, 2, 1, 1, 2, 1, 1, 2, 2, 1],
            [2, 2, 2, 1, 5, 1, 2, 1, 1, 2, 2, 1],
            [2, 2, 1, 2, 2, 1, 1, 2, 1, 1, 2, 2],
            [1, 2, 1, 2, 2, 1, 2, 1, 2, 1, 2, 1],
            [2, 1, 5, 2, 1, 2, 2, 1, 2, 1, 2, 1],   /* 2031 */
            [2, 1, 1, 2, 1, 2, 2, 1, 2, 2, 1, 2],
            [1, 2, 1, 1, 2, 1, 2, 1, 2, 2, 5, 2],
            [1, 2, 1, 1, 2, 1, 2, 1, 2, 2, 1, 2],
            [2, 1, 2, 1, 1, 2, 1, 1, 2, 2, 1, 2],
            [2, 2, 1, 2, 1, 4, 1, 1, 2, 2, 1, 2],
            [2, 2, 1, 2, 1, 1, 2, 1, 1, 2, 1, 2],
            [2, 2, 1, 2, 1, 2, 1, 2, 1, 1, 2, 1],
            [2, 2, 1, 2, 5, 2, 1, 2, 1, 2, 1, 1],
            [2, 1, 2, 2, 1, 2, 1, 2, 2, 1, 2, 1],
            [2, 1, 1, 2, 1, 2, 2, 1, 2, 2, 1, 2],   /* 2041 */
            [1, 5, 1, 2, 1, 2, 1, 2, 2, 1, 2, 2],
            [1, 2, 1, 1, 2, 1, 1, 2, 2, 1, 2, 2],
            [2, 1, 2, 1, 1, 2, 3, 2, 1, 2, 2, 2],
            [2, 1, 2, 1, 1, 2, 1, 1, 2, 1, 2, 2],
            [2, 1, 2, 1, 2, 1, 2, 1, 1, 2, 1, 2],
            [2, 1, 2, 2, 4, 1, 2, 1, 1, 2, 1, 2],
            [1, 2, 2, 1, 2, 2, 1, 2, 1, 1, 2, 1],
            [2, 1, 2, 1, 2, 2, 1, 2, 2, 1, 2, 1],
            [1, 2, 4, 1, 2, 1, 2, 2, 1, 2, 2, 1],
            [2, 1, 1, 2, 1, 1, 2, 2, 1, 2, 2, 2],   /* 2051 */
            [1, 2, 1, 1, 2, 1, 1, 5, 2, 2, 2, 2],
            [1, 2, 1, 1, 2, 1, 1, 2, 1, 2, 2, 2],
            [1, 2, 2, 1, 1, 2, 1, 1, 2, 1, 2, 2],
            [1, 2, 2, 1, 2, 4, 1, 1, 2, 1, 2, 1],
            [2, 2, 2, 1, 2, 1, 2, 1, 1, 2, 1, 2],
            [1, 2, 2, 1, 2, 1, 2, 2, 1, 1, 2, 1],
            [2, 1, 2, 4, 2, 1, 2, 1, 2, 2, 1, 1],
            [2, 1, 2, 1, 2, 1, 2, 2, 1, 2, 2, 1],
            [2, 1, 1, 2, 1, 1, 2, 2, 1, 2, 2, 1],
            [2, 2, 3, 2, 1, 1, 2, 1, 2, 2, 2, 1],   /* 2061 */
            [2, 2, 1, 1, 2, 1, 1, 2, 1, 2, 2, 1],
            [2, 2, 1, 2, 1, 2, 3, 2, 1, 2, 1, 2],
            [2, 2, 1, 2, 1, 2, 1, 1, 2, 1, 2, 1],
            [2, 2, 1, 2, 2, 1, 2, 1, 1, 2, 1, 2],
            [1, 2, 1, 2, 5, 2, 1, 2, 1, 2, 1, 2],
            [1, 2, 1, 2, 1, 2, 2, 1, 2, 1, 2, 1],
            [2, 1, 2, 1, 1, 2, 2, 1, 2, 2, 1, 2],
            [1, 2, 1, 5, 1, 2, 1, 2, 2, 2, 1, 2],
            [2, 1, 1, 2, 1, 1, 2, 1, 2, 2, 1, 2],
            [2, 1, 2, 1, 2, 1, 1, 5, 2, 1, 2, 2],   /* 2071 */
            [2, 1, 2, 1, 2, 1, 1, 2, 1, 2, 1, 2],
            [2, 1, 2, 2, 1, 2, 1, 1, 2, 1, 2, 1],
            [2, 1, 2, 2, 1, 5, 2, 1, 2, 1, 2, 1],
            [2, 1, 2, 1, 2, 2, 1, 2, 1, 2, 1, 2],
            [1, 2, 1, 2, 1, 2, 1, 2, 2, 1, 2, 1],
            [2, 1, 2, 3, 2, 1, 2, 2, 2, 1, 2, 1],
            [2, 1, 2, 1, 1, 2, 1, 2, 2, 1, 2, 2],
            [1, 2, 1, 2, 1, 1, 2, 1, 2, 1, 2, 2],
            [2, 1, 5, 2, 1, 1, 2, 1, 2, 1, 2, 2],
            [1, 2, 2, 1, 2, 1, 1, 2, 1, 1, 2, 2],   /* 2081 */
            [1, 2, 2, 2, 1, 2, 3, 2, 1, 1, 2, 2],
            [1, 2, 2, 1, 2, 1, 2, 1, 2, 1, 2, 1],
            [2, 1, 2, 1, 2, 2, 1, 2, 1, 2, 1, 2],
            [1, 2, 1, 1, 6, 1, 2, 2, 1, 2, 1, 2],
            [1, 2, 1, 1, 2, 1, 2, 2, 1, 2, 2, 1],
            [2, 1, 2, 1, 1, 2, 1, 2, 1, 2, 2, 2],
            [1, 2, 1, 5, 1, 2, 1, 1, 2, 2, 2, 1],
            [2, 2, 1, 2, 1, 1, 2, 1, 1, 2, 2, 1],
            [2, 2, 2, 1, 2, 1, 1, 5, 1, 2, 2, 1],
            [2, 2, 1, 2, 1, 2, 1, 2, 1, 1, 2, 1],   /* 2091 */
            [2, 2, 1, 2, 2, 1, 2, 1, 2, 1, 2, 1],
            [1, 2, 2, 1, 2, 4, 2, 1, 2, 1, 2, 1],
            [2, 1, 1, 2, 1, 2, 2, 1, 2, 2, 1, 2],
            [1, 2, 1, 1, 2, 1, 2, 1, 2, 2, 2, 1],
            [2, 1, 2, 3, 2, 1, 1, 2, 2, 2, 1, 2],
            [2, 1, 2, 1, 1, 2, 1, 1, 2, 2, 1, 2],
            [2, 2, 1, 2, 1, 1, 2, 1, 1, 2, 1, 2],
            [2, 5, 2, 2, 1, 1, 2, 1, 1, 2, 1, 2],
            [2, 2, 1, 2, 1, 2, 1, 2, 1, 1, 2, 1],
            [2, 2, 1, 2, 2, 1, 5, 2, 1, 1, 2, 1]];


        /* ��� <-> ���� ��ȯ �Լ�
         * type : 1 - ��� -> ����
         *        2 - ���� -> ���
         * leapmonth : 0 - ���
         *             1 - ���� (type = 2 �϶��� ��ȿ)
        */
        function lunarCalc(year, month, day, type, leapmonth)
        {
            var solYear, solMonth, solDay;
            var lunYear, lunMonth, lunDay;
            var lunLeapMonth, lunMonthDay;
            var i, lunIndex;


            var solMonthDay = [31, 0, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31];


            /* range check */
            if (year < 1800 || year > 2101)
            {
                alert('1800����� 2101������� �����մϴ�');
                return;
            }
            /* �ӵ� ������ ���� ���� ���ڸ� �������� �Ѵ� */
            if (year >= 2080)
            {
                /* �������� ��� 2080�� 1�� 1�� (���� 2079�� 12�� 10��) */
                solYear = 2080;
                solMonth = 1;
                solDay = 1;
                lunYear = 2079;
                lunMonth = 12;
                lunDay = 10;
                lunLeapMonth = 0;


                solMonthDay[1] = 29; /* 2080 �� 2�� 28�� */
                lunMonthDay = 30; /* 2079�� 12�� */
            }
            else if (year >= 2060)
            {
                /* �������� ��� 2060�� 1�� 1�� (���� 2059�� 11�� 28��) */
                solYear = 2060;
                solMonth = 1;
                solDay = 1;
                lunYear = 2059;
                lunMonth = 11;
                lunDay = 28;
                lunLeapMonth = 0;


                solMonthDay[1] = 29; /* 2060 �� 2�� 28�� */
                lunMonthDay = 30; /* 2059�� 11�� */
            }
            else if (year >= 2040)
            {
                /* �������� ��� 2040�� 1�� 1�� (���� 2039�� 11�� 17��) */
                solYear = 2040;
                solMonth = 1;
                solDay = 1;
                lunYear = 2039;
                lunMonth = 11;
                lunDay = 17;
                lunLeapMonth = 0;


                solMonthDay[1] = 29; /* 2040 �� 2�� 28�� */
                lunMonthDay = 29; /* 2039�� 11�� */
            }
            else if (year >= 2020)
            {
                /* �������� ��� 2020�� 1�� 1�� (���� 2019�� 12�� 7��) */
                solYear = 2020;
                solMonth = 1;
                solDay = 1;
                lunYear = 2019;
                lunMonth = 12;
                lunDay = 7;
                lunLeapMonth = 0;


                solMonthDay[1] = 29; /* 2020 �� 2�� 28�� */
                lunMonthDay = 30; /* 2019�� 12�� */
            }
            else if (year >= 2000)
            {
                /* �������� ��� 2000�� 1�� 1�� (���� 1999�� 11�� 25��) */
                solYear = 2000;
                solMonth = 1;
                solDay = 1;
                lunYear = 1999;
                lunMonth = 11;
                lunDay = 25;
                lunLeapMonth = 0;


                solMonthDay[1] = 29; /* 2000 �� 2�� 28�� */
                lunMonthDay = 30; /* 1999�� 11�� */
            }
            else if (year >= 1980)
            {
                /* �������� ��� 1980�� 1�� 1�� (���� 1979�� 11�� 14��) */
                solYear = 1980;
                solMonth = 1;
                solDay = 1;
                lunYear = 1979;
                lunMonth = 11;
                lunDay = 14;
                lunLeapMonth = 0;


                solMonthDay[1] = 29; /* 1980 �� 2�� 28�� */
                lunMonthDay = 30; /* 1979�� 11�� */
            }
            else if (year >= 1960)
            {
                /* �������� ��� 1960�� 1�� 1�� (���� 1959�� 12�� 3��) */
                solYear = 1960;
                solMonth = 1;
                solDay = 1;
                lunYear = 1959;
                lunMonth = 12;
                lunDay = 3;
                lunLeapMonth = 0;


                solMonthDay[1] = 29; /* 1960 �� 2�� 28�� */
                lunMonthDay = 29; /* 1959�� 12�� */
            }
            else if (year >= 1940)
            {
                /* �������� ��� 1940�� 1�� 1�� (���� 1939�� 11�� 22��) */
                solYear = 1940;
                solMonth = 1;
                solDay = 1;
                lunYear = 1939;
                lunMonth = 11;
                lunDay = 22;
                lunLeapMonth = 0;


                solMonthDay[1] = 29; /* 1940 �� 2�� 28�� */
                lunMonthDay = 29; /* 1939�� 11�� */
            }
            else if (year >= 1920)
            {
                /* �������� ��� 1920�� 1�� 1�� (���� 1919�� 11�� 11��) */
                solYear = 1920;
                solMonth = 1;
                solDay = 1;
                lunYear = 1919;
                lunMonth = 11;
                lunDay = 11;
                lunLeapMonth = 0;


                solMonthDay[1] = 29; /* 1920 �� 2�� 28�� */
                lunMonthDay = 30; /* 1919�� 11�� */
            }
            else if (year >= 1900)
            {
                /* �������� ��� 1900�� 1�� 1�� (���� 1899�� 12�� 1��) */
                solYear = 1900;
                solMonth = 1;
                solDay = 1;
                lunYear = 1899;
                lunMonth = 12;
                lunDay = 1;
                lunLeapMonth = 0;


                solMonthDay[1] = 28; /* 1900 �� 2�� 28�� */
                lunMonthDay = 30; /* 1899�� 12�� */
            }
            else if (year >= 1880)
            {
                /* �������� ��� 1880�� 1�� 1�� (���� 1879�� 11�� 20��) */
                solYear = 1880;
                solMonth = 1;
                solDay = 1;
                lunYear = 1879;
                lunMonth = 11;
                lunDay = 20;
                lunLeapMonth = 0;


                solMonthDay[1] = 29; /* 1880 �� 2�� 28�� */
                lunMonthDay = 30; /* 1879�� 11�� */
            }
            else if (year >= 1860)
            {
                /* �������� ��� 1860�� 1�� 1�� (���� 1859�� 12�� 9��) */
                solYear = 1860;
                solMonth = 1;
                solDay = 1;
                lunYear = 1859;
                lunMonth = 12;
                lunDay = 9;
                lunLeapMonth = 0;


                solMonthDay[1] = 29; /* 1860 �� 2�� 28�� */
                lunMonthDay = 30; /* 1859�� 12�� */
            }
            else if (year >= 1840)
            {
                /* �������� ��� 1840�� 1�� 1�� (���� 1839�� 11�� 27��) */
                solYear = 1840;
                solMonth = 1;
                solDay = 1;
                lunYear = 1839;
                lunMonth = 11;
                lunDay = 27;
                lunLeapMonth = 0;


                solMonthDay[1] = 29; /* 1840 �� 2�� 28�� */
                lunMonthDay = 30; /* 1839�� 11�� */
            }
            else if (year >= 1820)
            {
                /* �������� ��� 1820�� 1�� 1�� (���� 1819�� 11�� 16��) */
                solYear = 1820;
                solMonth = 1;
                solDay = 1;
                lunYear = 1819;
                lunMonth = 11;
                lunDay = 16;
                lunLeapMonth = 0;


                solMonthDay[1] = 29; /* 1820 �� 2�� 28�� */
                lunMonthDay = 30; /* 1819�� 11�� */
            }
            else if (year >= 1800)
            {
                /* �������� ��� 1800�� 1�� 1�� (���� 1799�� 12�� 7��) */
                solYear = 1800;
                solMonth = 1;
                solDay = 1;
                lunYear = 1799;
                lunMonth = 12;
                lunDay = 7;
                lunLeapMonth = 0;


                solMonthDay[1] = 28; /* 1800 �� 2�� 28�� */
                lunMonthDay = 30; /* 1799�� 12�� */
            }


            lunIndex = lunYear - 1799;


            while (true)
            {


                if (type == 1 &&
                    year == solYear &&
                    month == solMonth &&
                    day == solDay)
                {
                    return new myDate(lunYear, lunMonth, lunDay, lunLeapMonth);
                }
                else if (type == 2 &&
                    year == lunYear &&
                    month == lunMonth &&
                    day == lunDay &&
                    leapmonth == lunLeapMonth)
                {
                    return new myDate(solYear, solMonth, solDay, 0);
                }


                /* add a day of solar calendar */
                if (solMonth == 12 && solDay == 31)
                {
                    solYear++;
                    solMonth = 1;
                    solDay = 1;


                    /* set monthDay of Feb */
                    if (solYear % 400 == 0)
                        solMonthDay[1] = 29;
                    else if (solYear % 100 == 0)
                        solMonthDay[1] = 28;
                    else if (solYear % 4 == 0)
                        solMonthDay[1] = 29;
                    else
                        solMonthDay[1] = 28;


                }
                else if (solMonthDay[solMonth - 1] == solDay)
                {
                    solMonth++;
                    solDay = 1;
                }
                else
                    solDay++;


                /* add a day of lunar calendar */
                if (lunMonth == 12 &&
                    ((lunarMonthTable[lunIndex][lunMonth - 1] == 1 && lunDay == 29) ||
                        (lunarMonthTable[lunIndex][lunMonth - 1] == 2 && lunDay == 30)))
                {
                    lunYear++;
                    lunMonth = 1;
                    lunDay = 1;


                    if (lunYear > 2101) {
                        alert("�Է��Ͻ� �� �Ǵ� ���� �����ϴ�. �ٽ� �Է��Ͻñ� �ٶ��ϴ�.");
                        break;
                    }


                    lunIndex = lunYear - 1799;


                    if (lunarMonthTable[lunIndex][lunMonth - 1] == 1)
                        lunMonthDay = 29;
                    else if (lunarMonthTable[lunIndex][lunMonth - 1] == 2)
                        lunMonthDay = 30;
                }
                else if (lunDay == lunMonthDay)
                {
                    if (lunarMonthTable[lunIndex][lunMonth - 1] >= 3
                        && lunLeapMonth == 0)
                    {
                        lunDay = 1;
                        lunLeapMonth = 1;
                    }
                    else
                    {
                        lunMonth++;
                        lunDay = 1;
                        lunLeapMonth = 0;
                    }


                    if (lunarMonthTable[lunIndex][lunMonth - 1] == 1)
                        lunMonthDay = 29;
                    else if (lunarMonthTable[lunIndex][lunMonth - 1] == 2)
                        lunMonthDay = 30;
                    else if (lunarMonthTable[lunIndex][lunMonth - 1] == 3)
                        lunMonthDay = 29;
                    else if (lunarMonthTable[lunIndex][lunMonth - 1] == 4 &&
                        lunLeapMonth == 0)
                        lunMonthDay = 29;
                    else if (lunarMonthTable[lunIndex][lunMonth - 1] == 4 &&
                        lunLeapMonth == 1)
                        lunMonthDay = 30;
                    else if (lunarMonthTable[lunIndex][lunMonth - 1] == 5 &&
                        lunLeapMonth == 0)
                        lunMonthDay = 30;
                    else if (lunarMonthTable[lunIndex][lunMonth - 1] == 5 &&
                        lunLeapMonth == 1)
                        lunMonthDay = 29;
                    else if (lunarMonthTable[lunIndex][lunMonth - 1] == 6)
                        lunMonthDay = 30;
                }
                else
                    lunDay++;
            }
        }


        function getWeekday(year, month, day)
        {


            var weekday = Array("��", "��", "ȭ", "��", "��", "��", "��");
            var date = new Date(year, month - 1, day);


            if (date)
                return weekday[date.getDay()];
        }


        function getPassDay(year, month, day)
        {
            var date = new Date(year, month - 1, day);


            var interval = Math.floor((todayDate - date) / (1000 * 60 * 60 * 24) + 1);


            return interval;
        }


        function getDDay(year, month, day)
        {
            var date = new Date(year, month - 1, day);


            var interval = Math.floor((date - todayDate) / (1000 * 60 * 60 * 24) + 1);


            return interval;
        }


        function getDateSpecificInterval(year, month, day, interval)
        {
            var date = new Date(year, month - 1, parseInt(day, 10) + parseInt(interval, 10) - 1);


            return date;
        }


        function getGanjiD(year, month, day)
        {
            var Ganji = Array('ˣ��','����','ܰ��','����','����','����','����','��ڱ','����','ͤ�','ˣ��','����',
                'ܰ��','����','����','����','����','����','����','ͤڱ','ˣ��','���','ܰ��','����',
                '����','����','����','����','����','ͤ��','ˣ��','��ڱ','ܰ��','���','����','����',
                '����','����','����','ͤ��','ˣ��','����','ܰ��','��ڱ','����','���','����','����',
                '����','ͤ��','ˣ��','����','ܰ��','����','����','��ڱ','����','���','����','ͤ��');

            var date = new Date(year, month - 1, day);
            //1701�� 1�� 14���� �����Ϸ� �Ѵ�. 1800�� ������ ������ �����ϱ� ���� 1799�� 12�� 31�� �������� �������� ���Ѵ�.
            var basicDate = new Date(1701, 0, 14);


            var interval = Math.floor([(date - basicDate) / (1000 * 60 * 60 * 24)] % 60);


            if (date)
                return Ganji[interval];
        }


        function dayCalcDisplay(type)
        {
            switch (type) {
                /* ������ ����° */
                case 1:
                    var startYear = parseInt(document.getElementById("mStartYear").value, 10);
                    var startMonth = parseInt(document.getElementById("mStartMonth").value, 10);
                    var startDay = parseInt(document.getElementById("mStartDay").value, 10);
                    break;


                /* x ��° �Ǵ³� */
                case 2:
                    var startYear = parseInt(document.getElementById("mmStartYear").value, 10);
                    var startMonth = parseInt(document.getElementById("mmStartMonth").value, 10);
                    var startDay = parseInt(document.getElementById("mmStartDay").value, 10);
                    break;


                /* D-day */
                case 3:
                    var startYear = parseInt(document.getElementById("targetYear").value, 10);
                    var startMonth = parseInt(document.getElementById("targetMonth").value, 10);
                    var startDay = parseInt(document.getElementById("targetDay").value, 10);
                    break;

                /* ���� ��� */
                case 4:
                    var startYear = parseInt(document.getElementById("weekdayYear").value, 10);
                    var startMonth = parseInt(document.getElementById("weekdayMonth").value, 10);
                    var startDay = parseInt(document.getElementById("weekdayDay").value, 10);
                    break;


                /* ��� ���� ��ȯ */
                case 5:
                    var startYear = parseInt(document.getElementById("lsStartYear").value, 10);
                    var startMonth = parseInt(document.getElementById("lsStartMonth").value, 10);
                    var startDay = parseInt(document.getElementById("lsStartDay").value, 10);
                    break;

            }


            if ( !startYear || startYear == 0 ||
                !startMonth || startMonth == 0 ||
                !startDay || startDay == 0 )
            {
                alert('��¥�� �Է����ּ���');
                return;
            }


            var solMonthDay = [31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31];


            if (startYear % 400 == 0 || ( startYear % 4 == 0 && startYear % 100 != 0 )) solMonthDay[1] += 1;


            var startDate = new Date(startYear, startMonth - 1, startDay);
            var today = new Date(todayDate.getFullYear(),
                todayDate.getMonth(), todayDate.getDate());


            switch (type)
            {
                /* ������ ����° */
                case 1:
                    if (today < startDate)
                    {
                        alert("�������� ���ú��� ���� ��¥�� �����ϼ���");
                        return;
                    }


                    var interval = getPassDay(startYear, startMonth, startDay);
                    document.getElementById("day1").value = interval;
                    break;
                /* x �� �Ǵ� ���� */
                case 2:


                    var day2 = document.getElementById("day2").value;


                    if (day2 <= 0)
                    {
                        alert("0 ���� ū ���� �Է��ϼ���");
                        return;
                    }


                    var date = getDateSpecificInterval(startYear, startMonth, startDay, day2);


                    document.getElementById("resultDay").value =
                        String(date.getFullYear()) + "�� " +
                        String(date.getMonth() +1 ) + "�� " +
                        String(date.getDate()) + "��";


                    break;
                /* D-Day */
                case 3:

                    var interval = getDDay(startYear, startMonth, startDay);


                    if (today > startDate)
                    {
                        alert("�������� ���� ���� ��¥�� �����ϼ���");
                        return;
                    }


                    document.getElementById("day3").value = interval;


                    break;


                /* ���� ��� */
                case 4:
                    if (startYear < 100)
                    {
                        alert('�⵵�� 100�� ���ķ� �Է��� �ּ���');
                        return;
                    }
                    weekday.value = getWeekday(startYear, startMonth, startDay) + "����";


                    break;


                /* ���/���� ��ȯ */
                case 5:
                    if (document.getElementById('solarLunar').value == 'solar')
                    {
                        var leapMonth = document.getElementById('leapMonth').checked;
                        var date = lunarCalc(startYear, startMonth, startDay, 2, leapMonth);
                    }
                    else
                    {
                        var date = lunarCalc(startYear, startMonth, startDay, 1);
                    }


                    if (date)
                    {
                        document.getElementById('solarLunarDay').value =
                            date.year + "�� " +
                            (date.leapMonth ? "��" : "") + date.month + "�� " +
                            date.day + "��";


                    }
                    else
                    {
                        document.getElementById('solarLunarDay').value = "";
                    }


                    break;
            }
        }


        function memorialDayCheck(solarDate, lunarDate)
        {
            var i;
            var memorial;



            for (i = 0; i < memorialDays.length; i++)
            {
                if (memorialDays[i].month == solarDate.month &&
                    memorialDays[i].day == solarDate.day &&
                    memorialDays[i].solarLunar == 1)
                    return memorialDays[i];

//������ ������ ó���� ���� ����ó��
                if ( lunarDate.leapMonth && lunarDate.month == 4 && lunarDate.day == 8 ) {
                    return null;
                }
                if ( lunarDate.leapMonth && lunarDate.month == 8 && lunarDate.day > 13 && lunarDate.day < 17) {
                    return null;
                }


                if (memorialDays[i].month == lunarDate.month &&
                    memorialDays[i].day == lunarDate.day &&
                    memorialDays[i].solarLunar == 2 &&
                    !memorialDays[i].leapMonth)
                    return memorialDays[i];
            }


            return null;
        }


        function yearmemorialDayCheck(solarDate, lunarDate)
        {
            var i;
            var yearmemorial;



            for (i = 0; i < yearmemorialDays.length; i++)
            {
                if (yearmemorialDays[i].year == solarDate.year &&
                    yearmemorialDays[i].month == solarDate.month &&
                    yearmemorialDays[i].day == solarDate.day &&
                    yearmemorialDays[i].solarLunar == 1)
                    return yearmemorialDays[i];


                if (yearmemorialDays[i].year == lunarDate.year &&
                    yearmemorialDays[i].month == lunarDate.month &&
                    yearmemorialDays[i].day == lunarDate.day &&
                    yearmemorialDays[i].solarLunar == 2 &&
                    !yearmemorialDays[i].leapMonth)
                    return yearmemorialDays[i];
            }


            return null;
        }



        /* �̰��� ������, �����޷� �Ѿ�� �Լ��� �Է��Ѵ� */
        function trim(str) {
            return str.replace(/(^s+)|(s+$)/g,"");
        }


        function prevMonth()
        {
            var yearTmp = parseInt(document.getElementById('yearSelect').value, 10);
            var monthTmp = parseInt(document.getElementById('monthSelect').value, 10);


            if (yearTmp >= 1800 && monthTmp >= 1) {
                var date = new Date(yearTmp, monthTmp - 2);
                document.getElementById('yearSelect').value = date.getFullYear();
                document.getElementById('monthSelect').value = date.getMonth() + 1;

                setCalendar(date.getFullYear(), date.getMonth() + 1);
            }


        }


        function nextMonth()
        {

            var yearTmp = parseInt(document.getElementById('yearSelect').value, 10);
            var monthTmp = parseInt(document.getElementById('monthSelect').value, 10);

            if (yearTmp <= 2101 && monthTmp <= 12) {
                var date = new Date(yearTmp, monthTmp);

                document.getElementById('yearSelect').value = date.getFullYear();
                document.getElementById('monthSelect').value = date.getMonth() + 1;

                setCalendar(date.getFullYear(), date.getMonth() + 1);
            }
        }


        function currentMonth()
        {

            var yearTmp = parseInt(document.getElementById('yearSelect').value, 10);
            var monthTmp = parseInt(document.getElementById('monthSelect').value, 10);

            if (yearTmp >= 1800 && monthTmp >= 1 && yearTmp <= 2101 && monthTmp <= 12) {
                var todayDate = new Date();

                document.getElementById('yearSelect').value = todayDate.getFullYear();
                document.getElementById('monthSelect').value = todayDate.getMonth() + 1;

                setCalendar(todayDate.getFullYear(), todayDate.getMonth() + 1);
            }
        }


        function setCalendar(year, month)
        {
            var i;
            var oYearSelect = document.getElementById('yearSelect');
            var oMonthSelect = document.getElementById('monthSelect');


            if (!year)
            {
                year = oYearSelect.value;
                month = oMonthSelect.value;
            }
            else
            {
                for (i = 0; i < oYearSelect.length; i++)
                    if (oYearSelect[i].value == year)
                    {
                        oYearSelect.selectedIndex = i;
                        break;
                    }

                for (i = 0; i < oMonthSelect.length; i++)
                    if (oMonthSelect[i].value == month)
                    {
                        oMonthSelect.selectedIndex = i;
                        break;
                    }
            }


            var monthDay = Array(31, 0, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31);


            /* set monthDay of Feb */
            if (year % 400 == 0)
                monthDay[1] = 29;
            else if (year % 100 == 0)
                monthDay[1] = 28;
            else if (year % 4 == 0)
                monthDay[1] = 29;
            else
                monthDay[1] = 28;


            /* set the day before ���� */
            if (lunarMonthTable[year - 1 - 1799][11] == 1)
                memorialDays[1].day = 29;
            else if (lunarMonthTable[year - 1 - 1799][11] == 2)
                memorialDays[1].day = 30;

            var date = new Date(year, month - 1, 1);
            var startWeekday = date.getDay();


            /* clean all day cell */
            for (i = 0; i < 42; i++)
            {
                document.getElementById('dayCell' + i).innerHTML = "";
                document.getElementById('dayCell' + i).bgColor = "FFFFFF";
            }


            /* fill day cell */
            for (i = 0; i < monthDay[month - 1]; i ++)
            {
                var index = startWeekday + i;
                var dayHTML;


                var solarDate = new myDate(year, month, i + 1);
                var lunarDate = lunarCalc(year, month, i + 1, 1);
                var enMonthName = new Array('1�� (January)','2�� (February)','3�� (March)','4�� (April)','5�� (May)','6�� (June)',
                    '7�� (July)','8�� (August)','9�� (September)','10�� (October)','11�� (November)','12�� (December)');
                curenMonth.innerHTML = enMonthName[solarDate.month - 1];


                /* memorial day */
                var memorial = memorialDayCheck(solarDate, lunarDate);


                /* �����ʴ� ����� */
                var memorialDay = false;
                if (memorial && memorial.holiday == false)
                    memorialDay = true;

                var yearmemorial = yearmemorialDayCheck(solarDate, lunarDate);


                /* �����ʴ� ����� */
                var yearmemorialDay = false;
                if (yearmemorial && yearmemorial.holiday == false)
                    yearmemorialDay = true;

                /* day print */
                dayHTML = "<p align=left><font id=ln2 color='COLOR' size=5>HIGHLIGHT_START" +
                    ( i + 1 ) + "HIGHLIGHT_END</font>" + "<br><small><font color=gray>" + (lunarDate.leapMonth ? "��" : "") + lunarDate.month + "." + lunarDate.day + " "/* + getGanjiD(solarDate.year, solarDate.month, solarDate.day) */+ "</font><br>MEMO</small></p>";

                /* decoration */
                if (solarDate.year < 1991 && solarDate.month == 10 && solarDate.day == 9)
                    dayHTML = dayHTML.replace("COLOR", "red");

                if (solarDate.year > 1975 && solarDate.year < 1991 && solarDate.month == 10 && solarDate.day == 1)
                    dayHTML = dayHTML.replace("COLOR", "red");

                if (solarDate.year > 1948 && solarDate.year < 2000 && solarDate.month == 1 && solarDate.day == 2)
                    dayHTML = dayHTML.replace("COLOR", "red");

                if (solarDate.year > 1948 && solarDate.year < 1990 && solarDate.month == 1 && solarDate.day == 3)
                    dayHTML = dayHTML.replace("COLOR", "red");

                //�Ͽ����̳� �������� ���
                if ((memorial && memorial.holiday) || (yearmemorial && yearmemorial.holiday) || index % 7 == 0)
                    dayHTML = dayHTML.replace("COLOR", "red");

                if ((memorial && memorial.holiday) || (yearmemorial && yearmemorial.holiday) || index % 7 == 0)
                    dayHTML = dayHTML.replace("COLOR", "red");


                //������� ���
                else if (index % 7 == 6)
                    dayHTML = dayHTML.replace("COLOR", "#0099FF");

                //��� �����ϰ� ���� �������� ��ġ�� ���

                if (solarDate.year == 2000 && solarDate.month == 4 && solarDate.day == 13)
                    dayHTML = dayHTML.replace("MEMO", "��16�� ��ȸ�ǿ� ������");

                if (solarDate.year == 2027 && solarDate.month == 3 && solarDate.day == 3 && solarDate.month == 3 && solarDate.day == 3)
                    dayHTML = dayHTML.replace("MEMO", "��21�� ����� ����<br>�������ǳ�");

                if (solarDate.year == 2032 && solarDate.month == 3 && solarDate.day == 3 && solarDate.month == 3 && solarDate.day == 3)
                    dayHTML = dayHTML.replace("MEMO", "��22�� ����� ����<br>�������ǳ�");

                if (solarDate.month == 3 && solarDate.day == 1 && lunarDate.month == 1 && lunarDate.day == 15)
                    dayHTML = dayHTML.replace("MEMO", "3��1��<br>�����뺸��");

                if (solarDate.month == 4 && solarDate.day == 28 && lunarDate.month == 4 && lunarDate.day == 8)
                    dayHTML = dayHTML.replace("MEMO", "��ó�Կ��ų�<br>�湫��ź����");

                if (solarDate.month == 5 && solarDate.day == 1 && lunarDate.month == 4 && lunarDate.day == 8)
                    dayHTML = dayHTML.replace("MEMO", "��ó�Կ��ų�<br>�ٷ����ǳ�");

                if (solarDate.month == 5 && solarDate.day == 5 && lunarDate.month == 4 && lunarDate.day == 8)
                    dayHTML = dayHTML.replace("MEMO", "��̳�<br>��ó�Կ��ų�");

                if (solarDate.month == 5 && solarDate.day == 8 && lunarDate.month == 4 && lunarDate.day == 8)
                    dayHTML = dayHTML.replace("MEMO", "��ó�Կ��ų�<br>����̳�");

                if (solarDate.month == 5 && solarDate.day == 15 && lunarDate.month == 4 && lunarDate.day == 8 && index % 7 == 1)
                    dayHTML = dayHTML.replace("MEMO", "��ó�Կ��ų�<br>�����ǳ�<br>�����ǳ�");

                if (solarDate.month == 5 && solarDate.day == 18 && lunarDate.month == 4 && lunarDate.day == 8 && index % 7 == 1)
                    dayHTML = dayHTML.replace("MEMO", "��ó�Կ��ų�<br>5��18 ����ȭ���<br>�����ǳ�");

                if (solarDate.month == 5 && solarDate.day == 19 && lunarDate.month == 4 && lunarDate.day == 8 && index % 7 == 1)
                    dayHTML = dayHTML.replace("MEMO", "��ó�Կ��ų�<br>�����ǳ�<br>�߸��ǳ�");

                if (solarDate.month == 5 && solarDate.day >= 15 && solarDate.day <= 21 && lunarDate.month == 4 && lunarDate.day == 8 && index % 7 == 1)
                    dayHTML = dayHTML.replace("MEMO", "��ó�Կ��ų�<br>�����ǳ�");

                if (solarDate.month == 5 && solarDate.day == 15 && index % 7 == 1)
                    dayHTML = dayHTML.replace("MEMO", "�����ǳ�<br>�����ǳ�");

                if (solarDate.month == 5 && solarDate.day == 18 && index % 7 == 1)
                    dayHTML = dayHTML.replace("MEMO", "5��18 ����ȭ������<br>�����ǳ�");

                if (solarDate.month == 5 && solarDate.day == 19 && index % 7 == 1)
                    dayHTML = dayHTML.replace("MEMO", "�����ǳ�<br>�߸��ǳ�");

                if (solarDate.month == 5 && solarDate.day == 15 && lunarDate.month == 4 && lunarDate.day == 8)
                    dayHTML = dayHTML.replace("MEMO", "��ó�Կ��ų�<br>�����ǳ�");

                if (solarDate.month == 5 && solarDate.day == 18 && lunarDate.month == 4 && lunarDate.day == 8)
                    dayHTML = dayHTML.replace("MEMO", "��ó�Կ��ų�<br>5��18 ����ȭ������");

                if (solarDate.month == 5 && solarDate.day == 19 && lunarDate.month == 4 && lunarDate.day == 8)
                    dayHTML = dayHTML.replace("MEMO", "��ó�Կ��ų�<br>�߸��ǳ�");

                if (solarDate.month == 5 && solarDate.day == 31 && lunarDate.leapMonth)
                    dayHTML = dayHTML.replace("MEMO", "�ٴ��ǳ�");

                if (solarDate.month == 6 && solarDate.day == 5 && lunarDate.month == 5 && lunarDate.day == 5)
                    dayHTML = dayHTML.replace("MEMO", "ȯ���ǳ�<br>�ܿ�");

                if (solarDate.month == 6 && solarDate.day == 6 && lunarDate.month == 5 && lunarDate.day == 5)
                    dayHTML = dayHTML.replace("MEMO", "������<br>�ܿ�");

                if (solarDate.month == 6 && solarDate.day == 25 && lunarDate.month == 5 && lunarDate.day == 5)
                    dayHTML = dayHTML.replace("MEMO", "6��25������<br>�ܿ�");

                if (solarDate.month == 8 && solarDate.day == 15 && lunarDate.month == 7 && lunarDate.day == 7)
                    dayHTML = dayHTML.replace("MEMO", "������<br>ĥ��ĥ��");

                if (solarDate.month == 9 && solarDate.day == 18 && lunarDate.month == 8 && lunarDate.day == 14 || solarDate.month == 9 && solarDate.day == 18 && lunarDate.month == 8 && lunarDate.day == 16)
                    dayHTML = dayHTML.replace("MEMO", "ö���ǳ�");

                if (solarDate.month == 10 && solarDate.day == 1 && lunarDate.month == 8 && lunarDate.day == 14 || solarDate.month == 10 && solarDate.day == 1 && lunarDate.month == 8 && lunarDate.day == 16)
                    dayHTML = dayHTML.replace("MEMO", "�����ǳ�");

                if (solarDate.month == 10 && solarDate.day == 2 && lunarDate.month == 8 && lunarDate.day == 14 || solarDate.month == 10 && solarDate.day == 2 && lunarDate.month == 8 && lunarDate.day == 16)
                    dayHTML = dayHTML.replace("MEMO", "�����ǳ�");

                if (solarDate.month == 10 && solarDate.day == 3 && lunarDate.month == 8 && lunarDate.day == 14 || solarDate.month == 10 && solarDate.day == 3 && lunarDate.month == 8 && lunarDate.day == 16)
                    dayHTML = dayHTML.replace("MEMO", "��õ��");

                if (solarDate.month == 10 && solarDate.day == 8 && lunarDate.month == 8 && lunarDate.day == 17)
                    dayHTML = dayHTML.replace("MEMO", "��ü������<br>���ⱺ���ǳ�");

                if (solarDate.month == 9 && solarDate.day == 18 && lunarDate.month == 8 && lunarDate.day == 15)
                    dayHTML = dayHTML.replace("MEMO", "�߼�<br>ö���ǳ�");

                if (solarDate.month == 10 && solarDate.day == 1 && lunarDate.month == 8 && lunarDate.day == 15)
                    dayHTML = dayHTML.replace("MEMO", "�߼�<br>�����ǳ�");

                if (solarDate.month == 10 && solarDate.day == 2 && lunarDate.month == 8 && lunarDate.day == 15)
                    dayHTML = dayHTML.replace("MEMO", "�߼�<br>�����ǳ�");

                if (solarDate.month == 10 && solarDate.day == 3 && lunarDate.month == 8 && lunarDate.day == 15)
                    dayHTML = dayHTML.replace("MEMO", "��õ��<br>�߼�");

                if (solarDate.month == 10 && solarDate.day == 9 && lunarDate.month == 8 && lunarDate.day == 16)
                    dayHTML = dayHTML.replace("MEMO", "�ѱ۳�<br>����");

                if (solarDate.month == 10 && solarDate.day == 9 && lunarDate.leapMonth)
                    dayHTML = dayHTML.replace("MEMO", "�ѱ۳�");

                //��ġ�� �ʴ� �����
                if (memorial)
                    dayHTML = dayHTML.replace("MEMO", memorial.name);


                if (yearmemorial)
                    dayHTML = dayHTML.replace("MEMO", yearmemorial.name);

                if (solarDate.month == 5 && solarDate.day >= 15 && solarDate.day <= 21 && index % 7 == 1)
                    dayHTML = dayHTML.replace("MEMO", "�����ǳ�");

                else dayHTML = dayHTML.replace("MEMO", "");



                if (todayDate.getFullYear() == year &&
                    todayDate.getMonth() + 1 == month &&
                    todayDate.getDate() == i + 1)
                {
                    dayHTML = dayHTML.replace("HIGHLIGHT_START", "<b>");
                    dayHTML = dayHTML.replace("HIGHLIGHT_END", "</b>");
                    document.getElementById('dayCell' + index).bgColor = "#DBE3E9";
                }

                dayHTML = dayHTML.replace("COLOR", "");
                dayHTML = dayHTML.replace("HIGHLIGHT_START", "");
                dayHTML = dayHTML.replace("HIGHLIGHT_END", "");


                document.getElementById('dayCell' + index).innerHTML = dayHTML;

            }
        }


        function lunarMonthCheck()
        {
            if (document.getElementById('solarLunar').value == "solar")
                document.getElementById('leapMonth').disabled = false;
            else
                document.getElementById('leapMonth').disabled = true;
        }


        var ayear = todayDate.getFullYear(), amonth = todayDate.getMonth() + 1;


        function noAlpha(e)
        {
            if (e.keyCode < 48 || e.keyCode > 57)
                e.returnValue = false;
        }
    </script>

    <style>
        select {
            font-family:����;
            font-size:14px;
            font-weight:bold;
            color: #fff;
            border:none;
            border-right:0px;
            border-top:0px;
            background:#476178;
            cursor: pointer;
            outline: none;
        }
        select:hover {
            font-weight:bold;
            background:#fff;
            color:#000;
        }
        table{
            font-size: 0.8em;
        }
        font{
            font-size: 2.2em;
        }
    </style>

    <table style="display: block; width: 100%; height: auto; display: flex; justify-content: center" border=0 cellpadding=0 cellspacing=0>
        <tr>
            <td nowrap valign=top><!--------�޷� ����----->
                <table border=0 cellpadding=0 cellspacing=0 width=100%>
                    <tr>
                        <td>
                            <table border=0 cellpadding=0 cellspacing=0 width=100%>
                                <tr>
                                    <td rowspan=2 width=1 height=10 nowrap></td>
                                    <td width="1%"></td>
                                </tr>
                                <tr>
                                    <td height=1 bgcolor=#FFFFFF></td>
                                </tr>
                                <tr>
                                    <td style="opacity: 50%; height: 35px" width="97%" bgcolor=#476178 align=center bordercolorlight="#000000" bordercolordark="#000000"><!-----��¥ �ִ� ��--->
                                        <table border=0 cellpadding=0 cellspacing=0>
                                            <tr>
                                                <td nowrap>&nbsp;&nbsp;<input class="fas fa-chevron-right fa-rotate-180" TYPE="button" VALUE="<" onClick="javascript:prevMonth();" class="10"> <!--------�⵵----------> <select id=yearSelect onChange='setCalendar()'>


                                                    <script type=text/javascript>
                                                        for (var i = 1800, selectStr = ""; i <= 2101; i++)
                                                            selectStr += "<option value='" + i + "'>" + i + " ��</option>";
                                                        selectStr += "</select>";
                                                        document.write(selectStr);
                                                    </script>


                                                    <!--------�⵵---------->
                                                    <!--------��---------->


                                                </select><select id=monthSelect  id=monthSelect onChange='setCalendar()'>


                                                    <script type=text/javascript>
                                                        for (var i = 1, selectStr = ""; i <= 12; i++)
                                                            selectStr += "<option value='" + i + "'>" + i + " ��</option>";


                                                        selectStr += "</select>";
                                                        document.write(selectStr);
                                                    </script>

                                                    <style>
                                                        .fa-chevron-right{
                                                            background-color: transparent;
                                                            border: none;
                                                            cursor: pointer;
                                                            color:#fff;
                                                        }
                                                        .fa-chevron-right:hover {
                                                            color: #FFCC00;
                                                        }
                                                        .tb {
                                                            vertical-align: baseline;
                                                            padding-left: 8px;
                                                        }
                                                    </style>
                                                    <!--------��---------->
                                                    <input class="fa fa-chevron-right" TYPE="button" VALUE=">" onClick="javascript:nextMonth();" class="10" >
                                                </select></td>
                                                <td ailgn=right style="width: 60%;">
                                                    <p align="center" style="margin-bottom: 0rem;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                                        <b>
                                                            <font color=#fff><span style="font-size:20px; text-align: right" id=curenMonth></span></font>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                                        </b>
                                                </td>
                                            </tr>
                                        </table>
                                        <!-----��¥ �ִ� ��---></td>
                                </tr>
                                <tr>
                                    <td style="opacity: 50%;" width="97%" height=1 border=0 bgcolor="#000000" bordercolorlight="#000000" bordercolordark="#000000"></td>
                                </tr>
                                <tr>

                                    <td width="97%" bgcolor=ffffff align=center bordercolorlight="#000000" bordercolordark="#000000"><!----�޷� �ִ°�------>
                                        <table border=1 cellpadding=0 cellspacing=0 width=500px bordercolor="#ECEEF2">


                                            <tr>
                                                <td colspan=7 height=7 nowrap></td>
                                            </tr>
                                            <tr>
                                                <td width=15% align=center><font id=ln1 color=red>�ϡ�SUN</font></td>
                                                <td width=14% align=center><font id=ln2>����MON</font></td>
                                                <td width=14% align=center>ȭ��TUE</td>
                                                <td width=14% align=center><font id=ln3>����WED</font></td>
                                                <td width=14% align=center><font id=ln4>��THU</font></td>
                                                <td width=14% align=center><font id=ln5>�ݡ�FRI</font></td>
                                                <td width=15% align=center><font id=ln6 color=#0099FF>�䡤SAT</font></td>
                                            </tr>
                                            <tr>
                                                <td colspan=7 height=7 nowrap></td>
                                            </tr>
                                            <script type=text/javascript>
                                                for (i = 0; i < 6; i++)
                                                {
                                                    document.write("<tr height='65'>");


                                                    for (j = 0; j < 7; j++)
                                                        document.write("<td class='tb' cellSpacing='1' id='dayCell" + ( i * 7 + j )+"'></td>");
                                                    document.write("</tr>");
                                                }



                                                if (typeof(rege_0_1) != "undefined" && 1800 <= rege_0_1 && rege_0_1 <= 2101)
                                                {
                                                    ayear = rege_0_1;
                                                    amonth = 1;
                                                }


                                                if (typeof(rege_0_2) != "undefined" && 1 <= rege_0_2 && rege_0_2 <= 12)
                                                    amonth = rege_0_2;
                                            </script>
                                            <tr>
                                                <td colspan=7 height=7 nowrap></td>
                                            </tr>
                                        </table>
                                        <!----�޷� �ִ°�------></td>
                                </tr>
                            </table>
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
    </table>
</center>
<script>
$(document).ready(function() {
    javascript:currentMonth()
})
</script>
</body>
</html>
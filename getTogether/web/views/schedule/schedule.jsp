<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html xmlns:mso="urn:schemas-microsoft-com:office:office" xmlns:msdt="uuid:C2F41010-65B3-11d1-A29F-00AA00C14882">
<head>
        <meta http-equiv="Content-Language" content="ko">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Calendar</title>
        <link rel="stylesheet" type="text/css" href="../../resources/css/schedule.css" />
        <script type="text/javascript">
            var rege_0_type = "calendar";
            var rege_0_1 = "";
            var rege_0_2 = "";
        </script>
        <style>
			td{
                font-size: 15px;
            }
           	.myButton{
			width : 20px;
			}
        </style>
        </head>
        <body>
        
        <script type=text/javascript>
        var yearSelect;
        var monthSelect;
        var oYearSelect;
        var todayDate;
        
        if (typeof(headerfooter_time_year) != "undefined")
        {
         /* 오늘의 날짜를 서버 날짜로 설정 */
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
         var weekday= new Array('일','월','화','수','목','금','토');
         var wkd= date.getDay();
        }
        
        function memorialDay(name, month, day, solarLunar, holiday, type)
        {
         this.name = name;
         this.month = month;
         this.day = day;
         this.solarLunar = solarLunar;
         this.holiday = holiday;
         this.type = type;
         this.techneer = true;
        }
        
        var memorialDays = Array (
         new memorialDay("신정", 1, 1, 1, true),
         new memorialDay("", 12, 0, 2, true, true),
         new memorialDay("설날", 1, 1, 2, true),
         new memorialDay("", 1, 2, 2, true),
         new memorialDay("3·1절", 3, 1, 1, true),
         new memorialDay("식목일", 4, 5, 1, true),
         new memorialDay("석가탄신일", 4, 8, 2, true),
         new memorialDay("어린이날", 5, 5, 1, true),
         new memorialDay("현충일", 6, 6, 1, true),
         new memorialDay("광복절", 8, 15, 1, true),
         new memorialDay("", 8, 14, 2, true),
         new memorialDay("추석", 8, 15, 2, true),
         new memorialDay("", 8, 16, 2, true),
         new memorialDay("개천절", 10, 3, 1, true),
         new memorialDay("성탄절", 12, 25, 1, true),
         new memorialDay("정월대보름", 1, 15, 2, false),
         new memorialDay("단오", 5, 5, 2, false),
         new memorialDay("국군의날", 10, 1, 1, false),
         new memorialDay("한글날", 10, 9, 1, false),
         new memorialDay("6·25전쟁일", 6, 25, 1, false),
         new memorialDay("발렌타인데이", 2, 14, 1, false),
         new memorialDay("물의날", 3, 22, 1, false),
         new memorialDay("만우절", 4, 1, 1, false),
         new memorialDay("임시정부수립일", 4, 13, 1 , false),
         new memorialDay("4·19혁명기념일", 4, 19, 1 , false),
         new memorialDay("장애인의날", 4, 20, 1 , false),
         new memorialDay("과학의날", 4, 21, 1 , false),
         new memorialDay("정보통신의날", 4, 22, 1 , false),
         new memorialDay("법의날", 4, 25, 1 , false),
         new memorialDay("충무공탄신일", 4, 28, 1, false),
         new memorialDay("근로자의날", 5, 1, 1, false),
         new memorialDay("어버이날", 5, 8, 1, false),
         new memorialDay("스승의날", 5, 15, 1, false),
         new memorialDay("5·18 민주화운동일", 5, 18, 1, false),
         new memorialDay("발명의날", 5, 19, 1, false),
         new memorialDay("바다의날", 5, 31, 1, false),
         new memorialDay("환경의날", 6, 5, 1, false),
         new memorialDay("칠월칠석", 7, 7, 2, false),
         new memorialDay("노인의날", 10, 2, 1, false),
         new memorialDay("체육의날", 10, 15, 1, false),
         new memorialDay("국제연합일", 10, 24, 1, false),
         new memorialDay("학생독립운동기념일", 11, 3, 1, false),
         new memorialDay("철도의날", 9, 18, 1, false),
         new memorialDay("소방의날", 11, 9, 1, false)
        
        );
        
        //특정 연도의 날짜로만 된 기념일 또는 매년 반복되더라도 날짜가 불규칙하게 바뀌는 기념일은 이곳에 입력한다.
        function yearmemorialDay(name, year, month, day, solarLunar, holiday, type)
        {
         this.name = name;
         this.year = year;
         this.month = month;
         this.day = day;
         this.solarLunar = solarLunar;
         this.holiday = holiday; /* true : 빨간날 false : 안빨간날 */
         this.type = type; /* true : real time setting */
         this.techneer = true;
        }
        
        var yearmemorialDays = Array (
         new yearmemorialDay("", 1989, 10, 2, 1, true),
         new yearmemorialDay("제16대 국회의원 선거일", 2000, 4, 13, 1, true),
         new yearmemorialDay("제3대 지방선거일", 2002, 6, 13, 1, true),
         new yearmemorialDay("월드컵기념 임시공휴일", 2002, 7, 1, 1, true),
         new yearmemorialDay("제16대 대통령 선거일", 2002, 12, 19, 1, true),
         new yearmemorialDay("제17대 국회의원 선거일", 2004, 4, 15, 1, true),
         new yearmemorialDay("제4대 지방선거일", 2006, 5, 31, 1, true),
         new yearmemorialDay("제17대 대통령 선거일", 2007, 12, 19, 1, true)
         );
        
        function myDate(year, month, day, leapMonth)
        {
         this.year = year;
         this.month = month;
         this.day = day;
         this.leapMonth = leapMonth;
        }
        
        // 음력 데이터 (평달 - 작은달 :1,  큰달:2 )
        // (윤달이 있는 달 - 평달이 작고 윤달도 작으면 :3 , 평달이 작고 윤달이 크면 : 4)
        // (윤달이 있는 달 - 평달이 크고 윤달이 작으면 :5,  평달과 윤달이 모두 크면 : 6)
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
        
        /* 양력 <-> 음력 변환 함수
         * type : 1 - 양력 -> 음력
         *        2 - 음력 -> 양력
         * leapmonth : 0 - 평달
         *             1 - 윤달 (type = 2 일때만 유효)
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
          alert('1800년부터 2101년까지만 지원합니다');
          return;
         }
         /* 속도 개선을 위해 기준 일자를 여러개로 한다 */
         if (year >= 2080)
         {
          /* 기준일자 양력 2080년 1월 1일 (음력 2079년 12월 10일) */
          solYear = 2080;
          solMonth = 1;
          solDay = 1;
          lunYear = 2079;
          lunMonth = 12;
          lunDay = 10;
          lunLeapMonth = 0;
        
          solMonthDay[1] = 29; /* 2080 년 2월 28일 */
          lunMonthDay = 30; /* 2079년 12월 */
         }
         else if (year >= 2060)
         {
          /* 기준일자 양력 2060년 1월 1일 (음력 2059년 11월 28일) */
          solYear = 2060;
          solMonth = 1;
          solDay = 1;
          lunYear = 2059;
          lunMonth = 11;
          lunDay = 28;
          lunLeapMonth = 0;
        
          solMonthDay[1] = 29; /* 2060 년 2월 28일 */
          lunMonthDay = 30; /* 2059년 11월 */
         }
         else if (year >= 2040)
         {
          /* 기준일자 양력 2040년 1월 1일 (음력 2039년 11월 17일) */
          solYear = 2040;
          solMonth = 1;
          solDay = 1;
          lunYear = 2039;
          lunMonth = 11;
          lunDay = 17;
          lunLeapMonth = 0;
        
          solMonthDay[1] = 29; /* 2040 년 2월 28일 */
          lunMonthDay = 29; /* 2039년 11월 */
         }
         else if (year >= 2020)
         {
          /* 기준일자 양력 2020년 1월 1일 (음력 2019년 12월 7일) */
          solYear = 2020;
          solMonth = 1;
          solDay = 1;
          lunYear = 2019;
          lunMonth = 12;
          lunDay = 7;
          lunLeapMonth = 0;
        
          solMonthDay[1] = 29; /* 2020 년 2월 28일 */
          lunMonthDay = 30; /* 2019년 12월 */
         }
         else if (year >= 2000)
         {
          /* 기준일자 양력 2000년 1월 1일 (음력 1999년 11월 25일) */
          solYear = 2000;
          solMonth = 1;
          solDay = 1;
          lunYear = 1999;
          lunMonth = 11;
          lunDay = 25;
          lunLeapMonth = 0;
        
          solMonthDay[1] = 29; /* 2000 년 2월 28일 */
          lunMonthDay = 30; /* 1999년 11월 */
         }
         else if (year >= 1980)
         {
          /* 기준일자 양력 1980년 1월 1일 (음력 1979년 11월 14일) */
          solYear = 1980;
          solMonth = 1;
          solDay = 1;
          lunYear = 1979;
          lunMonth = 11;
          lunDay = 14;
          lunLeapMonth = 0;
        
          solMonthDay[1] = 29; /* 1980 년 2월 28일 */
          lunMonthDay = 30; /* 1979년 11월 */
         }
         else if (year >= 1960)
         {
          /* 기준일자 양력 1960년 1월 1일 (음력 1959년 12월 3일) */
          solYear = 1960;
          solMonth = 1;
          solDay = 1;
          lunYear = 1959;
          lunMonth = 12;
          lunDay = 3;
          lunLeapMonth = 0;
        
          solMonthDay[1] = 29; /* 1960 년 2월 28일 */
          lunMonthDay = 29; /* 1959년 12월 */
         }
         else if (year >= 1940)
         {
          /* 기준일자 양력 1940년 1월 1일 (음력 1939년 11월 22일) */
          solYear = 1940;
          solMonth = 1;
          solDay = 1;
          lunYear = 1939;
          lunMonth = 11;
          lunDay = 22;
          lunLeapMonth = 0;
        
          solMonthDay[1] = 29; /* 1940 년 2월 28일 */
          lunMonthDay = 29; /* 1939년 11월 */
         }
         else if (year >= 1920)
         {
          /* 기준일자 양력 1920년 1월 1일 (음력 1919년 11월 11일) */
          solYear = 1920;
          solMonth = 1;
          solDay = 1;
          lunYear = 1919;
          lunMonth = 11;
          lunDay = 11;
          lunLeapMonth = 0;
        
          solMonthDay[1] = 29; /* 1920 년 2월 28일 */
          lunMonthDay = 30; /* 1919년 11월 */
         }
         else if (year >= 1900)
         {
          /* 기준일자 양력 1900년 1월 1일 (음력 1899년 12월 1일) */
          solYear = 1900;
          solMonth = 1;
          solDay = 1;
          lunYear = 1899;
          lunMonth = 12;
          lunDay = 1;
          lunLeapMonth = 0;
        
          solMonthDay[1] = 28; /* 1900 년 2월 28일 */
          lunMonthDay = 30; /* 1899년 12월 */
         }
         else if (year >= 1880)
         {
          /* 기준일자 양력 1880년 1월 1일 (음력 1879년 11월 20일) */
          solYear = 1880;
          solMonth = 1;
          solDay = 1;
          lunYear = 1879;
          lunMonth = 11;
          lunDay = 20;
          lunLeapMonth = 0;
        
          solMonthDay[1] = 29; /* 1880 년 2월 28일 */
          lunMonthDay = 30; /* 1879년 11월 */
         }
         else if (year >= 1860)
         {
          /* 기준일자 양력 1860년 1월 1일 (음력 1859년 12월 9일) */
          solYear = 1860;
          solMonth = 1;
          solDay = 1;
          lunYear = 1859;
          lunMonth = 12;
          lunDay = 9;
          lunLeapMonth = 0;
        
          solMonthDay[1] = 29; /* 1860 년 2월 28일 */
          lunMonthDay = 30; /* 1859년 12월 */
         }
         else if (year >= 1840)
         {
          /* 기준일자 양력 1840년 1월 1일 (음력 1839년 11월 27일) */
          solYear = 1840;
          solMonth = 1;
          solDay = 1;
          lunYear = 1839;
          lunMonth = 11;
          lunDay = 27;
          lunLeapMonth = 0;
        
          solMonthDay[1] = 29; /* 1840 년 2월 28일 */
          lunMonthDay = 30; /* 1839년 11월 */
         }
         else if (year >= 1820)
         {
          /* 기준일자 양력 1820년 1월 1일 (음력 1819년 11월 16일) */
          solYear = 1820;
          solMonth = 1;
          solDay = 1;
          lunYear = 1819;
          lunMonth = 11;
          lunDay = 16;
          lunLeapMonth = 0;
        
          solMonthDay[1] = 29; /* 1820 년 2월 28일 */
          lunMonthDay = 30; /* 1819년 11월 */
         }
         else if (year >= 1800)
         {
          /* 기준일자 양력 1800년 1월 1일 (음력 1799년 12월 7일) */
          solYear = 1800;
          solMonth = 1;
          solDay = 1;
          lunYear = 1799;
          lunMonth = 12;
          lunDay = 7;
          lunLeapMonth = 0;
        
          solMonthDay[1] = 28; /* 1800 년 2월 28일 */
          lunMonthDay = 30; /* 1799년 12월 */
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
        
         var weekday = Array("일", "월", "화", "수", "목", "금", "토");
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
        
        function dayCalcDisplay(type)
        {
         var solMonthDay = [31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31];
        
         if (startYear % 400 == 0 || ( startYear % 4 == 0 && startYear % 100 != 0 )) solMonthDay[1] += 1;
        
         var startDate = new Date(startYear, startMonth - 1, startDay);
         var today = new Date(todayDate.getFullYear(),
              todayDate.getMonth(), todayDate.getDate());
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
        
        function trim(str) {
         return str.replace(/(^\s+)|(\s+$)/g,"");
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
        
         /* set the day before 설날 */
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
          var enMonthName = new Array('January','February','March','April','May','June',
                 'July','August','September','October','November','December');
        
          /* memorial day */
          var memorial = memorialDayCheck(solarDate, lunarDate);
        
          /* 쉬지않는 기념일 */
          var memorialDay = false;
          if (memorial && memorial.holiday == false)
           memorialDay = true;
           
             var yearmemorial = yearmemorialDayCheck(solarDate, lunarDate);
        
          /* 쉬지않는 기념일 */
          var yearmemorialDay = false;
          if (yearmemorial && yearmemorial.holiday == false)
           yearmemorialDay = true;
        
          /* day print */
          dayHTML = "<p onclick = 'days("+ (i + 1) +");' align=left><font id=ln"+ (i + 1) +" color='COLOR'>HIGHLIGHT_START" +
              ( i + 1 ) + "HIGHLIGHT_END</font>" + "<br><small></P>";

          /* decoration */
          if (solarDate.year < 1991 && solarDate.month == 10 && solarDate.day == 9)
           dayHTML = dayHTML.replace("COLOR", "red");
           
          if (solarDate.year > 1975 && solarDate.year < 1991 && solarDate.month == 10 && solarDate.day == 1)
           dayHTML = dayHTML.replace("COLOR", "red");
          
          if (solarDate.year > 1948 && solarDate.year < 2000 && solarDate.month == 1 && solarDate.day == 2)
           dayHTML = dayHTML.replace("COLOR", "red");
           
          if (solarDate.year > 1948 && solarDate.year < 1990 && solarDate.month == 1 && solarDate.day == 3)
           dayHTML = dayHTML.replace("COLOR", "red");
            
          //일요일이나 공휴일인 경우
          if ((memorial && memorial.holiday) || (yearmemorial && yearmemorial.holiday) || index % 7 == 0)
           dayHTML = dayHTML.replace("COLOR", "red");
           
          //토요일인 경우
          else if (index % 7 == 6)
           dayHTML = dayHTML.replace("COLOR", "#0099FF");
          
          //겹치지 않는 기념일
          if (todayDate.getFullYear() == year &&
           todayDate.getMonth() + 1 == month &&
           todayDate.getDate() == i + 1)
          {
           dayHTML = dayHTML.replace("HIGHLIGHT_START", "<b>");
           dayHTML = dayHTML.replace("HIGHLIGHT_END", "</b>");
           document.getElementById('dayCell' + index).bgColor = "#DDFFFF";
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
        </b>
        </font>
        <table width=670 border=0 cellpadding=0 cellspacing=0>
        <tr>
         <td nowrap valign=top>
          <tr>
           <td height=32 align=center>
           
           <table border=0 cellpadding=0 cellspacing=0>
           <tr>
            <td nowrap>
        
        <input VALUE="◀" onClick="javascript:prevMonth();" class="myButton">
            
         <select id=yearSelect style='font-family:Arial;font-size:20px;color:black;' onChange='setCalendar()'>
        
        <script type=text/javascript>
         for (var i = 1800, selectStr = ""; i <= 2101; i++)
          selectStr += "<option value='" + i + "'>" + i + " 년</option>";
         selectStr += "</select>";
         document.write(selectStr);
        </script>
        
        </select><select id=monthSelect style='font-family:Arial;font-size:20px;color:black' id=monthSelect onChange='setCalendar()'>
        
        <script type=text/javascript>
         for (var i = 1, selectStr = ""; i <= 12; i++)
          selectStr += "<option value='" + i + "'>" + i + " 월</option>";
         selectStr += "</select>";
         document.write(selectStr);
        </script>
        
            <input VALUE="▶" onClick="javascript:nextMonth();" class="myButton" >
            </select></td>
            <td ailgn=right>
            <p align="center">&nbsp;<b><font color=#009900><span id=curenMonth></span></font></b>
            </td>
           </tr>
           </table>
           </td>
          
          <tr>
           
           <td align=center bordercolorlight="#000000" bordercolordark="#000000">
           <table border=1 cellpadding=0 cellspacing=0 bordercolor="#E9E9E9">
        
           <tr><td colspan=7 height=7 nowrap></td></tr>
           <tr>
            <td width=150px align=center>
            <font id=ln6 color=red>일</font></td>
            <td width=150px align=center>
            <font id=ln6>월</font></td>
            <td width=150px align=center>
            <font id=ln6>화</font></td>
            <td width=150px align=center>
            <font id=ln6>수</font></td>
            <td width=150px align=center>
            <font id=ln6>목</font></td>
            <td width=150px align=center>
            <font id=ln6>금</font></td>
            <td width=150px align=center>
            <font id=ln6 color=#0099FF>토</font></td>
           </tr>
           <tr><td colspan=7 height=7 nowrap></td></tr>
        
        <script type=text/javascript>
         for (i = 0; i < 6; i++)
         {
          document.write("<tr height='65'>");
        
          for (j = 0; j < 7; j++)
           document.write("<td vAlign='top' cellSpacing='1' id='dayCell" + ( i * 7 + j )+ "'></td>");
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
        <script>
        setCalendar(ayear, amonth);
        getToDate();
        </script>
        
        </body>
        
        </html>
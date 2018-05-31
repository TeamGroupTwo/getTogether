<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    import="java.util.*, com.gt.gettogether.department.work.model.vo.*"%>
<%
	
%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <!-- <meta name="viewport" content="width=device-width, initial-scale=1.0"> -->
    <title>부서게시판</title>

    <script src="/gt/resources/js/jquery-3.3.1.min.js"></script>

    <style>
        /* 전체 초기화 */
        /* * {
            margin: 0;
            padding: 0;
        } */

        /* 전체 배경색 */
        body {
            background-color: #DAD5E7;
        }

        /* 내용을 담을 큰 틀 */
        #container {
        	min-width: 1200px;
            margin: 50px auto;
            padding-top: 50px;
            width: 80%;
            height: 700px;
            background-color: white;
            position: absolute;
            top: 80px;
            left: 300px;
        }

        /* 검색과 버튼들을 담는 div */
        #top {
            width: 80%;
            margin: 0 auto;
            height: 75px;
            padding-top: 30px;
        }
        #top input {
            border: 2px solid #604F8D;
            height: 30px;
            font-size: 1.0em;
            padding-left: 2px;
            outline: none;
        }
        #searchBtn {
            display: inline-block;
            width: 20px;
            height: 20px;
            padding: 10px;
            background-color: #5F4D8C;
            border-radius: 5px;
            opacity: .9;
        }
        #searchBtn:hover {
            cursor: pointer;
            opacity: 1;
        }
        #searchBtn img {
            width: 100%;
            height: 100%;
        }

        /* 프로젝트 게시판을 담을 div */
        #content {
            width: 90%;
            margin: 0 auto;
            margin-top: 40px;
            height: 555px;
            /* text-align: center; */
            padding: 0 5%;
            overflow-y: scroll;
            overflow-x: hidden;
        }

    </style>
</head>

<body>

<%@ include file="../../common/header.jsp" %>
<%@ include file="../../common/aside.jsp" %>
    
    <div id="container">
        <div id="top">

        </div>
        <div id="content">

        </div>
    </div>

</body>
</html>















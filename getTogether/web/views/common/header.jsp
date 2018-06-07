<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.gt.gettogether.employee.model.vo.*, java.util.*" %>    
<%  ArrayList<String> roomList = (ArrayList<String>)application.getAttribute("roomList");
	String chat_id = request.getParameter("chat_id");
	String room = (String)request.getAttribute("room");
	%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="https://fonts.googleapis.com/css?family=Righteous|Nanum+Gothic" rel="stylesheet">
<script src="<%=request.getContextPath()%>/resources/js/jquery-3.3.1.min.js"></script>
<style>
   body{
      margin : auto;
      min-width:800px;
   }
   .hText{
      color : white;
      text-shadow: -1px 0 black, 0 1px black, 1px 0 black, 0 -1px black;
      -moz-text-shadow: -1px 0 black, 0 1px black, 1px 0 black, 0 -1px black;
      -webkit-text-shadow: -1px 0 black, 0 1px black, 1px 0 black, 0 -1px black;
      vertical-align: middle;
   }
   .hAll{
      display:inline-block;
   }
   #right-side {
      float:right;
   }
   #header{
      position : absolute;
      background: #5f4d8c;
      width : 100%;
      min-width: 800px;
      height : 40px;
      padding-top : 20px;
      padding-bottom : 20px;
   	  z-index: 1;
   }
   #title{
      font-family:'Righteous', cursive;
      font-size : 1.8em;
      text-decoration: none;
      margin-left : 20px;
   }
   #chat {
      content : url("/gt/resources/images/common/chat.png");
      width : 35px;
      margin-right : 10px;
   }
   #chat:hover{
   		cursor: pointer;
   }
   #profile {
      border-radius : 50%;
      border :1px solid #404040;
      margin : auto;
      width : 34px;
   }
   #empName {
      clear : none;
      vertical-align:middle;
      font-family: 'Nanum Gothic', sans-serif;
      font-size : 1.3em;
      font-weight : bolder;
      letter-spacing : -1px;
      white-space : nowrap;
      margin-right : 25px;
      margin-bottom : 32px;
   }
   #empWrap:hover{
   		cursor: pointer;
   }
   #dropdown{
   		position : relative;
   		display : none;
   		float : right;
   		margin-top : 52px;
   		margin-right : 5px;
   		z-index: 10;
   }
   #drop-triangle{
 	 width:0;
 	 height: 0;
 	 border-right:12px solid transparent;
	 border-bottom:15px solid white;
 	 border-left:12px solid transparent;
 	 margin-left : 160px; 
   }
   #drop-menu{ 	 
   		float : right;
   		display : flex;
   		background: white;
   		width : 200px;
   		height : 30px;
   		padding : 10px;
   }
   .dropBtn {
   		width : 80px;
   		height : 26px;
   		color : white;
   		font-family: 'Nanum Gothic', sans-serif;
      	font-size : 1em;
      	font-weight: bolder;
      	letter-spacing : -1px;
      	text-align: center;
      	border-radius: 5px;
      	padding-top: 3px; 
   }
   .dropBtn:hover {
   		cursor: pointer;
   }
   #updateEmp {
   		background : #5f4d8c;
   		margin-left : 14px;
   		margin-right: 16px;
   }
    #adminMode {
    	width : 100px;
   		background : #5f4d8c;
   		margin-left : 5px;
   		margin-right: 12px;
   }
   #logout {
   		background : #404040;
   }
</style>
</head>
<body>
   <div id="header" class="hAll">
      <a href="<%=request.getContextPath()%>/main.jsp" class="hText" id="title">GETTOGETHER</a>
      <div class="hAll" id="right-side">
         <div class="hAll" id="chat" onclick="chatWindow();"></div>
         <div class="hAll" id="empWrap" onclick="dropdownMenu();">
            <div class="hAll" id="profile" style="content:url('/gt/resources/images/common/profile.png');"></div>
            <div class="hText hAll" id="empName"></div>
         </div>
      </div>
   </div>
     
    <!-- 유저 이름을 선택했을때 보여지는 부분 -->
	 <div id="dropdown">
		<div id="drop-triangle"></div>
		<div id="drop-menu">
			<div class="dropBtn" id="updateEmp" onclick="goMyPage();">정보수정</div>
			<div class="dropBtn" id="adminMode" onclick="goAdmin();">관리자모드</div>
			<div class="dropBtn" id="logout" onclick="logout();">로그아웃</div>
		</div>
	 </div>
	 
	  <script>
   		
	    // 로그인 한 사원의 이름을 가져오는 메소드
	 	$(function() { 
	 		var loginName = sessionStorage.getItem('loginName');
   			$('#empName').text(loginName);
   			if(loginName == "관리자1" || loginName == "관리자2"){
   				$("#chat").css("display", "none");
   				$("#updateEmp").css("display", "none");
   			}
   			else{
   				$("#adminMode").css("display", "none");
   			}
   		});

	    // 사원의 프로필 영역을 누르면 내려가는 dropdown 메뉴
   		function dropdownMenu() {
   			if($("#dropdown").css("display") == "none")
				$("#dropdown").css("display", "block");
   			else
				$("#dropdown").css("display", "none");
		}
	    
	    // 정보수정하는 페이지로 이동하는 메소드
	    function goMyPage() {
	    	location.href = "<%=request.getContextPath()%>/views/employee/employeeUpdate.jsp";
		}
	    
	 	// 관리자 페이지로 이동하는 메소드
	    function goAdmin() {
	    	location.href = "<%=request.getContextPath()%>/views/admin/adminAuthority.jsp";
		}
	    
	 	// 로그아웃하는 메소드
	    function logout() {
			sessionStorage.clear();
			location.href = "<%=request.getContextPath()%>/login.jsp";
		}
	 	
	 	// 채팅 새창으로 띄우기
	 	function chatWindow(){
			window.open("<%=request.getContextPath() %>/views/chat/chatting.jsp", "popup",
					'width=470, height=800, toolbar=no, menubar=no, resizable=no, scrollbars=no, copyhistory=no, status=no, location=no, directories=no');	 		
	 	}
  	 </script>
</body>
</html>
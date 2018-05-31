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


   /* chat style part */
   .first{
   		position : relative;
   		z-index: 8;
   		float: right;
		margin-top: 63px;
		margin-right: 120px;
		width:450px;
		height: 540px;
		border: 1px solid #5f4d8c;
		background: white;
		display: none;
		overflow-y:scroll;	
	}
	.first::-webkit-scrollbar {display: none;}

	#fieldBox{
	margin: 8px;
	cursor: pointer;
	}
	
	.chatBox{display: none;}
	.third{
	position:absolute;
	display:inline-block;
	z-index: 6;
	background: #5f4d8c;
	width: 100%;
	height: 5px;
	 padding-top : 20px;
     padding-bottom : 20px;
	}
	.messageBox{
	padding-top : 40px;
	height: 455px;
	overflow-y:scroll;}
	.messageBox::-webkit-scrollbar {display: none;}
	#back{
	color: white;
	font-weight:bold;
	font-size: 1.5em;
	margin-top: -20px;
	margin-left: 12px;
	cursor: pointer;
	}
	#participants{
	color: white; 
	float:right;
	display:inline-block;
	font-weight:bold;
	font-size: 1.2em;
	margin-top: -28px;
	margin-right: 12px;
	cursor: pointer;
	}
	
	.chat_content{
    background: rgb(255, 255, 102);
    padding: 10px;
    border-radius: 10px;
    display: inline-block;
    position: relative;
    margin: 10px;
    float: right;
    clear: both;
 }
 
 .chat_content:after{
    content: '';
   position: absolute;
   right: 0;
   top: 50%;
   width: 0;
   height: 0;
   border: 20px solid transparent;
   border-left-color: rgb(255, 255, 102);
   border-right: 0;
   border-top: 0;
   margin-top: -3.5px;
   margin-right: -10px;
 }
 
 .other-side {
    background: skyblue;
    float:left;
    clear:both;
 }
 
 .other-side:after{
    content: '';
   position: absolute;
   left: 0;
   top: 50%;
   width: 0;
   height: 0;
   border: 20px solid transparent;
   border-right-color: skyblue;
   border-left: 0;
   border-top: 0;
   margin-top: -3.5px;
   margin-left: -10px;
 }
</style>
</head>
<body>
   <div id="header" class="hAll">
      <a href="<%=request.getContextPath()%>/main.jsp" class="hText" id="title">GETTOGETHER</a>
      <div class="hAll" id="right-side">
         <div class="hAll" id="chat" onclick="onoffChat();"></div>
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


 <!-- chat 구현뷰(view) -->
	 <div class="box first">
		<% if(roomList!=null){for(String r : roomList){%>
		<div class="box second" onclick="inChatroom();">
			<fieldset id="fieldBox">
			<legend><%=r %><% room = r; %></legend>
			<label style="float: right;">참여 인원 : <%-- <%=numberOfPerson %> --%>n명 </label>
			</fieldset>
		</div>
		<%}}%>
		<div class="box chatBox">
		<div class="box third">
		<div id="back" onclick="backPage();">←</div>
		
		<div id="participants"><%=room %>&nbsp; ▼ 참여자(<!-- 참여하는 명 수 들어갈 예정 -->)</div> 
		</div>
		<div class="box messageBox"></div>
		<hr>
		<div class="box fifth">
		<input type="text" id="sendMsg" size="50" style="margin-left: 2px;">&nbsp;<input type="submit" value="보내기" />
		</div>
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


		/* chat workpart */
		
		var webSocket = null;
		
   		function onoffChat(){
			$.ajax({
				url : "<%= request.getContextPath() %>/roomView.do",
				type : "GET",
				data : {dept : sessionStorage.getItem('loginDept')	},
				success : function(data){console.log("전달 성공");	},
				error : function(data){	console.log("전달 실패!");}
			});
   				
   				if($('.first').css("display") == "none") $(".first").css("display", "block");
   				else $(".first").css("display", "none");
   		
   				if($("#dropdown").css("display") == "block") $("#dropdown").css("display", "none");

   		}
   		
		/* 채팅방 내부 */
		function inChatroom(){
			
			webSocket = new WebSocket('ws://localhost:8088<%=request.getContextPath()%>/multicast/<%=room %>');
			
			$('.first').remove("overflow-y", "hidden");
			
			$.ajax({
				url : "<%= request.getContextPath() %>/chatRoom.do",
				type : "GET",
				data : { name : sessionStorage.getItem('loginName')+" "+sessionStorage.getItem('loginRank'),
						 chatRoom : $('legend').text()},
				success : function(data){console.log("전달 성공");	},
				error : function(data){	console.log("전달 실패!!");}
			});
			
			var chat_id = sessionStorage.getItem('loginName')+" "+sessionStorage.getItem('loginRank');	// 채팅ID(닉네임)
			var $chatArea = $('.messageBox');	
			var $sendMsg = $('#sendMsg');

			if(webSocket.close()) webSocket.onopen = function(event){
				$chatArea.html("<p>"+chat_id+"님이 입장하셨습니다.</p>");
				
				webSocket.send(chat_id+"|님이 입장하셨습니다.");
				}
			
			webSocket.onmessage = function(event){
				onMessage(event);		// 동작할 부분
			}
			
			webSocket.onerror = function(event){onError(event);}
			if(!webSocket.close()) webSocket.onclose = function(event){onClose(event);}
		
		function send(){
			if($sendMsg.val()==""){	// 메시지를 입력하지 않을 경우
				alert("메세지를 입력해주세요.");
			}	else{	
				$chatArea.html($chatArea.html()+"<p class='chat_content'>"+$sendMsg.val()+"</p><br>");
			
			webSocket.send(chat_id+"|"+$sendMsg.val());
			$sendMsg.val("");
			}
		}
		$('#sendMsg').on('keyup', function(){
			if(window.event.keyCode==13) send();
		});
		$('input:submit').on('click', function(){
			send();});
		function onMessage(event){
			var message = event.data.split("|");
			var sender = message[0];		
			var content = message[1];		
			
			if(content==""){
				// 전달된 글이 없을 경우 화면에 전달받지 않음
			}	else{
				$chatArea.html($chatArea.html()+"<p class='chat_content other-side'>"+sender+" : "+content+"</p><br>");
			}
		}
		
		function onError(event){alert(event.data);}		
		function onClose(event){alert(event);}

			$(".second").css("display", "none");
			$(".chatBox").css("display","block");
			
			/* $('#endBtn').on('click', function(){
			webSocket.send(chat_id+"|님이 퇴장하였습니다.");
			webSocket.close();
		}); */
		}
		
		function backPage(){	/* 뒤로가기(나가기X) */
			$(".second").css("display", "block");
			$(".chatBox").css("display","none");
		}
  	 </script>	
</body>
</html>
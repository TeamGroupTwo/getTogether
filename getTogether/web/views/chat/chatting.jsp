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
<title>GT Chat</title>
<script src="<%=request.getContextPath()%>/resources/js/jquery-3.3.1.min.js"></script>
<link href="https://fonts.googleapis.com/css?family=Righteous|Nanum+Gothic" rel="stylesheet">
<style>
	/* chatting popup header */
	body{margin : auto;}
	
   #header{
      position : absolute;
      background: #5F4D8C;
      width : 100%;
      height : 70px;
   	  z-index: 1;
   }
   #title{
   color:white;
   font-family:'Righteous', cursive;
   font-size : 1.8em;
   text-decoration: none;
   margin-left : 8px;
  margin-top : 20px;
   }
   
   /* chat roomList part */
	.roomListBox{
	position: relative;
	top:80px;
	overflow-y:scroll; 
	}
	
	.roomListBox::-webkit-scrollbar {display: none;}
	
	#fieldBox{
	margin: 8px;
	cursor: pointer;}
	
	#addRoom{
	color: white;
	text-align : center;
	font-size: 1.3em;
	font-weight: bold; 
	background: #5F4D8C;
	float: right;
	width: 80px;
	height: 40px;
	position:relative;
	top : 670px;
	right : 8px; 
	border-radius: 3cm;
	padding-left:8px;
	padding-right:8px;
	cursor: pointer;
	}
	
	#onlineList{
	display:none;
	width: 360px;
	height: 470px;
	position: absolute;
	z-index: 7;
	top : 90px;
	left : 50px;
	background:white;
	border: 1px solid #5f4d8c;
	}
	
	#selectList{
		background: rgba(95,77,140, 0.8);
		width : auto;
		height: 90px;
		color:white;
		overflow-x:scroll;
	}
	#searchEngine{
		height: 26px;
	}
	.btncss1{
		background: #5F4D8C;
		border: none;
		border-radius : 1cm;
		padding-left: 7px;
		padding-right: 7px;
		color: white;
		cursor: pointer;
	}
	#memberList{
		height: 327px;
		width: 100%;
	}
	#inviteArea{
		
	}
	
	/* chatRoom inside css */
	
	.chatBox{display: none;}
	.messageBox{
	padding-top : 63px;
	height: 690px;
	overflow-y:scroll;
	}
	.messageBox::-webkit-scrollbar {display: none;}
	#back{
	color: white;
	font-weight:bold;
	font-size: 2.3em;
	cursor: pointer;
	padding-top: 4px;
	display: inline-block;
	}
	#participants{
	color: white; 
	float:right;
	display:inline-block;
	font-weight:bold;
	font-size: 1.2em;
	cursor: pointer;
	padding-top: 22px;
	}
	#talkerList{
	display: none;
	position : absolute;
	right : 5px;
	width: 200px;
	height: 300px;
	border: dashed 1px #5F4D8C;
	float: right;
	z-index: 8;
	background: white;
	overflow-y:scroll;
	}
	#talkerList::-webkit-scrollbar {display: none;}
	
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
	<header>
	<div id="header">
      <p class="hText" id="title">GETTOGETHER CHAT</p>
      </div>
      </header>
     <!-- 채팅방 리스트 -->
		<% if(roomList!=null){for(String r : roomList){%>
		<div class="roomListBox" onclick="inChatroom();">
			<fieldset id="fieldBox">
			<legend><%=r %><% room = r; %></legend>
			<label style="float: right;">참여 인원 : <%-- <%=numberOfPerson %> --%>n명 </label>
			</fieldset>
		</div>
		<%}}%>
		<div id="onlineList">
			<div id="selectList"></div>
			<div id="searchEngine" align="center">
				<input type="search" id="searchMember" placeholder="멤버 검색"/>
				<input type="submit" value="검색" class="btncss1 search"/>
			</div>
				<select id="memberList" multiple>
					<% for(int i=0;i<30;i++) {%>
					<option value="유저<%=i+1 %>">유저<%=i+1 %></option>
					<%} %>
				</select>
			<div id="inviteArea" align="center">
			<input type="text" name="createRoom" id="createRoom" placeholder="채팅방 이름을 입력하세요">
			<button class="btncss1" onclick="invite()">초대</button>
			<button class="btncss1" onclick="inviteCancel()">취소</button>
			</div>
		</div>
		<div id="addRoom">방 추가</div>
		
		<!-- 채팅방 내부 -->
		<div class="chatBox">
		<div id="header">
		<div id="back" onclick="backPage();">←</div>
		<div id="participants"><%=room %>&nbsp; ▼ 참여자(<!-- 참여하는 명 수 들어갈 예정 -->)</div>
		<div id="talkerList"></div>
		</div>
		<div class="box messageBox"></div>
		<hr>
		<div class="box fifth">
		<input type="text" id="sendMsg" size="50" style="margin-left: 2px;">&nbsp;<input type="submit" value="보내기" />
		</div>
		</div>
	 <script>
	 
		/* 창 열리자마자 채팅목록 전달 */
		window.onload = function(){
			$.ajax({
				url : "<%= request.getContextPath() %>/deptroomView.do",
				type : "GET",
				data : {dept : sessionStorage.getItem('loginDept')	},
				success : function(data){	},
				error : function(data){	console.log("전달 실패!");}
			});
		}
	
		var webSocket = null;
		var chat_id = sessionStorage.getItem('loginName')+" "+sessionStorage.getItem('loginRank');	// 채팅ID(닉네임)
		var $chatArea = $('.messageBox');	
		
		var n = 0;
		
		/* 채팅방 내부 */
		function inChatroom(){
			$(".roomListBox").css("display", 'none');
			$('#addRoom').css('display', 'none');
			$('#header p').css('display', 'none');
			
			
			 if(n==0) {webSocket = new WebSocket('ws://localhost:8088<%=request.getContextPath()%>/multicast/<%=room %>');
				n++;
				}
			
			$.ajax({
				url : "<%= request.getContextPath() %>/chatRoom.do",
				type : "GET",
				data : { name : sessionStorage.getItem('loginName')+" "+sessionStorage.getItem('loginRank'),
						 chatRoom : $('legend').text()},
				success : function(data){
					$(".roomListBox").css("display", "none");
					$(".chatBox").css("display","block");
				},
				error : function(data){	console.log("전달 실패!!");}
			});
			
			webSocket.onopen = function(event){
			$chatArea.html("<p>"+chat_id+"님이 입장하셨습니다.</p>");
				
			webSocket.send(chat_id+"|님이 입장하셨습니다.");	}
			
			webSocket.onmessage = function(event){onMessage(event);}
			
			webSocket.onerror = function(event){onError(event);}
			 if(!(webSocket.readyState == webSocket.CLOSED ||webSocket.readyState == webSocket.CLOSING)) 
				webSocket.onclose = function(event){onClose(event);}
			 
			function onError(event){alert(event.data);}	
			function onClose(event){alert(event);}
			
			/* $('#endBtn').on('click', function(){
			webSocket.send(chat_id+"|님이 퇴장하였습니다.");
			webSocket.close();
		}); */
		
		}
		function send(){
			var $sendMsg = $('#sendMsg');
			
			if($sendMsg.val()==""){	// 메시지를 입력하지 않을 경우
				alert("메세지를 입력해주세요.");
			}	else{
				$chatArea.html($chatArea.html()+"<p class='chat_content'>"+$sendMsg.val()+"</p><br>");
			
				webSocket.send(chat_id+"|"+$sendMsg.val());
				$sendMsg.val("");

			}
			scrollDown();
		}
		$('#sendMsg').on('keyup', function(){
			if(window.event.keyCode==13) send();});
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
			scrollDown();
		}

		function scrollDown(){		/* 최신글로 이동 */
			/* console.log("현재 길이 : "+$('.messageBox').prop('scrollHeight')); */
			$('.messageBox').scrollTop($('.messageBox').prop('scrollHeight'));
		}
		
		function backPage(){	/* 뒤로가기(나가기X) */
			$(".roomListBox").css("display", "block");
			$('#header p').css('display', 'block');
			$(".chatBox").css("display","none");
			if($('#addRoom').css("display") == "none") $("#addRoom").css("display", "block");
			n++;
		}
		
		$('#participants').on('click', function(){	/* 참여자 목록 가져오기 */
			if($('#talkerList').css('display')=="none"){
				$('#talkerList').slideDown(250);
				getUserList();
			}
			else {
				$('#talkerList').slideUp(100);
				delUserList();}
		});
		
		function getUserList(){
			$.ajax({
				url : "<%=request.getContextPath()%>/getUserList.do",
				data : {name : chat_id},
				type : "post",
				success : function(data){
					$userList = $('#talkerList');
					$userList.empty();
	
					for(var idx in data){
						var $p = $('<p>');
						
						$p.text(data[idx]);
						$userList.append($p);}
				}, error : function(data){
					console.log("실패");}
			});
		}
		
		function delUserList(){
			$.ajax({
				url : "<%=request.getContextPath()%>/delUser.do",
				data : {name : chat_id},
				type : "post",
				success : function(data){
					$userList = $('#talkerList');
					$userList.empty();
					
					for(var idx in data){
						var $p = $('<p>');
						
						$p.text(data[idx]);
						$userList.append($p);}
				}, error : function(data){
					console.log("실패");}
			});
		}
		
		$('#addRoom').on('click',function(){	/* 방 추가 버튼  */
			if($('#onlineList').css('display')=='none'){
				$('#onlineList').css('display', 'block');
				$('body').css({'background':'rgba(0,0,0,.6)'});
			}
		});
	
		$('select').change(function(){
			var selectedMember = "";
			$("select option:selected").each(function(){
				selectedMember += $(this).text()+ " ";
			});
			$('#selectList').text(selectedMember);
		});
		
		$('.btncss1 search').on('click', function(){
			$.ajax({
				url : "<%= request.getContextPath() %>/memberSearch.do?member="+$('#searchMember').val(),
				type : "GET",
				data : {member : $('option').text()},
				success : function(data){console.log("전달 성공");	},
				error : function(data){	console.log("전달 실패!!");}
			});
		});
		function invite(){	/* 방 초대 */
			
			if($('#createRoom').val()=="")	{alert("채팅방 이름을 입력해주세요.");}
			else{
				$.ajax({
					url : "<%= request.getContextPath() %>/addRoom.do",
					type : "GET",
					data : { newRoom : $('#createRoom').val(),
							chatRoom : $('legend').text()},
					success : function(data){
						console.log("전달 성공");
						$('#onlineList').css('display', 'none');
						$('body').css('background', 'white');
					},
					error : function(data){	console.log("전달 실패!!");}
						});
				}
		}
		
		function inviteCancel() {	/* 방 추가 취소 */
			$('#onlineList').css('display', 'none');
			$('body').css('background', 'white');
			$("select option:selected").prop("selected", false);
			$('#selectList').text("");
		}
		
	 </script>
</body>
</html>
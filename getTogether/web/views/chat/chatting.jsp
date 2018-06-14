<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="com.gt.gettogether.employee.model.vo.*, java.util.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>GT Chat</title>
<script
	src="<%=request.getContextPath()%>/resources/js/jquery-3.3.1.min.js"></script>
<link
	href="https://fonts.googleapis.com/css?family=Righteous|Nanum+Gothic"
	rel="stylesheet">
<style>
/* chatting popup header */
body {margin: auto;}

#header {
	position: absolute;
	background: #5F4D8C;
	width: 100%;
	height: 70px;
	z-index: 1;
}

#title {
	color: white;
	font-family: 'Righteous', cursive;
	font-size: 1.8em;
	text-decoration: none;
	margin-left: 8px;
	margin-top: 20px;
}

/* chat roomList part */
.roomListBox {
	position: relative;
	top: 80px;
	overflow-y: scroll;
}

.roomListBox::-webkit-scrollbar {display: none;}

.fieldBox {
	margin: 8px;
	cursor: pointer;
}

#addRoom {
	color: white;
	text-align: center;
	font-size: 1.3em;
	font-weight: bold;
	background: #5F4D8C;
	float: right;
	width: 80px;
	height: 40px;
	position: fixed;
	top: 732px;
	right: 17px;
	border-radius: 3cm;
	padding-left: 8px;
	padding-right: 8px;
	cursor: pointer;
	box-shadow: 3px 3px 3px gray;
}

#onlineList {
	display: none;
	width: 360px;
	height: 470px;
	position: absolute;
	z-index: 7;
	top: 90px;
	left: 50px;
	background: white;
	border: 1px solid #5f4d8c;
}

#selectList {
	background: rgba(95, 77, 140, 0.8);
	width: auto;
	height: 90px;
	color: white;
	overflow-x: scroll;
}

#searchEngine {height: 26px;}

.btncss1 {
	background: #5F4D8C;
	border: none;
	border-radius: 1cm;
	padding-left: 7px;
	padding-right: 7px;
	color: white;
	cursor: pointer;
}

#memberList {
	height: 327px;
	width: 100%;
}

#inviteArea {
	
}

/* chatRoom inside css */
.chatBox {	display: none;}

.messageBox {
	padding-top: 63px;
	height: 690px;
	overflow-y: scroll;
}

.messageBox::-webkit-scrollbar {display: none;}

#back {
	color: white;
	font-weight: bold;
	font-size: 2.3em;
	cursor: pointer;
	padding-top: 4px;
	display: inline-block;
}

#participants {
	color: white;
	float: right;
	display: inline-block;
	font-weight: bold;
	font-size: 1.2em;
	cursor: pointer;
	padding-top: 22px;
}

#talkerList {
	display: none;
	position: absolute;
	right: 5px;
	width: 200px;
	height: 300px;
	border: dashed 1px #5F4D8C;
	float: right;
	z-index: 8;
	background: white;
	overflow-y: scroll;
}

#talkerList::-webkit-scrollbar {display: none;}

.chat_content {
	background: rgb(255, 255, 102);
	padding: 10px;
	border-radius: 10px;
	display: inline-block;
	position: relative;
	margin: 10px;
	float: right;
	clear: both;
}

.chat_content:after {
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
	float: left;
	clear: both;
}

.other-side:after {
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
	<!-- 부서별 채팅방 -->
	<div class="roomListBox" id="deptChatDiv" onclick="inChatroom(this);"
		style="background: PeachPuff;"></div>
	<!-- 개별 채팅방 -->
	<div class="roomListBox" id="myChatList">
	</div>
	<div id="onlineList">
		<div id="selectList">현재 접속한 사용자만 표시됩니다.</div>
		<div id="searchEngine" align="center">
			<input type="search" id="searchMember" placeholder="멤버 검색" />
			<input type="button" value="검색" class="btncss1 search" />
		</div>
		<input type="hidden" id="selectedUserList">
		<select id="memberList" multiple></select>
		
		<div id="inviteArea" align="center">
			<input type="text" name="createRoom" id="createRoom"
				placeholder="채팅방 이름을 입력하세요">
			<button class="btncss1" onclick="invite()">초대</button>
			<button class="btncss1" onclick="inviteCancel()">취소</button>
		</div>
	</div>
	<div id="addRoom">추가</div>

	<!-- 채팅방 내부 -->
	<div class="chatBox">
		<div id="header">
			<div id="back" onclick="backPage();">←</div>
			<div id="participants"></div>
			<div id="talkerList"></div>
		</div>
		<div class="box messageBox"></div>
		<hr>
		<div class="box fifth" align="center">
			<input type="text" id="sendMsg" size="50" style="margin-left: 2px;">&nbsp;
			<input type="button" value="보내기" onclick="send();" />
			<button id="out">나가기</button>
		</div>
	</div>
	<script>
	 
		/* 창 열리자마자 채팅목록 전달 */
		window.onload = function(){
			init();
		}
		
		function init(){
			// 부서별 채팅방 오픈
			getDeptChatRoom();
			
			// 개인 채팅방 오픈
			getMyChatRoom();
			
			// 현재 로그인한 사용자 리스트
			getOnlineMember();
		};
		
		function getDeptChatRoom(){
			var dept = sessionStorage.getItem('loginDept');
			$.ajax({
				url : "<%=request.getContextPath()%>/deptroomView.do",
				type : "GET",
				data : {dept : dept	},
				async:false,
				dataType: "json",
				success : function(data){
					if(data.roomName == dept){
						var $deptChatDiv = $('#deptChatDiv');
						var $fieldset = $('<fieldset class="fieldBox">');
						var $legend = $('<legend>');
						var $label = $('<label style="float: right;">');
						$deptChatDiv.text("");
						
						$fieldset.append($legend.text(dept)).append($label.text("참여자 : "+data.currUser.length+"명"));
						$deptChatDiv.append($fieldset);
					}
				},	error : function(data){	console.log("전달 실패!");}
			});
		}
		
		function getMyChatRoom(){
			
			// 동명이인을 위해 id와 이름 모두를 가져오고, '$'로 구분
			var userId =  sessionStorage.getItem('loginId');
			var userName =  sessionStorage.getItem('loginName');
			
			$.ajax({
				url : "<%=request.getContextPath()%>/chatRoom.do",
				type : "GET",
				data : {user : userId+"$"+userName},
				async : false,
				dataType: "json",
				success : function(data){
					var $myChatList = $('#myChatList');
					$myChatList.text("");
					
					if(data !== "none"){
						for(var i in data){
							var $chatDiv = $('<div class="chatDiv" onclick="inChatroom(this);">');
							var $fieldset = $('<fieldset class="fieldBox">');
							var $legend = $('<legend>');
							var $label = $('<label style="float: right;">');
							
							$fieldset.append($legend.text(data[i].roomName)).append($label.text("참여자 : "+data[i].currUser.length+"명"));
							$chatDiv.append($fieldset);
							$myChatList.append($chatDiv);
						}
					} else {
						$myChatList.append($('<h3>').text("현재 참여 중인 채팅방 없음"));
					}
				},
				error : function(data){	console.log("전달 실패!");}
			});
		}
		// 개인 톡방 전용 웹 소켓
		var webSocket = null;
		
		// 채팅방 이름
		var roomName;
		var chatRoomMap = new Map();

		var chat_id = sessionStorage.getItem('loginName')+" "+sessionStorage.getItem('loginRank');	// 채팅ID(닉네임)
		var $chatBox = $('.chatBox > #header').next();
		var $div;
		var $chatArea = $('.messageBox');		// messageBox
	
		/* 채팅방 내부 */
		function inChatroom(obj) {

			var userId =  sessionStorage.getItem('loginId');
			var userName =  sessionStorage.getItem('loginName');
			
			roomName = $(obj).find('legend').text();
			
			$.ajax({
				url : "<%=request.getContextPath()%>/enterRoom.do",
				type : "GET",
				data : { name : userId+"$"+userName,
						 chatRoom : roomName},
				async : false,
				dataType : "json",
				success : function(data){
					$(".roomListBox").css("display", 'none');
					$('#addRoom').css('display', 'none');
					$('#header p').css('display', 'none');
					
					$(".chatBox").css("display","block");
					
					$('#participants').text(data.roomName+"  ▼ 참여자("+data.currUser.length+")");
					
					/* 부서 단톡방일 경우 나가기 없애는 코드 */
					if(roomName == sessionStorage.getItem('loginDept')) {
						if($('#out').css('display')!='none') $('#out').css('display', 'none');
						$('#sendMsg').attr('size', 50);
					} else {
						if($('#out').css('display')=='none') $('#out').css('display', 'inline');
						$('#sendMsg').attr('size', 42);	
					}
					if ($chatBox.has('#'+data.roomName).length == 0 ){
						console.log($chatBox.has('#'+data.roomName));
						console.log($chatBox.has('#'+data.roomName).length);
						$div = $('<div class="msgChatBox" id="'+data.roomName+'">');
						$chatBox.append($div);
					} else {
						$div= $('#'+data.roomName);
					}
					
					/* 사용하려는 웹소켓이 이미 열려 있는 지 확인 */
					webSocket = new WebSocket('ws://localhost:8088<%=request.getContextPath()%>/chatServer/'+roomName);
					
					if(chatRoomMap.get(roomName) == undefined){
						webSocketInit(webSocket);
						
						webSocket.onopen = function(){
							$div.html("<p>"+chat_id+"님이 입장하셨습니다.</p>");
							webSocket.send(chat_id+"|님이 입장하셨습니다.");
						}
					} else {
						webSocketInit(webSocket);
					}
					
					$(".msgChatBox").each(function(){
						$(this).css('display', 'none');
					});
					$('#'+roomName).css('display','block');
					
					chatServerWebsocket.send("채팅방 변경사항 발생!");
					
					getUserList(roomName);
					getMyChatRoom();
				},	error : function(data){	console.log("전달 실패!!");}
			});
		}
		
		function webSocketInit(obj){
			chatRoomMap.set(roomName, obj);
			obj.onopen = function(event){ }
			obj.onmessage = function(event){onMessage(event);}
			obj.onerror = function(event){onError(event);}
			obj.onclose = function(event){onClose(event);}
		};
		
		function onError(event){alert(event.data);}	
		function onClose(event){ getMyChatRoom(); }
		
		function send(){
			var $sendMsg = $('#sendMsg');
			
			if($sendMsg.val()==""){	// 메시지를 입력하지 않을 경우
				alert("메세지를 입력해주세요.");
			}	else{
//				$chatArea.html($chatArea.html()+"<p class='chat_content'>"+$sendMsg.val()+"</p><br>");
				$div.html($div.html()+"<p class='chat_content'>"+$sendMsg.val()+"</p><br>");			
				webSocket.send(chat_id+"|"+$sendMsg.val());
				
				$sendMsg.val("");

			}
			scrollDown();
			getUserList(roomName);
		}
		
		$('#sendMsg').on('keyup', function(){if(window.event.keyCode==13) send();});
		
		$('input:submit').on('click', function(){send();});
		
		function onMessage(event){
			if(event.data.includes('\\n')){
				var chatData = event.data.split('\\n');
				$div.html("");
				
				for(var i = 0 ; i < chatData.length ; i++){
					
					var message = chatData[i].split("|");
					
					var sender = message[0];		
					var content = message[1];

					var userName =  sessionStorage.getItem('loginName');
					var userRank =  sessionStorage.getItem('loginRank');
					
					if(sender != userName+" "+userRank){
						$div.html($div.html()+"<p class='chat_content other-side'>"+sender+" : "+content+"</p><br>");
					} else {
						$div.html($div.html()+"<p class='chat_content'>"+sender+" : "+content+"</p><br>");
					}
				}
			} else {
				var message = event.data.split("|");
				var sender = message[0];		
				var content = message[1];		
				
				if(content==""){
					// 전달된 글이 없을 경우 화면에 전달받지 않음
				}	else {
					//$chatArea.html($chatArea.html()+"<p class='chat_content other-side'>"+sender+" : "+content+"</p><br>");
					$div.html($div.html()+"<p class='chat_content other-side'>"+sender+" : "+content+"</p><br>");
				}
			}
			scrollDown();
			getUserList(roomName);
		}

		function scrollDown() {		/* 최신글로 이동 */
			/* console.log("현재 길이 : "+$('.messageBox').prop('scrollHeight')); */
			$('.messageBox').scrollTop($('.messageBox').prop('scrollHeight'));
		}
		
		function backPage() {	/* 뒤로가기(나가기X) */
			$(".roomListBox").css("display", "block");
			$('#header p').css('display', 'block');
			$(".chatBox").css("display","none");
			if($('#addRoom').css("display") == "none") $("#addRoom").css("display", "block");
			if($('#out').css('display')!='none')$('#out').css('display', 'none');
			
			chatServerWebsocket.send("채팅방 변경사항 발생!");
			
			webSocket.close();
		}
		
		$('#out').on('click', function(){		/* 개설된 채팅방 나가기 */
			
			var userId =  sessionStorage.getItem('loginId');
			var userName =  sessionStorage.getItem('loginName');
			
			$.ajax({
				url : "<%=request.getContextPath()%>/exitChatRoom.do",
				type : "post",
				dataType : "json",
				async : false,
				data : {
					roomName : roomName,
					user : userId+"$"+userName,
					dept : sessionStorage.getItem('loginDept')
				},
				success : function(data){
					$('#participants').text(data.roomName+"  ▼ 참여자("+data.currUser.length+")");
					
					// 이클립스 문법 Bug
					chatRoomMap.delete(roomName);
					alert("채팅을 종료하셨습니다.");
				}, error : function(data){
					console.log("나가기 실패!");}
			});
			
			webSocket.close();
			backPage();
		});
		
		$('#participants').on('click', function() {	/* 참여자 목록 가져오기 */
			if($('#talkerList').css('display')=="none"){
				$('#talkerList').slideDown(250);
				getUserList(roomName);
			}
			else $('#talkerList').slideUp(100);
		});
		
		/* 채팅방 추가 스크립트 */
		function getUserList(roomName){
			var userId =  sessionStorage.getItem('loginId');
			var userName =  sessionStorage.getItem('loginName');
			
			$.ajax({
				url : "<%=request.getContextPath()%>/getUserList.do",
				type : "post",
				data : {
					name : chat_id,
					userCode : userId+"$"+userName,
					roomName : roomName
					},
				success : function(data){
					$userList = $('#talkerList');
					$userList.empty();
	
					for(var idx in data){
						var $p = $('<p>');
						
						$p.text(data[idx]);
						$userList.append($p);
					}
					$('#participants').text(roomName+"  ▼ 참여자("+data.length+")");
				}, error : function(data){
					console.log("실패");}
			});
		}
		
		function delUserList(){
			$.ajax({
				url : "<%=request.getContextPath()%>/delUser.do",
				type : "post",
				data : {name : chat_id},
				success : function(data){
					console.log("사용자 제거 성공");
				}, error : function(data){
					console.log("사용자 제거 실패");
				}
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
			var $IdAndName = $('#selectedUserList');
			$IdAndName.val("");
			$("select option:selected").each(function(index){
				if(index == 0) {
					$IdAndName.val($(this).val());
					selectedMember += $(this).text();
				}
				else {
					$IdAndName.val($IdAndName.val()+" "+$(this).val());
					selectedMember += " "+$(this).text();
				}
			});
			$('#selectList').text(selectedMember);
		});
		
		$('.btncss1.search').on('click', function(){
			getOnlineMember($('#searchMember').val());
		});
		
		function getOnlineMember(keyword){
	 		if (keyword == undefined) keyword = "";
	 		$.ajax({
				url : "<%= request.getContextPath() %>/memberSearch.do",
				type : "GET",
				data : {
					keyword : keyword
				},
				success : function(data){
					var $memberList = $('#memberList');
					$memberList.text("");
					for(var idx in data){
						if(sessionStorage.getItem('loginName') != data[idx].eName){
							var $option = $('<option>');
							$option.val(data[idx].eId+"$"+data[idx].eName);
							$option.text(data[idx].dCode+"\t"+data[idx].eName+"\t"+data[idx].rCode);

							$memberList.append($option);
						}
					}
					
				}, error : function(request,status,error){
	 		        console.log("code : "+request.status);
	 		        console.log("message : "+request.responseText);
	 		        console.log("error : "+error);
	 	       }

			});
	 		
	 		$('#searchMember').val("");
	 	}
		
		function invite(){	/* 방 초대 */
			var userId =  sessionStorage.getItem('loginId');
			var userName =  sessionStorage.getItem('loginName');
			
			if($('#createRoom').val()=="")	{alert("채팅방 이름을 입력해주세요.");}
			else if($('#createRoom').val().match(/[,]/g)){
				
				$('#createRoom').val("");
				alert("채팅방 이름에 쉼표는 사용이 불가능합니다.");
			}
			else{
				$.ajax({
					url : "<%=request.getContextPath()%>/enterRoom.do",
					type : "GET",
					data : { newRoom : $('#createRoom').val(),
							chatRoom : "newRoom",
							chatMember : userId+"$"+userName+" "+$('#selectedUserList').val()
					}, async: false,
					dataType : "json",
					success : function(data){
						if(data == 'error'){
							alert("이미 존재하는 채팅방 이거나 생성이 금지된 이름입니다.");
						} else {
							$('#onlineList').css('display', 'none');
							$('body').css('background', 'white');
							$(".roomListBox").css("display", 'none');
							$('#addRoom').css('display', 'none');
							$('#header p').css('display', 'none');
							webSocket = new WebSocket('ws://localhost:8088<%=request.getContextPath()%>/chatServer/'+$('#createRoom').val());
							webSocketInit(webSocket);
							
							$div = $('<div class="msgChatBox" id="'+data.roomName+'">');
							$chatBox.append($div);
							$(".chatBox").css("display","block");
							$('#participants').text(data.roomName+"  ▼ 참여자("+data.currUser.length+")");
							$('#createRoom').text("");
						}
						
						// 개인이 생성한 단톡방이므로 나가기 활성화
						if($('#out').css('display')=='none'){ $('#out').css('display', 'inline');
						$('#sendMsg').attr('size', 42);}
						
						roomName = data.roomName;

						$(".msgChatBox").each(function(){
							$(this).css('display', 'none');
						});
						
						$('#'+roomName).css('display','block');
						
						chatServerWebsocket.send("채팅방 변경사항 발생!");
						
					},	error : function(data){	console.log("전달 실패!!");}
				});
				init();
				getUserList(roomName);
			}
		}
		
		function inviteCancel() {	/* 방 추가 취소 */
			$('#onlineList').css('display', 'none');
			$('body').css('background', 'white');
			$("select option:selected").prop("selected", false);
			$('#selectList').text("현재 접속한 사용자만 표시됩니다.");
			$('#createRoom').val("");
			$('#selectedUserList').val("");
		}	
		
		/* ver_2 새로고침 문제 해결을 위한 방 리스트 갱신 소스 구현부 */
		
		var chatServerWebsocket = null;
		
		$(function(){
			chatServerWebsocket =  new WebSocket('ws://localhost:8088<%=request.getContextPath()%>/chatControllServer');
			
			chatControllerInit(chatServerWebsocket);
			
		});
		
		function roomModified(){
			getDeptChatRoom();
			getMyChatRoom();
			getOnlineMember();
		}
		
		function chatControllerInit(obj){
			obj.onopen = function(event){}
			obj.onmessage = function(event){
				roomModified();
			}
			obj.onerror = function(event){}
			obj.onclose = function(event){
				alert("채팅 서비스를 종료합니다.");
			}
		};
	 </script>
</body>
</html>
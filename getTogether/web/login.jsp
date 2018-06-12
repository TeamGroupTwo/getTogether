<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="https://fonts.googleapis.com/css?family=Righteous|Nanum+Gothic|Do+Hyeon" rel="stylesheet">
<script src="<%=request.getContextPath()%>/resources/js/jquery-3.3.1.min.js"></script>
<style>
	body{
		background : #5f4d8c;
		margin : auto;
	}
	#login{
		position : absolute;
		display : inline-block;
		top : 50%;
		left : 50%;
		margin-left : -250px;
		margin-top : -250px;
		width : 500px;
		height : 500px;
		background : white;
		text-align: center;
	}
	.login-title{
		color : #5f4d8c;
		text-shadow: -1px 0 black, 0 1px black, 1px 0 black, 0 -1px black;
     	-moz-text-shadow: -1px 0 black, 0 1px black, 1px 0 black, 0 -1px black;
     	-webkit-text-shadow: -1px 0 black, 0 1px black, 1px 0 black, 0 -1px black;
     	vertical-align: middle;
     	font-family:'Righteous', cursive;
      	font-size : 3em;
      	margin-left: -2px;
      	margin-top: 100px;
      	margin-bottom: 30px;
	}
	.loginArea{
		display: inline-block;
		text-align : left;
		border : 1px solid #BFBFBF;
		border-radius: .25em;
		width: 320px;
		height : 29px;
		padding: 5px;
		vertical-align: middle;
		margin : 5px;
	}
	.loginImg {
		display : inline-block;
		height: inherit;
		padding-right : 5px; 
		border-right: 1px solid #BFBFBF;
	}
	.loginText {
		position : fixed;
		width : 278px;
		height : 24px;
		margin-left : 5px;
  		border: 1px solid white;
		vertical-align: middle;
		font-family: 'Nanum Gothic', sans-serif;
		color : #404040;
		font-size : 1em;
      	font-weight : bolder;
      	letter-spacing : -1px;
      	white-space : nowrap;
      	padding-top : 0px;
	}
	.loginText:focus{
		outline: none;
	}
	.loginBtn{
		display: inline-block;
		width: 164px;
		height : 35px;
		padding-top : 5px;
		text-align : center;
		font-family: 'Nanum Gothic', sans-serif;
		margin-top : 5px;
		margin-bottom : 5px;
		background: #404040;
		border-radius: .25em;
		color : white;
		font-size : 1.2em;
      	font-weight : bolder;
      	letter-spacing : -1px;
      	white-space : nowrap;
	}
	.loginBtn:hover{
		cursor : pointer;
	}
	#loginOk{
		background: #5f4d8c;
		width: 331px;
		margin-left : 5px;
	}
	
	/* 팝업 영역 css*/
   .popup-wrap{
   	display: none;
   	position: fixed;
	_position: absolute;
	top: 0;
	left: 0;
	width: 100%;
	height: 100%;
	z-index: 10;
	}
	.popup-bg{
	position: absolute;
  	top: 0;
 	left: 0;
 	width: 100%;
 	height: 100%;
	background: #000;
  	opacity: .5;
 	filter: alpha(opacity=50);
 	}
 	.popup-border{
		position : absolute;
		display : inline-block;
		top : 50%;
		left : 50%;
		margin-left : -200px;
		margin-top : -200px;
		width : 400px;
		height : 400px;
		background : #5f4d8c;
		text-align: center;
		z-index: 50;
   }
   .popup-content{
  		position : absolute;
		display : inline-block;
		top : 50%;
		left : 50%;
		margin-left : -190px;
		margin-top : -190px;
		width : 380px;
		height : 380px;
		background : white;
		text-align: center;
		z-index: 50;
   }
   .find-title{
   		margin-top: 40px;
   		font-family: 'Do Hyeon', sans-serif;
   		font-size : 2.8em;
      	font-weight : bolder;
      	letter-spacing : -1px;
      	white-space : nowrap;	
   }
   .findBtn{
		width: 60px;
		height : 25px;
		font-size: 12pt;
		padding-bottom: 5px;
   }
   #findSuccess{
   		background: #5f4d8c;
   }
   .findLbl{
   		font-family: 'Nanum Gothic', sans-serif;
		color : #606060;
		font-weight : bolder;
		font-size : 1.4em;
		letter-spacing : -2px;
      	white-space : nowrap; 
      	margin-right: 5px;
      	text-shadow: -1px 0 black, 0 1px black, 1px 0 black, 0 -1px black;
     	-moz-text-shadow: -1px 0 black, 0 1px black, 1px 0 black, 0 -1px black;
     	-webkit-text-shadow: -1px 0 black, 0 1px black, 1px 0 black, 0 -1px black;
   }
   .findBox{
   		text-align: right;
   		margin-bottom: 5px;
   }
   .findInput{
   		width : 200px;
   		border: 1px solid white;
   		border-bottom: 3px solid #5f4d8c;
   		border-bottom-left-radius: .2em;
   		border-bottom-right-radius: .2em;
   		font-family: 'Nanum Gothic', sans-serif;
		color : #404040;
		font-size : 1em;
      	font-weight : bolder;
      	letter-spacing : -1px;
      	white-space : nowrap;
      	padding-top : 0px;
      	-webkit-box-shadow: 0 0 0 30px #fff inset ; 
      	-webkit-text-fill-color: #000;
   }
   .findInput:focus{
		outline: none;
	}
	#onlyPwd{
		display: none;
	}
	#onlyVerify{
		display: none;
	}
	.verifySuccess{
		display : none;
		background: #5f4d8c;
   }
   #findResult{
   	display : none;
   	vertical-align: middle;
	font-family: 'Nanum Gothic', sans-serif;
	color : #404040;
	font-size : 1.4em;
    font-weight : bolder;
    letter-spacing : -1px;
    white-space : nowrap;
   }

</style>
<title>로그인 화면</title>
</head>
<body>
	<div id="login">
		<p class="login-title" id="title">GETTOGETHER</p>
		<div class="loginArea">
			<img class="loginImg" src="resources/images/common/loginId.png"/>
			<input type="text" class="loginText" name="eId" id="eId" maxlength="6" placeholder="아이디"/>
		</div>
		<div class="loginArea">
			<img class="loginImg" src="resources/images/common/loginPassword.png"/>
			<input type="password" class="loginText" name="ePwd" id="ePwd" placeholder="비밀번호" onkeyup="enterkey();"/>
		</div>
		<div class="loginBtn" id="loginOk" onclick="login();">LOGIN</div>
		<br />
		<div class="loginBtn" id="findId" onclick="findId();">아이디 찾기</div>
		<div class="loginBtn" id="findPwd" onclick="findPassword();">비밀번호 찾기</div>
	</div>
	
	<!-- 팝업창 영역 -->	
	<div class="popup-wrap" id="popup-find">
		<div class="popup-bg"></div>
		<div class="popup-border">
			<div class="popup-content">
				<p class="login-title find-title" id="findTitle"></p>
				<div class="findBox verifynone"><label class="findLbl">사번  </label><input type="text" class="findInput" id="empNo" /></div>
				<div class="findBox verifynone"><label class="findLbl">이름  </label><input type="text" class="findInput" id="empName" /></div>
				<div class="findBox verifynone" id="onlyPwd"><label class="findLbl">아이디  </label><input type="text" class="findInput" id="empId" /></div>
				<div class="findBox verifynone"><label class="findLbl">이메일  </label><input type="text" class="findInput" id="email"/></div>
				<div class="findBox" id="onlyVerify"><label class="findLbl">인증번호  </label><input type="text" class="findInput" id="verifyCode"/></div>
				<label id="findResult"></label>
				<div class="findBtn loginBtn" id="findSuccess" onclick="finds();">확인</div>
				<div class="findBtn loginBtn verifySuccess" id="idSuccess">확인</div>
				<div class="findBtn loginBtn verifySuccess" id="pwdSuccess">확인</div>
				<div class="findBtn loginBtn" id="findClose" onclick="popupClose();">닫기</div>
			</div>
		</div>
	</div>
	
	<script>
	
	history.pushState(null, null, location.href);
    window.onpopstate = function () {
        history.go(1);
	};
	
	function enterkey() {
		 if (window.event.keyCode == 13)
             login();
	}
	
	function login(){
		if($("#eId").val() == "" || $("#ePwd").val() == "")	
			alert("아이디와 비밀번호를 모두 입력해주세요.");
		else{
			$.ajax({
				url : "login.emp",		
				type : "POST",
				data : {
					eId : $("#eId").val(),
					empPwd : $("#ePwd").val()
				},
				success : function(data) {
					if(data == null)
						alert("아이디나 비밀번호가 일치하지 않습니다. 다시 입력해주세요.");
					else{
						sessionStorage.setItem('loginNo', data.eNo);
						sessionStorage.setItem('loginName', data.eName);
						sessionStorage.setItem('loginId', data.eId);
						sessionStorage.setItem('loginPwd', data.ePassword); 
						sessionStorage.setItem('loginProfile', data.profile);
						sessionStorage.setItem('loginEmail', data.email);
						sessionStorage.setItem('loginPhone', data.phone);
						sessionStorage.setItem('loginRcode', data.rCode);
						sessionStorage.setItem('loginDcode', data.dCode);
						sessionStorage.setItem('loginRank', data.rName);
						sessionStorage.setItem('loginDept', data.dName);

						if(data.eId == 'admin1' || data.eId == 'admin2')							
							location.href = "<%=request.getContextPath()%>/views/admin/adminAuthority.jsp";
						else if(data.email == null)
							location.href = "<%=request.getContextPath()%>/views/employee/employeeFirstUpdate.jsp";
						else
							location.href = "<%=request.getContextPath()%>/main.jsp";		
					}
				},
				error : function(){
				   console.log("오류");
				}
			});
		}
	}
	
	var find = "id"; 
	
	function findId() {
		find = "id";

		$(".findBox").css("margin-right", "60px");
		$("#onlyVerify").css("display", "none");
		$(".verifynone").css("display", "block");
		$("#popup-find").fadeIn();
		$("#findTitle").text("아이디 찾기");
		$("#onlyPwd").css("display", "none");
		$(".find-title").css("margin-bottom","35px");
		$(".findBtn").css("margin-top","50px");
		$("#findSuccess").css("display", "inline-block");
		$("#idSuccess").css("display", "none");
		$("#pwdSuccess").css("display", "none");
		$(".findInput").css("width", "200px");
		$("#findResult").css("display", "none");
	}
	
	function findPassword(){
		find = "pwd";
		$(".findBox").css("margin-right", "60px");
		$("#onlyVerify").css("display", "none");
		$(".verifynone").css("display", "block");
		$("#popup-find").fadeIn();
		$("#findTitle").text("비밀번호 찾기");
		$("#onlyPwd").css("display", "block");
		$(".find-title").css("margin-bottom","20px");
		$(".findBtn").css("margin-top","30px");
		$("#findSuccess").css("display", "inline-block");
		$("#idSuccess").css("display", "none");
		$("#pwdSuccess").css("display", "none");
		$(".findInput").css("width", "200px");
		$("#findResult").css("display", "none");
	}
	
	function popupClose() {
		$(".popup-wrap").fadeOut();
		$("#empNo").val("");
		$("#empName").val("");
		$("#empId").val("");
		$("#email").val("");
		$("#verifyCode").val("");
	}

	function finds() {
		
		var empNo = $("#empNo").val();
		var empName = $("#empName").val();
		var empId = $("#empId").val();
		var email = $("#email").val();
		
		if(find == "id"){
			// 아이디 영역
			if(empNo == "" || empName == "" || email == "")
				alert("내용을 모두 입력해주세요.");
			else{
				$.ajax({
					url : "<%=request.getContextPath()%>/findId.emp",
					type : "POST",
					async: false,
					data : {
						empNo : empNo,
						empName : empName,
						email : email
					},
					success : function(data) {
						if(data == null)
							alert("일치하는 정보가 없습니다. 다시 입력해주세요.");
						else{
							$("#findTitle").text("인증번호");
							$(".verifynone").css("display", "none");
							$("#onlyVerify").css("display", "block");
							$(".find-title").css("margin-bottom","70px");
							$(".findBtn").css("margin-top","80px");
							$(".findInput").css("width", "150px");
							$(".findBox").css("margin-right", "75px");
							
							var resultId = data.eId;
							
							// 이메일 발신 ajax
							$.ajax({
								url:"<%=request.getContextPath()%>/sendEmail.emp",	
								type : "POST",
								data : {email : email},
								async: false,
								success : function(data) {
									$("#findSuccess").css("display", "none");
									$("#idSuccess").css("display", "inline-block");
									$("#idSuccess").on("click", function() {
										if(data == $("#verifyCode").val()){
											 $("#onlyVerify").css("display", "none");
											 $("#idSuccess").css("display", "none");
											 $("#findTitle").text("아이디 확인");
											 $("#findResult").css("display", "block");
											 $("#findResult").text("아이디 : " + resultId);
										}
										else{
											alert("인증번호와 일치하지 않습니다. 다시 입력해주세요.");
										}
									});
								},
								error : function() {
									console.log("이메일 발신 오류발생");
								}
							});
 						}			
					},
					error: function() {
						console.log("아이디 찾기 오류발생");
					}
				});
			}
		}			
		else{
			// 비밀번호 영역
			if(empNo == "" || empName == "" || email == "" || empId == "")
				alert("내용을 모두 입력해주세요.");
			else{
				$.ajax({
					url : "<%=request.getContextPath()%>/findPwd.emp",
					type : "POST",
					async: false,
					data : {
						empNo : empNo,
						empName : empName,
						email : email,
						empId : empId
					},
					success : function(data) {
						if(data == null)
							alert("일치하는 정보가 없습니다. 다시 입력해주세요.");
						else{
							$("#findTitle").text("인증번호");
							$(".verifynone").css("display", "none");
							$("#onlyVerify").css("display", "block");
							$(".find-title").css("margin-bottom","70px");
							$(".findBtn").css("margin-top","80px");
							$(".findInput").css("width", "150px");
							$(".findBox").css("margin-right", "75px");
							
							var resultPwd = data.ePassword;
							
							// 이메일 발신 ajax
							$.ajax({
								url:"<%=request.getContextPath()%>/sendEmail.emp",	
								type : "POST",
								data : {email : email},
								async: false,
								success : function(data) {
									$("#findSuccess").css("display", "none");
									$("#pwdSuccess").css("display", "inline-block");
									$("#pwdSuccess").on("click", function() {
										if(data == $("#verifyCode").val()){
											 $("#onlyVerify").css("display", "none");
											 $("#pwdSuccess").css("display", "none");
											 $("#findTitle").text("비밀번호 확인");
											 $("#findResult").css("display", "block");
											 $("#findResult").text("비밀번호 : " + resultPwd);
										}
										else{
											alert("인증번호와 일치하지 않습니다. 다시 입력해주세요.");
										}
									});
								},
								error : function() {
									console.log("이메일 발신 오류발생");
								}
							});
 						}			
					},
					error: function() {
						console.log("비밀번호 찾기 오류발생");
					}
				});
			}
		}
	}

	</script>
</body>
</html>
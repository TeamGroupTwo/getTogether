<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="https://fonts.googleapis.com/css?family=Righteous|Nanum+Gothic|Do+Hyeon" rel="stylesheet">
<script src="<%=request.getContextPath()%>/resources/js/jquery-3.3.1.min.js"></script>
<script src="https://www.google.com/recaptcha/api.js" async defer></script>
<style>
	body{
		background : #5f4d8c;
		margin : auto;
	}
	#container {
		position : absolute;
		display : inline-block;
		top : 50%;
		left : 50%;
		margin-left : -300px;
		margin-top : -300px;
		width : 600px;
		height : 600px;
		background : white;
		text-align: center;
	}
	.fu-input-wrap{
		margin-top : 10px;
		margin-right: 135px;
	}   
	.fu-input{
	width : 335px;
	border: 1px solid white;
	border-bottom: 3px solid #5f4d8c;
	border-bottom-left-radius: .2em;
	border-bottom-right-radius: .2em;
	font-family: 'Nanum Gothic', sans-serif;
	color:#606060;
	font-size : 1em;
   	font-weight : bolder;
   	letter-spacing : -1px;
   	white-space : nowrap;
   	padding-top : 0px;
   	-webkit-box-shadow: 0 0 0 30px #fff inset ;
    float: right;
    margin-bottom: 8px;
   }
   .fu-btn-font {
   	font-family: 'Nanum Gothic', sans-serif;
   	font-weight : bolder;
   	letter-spacing : -1px;
   	white-space : nowrap;
   }
  	.fu-input:focus{
		outline: none;
	}
	.fu-label{
		font-family: 'Nanum Gothic', sans-serif;
		color : #404040;
		font-weight : bolder;
		font-size : 1.2em;
		letter-spacing : -2px;
      	white-space : nowrap; 
      	margin-right: 5px;
      	float: right;
	}
	#profile {
      border-radius : 50%;
      border :1px solid #404040;
      margin : auto;
      width : 80px;
      height : 80px;
      margin-bottom: 5px;
   }
   #file-select{
   	position: absolute; 
   	width: 1px; 
   	height: 1px; 
   	padding: 0; 
   	margin: -1px; 
   	overflow: hidden; 
   	clip:rect(0,0,0,0); 
   	border: 0;
   }
   #file-lbl{
   	display: inline-block; 
   	padding: .4em .50em; 
   	color: white;
   	font-size : bolder;
   	vertical-align: middle; 
   	background: #5f4d8c; 
   	cursor: pointer;  
   	border-radius: .25em;
   }
   #file-text{
   display: inline-block; 
   padding: .4em .50em;
   vertical-align: middle; 
   background-color: #f5f5f5; 
   border: 1px solid #ebebeb; 
   border-bottom-color: #e2e2e2; 
   border-radius: .25em; 
   height : 15px;
   font-family: 'Nanum Gothic', sans-serif;
	color : #404040;
	font-weight : bolder;
	font-size : 1em;
	letter-spacing : -1px;
    white-space : nowrap; 
   }
   .checkLight {
    position: absolute;
   	display : inline-block;
    border-radius: 50%;
    margin : auto;
    width : 13px;
    height : 13px;
    background: #ED3200;
   	right : 120px;
   }
   #pwdLight {
   	top : 328px;
   }
   #pwdDupLight{
   	top : 363px;
   }
   #phoneLight{
   	top : 398px;
   }
   #emailLight{
   	top : 433px;
   }
   #email{
   	width : 150px;
   	margin-right: 185px;
   }
   #selfEmail {
    width : 150px;
   	margin-right: 185px;
   }
   .fu-btn{
   	background: #404040;
   	padding: .2em .25em; 
   	border-radius: .25em;
   	color : white;
   }
   .fu-title{
   		color : #5f4d8c;
		text-shadow: -1px 0 black, 0 1px black, 1px 0 black, 0 -1px black;
     	-moz-text-shadow: -1px 0 black, 0 1px black, 1px 0 black, 0 -1px black;
     	-webkit-text-shadow: -1px 0 black, 0 1px black, 1px 0 black, 0 -1px black;
     	vertical-align: middle;
   		margin-top: 20px;
      	margin-bottom: 20px;
   		font-family: 'Do Hyeon', sans-serif;
   		font-size : 2.2em;
      	font-weight : bolder;
      	letter-spacing : -1px;
      	white-space : nowrap;
   }
   #emailLbl{
   	margin: 0px;
   	font-family: 'Nanum Gothic', sans-serif;
	color : #404040;
	font-weight : bolder;
	font-size : 1.2em;
	letter-spacing : -2px;
    white-space : nowrap; 
    margin-right: 5px;
    position: absolute;
    top : 422px;
    right : 295px;
   }
   #emailList{
    -webkit-appearance: none;
    -moz-appearance: none; 
    appearance: none;
    background: url('/gt/resources/images/common/listdown.png') no-repeat 95% 50%; 
    background-size : 14px;
    position: absolute;
    top : 426px;
    right : 136px;
    width : 154px;
    border: 1px solid white;
    border-bottom: 3px solid #5f4d8c;
    border-bottom-left-radius: .2em;
	border-bottom-right-radius: .2em;
	font-family: 'Nanum Gothic', sans-serif;
	color : #404040;
	font-weight : bolder;
	font-size : 1em;
	letter-spacing : -1px;
    white-space : nowrap;
   }
   #emailList:focus{
	outline: none;	
   }

   #emailBtn{
   	position : absolute;
   	display: inline-block;
   	width : 40px;
   	height : 25px;
   	top : 422px;
   	right : 62px;
   }
   #emailBtn:hover{
   	cursor: pointer;
   }
   #firstUpdateBtn{
   	position : absolute;
   	width : 50px;
   	height : 25px;
   	bottom: 20px;
   	left: 265px;
   }
   
   /* 팝업 영역 css*/
   #popup-wrap{
   	display: none;
   	position: fixed;
	_position: absolute;
	top: 0;
	left: 0;
	width: 100%;
	height: 100%;
	z-index: 10;
	}
	#popup-bg{
	position: absolute;
  	top: 0;
 	left: 0;
 	width: 100%;
 	height: 100%;
	background: #000;
  	opacity: .5;
 	filter: alpha(opacity=50);
 	}
 	#popup-border{
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
 	#popup-content{
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
   #emailTitle{
   	margin-top: 50px;
   	margin-bottom: 70px;
   }
   .popup-btn{
  		display: inline-block;
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
      	width: 50px;
		height : 25px;
		font-size: 12pt;
		padding-bottom: 5px;
   }
   .popup-btn:hover{
	   cursor : pointer;
   }
   #popup-ok{
   	background: #5f4d8c;
   }
   #popup-close{
   	display: block;
   	margin-top: 75px;
   	margin-left: 160px;
   }
   #verifyLbl{
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
   #verifyCode{
   		width : 130px;
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
   #verifyCode:focus{
		outline: none;
	}
</style>
<title>최초 정보 기입</title>
</head>
<body>

	<!-- 팝업창 영역 -->	
	<div id="popup-wrap">
		<div id="popup-bg"></div>
		<div id="popup-border">
			<div id="popup-content">
				<p class="fu-title" id="emailTitle">이메일 인증</p>
				<label id="verifyLbl">인증번호 </label><input type="text" id="verifyCode"/>
				<div class="popup-btn" id="popup-ok">확인</div>
				<div class="popup-btn" id="popup-close" onclick="popupClose();">닫기</div>
			</div>
		</div>
	</div>
	
	<div id="container">
		<form action="<%=request.getContextPath()%>/firstUpdate.emp" method="POST" id="firstUpdateForm" encType="multipart/form-data">
		  	
		  	<p class="fu-title">최초 정보 기입</p>
	  		
	  		<div id="profile" style="content:url('/gt/resources/images/common/profile.png');"></div>
		  	
		  	<div id="fileBox">
		  		<input type="text" id="file-text" disabled="disabled"/>
		  		<label class="fu-btn-font" id="file-lbl" for="file-select">이미지 선택</label>
		  		<input type="file" id="file-select" name="empProfile" accept="image/*"/>
		  	</div>
		  	
		  	<div class="fu-input-wrap">
			  	<input type="text" class="fu-input" id="empName" disabled="disabled"/>
			  	<label class="fu-label">이름 </label>		  	
		  
		  	<input type="text" class="fu-input" id="empNo" disabled="disabled"/>
		  	<label class="fu-label">사번 </label>
		  	
		  	<input type="text" class="fu-input" name="empId" id="empId" disabled="disabled"/>
		  	<label class="fu-label">아이디 </label>
  			<input type="text" name="rId" id="rId" hidden="hidden"/>
		  	
		  	<input type="password" class="fu-input" name="empPwd" id="empPwd" size="40" placeholder="영문, 숫자, 기호를 조합한 8~16자리, 대소문자 구분" oninput="checkPwd();"/>
		  	<label class="fu-label">비밀번호 </label>
		  	<div class="checkLight" id="pwdLight"></div>
			

			<input type="password" class="fu-input" id="empPwd2" oninput="dupCheckPwd();"/>
		  	<label class="fu-label">확인 </label>
		  	<div class="checkLight" id="pwdDupLight"></div>
		  	
		  	<input type="tel" class="fu-input" name="phone" placeholder="'-'없이 입력"  id="phone" oninput="checkPhone();"/>
		  	<label class="fu-label">연락처 </label>
		  	<div class="checkLight" id="phoneLight"></div>
		  	
		  	<input type="text" id="rEmail" name="rEmail" hidden="hidden"/>
		  	<input type="email" class="fu-input" name="email" id="email"/>
		  	<input type="email" class="fu-input" name="selfEmail" id="selfEmail" hidden="hidden"/>
		  	<label class="fu-label">이메일 </label>
		  	<label id="emailLbl">@</label>
		  	<select name="emailList" id="emailList" >
 					<option value="none">계정선택</option>
 					<option value="naver.com">naver.com</option>
 					<option value="gmail.com">gmail.com</option>
 					<option value="hanmail.net">hanmail.net</option>
 					<option value="nate.com">nate.com</option>
 					<option value="self">직접입력</option>
 			</select>
		  	<div class="fu-btn fu-btn-font" id="emailBtn" onclick="checkEmail();">확인</div>	
		  	<div class="checkLight" id="emailLight"></div>
		  	
		  	<input type="text" class="fu-input" id="empDept" disabled="disabled"/>
		  	<label class="fu-label">부서 </label>
		  	
		  	<input type="text" class="fu-input" id="empRank" disabled="disabled"/>
		  	<label class="fu-label">직급 </label>
		  	</div>
		  	
		  	<div id='recaptcha' class="g-recaptcha" data-sitekey="6LevAFwUAAAAAMcuT6usZRZ5dYdVEHMS1HMDttL3" data-callback="onSubmit" data-size="invisible"></div>   
			<div class="fu-btn fu-btn-font" id="firstUpdateBtn" onclick="firstUpdate();">확인</div>		
		</form>
	</div>
	
	<script>
	
		// 뒤로가기 기능을 막는 메소드
		history.pushState(null, null, location.href);
	    window.onpopstate = function () {
	        history.go(1);
		};
	
		// 새로 입력할 정보들의 flag값
		var pwdChk = 'N';
		var pwdDupChk = 'N';
		var phoneChk = 'N';
		var emailChk = 'N';
		var allChk = 'N';
				
		$(function(){
			// 로그인한 회원의 기존 정보를 출력
			$('#empName').val(sessionStorage.getItem('loginName'));
			$('#empNo').val(sessionStorage.getItem('loginNo'));
			$('#empId').val(sessionStorage.getItem('loginId'));
			$('#empDept').val(sessionStorage.getItem('loginDept'));
			$('#empRank').val(sessionStorage.getItem('loginRank'));
			
			$('#rId').val(sessionStorage.getItem('loginId'));
			
			var file = null;
			var filename = "";
			
			// 파일 업로드 커스텀 관련 메소드
			$("#file-select").on('change', function(){
				var reader = new FileReader();
				
				// 파일을 업로드 하고 나서 다시 파일 선택 누른 뒤 취소버튼 눌렀을 때 발생하는 오류캐치
				if($(this)[0].files[0] == undefined){
					$("#file-text").val(filename);
					reader.readAsDataURL(file);
				} 
				else {
					if(reader)
						filename = $(this)[0].files[0].name; 
					else
						filename = $(this).val().split('/').pop().split('\\').pop(); // 예전 IE 경우 대비  
					
					var imgChk = filename.slice(filename.lastIndexOf(".")+1).toLowerCase();
					
					// 이미지 파일만 업로드하는 조건 부여
					if(imgChk != "gif" && imgChk != "jpg" && imgChk != "png"){
						alert("이미지파일(.jpg, .png, .gif)만 업로드 가능합니다.");
						$("#file-text").val("");
						$("#profile").css("content", "url('/gt/resources/images/common/profile.png')");
					}
					else{
						$("#file-text").val(filename);
						file = $(this)[0].files[0];
						reader.readAsDataURL(file);
						reader.onload = function(){
							$("#profile").css("content", "url(" + reader.result + ")");
						};	
					}	
				}
			});
			
			// select 체크
			$("#emailList").on("change", function() {
				if($(this).val() == "self"){
					$("#email").css("display","none");
					$("#emailLbl").css("display","none");
					$("#selfEmail").removeAttr("hidden");
					$("#selfEmail").css({
						"width": "235px",
						"margin-right" : "100px"
					});
					$("#emailList").css({
						"right" : "137px",
						"width" : "90px"
					});
				}
				else{
					$("#email").css("display","inline-block");
					$("#emailLbl").css("display","inline-block");
					$("#selfEmail").attr("hidden","hidden");
					$("#emailList").css({
						"right" : "136px",
						"width" : "154px"
					});
				}
			});
			
		});
		
		// 모든 점검 조건을 만족하는지 확인하는 메소드
		function checkAll(){
			if(pwdChk=='Y' && pwdDupChk=='Y' && phoneChk=='Y' && emailChk=='Y'){
				$("#firstUpdateBtn").css({
				 	"cursor":"pointer",
				 	"background" : "#5f4d8c"
				});
				
				allChk = 'Y';
			}else{
				$("#firstUpdateBtn").css({
				 	"cursor":"default",
				 	"background" : "#404040"
				});
				allChk = 'N';
			}
		}
		
		// 비밀번호가 조건에 맞는지 확인하는 메소드
		function checkPwd() {
			
			var pwdReg = /^(?=.*[a-zA-Z])((?=.*\d)|(?=.*\W)).{8,16}$/;
			
			if(pwdReg.test($("#empPwd").val())){
				pwdChk = 'Y';
				$('#pwdLight').css("background", "#57B20B");
			}
			else{
				pwdChk = 'N';
				$('#pwdLight').css("background", "#ED3200");
			}
			checkAll();
		}
		
		// 비밀번호와 일치하는지 확인하는 메소드
		function dupCheckPwd() {
			if($('#empPwd').val() == $('#empPwd2').val()){
				pwdDupChk = 'Y';
				$('#pwdDupLight').css("background", "#57B20B");
			}
			else{
				pwdDupChk = 'N';
				$('#pwdDupLight').css("background", "#ED3200");
			}
			checkAll();
		}
		
		// 연락처가 조건에 맞는지 확인하는 메소드
		function checkPhone() {
			
			var phoneReg = /^0{1}[1-9]{1}[0-9]{7,9}$/;
			
			if(phoneReg.test($("#phone").val())){
				phoneChk = 'Y';
				$('#phoneLight').css("background", "#57B20B");
			}
			else{
				phoneChk = 'N';
				$('#phoneLight').css("background", "#ED3200");
			}
			checkAll();
		}
	
		// 이메일이 중복되지 않는지 확인하는 메소드
		function checkEmail() {	
			
			var inEmail = "";
			
 			if($("#emailList").val() == "none")
				alert("계정을 선택해주세요.");
 			else{
 				
 				if($("#emailList").val() == "self"){
					if($("#selfEmail").val() == "")
						alert("이메일을 입력해주세요.");
					else{
						var emailReg = /^[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*\.[a-zA-Z]{2,3}$/i;
						
						if(!emailReg.test($("#selfEmail").val()))
							alert("이메일 형식에 맞게 입력해주세요.");
						else{
							inEmail = $("#selfEmail").val();
							$("#rEmail").val(inEmail);
						}
					}
				}
				else{
					if($("#email").val() == "")
						alert("이메일 아이디를 입력해주세요.");
					else{
						inEmail = $("#email").val() + "@" + $("#emailList").val();
						$("#rEmail").val(inEmail);						
					}
				}
 				
 				if(inEmail != "")
 				// 이메일이 다른 사람과 중복되는지 체크
 					$.ajax({
 						url : "<%=request.getContextPath()%>/checkEmail.emp",
 						type : "POST",
 						data : {email : inEmail},
 						async: false,
 						success : function(data) {
 							if(data == 1)
 								alert("중복된 이메일입니다. 다시 입력해주세요.");
 							else{
 								// 이메일 발신 ajax
 								$.ajax({
 									url:"<%=request.getContextPath()%>/sendEmail.emp",	
 									type : "POST",
 									data : {email : inEmail},
 									async: false,
 									success : function(data) {
		 								$("#popup-wrap").fadeIn();
		 								$("#popup-ok").on("click", function() {
											if(data == $("#verifyCode").val()){
												alert("인증번호가 확인되었습니다.");
												popupClose();
												emailChk='Y';
												$('#emailLight').css("background", "#57B20B");
												$("#email").prop("disabled", true);
												$("#emailList").prop("disabled", true);
												$("#selfEmail").prop("disabled", true);
												$("#emailBtn").css("pointer-events", "none");
												checkAll();
											}
											else{
												alert("인증번호와 일치하지 않습니다. 다시 입력해주세요.");
											}
										});
									},
									error: function() {
										console.log("이메일 발신 오류발생");
									}
 								});							
 							}
 						},
 						error : function() {
 							console.log("이메일 중복체크에서 오류 발생");
 						}
 					});
			}
		}
		
		function popupClose() {
			$("#popup-wrap").fadeOut();
		}
		
		function firstUpdate() {
			if(allChk =='Y')
				grecaptcha.execute();
		}
		
		function onSubmit() {
			sessionStorage.setItem('loginProfile', $("#file-text").val());
			sessionStorage.setItem('loginEmail', $("#rEmail").val());
			sessionStorage.setItem('loginPhone', $("#phone").val());
			$("#firstUpdateForm").submit();
		}
			
	</script>
</body>
</html>
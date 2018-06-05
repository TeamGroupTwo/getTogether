<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="<%=request.getContextPath()%>/resources/js/jquery-3.3.1.min.js"></script>
<script src="https://www.google.com/recaptcha/api.js" async defer></script>
<style>
	body{
		background : #5f4d8c;
		margin : auto;
	}
	#container {
		text-align: center;
		width : 800px;
		height : 800px;
		background: white;
	}
	#profile {
      border-radius : 50%;
      border :1px solid #404040;
      margin : auto;
      width : 100px;
      height : 100px;
   }
   #file-box {
   
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
   }
   .checkLight {
    border-radius: 50%;
    margin : auto;
    width : 13px;
    height : 13px;
    background: #ED3200;
   }
   .fu-btn{
   	background: #404040;
   	padding: .2em .25em; 
   	border-radius: .25em;
   	color : white;
   }
   #emailBtn{
   	display: inline-block;
   	width : 40px;
   	height : 25px;
   }
   #emailBtn:hover{
   	cursor: pointer;
   }
   #firstUpdateBtn{
   	width : 50px;
   	height : 25px;
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
 	#popup-content{
	position: absolute;
   	background : pink;
   	width : 300px;
   	height : 300px;
	z-index: 50;
   }
</style>
<title>최초 정보 기입</title>
</head>
<body>

	<!-- 팝업창 영역 -->	
	<div id="popup-wrap">
		<div id="popup-bg"></div>
		<div id="popup-content">
			인증번호 : <input type="text" id="verifyCode"/>
			<div id="popup-ok">확인</div>
			<div id="popup-close" onclick="popupClose();">닫기</div>
		</div>
	</div>
	
	<div id="container">
		<form action="<%=request.getContextPath()%>/firstUpdate.emp" method="POST" id="firstUpdateForm" encType="multipart/form-data">
		  	<div class="hAll" id="profile" style="content:url('/gt/resources/images/common/profile.png');"></div>
		  	<div id="fileBox">
		  		<input type="text" id="file-text" disabled="disabled"/>
		  		<label id="file-lbl" for="file-select">이미지 선택</label>
		  		<input type="file" id="file-select" name="empProfile" accept="image/*"/>
		  	</div>
		  	<table id="fu-table">
		  		<tr>
		  			<td>이름 : </td>
		  			<td colspan="2"><input type="text" id="empName" disabled="disabled"/></td>
		  		</tr>
		  		<tr>
		  			<td>사번 : </td>
		  			<td colspan="2"><input type="text" id="empNo" disabled="disabled"/></td>
		  		</tr>
		  		<tr>
		  			<td>아이디 : </td>
		  			<td colspan="2"><input type="text" name="empId" id="empId" disabled="disabled"/>
		  			<input type="text" name="rId" id="rId" hidden="hidden"/></td>
		  		</tr>
		  		<tr>
		  			<td>비밀번호 : </td>
		  			<td><input type="password" name="empPwd" id="empPwd" size="40" placeholder=" 영문, 숫자, 기호를 조합한 8~16자리, 대소문자 구분" oninput="checkPwd();"/></td>
		  			<td><div class="checkLight" id="pwdLight"></div></td>
		  		</tr>
		  		<tr>
		  			<td>확인 : </td>
		  			<td><input type="password" id="empPwd2" oninput="dupCheckPwd();"/></td>
		  			<td><div class="checkLight" id="pwdDupLight"></div></td>
		  		</tr>
		  		<tr>
		  			<td>연락처 : </td>
		  			<td><input type="tel" name="phone" placeholder=" '-'없이 입력"  id="phone" oninput="checkPhone();"/></td>
		  			<td><div class="checkLight" id="phoneLight"></div></td>
		  		</tr>
		  		<tr>
		  			<td>이메일 : </td>
		  			<td>
		  				<input type="text" id="rEmail" name="rEmail" hidden="hidden"/>
		  				<input type="email" name="email" id="email" size="10"/>
		  				<label id="emailLbl">@</label>
		  				<input type="email" name="selfEmail" id="selfEmail" hidden="hidden"/>
		  				<select name="emailList" id="emailList" >
		  					<option value="none">계정선택</option>
		  					<option value="naver.com">naver.com</option>
		  					<option value="gmail.com">gmail.com</option>
		  					<option value="hanmail.net">hanmail.net</option>
		  					<option value="nate.com">nate.com</option>
		  					<option value="self">직접입력</option>
		  				</select>
		  				<div class="fu-btn" id="emailBtn" onclick="checkEmail();">확인</div>	
		  			</td>
		  			<td><div class="checkLight" id="emailLight"></div></td>
		  		</tr>
		  		<tr>
		  			<td>부서 : </td>
		  			<td colspan="2"><input type="text" id="empDept" disabled="disabled"/></td>
		  		</tr>
		  		<tr>
		  			<td>직급 : </td>
		  			<td colspan="2"><input type="text" id="empRank" disabled="disabled"/></td>
		  		</tr>
		  	</table>
		  	<div id='recaptcha' class="g-recaptcha" data-sitekey="6LevAFwUAAAAAMcuT6usZRZ5dYdVEHMS1HMDttL3" data-callback="onSubmit" data-size="invisible"></div>   
			<div class="fu-btn" id="firstUpdateBtn" onclick="firstUpdate();">확인</div>		
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
				}
				else{
					$("#email").css("display","inline-block");
					$("#emailLbl").css("display","inline-block");
					$("#selfEmail").attr("hidden","hidden");
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
 						success : function(data) {
 							if(data == 1)
 								alert("중복된 이메일입니다. 다시 입력해주세요.");
 							else{
 								// 이메일 발신 ajax
 								$.ajax({
 									url:"<%=request.getContextPath()%>/sendEmail.emp",	
 									type : "POST",
 									data : {email : inEmail},
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
			$("#firstUpdateForm").submit();
		}
			
	</script>
</body>
</html>
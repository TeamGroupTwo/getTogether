<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="<%=request.getContextPath()%>/resources/js/jquery-3.3.1.min.js"></script>
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
   }
   #file-box {
   
   }
   #file-select{
   
   }
   #file-btn{
   	display: inline-block;
   }
   #file-text{
   
   }
   .checkLight {
    border-radius: 50%;
    margin : auto;
    width : 13px;
    height : 13px;
    background: #ED3200;
   }
   #firstUpdateBtn {
   	width : 50px;
   	height : 25px;
   	background: #404040;
   	border-radius: 5px;
   	color : white;

   }	
</style>
<title>최초 정보 기입</title>
</head>
<body>
	<div id="container">
		<form action="firstUpdate.emp" method="POST" id="firstUpdateForm">
		  	<div class="hAll" id="profile" style="content:url('/gt/resources/images/common/profile.png');"></div>
		  	<div id="fileBox">
		  		<input type="text" id="file-text" disabled="disabled"/>
		  		<div id="file-btn">파일 선택</div>
		  		<input type="file" id="file-select" name="empProfile" accept="image/*"/>
		  	</div>
		  	<table id="fu-table">
		  		<tr>
		  			<td style="text-align: right;">이름 : </td>
		  			<td colspan="2"><input type="text" id="empName" disabled="disabled"/></td>
		  		</tr>
		  		<tr>
		  			<td>사번 : </td>
		  			<td colspan="2"><input type="text" id="empNo" disabled="disabled"/></td>
		  		</tr>
		  		<tr>
		  			<td>아이디 : </td>
		  			<td colspan="2"><input type="text" name="empId" id="empId" disabled="disabled"/></td>
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
		  				<input type="email" name="email" id="email" size="10" oninput="checkEmail();"/>
		  				<label>@</label>
		  				<input type="email" name="selfEmail" id="selfEmail" hidden="hidden"/>
		  				<select name="emailList" id="emailList">
		  					<option value="self">직접입력</option>
		  					<option value="naver">naver.com</option>
		  					<option value="google">gmail.com</option>
		  					<option value="daum">hanmail.net</option>
		  					<option value="nate">nate.com</option>
		  				</select>
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
			<div id="firstUpdateBtn" onclick="firstUpdate();">확인</div>		
		</form>
	</div>
	
	<script>
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
			
			if($("#email").val() == "test01"){
				emailChk = 'Y';
				$('#emailLight').css("background", "#57B20B");
			}
			else{
				emailChk = 'N';
				$('#emailLight').css("background", "#ED3200");
			}
			checkAll();
		}
		
		function firstUpdate() {
			if(allChk =='Y')
				$("#firstUpdateForm").submit();
		}
	</script>
</body>
</html>
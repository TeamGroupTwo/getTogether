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
	
</style>
<title>최초 정보 기입</title>
</head>
<body>
	<div id="container">
		<form action="firstUpdate.emp" method="POST" id="firstUpdateForm">
		  	<div class="hAll" id="profile" style="content:url('/gt/resources/images/common/profile.png');"></div>
		  	<div id="fileBox">
		  		<span id="file-text"></span>
		  		<span id="file-btn">파일찾기</span>
		  		<span class="file-select"><input type="file"></span>
		  	</div>
		  	<table>
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
		  			<td colspan="2"><input type="text" id="empId" disabled="disabled"/></td>
		  		</tr>
		  		<tr>
		  			<td>비밀번호 : </td>
		  			<td><input type="password" id="empPwd"/></td>
		  			<td><div id=""></div></td>
		  		</tr>
		  		<tr>
		  			<td>확인 : </td>
		  			<td><input type="password" id="empPwd2"/></td>
		  			<td><div id=""></div></td>
		  		</tr>
		  		<tr>
		  			<td>연락처 : </td>
		  			<td><input type="tel" id="phone"/></td>
		  			<td><div id=""></div></td>
		  		</tr>
		  		<tr>
		  			<td>이메일 : </td>
		  			<td><input type="email" id="email"/></td>
		  			<td><div id=""></div></td>
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
		$(function() {
			$('#empName').text(sessionStorage.getItem('loginName'));
			$('#empNo').text(sessionStorage.getItem('loginNo'));
			$('#empId').text(sessionStorage.getItem('loginId'));
			$('#empDept').text(sessionStorage.getItem('loginDept'));
			$('#empRank').text(sessionStorage.getItem('loginRank'));
		});
	</script>
</body>
</html>
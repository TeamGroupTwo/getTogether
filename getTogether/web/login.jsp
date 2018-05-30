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
	.wrap{
		display : flex;
		width : 74vw;
		height : 70vh;
		margin-top : 15vh;
		margin-left : 13vw;
	}
	#login{
		background : white;
		width : 35vw;
		min-width:400px;
		height : inherit;
	}
	#loginBtn{
		width : 50px;
		height : 50px;
		background: pink;
	}
	#loginBtn:hover{
		cursor : pointer;
	}
	#d2 {
		background : pink;
		width : 35vw;
		height : auto;
	}
</style>
<title>로그인 화면</title>
</head>
<body>
	<div class="wrap">
		<div id="login">
			<p align="center">GETTOGETHER</p>
			아이디 : <input type="text" name="eId" id="eId" /><br />
			비밀번호 : <input type="password" name="ePwd" id="ePwd"/>
			<div id="loginBtn"  onclick="login();">확인</div>
		</div>
		<div id="d2">
		
		</div>
	</div>
	
	<script>
	function login(){
		if($("#eId").val() == "" || $("#ePwd").val() == "")	
			alert("아이디와 비밀번호를 모두 입력해주세요.");
		else{
			$.ajax({
				url : "login.emp",		
				type : "POST",
				data : {
					eId : $("#eId").val(),
					ePwd : $("#ePwd").val()
				},
				success : function(data) {
					
					console.log(data.dCode);
					if(data == null)
						alert("아이디나 비밀번호가 일치하지 않습니다. 다시 입력해주세요.");
					else{
						sessionStorage.setItem('loginNo', data.eNo);
						sessionStorage.setItem('loginName', data.eName);
						sessionStorage.setItem('loginId', data.eId);
						sessionStorage.setItem('loginPwd', data.ePassword); 
						sessionStorage.setItem('loginRank', data.rCode);
						sessionStorage.setItem('loginDept', data.dCode); 
						
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
	</script>
</body>
</html>
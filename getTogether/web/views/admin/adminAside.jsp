<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="https://fonts.googleapis.com/css?family=Nanum+Gothic" rel="stylesheet">
<style>
	body{
		margin : auto;
	}
	#aside {
		background : #5f4d8c;
		position : fixed;
		width : 200px;
		height : 100%;
		padding-top : 90px; 
	}
	.menu{
		display : flex;
		margin-left : 20px;
	}
	.menu:hover{
		cursor : pointer;
	}
	.aImage {
		width : 30px;
		height : 30px;
		margin-top : 13px;
		margin-right : 5px;
	}
	.aText {
		color : white;
		font-family: 'Nanum Gothic', sans-serif;
      	font-size : 1em;
      	font-weight: bolder;
      	letter-spacing : -1px;
	}
</style>
</head>
<body>
	<div id="aside">
		<div class="menu" onclick="gotoEmpManagement();">
			<img class="aImage" src="<%= request.getContextPath() %>/resources/images/common/employeeManage.png"/>
			<p class="aText" id="workTxt">사원관리</p>
		</div>
		<div class="menu" onclick="gotoNoticeList();">
			<img class="aImage" src="<%= request.getContextPath() %>/resources/images/common/notice.png"/>
			<p class="aText" id="noticeTxt">공지사항</p>
		</div>
	</div>
	
	<script>
		function gotoEmpManagement(){
			location.href="/gt/elist.do";
		};
		
		function gotoNoticeList(){
			location.href="/gt/selectList.no";
		};
		
		
		
			
		
	</script>
	
</body>
</html>
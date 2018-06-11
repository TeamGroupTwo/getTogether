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
		background : white;
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
		color : #404040;
		font-family: 'Nanum Gothic', sans-serif;
      	font-size : 1em;
      	font-weight: bolder;
      	letter-spacing : -1px;
	}
</style>
</head>
<body>
	<div id="aside">
		<div class="menu" onclick="gotoNotice();">
			<img class="aImage" src="<%= request.getContextPath() %>/resources/images/common/notice.png"/>
			<p class="aText" id="noticeTxt">공지사항</p>
		</div>
		<div class="menu" onclick="selectPjList();">
			<img class="aImage" src="<%= request.getContextPath() %>/resources/images/common/work.png"/>
			<p class="aText" id="workTxt">부서게시판</p>
		</div>
		<div class="menu" onclick="location.href='<%=request.getContextPath()%>/views/schedule/schedule_main.jsp'">
			<img class="aImage" src="<%= request.getContextPath() %>/resources/images/common/schedule.png"/>
			<p class="aText" id="scheduleTxt">일정관리</p>
		</div>
		<div class="menu" onclick="gotoAddress();">
			<img class="aImage" src="<%= request.getContextPath() %>/resources/images/common/address.png"/>
			<p class="aText" id="addressTxt">주소록</p>
		</div>
	</div>

	<script>
		function selectPjList() {
			console.log(sessionStorage.getItem('loginDcode'));
			location.href = '/gt/selectList.pj?loginDcode='+sessionStorage.getItem('loginDcode');
		}
		function gotoAddress(){
			location.href = "/gt/alist.do";
		}
		function gotoNotice(){
			location.href = "/gt/selectList.no";
		}

	</script>
	
</body>
</html>
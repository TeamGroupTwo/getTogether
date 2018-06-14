<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<style>
	body{
		background : #dad5e6;
	}
	#myName{
			font-family : 'Nanum Gothic', sans-serif;
        	font-size : 30px;
        	position: relative;
        	left : 40%;
    }
    #listTable{
        position : absolute;
        top: 45px;
		border-collapse: collapse;
		border-bottom:3px solid rgb(95,77,140);
		text-align:center;
		width : 500px;
		margin-left: 800px;
	}
	th{
		color:white;
		background: #5f4d8c;
		font-size:20px;
	}
    #notice_title td{
		border-bottom:2px solid gray;
		padding :5px;
		font-size:15px;
	}
	#notice_title{
	 	padding-top: 100px;
	 	padding :5px;
	}
	#nowdaylist{
		color : black;
		font-size:20px;
		position : absolute;
		top : 370px;
		margin-left: 800px;
		background : white;
		width : 500px;
		height : 200px;
		text-align : left;
		border : 1px solid rgb(162,138,170);
	}
</style>
<title>메인페이지 화면</title>
<script src="/gt/resources/js/jquery-3.3.1.min.js"></script>
<link rel="stylesheet" type="text/css" href="./resources/css/schedule/schedule.css" />
</head>
<body>
<%@ include file="views/common/aside.jsp" %>
<%@ include file="views/common/header.jsp" %>
	<section style="width : 1530px; height : 80%; background : white; position: absolute; margin-top:  130px; margin-left: 300px;">
			<label id = "myName"></label>
	<div style="top : 70px; margin-left: 100px; position : absolute;">
	<%@ include file = "views/schedule/schedule_calendar.jsp" %>
	</div>
	<table id="listTable">
	<thead>
	<tr>
	<th>글 구분</th>
	<th>제목</th>
	<th>파일</th>
	</tr>
	</thead>
	<tbody>
	<tr id = "notice_title">
			<td style="width : 70px; color : red;"><b>공지</b></td>
			<td style="width : 70px;">안녕하세요</td>
			<td style="width : 80px;">
				<img src="resources/images/common/fileimg.png">
			</td>
	</tr>
	</tbody>
	</table>
	<div id = "nowdaylist">
	<div style="color : white; background : #5f4d8c; font-size : 30px; text-align: center"> 오늘의 메모 </div>
	</div>
	</section>
	<script>
	$(function(){
		$("#myName").text($('#empName').text()+"님 환영합니다.");
		$("#empNo").html(sessionStorage.getItem("loginNo"));
		$.ajax({
			url : "<%= request.getContextPath()%>/schedule_li.do",
			data : {
				empNo : $("#empNo").text(),
			},
			type : "GET",
			success : function(data){
				
				var $memo_title = $('#nowdaylist');
				
				if(data.length <= 0){
					var $label = $("<label>");
					$label.text("저장된 메모가 없습니다 !");
					$label.css('margin-left','25%');
					$memo_title.append($label);
				} else {
					for(var i in data){
						if(i < 5){
							var $body = $("<div>");
							var $div = $("<div>");
							var $label = $("<label>");
							$label.css("color" , data[i].sColor);
							$label.text("O");
							$div.attr('class','contentview');
							$div.css('display','inline-block');
							$div.text(data[i].sTitle);
							$body.append($label ,"&nbsp;", $div ,"<br>");
							$memo_title.append($body);	
						}
					}
				}
			}
		});
	});
	function days(day){
		console.log($("#yearSelect").val() + $("#monthSelect").val() +day);
	}
	</script>
</body>
</html>
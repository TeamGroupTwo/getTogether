<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    import="com.gt.gettogether.employee.model.vo.*, java.util.*"%>
    
<%
    	ArrayList<Employee> list = (ArrayList<Employee>)request.getAttribute("list");
%>    
<!DOCTYPE html>
<html>
<script src="/gt/resources/js/jquery-3.3.1.min.js"></script>
<head>
<meta charset="UTF-8">
<style>

/* 스크롤바 */
::-webkit-scrollbar {width: 8px; height: 8px; border: 3px solid #fff; }
::-webkit-scrollbar-button:start:decrement, ::-webkit-scrollbar-button:end:increment {display: block; height: 10px; background: url('./images/bg.png') #efefef}
::-webkit-scrollbar-track {background: #efefef; -webkit-border-radius: 10px; border-radius:10px; -webkit-box-shadow: inset 0 0 4px rgba(0,0,0,.2)}
::-webkit-scrollbar-thumb {height: 50px; width: 50px; background: rgba(0,0,0,.2); -webkit-border-radius: 8px; border-radius: 8px; -webkit-box-shadow: inset 0 0 4px rgba(0,0,0,.1)}

	table1{
	border-collapse: collapse;
    text-align: center;
    line-height: 1.5;
	}
	
	body{
		background : #dad5e6;	
	}
	.department{
		width : 200px;
		height: 500px;
		background-color: #5f4d8c;
		margin-left: auto;
		margin-right: auto;
		border: 1px solid black;
		text-align: center;
		font-size: 8pt;
	}
	.adrlist{
		width : 880px;
		height: 450px;
		background-color: white;
		margin-left: auto;
		margin-right: auto;
		border: 1px solid black;
		text-align: center;
	}    
/*  	th{
	width: 170px;
	height: 40px;
	border:1px solid gray;
	background-color: lightpink;
	} */

	td{
	width: 350px;
    padding: 10px;
    vertical-align: top;
    border-bottom: 1px solid #ccc;
	}
	table.table1 thead th{
	padding: 10px;
	width: 170px;
    font-weight: bold;
    vertical-align: top;
    color: #369;
    border-bottom: 3px solid #036;
   
	}
	
	#pfile{
		background: #f3f6f7;
	}
	h1{
	margin: 0;
	margin-top: -15px;
	margin-bottom: 15px;
	padding-top: -20px;
	padding-bottom: -10px;
	height: 13.5%;
	line-height: 60px;
	color: white;
	border: 1px solid white;
	text-shadow: 0 1px 20px #fff;
	transition-duration: 0.5s;
	
	}
	h1:hover {
		cursor: pointer;
		background: #dad5e6;
	}

	#keyword {
		height: 34px;		
		border: 1px solid #036;
		background: #ffffff; 
	}
	
	/*주소록 검색 버튼*/
	#sBtn {
		width:70px;
		height: 34px;
		border: 0px;
		background: #1b5ac2;
		outline: none;
		float: right;
		color: #ffffff;
	}

</style>
<title>주소록 화면</title>
</head>
<body>
	<%@ include file="../common/aside.jsp" %>
	<%@ include file="../common/header.jsp" %>
	
	
	<div class="department" id="department" style="position: absolute; top: 120px; left: 230px;">
	<br />

	
	   
		<h1 onclick="test(1)">회계부</h1><br/>
		<h1 onclick="test(2)">인사부</h1><br/>
		<h1 onclick="test(3)">법무부</h1><br/>
		<h1 onclick="test(4)">개발부</h1><br/>
		<h1 onclick="test(5)">영업부</h1><br/>
		<h1 onclick="test(6)">전략기획부</h1>
	  
		
	</div>
	<form action="<%=request.getContextPath()%>/alist.do">
	
<% String[] partList = {"회계부", "인사부", "법무부", "개발부", "영업부", "전략기획부"}; 
	for(int i = 0 ; i < partList.length ; i++){ %>
	 <div id="div<%=(i+1) %>" class="adrlist" style="background:white; position: absolute; top: 170px; left: 450px; overflow: auto;">
		
		<table class="table1" align="center" id="listArea" >
		<thead>
			<tr>
				<th>   </th>
				<th>이 름</th>
				<th>직 책</th>
				<th>E-MAIL</th>
				<th>H.P</th>
			</tr>
			</thead>
			
			
			 <% for ( Employee a : list) { 
			 if( a.getdCode().equals("D"+(i+1))) {%>
			<tr>
			    <td id="pfile"><%=a.getProfile() %></td>
				<td><%=a.geteName() %></td>
				<td><%=a.getrCode() %></td>
				<td><%=a.getEmail() %></td>
				<td><%=a.getPhone() %></td>				
			</tr>
			<% } } %> 
		</table>		
	</div>
<% } %>
	<div id="searchDiv" class="searchDiv adrlist" style="display:none; background:white; position: absolute; top: 170px; left: 450px; overflow: auto;">
		
		<table class="table1" align="center" id="listArea" >
		<thead>
			<tr>
				<th>   </th>
				<th>이 름</th>
				<th>직 책</th>
				<th>E-MAIL</th>
				<th>H.P</th>
			</tr>
			</thead>
			<tbody>
			</tbody>
		</table>		
	</div>
	</form>

	<div class="searchArea" align="center" style="position: absolute; top: 120px; left: 1090px;">
		<input type="search" id="keyword" placeholder="이름 검색" onkeyup="enterCheck();"/>
		<button id="sBtn" type="button" onclick="search();">검색</button>
	</div>


	<script>
	
	
	
//최초 접속시 보여질 페이지
$(function(){
	$('.adrlist').each(function(index, item){
		$(this).css('display', 'none');
	});
	$("#div1").css("display", "block");
});
	// 각 부서 클릭시 보여지는 div
	function test(num){
		var divName = '#div'+num;
		$('.adrlist').each(function(index, item){
			$(this).css('display', 'none');
		});
		$(divName).css("display", "block");
	}

	function search() {
			$.ajax({
				url:"<%=request.getContextPath()%>/searchAddress.do",
				data:{name : $('#keyword').val()},
				type:"POST",
				success: function(data){
					/* 갱신 해야 한다. [검색된 이름 ArrayList] */
					$('.adrlist').each(function(){
						$(this).css('display', 'none');
					});
					$('#searchDiv').css('display','block');
					
					$('#searchDiv').children().find('tbody').text("");
					
						for(var i in data){
							
							var $tr = $('<tr>');
							//  한 요소(td) 별로 담는다.
							var $tdProfile = $('<td>').text(data[i].profile); 
							 $tdProfile.attr('id', 'pfile');
							var $tdName = $('<td>').text(data[i].eName); 
							var $tdDept = $('<td>').text(data[i].dCode); 
							var $tdEmail = $('<td>').text(data[i].email); 
							var $tdHP = $('<td>').text(data[i].phone);
							
							$tr.append($tdProfile);
							$tr.append($tdName);
							$tr.append($tdDept);
							$tr.append($tdEmail);
							$tr.append($tdHP);
							
							// 하나의 큰 틀(tr)에 담는다.
							
							$('#searchDiv table tbody').append($tr);
							
						}
				},
				error: function(){
					
				}
			});
	}
	
	// 검색 버튼 엔터
 	function enterCheck(){
		if(event.keyCode == 13) {
			search();
		}
	}
	</script>
</body>
</html>
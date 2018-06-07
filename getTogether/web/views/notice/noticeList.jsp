﻿<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"  import="java.util.*, com.gt.gettogether.notice.model.vo.*" %>

<%
	ArrayList<NoticeNFiles> list = (ArrayList<NoticeNFiles>)request.getAttribute("list");
	
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>공지사항</title>
	<script src="<%=request.getContextPath()%>/resources/js/jquery-3.3.1.min.js"></script>
<style>
	
	body{
		background : #dad5e6;
	}
	
	#whiteArea{
		width:1000px; 
		height:auto; 
		background:white; 
		position:absolute;  
		margin-left:550px;  
		margin-top: 170px;
		
		
	}
	
	#listTable{
		border-collapse: collapse;
		border-bottom:3px solid rgb(95,77,140);
		text-align:center;
		margin-left:auto;
		margin-right:auto;
	}
	
	#spanTag{
		
		height:11px; 
		font-size:40px; 
		border-bottom:2px solid gray;
		text-align:center;
		background:white; 
		margin-left:400px;
	}
	#tableArea{
		width:900px; 
		height:650px; 
		background: white; 
		margin-left:auto; 
		margin-right:auto;
	}
	
	
	
	#writeTextBtn{
		width:70px; 
		height:25px; 
		background:rgb(95,77,140); 
		color:white; 
		font-weight:bold; 
		font-size:15px; 
		position:absolute;
		margin-left:792px; 
		cursor: pointer;  
	
	}
	#searchCondition{
		width:70px; 
		height:25px; 
		font-weight:bold;
		font-size:15px;
		border:2px solid rgb(95,77,140) ; 
		position:absolute;  
		margin-left:600px;
	}
	#keyword{
		width:150px; 
		height:25px; 
		font-weight:bold;
		font-size:15px;
		border:2px solid rgb(95,77,140); 
		position:absolute;  
		margin-left:675px;
	}
	#searchBtn{
		width:30px; 
		height:25px; 
        cursor: pointer;
		position:absolute;  
		margin-left:830px;
	}
	
	
	
	th{
		color:white;
		background: #5f4d8c;
		font-size:20px;
	}
	td{
		border-bottom:2px solid gray;
		padding :5px;
		font-size:15px;
	}
	tr{
	 	padding-top: 100px;
	 	padding :5px;
	}
	
	
	#writeNotice1{
		width:600px; 
		height:725px; 
		background:white; 
		position:absolute; 
		margin-left:1290px; 
		margin-top:130px; 
		display:none;
		
	}
	
	#writeNoticeSpan{
		height:11px; 
		border-bottom:2px solid gray;
		background:white; 
		margin-left:200px;
		font-size:25px;
		text-align:center;
	}
	.filebox input[type="file"] {
		 position: absolute; 
		 width: 1px; 
		 height: 1px; 
		 padding: 0; 
		 margin: -1px; 
		 overflow: hidden; 
		 clip:rect(0,0,0,0); 
		 border: 0; 
	} 
	.filebox label { 
		 display: inline-block; 
		 padding: .5em .75em; 
		 color: white; 
		 font-size: inherit; 
		 line-height: normal; 
		 vertical-align: middle; 
		 background-color: rgb(95,77,140); 
		 cursor: pointer; 
		 border: 1px solid gray; 
		 border-bottom-color: gray; 
		 border-radius: .25em; } /* named upload */ 
	.filebox .file { 
		
		 padding: .5em .75em; /* label의 패딩값과 일치 */  	 
		 vertical-align: middle; 
		 background-color: white;
		 color: rgb(95,77,140);
		 font-weight:bold; 
		 border: 1px solid gray;
		 border-radius: .25em; 
	 }


</style>
</head>
<body>
	<%@ include file="../admin/adminHeader.jsp" %>
	<%@ include file="../admin/adminAside.jsp" %>
	<div id="whiteArea">
		<span id="spanTag">공지사항</span>
			<br><br>
			<div id="tableArea">
			
			
			<select name="searchCondition" id="searchCondition">                                							      <!-- 검색용 select -->
				<option value="">전체</option>	
				<option value="title">제목</option>
				<option value="content">내용</option>
			</select>
			
								
			<input type="search" name="" id="keyword"placeholder="검색 내용 입력"/>					           <!-- 검색용 Input -->					
			<input type="image" id="searchBtn"  src="/gt/resources/images/common/button_search.png" onClick="search();"> <!-- 검색용 Button -->
			<br><br>
			<table id="listTable">   												 			<!-- Table Start -->
				<thead>
					<th>글구분</th>
					<th>제목</th>
					<th>파일</th>
					<th>작성일</th>
					<th>조회수</th>
				</thead>
				<tbody>
					<% for (NoticeNFiles n:list){ %>
					<tr>
						<% if(n.getnFix().equals("Y")){ %>
						<td style="display:none;" ><%= n.getnNo()%></td>
						<td style="width:70px; color:red;" ><b>공지</b></td>
						<% }else{ %>
						<td style="width:70px;"><%= n.getnNo()%></td>
						
						<% }%>
						
						<td style="width:450px;"><b><%= n.getnTitle()%></b></td>
						
						
						<% if(n.getfName() != null) { %>
						<td style="width:80px;">
							<img src="<%=request.getContextPath()%>/resources/images/common/fileimg.png">
						</td>
						<% } else {%>
						<td style="width:80px;">
							
						</td>
						<% } %>
						
					
						<td style="width:100px;"><%= n.getnDate()%></td>
						<td style="width:70px;"><%= n.getnCount()%></td>
					</tr>
					<% }%>
				</tbody>
			</table>											   			  	<!-- Table End -->
			<p></p>
			<button id="writeTextBtn" onclick="writeTextBtn();">글작성</button>     	            									  <!-- 글작성 버튼  -->
	
			</div>
	</div>
	
	<div id="writeNotice1">
		<span id="writeNoticeSpan">공지사항 글작성</span>
			<form action="<%= request.getContextPath() %>/insert.no" method="post" enctype="multipart/form-data">
			 
		      <input type="text" name="empNo" id="empNo" style="display: none;"/>
		      <input type="text" name="eName" id="eName" style="display: none;"/>
			
			<div id="writeNotice2" style=" border-radius: .25em; background: white; width: 500px; height:650px; margin-left:auto; margin-right:auto; margin-top:20px; border:3px solid rgb(95,77,140);  ">
				 <button type="button" style="background:rgb(95,77,140); margin-left:480px; color:white; height:25px; cursor: pointer; border:0; border-radius: .25em;" onclick="location.href='<%= request.getContextPath()%>/selectList.no'">X</button>
				<table style="background: white; border-collapse: collapse; margin-left:auto; margin-right:auto; ">
					<tr>
						<td style="width:60px; text-align:center;">제목</td>
						<td><input type="text" name="title" size="50px;" style=" border-radius: 5px; height:20px;" /></td>	
					</tr>
					<tr>
						<td style="text-align:center;">공지여부</td>
						<td>
						<input type="checkbox" name="noticeYN" id="noticeYN" value="N"/>
						</td>	
					</tr>
					<tr>
						<td style="text-align:center;">첨부파일</td>
						<td>
							<div class="filebox"> 
							<input class="file" disabled="disabled" placeholder="파일을 첨부해주세요"> 
							<label for="f_NameSend">파일 첨부</label> 
							<input type="file" id="f_NameSend"  name ="f_NameSend"class="upload-hidden"> 
							</div>
						</td>
					</tr>
					<tr>
						<td>내용</td>
						<td></td>
					</tr>
					<tr>
						<td colspan="2">
							<textarea name="content"cols="60" rows="15"></textarea>
						</td>
					</tr>
				</table>
				 
		            <div align="right" style="background:white; width:300px; height:50px; margin-left:170px;">
		               <p></p>
		               
		               <button type="reset" style="background:rgb(95,77,140); color:white; height:25px; cursor: pointer; border:0; border-radius: .25em;">다시작성</button>
		               <button type="submit" style="background:rgb(95,77,140); color:white; height:25px; cursor: pointer; border:0; border-radius: .25em;">등록하기</button>
		            </div>
			</div>
			
			
			
			</form>
	</div>
	
	<script>
		$(function(){
			$('#listTable td').mouseenter(function(){
				$(this).parent().css({
					"background" : "#dad5e6",
					"cursor":"pointer"
					});
				}).mouseout(function(){
					$(this).parent().css({
						"background": "white"
						});
					}).click(function(){
					
					var num = $(this).parent().children().eq(0).text();
					location.href="<%= request.getContextPath()%>/selectOne.no?num="+num;
				});
			});
	
	
		$(function(){
			
			
			$("#empNo").val(sessionStorage.getItem("loginNo"));
			console.log($("#empNo").val());
			
			$("#eName").val(sessionStorage.getItem("loginName"));
			console.log($("#eName").val());
			
			$('#writeTextBtn').on("click", function(){
				$('#writeNotice1').show(1300);
				
		  	   var left = $('#whiteArea').css('margin-left','250px');//왼쪽에서 부터 = 250px
               var top = $('#whiteArea').css('margin-top','130px');  //상단에서 부터 = 130px
                
                $('#whiteArea').animate({
                   
                },'slow');
			});
		
			var fileTarget = $('.filebox .upload-hidden'); 
			
			fileTarget.on('change', function(){ // 값이 변경되면 
				if(window.FileReader){ // modern browser 
					var filename = $(this)[0].files[0].name; } 
				else { // old IE 
					var filename = $(this).val().split('/').pop().split('\\').pop(); // 파일명만 추출 
					} 
				// 추출한 파일명 삽입 
					$(this).siblings('.file').val(filename); 
				}); 
			}); 
		
		$('#noticeYN').on('change',function(){
			if($('#noticeYN').is(":checked")){
				$(this).val('Y');
				alert('공지 사항으로 글을 게시합니다.');
				console.log($('#noticeYN').val());
			}else{
				$(this).val('N');
				alert('일반 글로 글을 게시합니다. ');
				console.log($('#noticeYN').val());
			}
			
		});
		
		function search(){
			location.href='<%=request.getContextPath()%>/searchNotice.no?con='+$('#searchCondition').val()+"&keyword="+$('#keyword').val();
		}
			
		
		
	
	</script>
	
</body>
</html>









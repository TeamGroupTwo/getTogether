<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import = "com.gt.gettogether.notice.model.vo.*"%>
<%
	NoticeNFiles n = (NoticeNFiles)request.getAttribute("n");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시판 글</title>

<style>
	
	body{
		background : #dad5e6;
	}
	
	#whiteArea{
		width:1000px; 
		height:700px; 
		background:white; 
		position:absolute;  
		margin-left:550px;  
		margin-top: 170px;
		
		
	}
	#tableDetail{
		border-collapse: collapse;
		border-bottom:3px solid rgb(95,77,140);
		border-top:3px solid rgb(95,77,140);
		margin-left:auto;
		margin-right:auto;
	}
	#tableArea{
		width:900px; 
		height:510px; 
		background: white; 
		margin-left:50px; 
		margin-top:20px;
	}
	#spanTag{
		
		height:11px; 
		font-size:40px; 
		border-bottom:2px solid gray;
		text-align:center;
		background:white; 
		margin-left:400px;
	}
	td{
		border-bottom:2px solid gray;
		padding :5px;
		font-size:15px;
		text-align: left;
	}
	tr{
	 	padding-top: 100px;
	 	padding :5px;
	}
</style>
	
</head>
<body>
	<%@ include file="../admin/adminHeader.jsp" %>
	<%@ include file="../admin/adminAside.jsp" %>
	
	<div id="whiteArea">
		<span id="spanTag">공지사항</span>
		<div id="tableArea">
			<table id="tableDetail">
				<tr>
					<td style="width:50px"><b>제목</b></td>
					<td colspan="5" style="width:700px"><%= n.getnTitle() %></td>
				</tr>
				<tr>
					<td style="width:50px"><b>작성자</b></td><td style="width:50px"><%=n.getnWriter()%></td>
					<td style="width:50px"><b>작성일</b></td><td style="width:100px"><%=n.getnDate()%></td>
					<td style="width:50px"><b>조회수</b></td><td style="width:100px"><%=n.getnCount()%></td>
				</tr>
					<% if (n.getfName() != null &&  n.getfName() != "") { %>
				<tr>
					<td><b>첨부파일<b></td>
					<td colspan="5">
					<a href="/gt/resources/files/noticeFiles/<%= n.getfName()%>" download><%= n.getfName() %></a></td>
					
				</tr>
					<% } %> 
				<tr>
					<td style="width:50px" ><b>내용<b></td>
				</tr>
				<tr>
					<td id="contentTD"colspan="6" style="height:400px; width:350px; vertical-align: text-top;" ><br><%= n.getnContent()%></td>
				</tr>
			</table>
		</div>
		<div style="margin-left:790px;">
		<br><br />	
			<button style="background:rgb(95,77,140); color:white; height:25px; cursor: pointer; border:0; border-radius: .25em;" onclick="location.href='<%= request.getContextPath()%>/selectList.no'">목록</button>
			<%-- <% if(m != null && m.getUserId().equals("admin")) {%> --%>
			<button style="background:rgb(95,77,140); color:white; height:25px; cursor: pointer; border:0; border-radius: .25em;" onclick="location.href='<%= request.getContextPath()%>/noticeUpdateView.no?num=<%=n.getnNo() %>'">글 수정</button>
			<%-- <%} %> --%>
		</div>
	</div>
	
</body>
</html>
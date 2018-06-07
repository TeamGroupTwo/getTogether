<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import = "com.gt.gettogether.notice.model.vo.*"%>
<%
	NoticeNFiles n = (NoticeNFiles)request.getAttribute("n");
%>
	<!-- n.setnNo(rset.getInt("N_NO"));
			n.setnTitle(rset.getString("N_TITLE"));
			n.setnWriter(rset.getString("E_NAME"));
			n.setnContent(rset.getString("N_CONTENT"));
			n.setnCount(rset.getInt("N_COUNT"));
			n.setnDate(rset.getDate("N_DATE"));
			n.setfName(rset.getString("F_NAME")); -->
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
		border:2px solid gray;
		padding :5px;
		font-size:15px;
		text-align: left;
	}
	tr{
	 	padding-top: 100px;
	 	padding :5px;
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
		/*  padding: .5em .75em;  */
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
		
		/*  padding: .5em .75em; /* label의 패딩값과 일치 */   */	 
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
		<span id="spanTag">공지사항 </span>
		<form id="updateform" method="post">
		<div id="tableArea">
			<table id="tableDetail">
				<tr>
					<td style="width:50px"><b>제목</b></td>
					<td colspan="5" style="width:700px">
					<input type="text" name="title" size="50" value="<%=n.getnTitle() %>" />
					<input type="hidden" name="nno" value="<%=n.getnNo()%>"/>
					</td>
				</tr>
				<tr>
					<td style="width:50px"><b>작성자</b></td><td style="width:50px" readonly><%=n.getnWriter()%></td>
					<td style="width:50px"><b>작성일</b></td><td style="width:100px" readonly><%=n.getnDate()%></td>
					<td style="width:50px"><b>조회수</b></td><td style="width:100px" readonly><%=n.getnCount()%></td>
				</tr>
					
				<tr>
				 <% if (n.getfName() != null) { %> 
               
                  <td><b>기존 파일</b></td>
                  <td colspan="5"><%= n.getfName() %></td>
            
                <% } %> 
				<tr>
					<td><b>새 파일 첨부</b></td>
					<td colspan="5">
						<div class="filebox"> 
							<input class="file"  disabled="disabled" placeholder="파일을 첨부해주세요"> 
							<label for="f_NameSend">파일 첨부</label> 
							<input type="file" id="f_NameSend"  name ="f_NameSend"class="upload-hidden"> 
						</div>
					</td>
				</tr>
					
				<tr>
					<td style="width:50px" ><b>내용<b></td>
				</tr>
				<tr>
					<td id="contentTD"colspan="6" style="height:400px; width:350px; vertical-align: text-top;" >
					<br>
					<textarea name="content" cols="114" rows="23" style="resize:none;"><%= n.getnContent()%></textarea>
					</td>
				</tr>
			</table>
		</div>
		<div style="margin-left:790px;">
		<br><br><br><br>
			<button style="background:rgb(95,77,140); color:white; height:25px; cursor: pointer; border:0; border-radius: .25em;" onclick="complete();">수정완료</button>
			<%-- <% if(m != null && m.getUserId().equals("admin")) {%> --%>
			<button style="background:rgb(95,77,140); color:white; height:25px; cursor: pointer; border:0; border-radius: .25em;" onclick="deleteNotice();">글 삭제</button>
			<%-- <%} %> --%>
			
			<script>
					function complete(){
						$('#updateform').attr("action","<%=request.getContextPath() %>/update.no")
					}
					function deleteNotice(){
						$('#updateform').attr("action","<%=request.getContextPath() %>/deleteNotice.no")
					}
					
					
					
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
					
					
			</script>
		</div>
	</form>
	</div>
	
</body>
</html>
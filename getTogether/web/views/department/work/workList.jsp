<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    import="java.util.*, com.gt.gettogether.department.work.model.vo.*"%>
<%
	ArrayList<Work> workList = (ArrayList<Work>) request.getAttribute("workList");
	int pNo = (int) request.getAttribute("pNo");
	String pTitle = (String) request.getAttribute("pTitle");
	int loginNo = (int) request.getAttribute("eNo");
	HashMap<Integer, ArrayList<WorkComment>> workCommentList
		= (HashMap<Integer, ArrayList<WorkComment>>) request.getAttribute("workCommentList");
%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <!-- <meta name="viewport" content="width=device-width, initial-scale=1.0"> -->
    <title>부서게시판</title>

    <script src="/gt/resources/js/jquery-3.3.1.min.js"></script>

    <style>
    
        /* 전체 초기화 */
        /* * {
            margin: 0;
            padding: 0;
        } */

        /* 전체 배경색 */
        body {
            background-color: #DAD5E7;
        }

        /* 내용을 담을 큰 틀 */
        #container {
        	min-width: 1200px;
            margin: 50px auto;
            padding-top: 50px;
            width: 80%;
            height: 700px;
            background-color: white;
            position: absolute;
            top: 80px;
            left: 300px;
        }

        /* 검색과 버튼들을 담는 div */
        #top {
            width: 80%;
            height: 75px;
            margin: 0 auto;
            padding-top: 30px;
        }
        #top img {
            float: left;
        }
        #top h2 {
            margin: 0 0 0 10px;
            float: left;
            height: 50px;
            line-height: 50px;
        }
        .right {
            float: right;
        }
        #insertBtn {
            color: white;
            border-radius: 5px;
            width: 60px;
            height: 35px;
            line-height: 35px;
            text-align: center;
            cursor: pointer;
            background-color: #5F4D8C;
            border: 1px solid #5F4D8C;
            margin-left: 10px;

            transition-duration: 0.4s;
            -webkit-transition-duration: 0.4s;
        }
        #insertBtn:hover {
            background-color: white;
            color: black;
        }
        #top input {
            border: 2px solid #604F8D;
            height: 30px;
            font-size: 1.0em;
            padding-left: 2px;
            outline: none;
        }
        #searchBtn {
            display: inline-block;
            width: 20px;
            height: 20px;
            padding: 10px;
            background-color: #5F4D8C;
            border-radius: 5px;
            opacity: .9;
            margin-left: 10px;
        }
        #searchBtn:hover {
            cursor: pointer;
            opacity: 1;
        }
        #searchBtn img {
            width: 100%;
            height: 100%;
        }

        /* 프로젝트 게시판을 담을 div */
        #content {
            width: 80%;
            margin: 0 auto;
            margin-top: 20px;
            height: 500px;
            /* text-align: center; */
            overflow-y: scroll;
            overflow-x: hidden;
            border: 2px solid #5F4D8C;
            min-width: 1200px;
        }
/*         #content::-webkit-scrollbar {
            display: none;
        } */
        
   	    #content::-webkit-scrollbar {width: 8px; height: 8px; border: 3px solid #fff; }
		#content::-webkit-scrollbar-button:start:decrement, ::-webkit-scrollbar-button:end:increment {display: block; height: 10px; background: #efefef}
		#content::-webkit-scrollbar-track {background: #efefef; -webkit-border-radius: 10px; border-radius:10px; -webkit-box-shadow: inset 0 0 4px rgba(0,0,0,.2)}
		#content::-webkit-scrollbar-thumb {height: 50px; width: 50px; background: rgba(0,0,0,.2); -webkit-border-radius: 8px; border-radius: 8px; -webkit-box-shadow: inset 0 0 4px rgba(0,0,0,.1)}

        .oneArticle {
            height: 500px;
            border-bottom: 1px solid #5F4D8C;
            border-top: 1px solid #5F4D8C;
            margin-bottom: 30px;
        }
        .oneArticle:last-child {
            margin: 0;
        }

        .content_left {
            width: 58.5%;
            height: 460px;
            border-right: 1px solid #5F4D8C;
            float: left;
            padding: 20px;
        }
        .content_left img {
            float: left;
            margin-right: 10px;
        }
        .empName {
            height: 40px;
            line-height: 40px;
            display: inline-block;
            margin: 0;
        }
        .date {
            height: 40px;
            line-height: 40px;
            float: right;
            margin: 0;
            margin-right: 50px;
        }
        .naeyong {
            margin-top: 30px;
        }
        .article {
            border: 1px solid #5F4D8C;
            height: 210px;
            width: 95%;
            margin: 0 auto;
            padding: 10px;
            font-weight: 550;
        }
        .inputFile {
            float: left;
        }
        .content-left-buttons {
            float: right;
            color: white;
            border-radius: 5px;
            width: 50px;
            height: 30px;
            line-height: 30px;
            text-align: center;
            margin-right: 10px;
            margin-top: 15px;
        }
        .content-left-buttons:hover {
            cursor: pointer;
        }
        .updateBtn {
            background-color: #346DF0;
            border: 1px solid #346DF0;

            transition-duration: 0.4s;
            -webkit-transition-duration: 0.4s;
        }
        .updateBtn:hover {
            background-color: white;
            color: black;
        }
        .deleteBtn {
            background-color: #404040;
            border: 1px solid #404040;
            margin-right: 15px;

            transition-duration: 0.4s;
            -webkit-transition-duration: 0.4s;
        }
        .deleteBtn:hover {
            background-color: white;
            color: black;
        }

        /* 댓글 부분 */
        .content_right {
            height: 500px;
            width: 38%;
            display: inline-block;
        }
        .comment_header {
            width: 100%;
            background-color: #5F4D8C;
        }
        .comment_header h3 {
            margin: 0;
            color: white;
            height: 50px;
            line-height: 50px;
            margin-left: 20px;
        }
        .comment_content {
            height: 300px;
            border-bottom: 1px solid #5F4D8C;
            overflow-y: scroll;
        }
         .comment_content::-webkit-scrollbar {
            display: none;
        } 

        .oneComment {
            overflow: hidden;
            height: auto;
            /* width: 452.95px; */
            min-height: 50px;
            border-bottom: 1px solid #5F4D8C;
            padding: 20px 20px;
        }
        .oneComment_left {
            width: 33%;
            float: left;
        }
        .oneComment_left div {
            float: left;
        }
        .oneComment_left h3 {
            float: left;
            /* display: inline-block; */
            margin: 0;
            height: 40px;
            line-height: 40px;
            margin-left: 10px;
        }
        .oneComment_right {
            width: 66%;
            float: left;
        }
        .oneComment_right p {
            margin: 0;
        }
        .oneComment_right .defaultBtn {
        	font-size: 0.8em;
        	width: 40px;
        	height: 20px;
        	line-height: 20px;
        	margin-right: 0;
        	opacity: .9;
        }
        .oneComment_right .defaultBtn:hover {
			opacity: 1;        
        }
        .oneComment_right .deletewcBtn, .oneComment_right .updatewcCancelBtn {
            background-color: #404040;
            border: 1px solid #404040;
            /* margin-right: 15px; */
        }
        .oneComment_right .updatewcBtn, .oneComment_right .updatewcConfirmBtn {
			background-color: #404040;
            border: 1px solid #404040;
            margin-right: 5px;       
        }
        .updatewcCancelBtn, .updatewcConfirmBtn {
        	display: none;
        }

        .comment_bottom {
            height: 110px;
            padding: 20px;
        }
        .comment_bottom textarea {
            border: 1px solid #5F4D8C;
            resize: none;
            outline: none;
        }

        .commentInsertBtn {
            float: right;
            width: 65px;
            height: 80px;
            background-color: #5F4D8C;
            margin-top: 15px;
            border-radius: 10px;
            opacity: .9;
        }
        .commentInsertBtn:hover {
            cursor: pointer;
            opacity: 1;
        }
        .commentInsertBtn p {
            margin: 0;
            height: 80px;
            line-height: 80px;
            text-align: center;
            color: white;
            font-size: 1.2em;
            font-weight: 600;


        }
        
        .wcUpContent {
        	word-break:break-all;
        	resize: none;
        	width: 100%;
        	overflow: hidden;
        }
        .oneComment_right p {
        	word-break:break-all;
        }
        
        select {
        	width: 70px;
        	height: 35px;
        	margin-right: 10px;
        	border: 2px solid #5F4D8C;
        	outline: none;
        }
        
		.profile {
	      border-radius : 50%;
	      border :1px solid #404040;
	      margin : auto;
	      width : 34px;
	      height : 34px;
	   	}

    </style>
</head>

<body>

	<%@ include file="../../common/header.jsp" %>
	<%@ include file="../../common/aside.jsp" %>

    <div id="container">
        <div id="top">
            <img src="/gt/resources/images/department/work/project_icon.png" width="50px" height="50px">
            <h2><%=pTitle%></h2>

            <div class="right" id="insertBtn">생성</div>
            <div class="right" id="searchBtn"><img src="/gt/resources/images/department/work/search_icon.png"></div>
            <div class="right"><input type="text" size="15" placeholder="search..." id="search"></div>
            <select class="right" id="">
            	<option value="제목">제목</option>
            	<option value="내용">내용</option>
            	<option value="작성자">작성자</option>
            </select>
        </div>

        <div id="content">
        
        	<% for(Work w : workList) { %>
	            <div class="oneArticle">
	            	<input type="hidden" value="<%=w.getwNo()%>" class="wNo" />
	                <div class="content_left">
	                    <h3 class="title">제목 : <%=w.getwTitle()%></h3>
	                    <%if(w.getProfile() == null) { %>
	                    	<div class="hAll" id="profile" style="content:url('/gt/resources/images/common/profile.png');"></div>
	                    <% } else { %>
	                    	<div class="hAll" id="profile" style="content:url(<%=w.getProfile()%>);"></div>
	                    <% } %>
	                    <h3 class="empName"><%=w.getwWriter()%></h3>
	                    <h3 class="date">날짜 : <%=w.getwDate()%></h3>
	                    <h3 class="naeyong">내용</h3>
	                    <div class="article"><%=w.getwContent()%></div>
	                    <h3 class="inputFile">첨부파일 : 
	                    <% if(w.getfName() != null) { %>
	                    	<a href="/gt/resources/files/workFiles/<%=w.getfName()%>" download><%=w.getfName()%></a>
	                    <% } %>
	                    </h3>
	                    
	                    <% if(w.geteNo() == loginNo) { %>
	                    <div class="content-left-buttons defaultBtn deleteBtn">삭제</div>
	                    <div class="content-left-buttons defaultBtn updateBtn">수정</div>
	                    <% } %>
	                </div>
	
	                <div class="content_right">
	                    <div class="comment_header"><h3>댓글</h3></div>
	                    <div class="comment_content">
<%-- 	                    <% if(workCommentList.get(w.getwNo()) != null) { %>
	                    
	                    	<% for(WorkComment wc : workCommentList.get(w.getwNo())) { %>
	                    	
   	                         	<div class="oneComment">
   	                         		<input type="hidden" value="<%=wc.getWcNo()%>" class="wcNo" />
	 	                            <div class="oneComment_left">
                   	                    <%if(wc.getProfile() == null) { %>
					                    	<div class="hAll" id="profile" style="content:url('/gt/resources/images/common/profile.png');"></div>
					                    <% } else { %>
					                    	<div class="hAll" id="profile" style="content:url(<%=wc.getProfile()%>);"></div>
					                    <% } %>
		                                <h3><%=wc.getWcWriter()%></h3>
		                            </div>
		                            <div class="oneComment_right">
		                            	<p><%=wc.getWcContent()%></p>
		                                <textarea class="wcUpContent" readonly="readonly"><%=wc.getWcContent()%></textarea>
                   	                    <% if(wc.geteNo() == loginNo) { %>
						                    <div class="content-left-buttons defaultBtn deletewcBtn">삭제</div>
						                    <div class="content-left-buttons defaultBtn updatewcBtn">수정</div>
						                    <div class="content-left-buttons defaultBtn updatewcCancelBtn">취소</div>
						                    <div class="content-left-buttons defaultBtn updatewcConfirmBtn">확인</div>
					                    <% } %> 
		                            </div>
	                        	</div>
	                    	
	                    	<% } %>
	                    	
	                    <% } %> --%>
	                    </div>
	                    <div class="comment_bottom">
	                        <textarea cols="45" rows="7" class="wcContent"></textarea>
	                        <div class="commentInsertBtn">
	                            <p>작성</p>
	                        </div>
	                    </div>
	                </div>
	            </div>
	        <% } %>

        </div>
    </div>

	<script>

		
	
		$(function() {
			
			$.ajax({
				
				url : "/gt/selectList.wc",
				data : { "pNo" : <%=pNo%> },
				type : "POST",
				success : function(data) {
					
					$('.comment_content').each(function() {
						
						var $comment_content = $(this);
						
						for(var idx in data) {
							
							if(data[idx].wNo == $(this).parent().siblings('.wNo').val()) {
								
					        	var $oneComment = $('<div>');
					        	var $wcNo = $('<input>');
					        	var $oneComment_left = $('<div>');
					        	var $profile = $('<div>');
					        	var $writer = $('<h3>');
					        	var $oneComment_right = $('<div>');
					        	var $content = $('<p>');
					        	var $deletewcBtn = $('<div>');
					        	var $updatewcBtn = $('<div>');
					        	var $updatewcCancelBtn = $('<div>');
					        	var $updatewcConfirmBtn = $('<div>');
					        	
					        	$oneComment.addClass('oneComment');
					        	$wcNo.addClass('wcNo');
					        	$wcNo.attr('type', 'hidden');
					        	$oneComment_left.addClass('oneComment_left');
					        	$profile.addClass('hAll profile');
					        	$oneComment_right.addClass('oneComment_right');
					        	$deletewcBtn.addClass('content-left-buttons defaultBtn deletewcBtn');
					        	$deletewcBtn.text('삭제');
					        	$updatewcBtn.addClass('content-left-buttons defaultBtn updatewcBtn');
					        	$updatewcBtn.text('수정');
					        	$updatewcCancelBtn.addClass('content-left-buttons defaultBtn updatewcCancelBtn');
					        	$updatewcCancelBtn.text('취소');
					        	$updatewcConfirmBtn.addClass('content-left-buttons defaultBtn updatewcConfirmBtn');
					        	$updatewcConfirmBtn.text('확인');
					        	
					        	$oneComment_left.append($profile);
					        	$oneComment_left.append($writer);
					        	$oneComment_right.append($content);
					        	$oneComment_right.append($deletewcBtn);
					        	$oneComment_right.append($updatewcBtn);
					        	$oneComment_right.append($updatewcCancelBtn);
					        	$oneComment_right.append($updatewcConfirmBtn);
					        	
					        	$oneComment.append($wcNo);
					        	$oneComment.append($oneComment_left);
					        	$oneComment.append($oneComment_right);
								
					        	$comment_content.append($oneComment);
					        	
								if(data[idx].profile == null) {
									$profile.attr("style", "content:url('/gt/resources/images/common/profile.png')");
								} else {
									$profile.attr("style", "content:url('')")
								}
								
								$wcNo.val(data[idx].wcNo);
								$writer.text(data[idx].wcWriter);
								$content.text(data[idx].wcContent);
								
							}
							
						}
						
					});
					
					addEventUpdatewcBtn();
					addEventUpdatewcConfirmBtn();
					addEventUpdatewcCancelBtn();
					addEventdeletewcBtn();
					
				}, error : function(data) {
					console.log(data);
					//console.log('앋뇌');
				} 
				
			});
			
			addEventUpdatewcBtn();
			addEventUpdatewcConfirmBtn();
			addEventUpdatewcCancelBtn();
			addEventdeletewcBtn();
			
		});
	
		$('#insertBtn').on('click', function() {
			
			location.href = '<%=request.getContextPath()%>/insertView.wo?loginNo=<%=loginNo%>'
					+'&loginName='+sessionStorage.getItem("loginName")+'&pNo='+<%=pNo%>;
					
		});
		
		$('.updateBtn').on('click', function() {
			
			var wNo = $(this).parent().siblings('.wNo').val();
			
			location.href = '<%=request.getContextPath()%>/updateView.wo?wNo='+wNo;
			
		});
		
		$('.deleteBtn').on('click', function() {
			
			if(confirm('정말 삭제하시겠습니까?')) {
			
				var wNo = $(this).parent().siblings('.wNo').val();
				
				var fName = $(this).siblings('.inputFile').children('a').text();
				console.log(fName);
				
				var $oneArticle = $(this).parent().parent();
				
				$.ajax({
					
					url : "/gt/delete.wo",
					data : {
						"wNo" : wNo,
						"fName" : fName
					},
					type : "POST",
					success : function(data) {
						
						if(data > 0) {
							$oneArticle.remove();
							alert('정상적으로 삭제되었습니다.');
						} else {
							alert('글 삭제에 실패했습니다.');
						}
						
					}, error : function(data) {
						console.log(data);
					}
					
				});
			
			} else {
				return
			}
			
		});
		
		$('.commentInsertBtn').on('click', function() {
			
			var wcWriter = sessionStorage.getItem('loginName');
			var wcContent = $(this).siblings('.wcContent').val();
			var wNo = $(this).parent().parent().siblings('.wNo').val();
			var eNo = sessionStorage.getItem('loginNo');
						
			$deletewcBtn = $('<div>');
			$deletewcBtn.addClass('content-left-buttons');
			$deletewcBtn.addClass('defaultBtn');
			$deletewcBtn.addClass('deletewcBtn');
			$deletewcBtn.text('삭제');
			
			$updatewcBtn = $('<div>');
			$updatewcBtn.addClass('content-left-buttons');
			$updatewcBtn.addClass('defaultBtn');
			$updatewcBtn.addClass('updatewcBtn');
			$updatewcBtn.text('수정');
			
			$updatewcCancelBtn = $('<div>');
			$updatewcCancelBtn.addClass('content-left-buttons');
			$updatewcCancelBtn.addClass('defaultBtn');
			$updatewcCancelBtn.addClass('updatewcCancelBtn');
			$updatewcCancelBtn.text('취소');
			
			$updatewcConfirmBtn = $('<div>');
			$updatewcConfirmBtn.addClass('content-left-buttons');
			$updatewcConfirmBtn.addClass('defaultBtn');
			$updatewcConfirmBtn.addClass('updatewcConfirmBtn');
			$updatewcConfirmBtn.text('확인');
			
			var $comment_content = $(this).parent().siblings('.comment_content');
			
			if(wcContent == '') {
				alert('댓글 내용을 작성해 주세요');
			}else {
				
				$.ajax({
					
					url : "/gt/insert.wc",
					data : {
						"wcWriter" : wcWriter,
						"wcContent" : wcContent,
						"wNo" : wNo,
						"eNo" : eNo
					},
					type : "POST",
					success : function(data) {

						var profile = '';
						
						if(data.profile == null) {
							profile = '/gt/resources/images/common/profile.png'; 
						} else {
							profile = data.profile;
						}
						
						// 코멘트를 넣을 노드들 생성
						var $oneComment = $('<div>');
						
						var $wcNo = $('<input>');
						var $oneComment_left = $('<div>');
						var $oneComment_right = $('<div>');
						
						var $profile = $('<div>');
						var $name = $('<h3>');
						var $content = $('<p>');
						<%-- <div class="hAll" id="profile" style="content:url(<%=wc.getProfile()%>);"></div> --%>
						// 속성 추가
						$oneComment.addClass('oneComment');
						
						$wcNo.attr('type', 'hidden');
						$wcNo.val(data.wcNo);
						$wcNo.addClass('wcNo');
						$oneComment_left.addClass('oneComment_left');
						$oneComment_right.addClass('oneComment_right');
						
						$profile.attr({
							"class" : "hAll",
							"id" : "profile",
							"style" : "content:url(" +profile+ ")"
						});
						$name.text(wcWriter);
						$content.text(wcContent);
						
						$oneComment_left.append($profile);
						$oneComment_left.append($name);
						$oneComment_right.append($content);
						$oneComment_right.append($deletewcBtn);
						$oneComment_right.append($updatewcBtn);
						$oneComment_right.append($updatewcCancelBtn);
						$oneComment_right.append($updatewcConfirmBtn);
						
						$oneComment.append($wcNo);
						$oneComment.append($oneComment_left);
						$oneComment.append($oneComment_right);
						
						$comment_content.append($oneComment);
						
						$comment_content.scrollTop($comment_content.prop('scrollHeight'));
						
						addEventUpdatewcBtn();
						addEventUpdatewcConfirmBtn();
						addEventUpdatewcCancelBtn();
						addEventdeletewcBtn();
						
					}, error : function(data) {
						console.log(data);
					}
					
				});
				
			}

			$(this).siblings('.wcContent').val('');
			
		});
		
		function addEventUpdatewcBtn(){
			
			$('.updatewcBtn').on('click', function() {
				
				var $textarea = $('<textarea>');
				
				$textarea.addClass('wcUpContent');
				
				$(this).parent('.oneComment_right').children('p').css('display', 'none');
				
				$(this).parent('.oneComment_right').prepend($textarea);

				$('.oneComment_right').children('.defaultBtn').css('display', 'none');
				
				$(this).parent('.oneComment_right').children('.updatewcCancelBtn').css('display', 'block');
				$(this).parent('.oneComment_right').children('.updatewcConfirmBtn').css('display', 'block');
				
			});
			
		};
		
		function addEventUpdatewcConfirmBtn() {
			
			$('.updatewcConfirmBtn').on('click', function() {
				
				var wcNo = $(this).parent().siblings('.wcNo').val();
				var wcUpContent = $(this).siblings('.wcUpContent').val();
				
				var $wcContent = $(this).siblings('p'); 
				var $wcUpContent = $(this).siblings('.wcUpContent');
				
				console.log(wcUpContent);
				
				if(wcUpContent == '') {
					alert('글을 입력해 주세요');
				} else {
				
					$.ajax({
						
						url : "/gt/update.wc",
						data : {
							"wcNo" : wcNo,
							"wcUpContent" : wcUpContent
						},
						type : "post",
						success : function(data) {
							
							$wcContent.text(data);
							
							$wcUpContent.css('display', 'none');
							$wcContent.css('display', 'block');
							
							$('.oneComment_right').children('.defaultBtn').css('display', 'block');
							
							$('.updatewcCancelBtn').css('display', 'none');
							$('.updatewcConfirmBtn').css('display', 'none');
							
						}, error : function(data) {
							console.log(data);
						}
						
					});
				
				}
				
			});
			
		};
		
		function addEventUpdatewcCancelBtn() {
			
			$('.updatewcCancelBtn').on('click', function() {
				
				$(this).siblings('.wcUpContent').remove();
				$(this).siblings('p').css('display', 'block');
				
				$('.oneComment_right').children('.defaultBtn').css('display', 'block');
				
				$('.updatewcCancelBtn').css('display', 'none');
				$('.updatewcConfirmBtn').css('display', 'none');
				
			});
			
		};
		
		function addEventdeletewcBtn() {
			
			$('.deletewcBtn').on('click', function() {
				
				if(confirm('정말 삭제하시겠습니까?')) {
				
					var wcNo = $(this).parent().siblings('.wcNo').val();
					var $oneComment = $(this).parent().parent();
					
					$.ajax({
						
						url : "/gt/delete.wc",
						data : {
							"wcNo" : wcNo
						},
						type : "post",
						success : function(data) {
							
							if(data > 0) {
								
								$oneComment.remove();
								
							} else {
								alert('댓글 삭제에 실패했습니다.');
							}
							
						}, error : function(data) {
							console.log(data);
						}
						
					});
				
				} else {
					return
				}
				
			});
			
		};
		
		$('#searchBtn').on('click', function () {

			var search = $('#search').val();
			var selected = $("select option:selected").val();
			console.log(selected);
			$('.oneArticle').hide();
			
			if(selected == '제목') {
				$(".title:contains(" + search + ")").parent().parent().show();
			} else if(selected == '내용') {
				$(".article:contains(" + search + ")").parent().parent().show();
			} else if(selected == '작성자') {
				$(".empName:contains(" + search + ")").parent().parent().show();
			}
			
		});
		
		$('.deleteBtn').on('click', function() {
			
			
		});
	
	</script>

</body>
</html>















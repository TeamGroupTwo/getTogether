<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    import="java.util.*, com.gt.gettogether.department.work.model.vo.*"%>
<%
	ArrayList<Work> workList = (ArrayList<Work>) request.getAttribute("workList");
	int pNo = (int) request.getAttribute("pNo");
	String pTitle = (String) request.getAttribute("pTitle");
	int loginNo = (int) request.getAttribute("eNo");
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
            min-height: 50px;
            border-bottom: 1px solid #5F4D8C;
            padding: 20px 20px;
        }
        .oneComment_left {
            width: 33%;
            float: left;
        }
        .oneComment_left img {
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
            <div class="right"><input type="text" size="15" placeholder="search..."></div>
        </div>

        <div id="content">
        
        	<% for(Work w : workList) { %>
	            <div class="oneArticle">
	            	<input type="hidden" value="<%=w.getwNo()%>" class="wNo" />
	                <div class="content_left">
	                    <h3>제목 : <%=w.getwTitle()%></h3>
	                    <img src="/gt/resources/images/common/adminProfile.png" width="40px" height="40px">
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
	                        <div class="oneComment">
	                            <div class="oneComment_left">
	                                <img src="/gt/resources/images/common/adminProfile.png" width="40px" height="40px">
	                                <h3>오홍근</h3>
	                            </div>
	                            <div class="oneComment_right">
	                                <p>가즈가즈아아아아아아가즈가즈아아아
	                                </p>
	                            </div>
	                        </div>
	                        <div class="oneComment"></div>
	                        <div class="oneComment"></div>
	                        <div class="oneComment"></div>
	                        <div class="oneComment"></div>
	                    </div>
	                    <div class="comment_bottom">
	                        <textarea cols="45" rows="7" id="wcContent"></textarea>
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
	
		$('#insertBtn').on('click', function() {
			
			location.href = '<%=request.getContextPath()%>/insertView.wo?loginNo=<%=loginNo%>'
					+'&loginName='+sessionStorage.getItem("loginName")+'&pNo='+<%=pNo%>;
					
		});
		
		$('.updateBtn').on('click', function() {
			
			var wNo = $(this).parent().siblings('.wNo').val();
			
			location.href = '<%=request.getContextPath()%>/updateView.wo?wNo='+wNo;
			
		});
		
		$('.deleteBtn').on('click', function() {
			
			var wNo = $(this).parent().siblings('.wNo').val();
			
			var $oneArticle = $(this).parent().parent();
			
			$.ajax({
				
				url : "/gt/delete.wo",
				data : {
					"wNo" : wNo
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
			
		});
		
		$('.commentInsertBtn').on('click', function() {
			
			var wcWriter = sessionStorage.getItem('loginName');
			var wcContent = $('#wcContent').val();
			var wNo = $(this).parent().parent().siblings('.wNo').val();
			var eNo = sessionStorage.getItem('loginNo');
			
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
						
						
						
					}, error : function(data) {
						console.log(data);
					}
					
				});
				
			}
			
		});
	
	</script>

</body>
</html>















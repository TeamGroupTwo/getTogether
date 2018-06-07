<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String loginName = (String) request.getAttribute("loginName");
	int pNo = (int) request.getAttribute("pNo");
	int loginNo = (int) request.getAttribute("loginNo");
	String pTitle = (String) request.getAttribute("pTitle");
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

        /* 프로젝트 게시판을 담을 div */
        #content {
            width: 60%;
            margin: 0 auto;
            margin-top: 20px;
            height: 430px;
            /* text-align: center; */
            border: 2px solid #5F4D8C;
            padding: 40px 40px 20px 40px;
        }
        #content h3 {
            margin: 0;
            display: inline;
        }
        #wTitle {
            font-size: 1.2em;
            outline: none;
            border: 1px solid #5F4D8C;
        }
        #fileInput {
            display: none;
        }
        #fileInputBtn {
            display: inline-block;
            background-color: #404040;
            color: white;
            width: 70px;
            height: 15px;
            padding: 10px 10px;
            text-align: center;
            line-height: 15px;
            border-radius: 5px;
            opacity: .9;
        }
        #fileInputBtn:hover {
            cursor: pointer;
            opacity: 1;
        }
        #fileName {
            height: 23px;
            /* background-color: #eeeeee; */
        }
        #wContent {
            width: 90%;
            height: 280px;
            border: 1px solid #5F4D8C;
            resize: none;
            display: block;
            margin: 0 auto;
            font-size: 1.3em;
            outline: none;
        }

        #buttonsBox {
            margin: 0 auto;
            width: 150px;
            margin-top: 20px;
        }
        .buttons {
            display: inline-block;
            color: white;
            width: 60px;
            height: 30px;
            border-radius: 5px;
            text-align: center;
            line-height: 30px;
            opacity: .9;
        }
        .buttons:hover {
            cursor: pointer;
            opacity: 1;
        }
        #confirmBtn {
            background-color: #5F4D8C;
        }
        #cancelBtn {
            background-color: #404040;
            margin-left: 20px;
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
        </div>

        <form action="/gt/insert.wo" method="post" enctype="multipart/form-data">
        
        	<input type="hidden" value="<%=pTitle%>" name="pTitle" />
			<input type="hidden" value="<%=loginName%>" name="wWriter" />
			<input type="hidden" value="<%=pNo%>" name="pNo" />
        	<input type="hidden" value="<%=loginNo%>" name="eNo" />
        
            <div id="content">
                <h3>제목 : </h3><input type="text" size="30" id="wTitle" name="wTitle"><br><br>
                <h3>첨부파일 : </h3>
                <label for="fileInput"><div id="fileInputBtn">첨부파일</div></label>
                <input type="file" id="fileInput" name="fileInput">
                <input type="text" readonly size="15" id="fileName" name="fileName">
                <br><br>
                <h3>내용</h3><br><br>
                <textarea id="wContent" name="wContent"></textarea>
            </div>
            <div id="buttonsBox">
                <div class="buttons" id="confirmBtn" onclick="send();">확인</div>
                <div class="buttons" id="cancelBtn">취소</div>
            </div>
        </form>
    </div>

    <script>
        $(document).ready(function() {

            var fileInput = $('#fileInput');

            fileInput.on('change', function() { // 값이 변경되면

                if(window.FileReader) { // modern browser
                    var filename = $(this)[0].files[0].name;
                } else { // old IE
                    var filename = $(this).val().split('/').pop().split('\\').pop(); // 파일명만 추출
                }
                // 추출한 파일명 삽입
                $(this).siblings('#fileName').val(filename);
            });
            
            var pTitle = $('#top').children('h2').text();
            var $input = $('<input>');
            
            $input.attr({
            	'type' : 'hidden',
            	'value' : pTitle,
            	'name' : pTitle
            });
            
            $('form').prepend($input);
            
        });
        
        function send() {
        	
        	// var titleChk = true;
        	// var contentChk = true;
        	
        	if($('#wTitle').val() == '') {
        		alert('제목을 입력하세요');
        		// titleChk = false;
        	} else if($('#wContent').val() == '') {
        		alert('내용을 입력하세요');
        		// contentChk = false;
        	} else {
        		$('form').submit();	
        	}
			
		};
		
		$('#cancelBtn').on('click', function() {
			
			location.href = '<%=request.getContextPath()%>/selectList.wo?pNo=<%=pNo%>'
					+'&eNo=<%=loginNo%>&pTitle=<%=pTitle%>';
			
		});
        
    </script>

</body>
</html>
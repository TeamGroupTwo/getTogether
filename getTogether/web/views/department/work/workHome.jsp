<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    import="java.util.*, com.gt.gettogether.department.work.model.vo.*"%>
<%
	ArrayList<Project> pjList = (ArrayList<Project>)request.getAttribute("pjList");
%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <!-- <meta name="viewport" content="width=device-width, initial-scale=1.0"> -->
    <title>부서게시판</title>

    <script src="/gt/resources/js/jquery-3.3.1.min.js"></script>

    <script src="/gt/resources/js/jquery.modal.min.js"></script>
    <link rel="stylesheet" href="/gt/resources/css/department/jquery.modal.min.css">

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
            margin: 0 auto;
            height: 75px;
            padding-top: 30px;
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
        }
        #searchBtn:hover {
            cursor: pointer;
            opacity: 1;
        }
        #searchBtn img {
            width: 100%;
            height: 100%;
        }
        .right-buttons {
            float: right;
            color: white;
            border-radius: 5px;
            width: 60px;
            height: 35px;
            line-height: 35px;
            text-align: center;
        }
        .right-buttons:hover {
            cursor: pointer;
        }
        #deleteBtn, #updateCancelBtn, #deleteCancelBtn {
            background-color: #404040;
            border: 1px solid #404040;
            margin-left: 10px;

            transition-duration: 0.4s;
            -webkit-transition-duration: 0.4s;
        }
        #deleteBtn:hover, #updateCancelBtn:hover, #deleteCancelBtn:hover {
            background-color: white;
            color: black;
        }
        #updateBtn, #updateConfirmBtn, #deleteConfirmBtn {
            background-color: #346DF0;
            border: 1px solid #346DF0;
            margin-left: 10px;

            transition-duration: 0.4s;
            -webkit-transition-duration: 0.4s;
        }
        #updateBtn:hover, #updateConfirmBtn:hover, #deleteConfirmBtn:hover {
            background-color: white;
            color: black;
        }
        #insertBtn {
            background-color: #5F4D8C;
            border: 1px solid #5F4D8C;

            transition-duration: 0.4s;
            -webkit-transition-duration: 0.4s;
        }
        #insertBtn:hover {
            background-color: white;
            color: black;
        }
        #insertBtn a, #updateConfirmBtn a, #deleteConfirmBtn a {
            text-decoration: inherit;
            color: inherit;
            display: block;
        }
        #updateConfirmBtn a {
        	/* pointer-events: none; */
        }

        /* 프로젝트 게시판을 담을 div */
        #content {
            width: 90%;
            margin: 0 auto;
            margin-top: 40px;
            height: 555px;
            /* text-align: center; */
            padding: 0 5%;
            overflow-y: scroll;
            overflow-x: hidden;
        }

        /* 모달창 스타일 */
        #insertModal, #updateModal {
            text-align: center;
        }
        #insertModal h2, #updateModal h2 {
            text-align: center;
            color: #614F8D;
        }
        #insertModal input, #updateModal input {
            border: none;
            border-bottom: 3px solid black;
            font-size: 1.0em;
            font-weight: 500;
            padding: 2px 0;
        }
        #insertModal div, #updateModal div {
            display: inline-block;
            color: white;
            width: 60px;
            height: 30px;
            line-height: 30px;
            border-radius: 5px;
            opacity: .9;
        }
        #confirmBtn, #upModalConfirmBtn {
            background-color: #5F4D8C;
        }
        #cancelBtn, #upModalCancelBtn {
            background-color: #404040;
            margin-left: 20px;
        }
        #insertModal div a, #updateModal div a {
            color: inherit;
            text-decoration: inherit;
            display: block;
        }
        #insertModal div:hover, #updateModal div:hover {
            cursor: pointer;
            opacity: 1.0;
        }
        .project {
            width: 150px;
            height: 170px;
            display: inline-block;
            margin: 25px 35px;
            text-align: center;
            opacity: .9;
        }
        .project:hover {
            opacity: 1;
            /* cursor: pointer; */
            background-color: #dddddd;
        }
        .project input {
        	display: block;
           	width: 20px;
          	height : 20px;
        }
        .project img {
            width: 100px;
        }
        .project h3 {
            height: 55px;
            margin-top: 10px;
            text-align: center;
            white-space: nowrap;
            overflow: hidden;
            text-overflow: ellipsis;

            white-space: normal;
            line-height: 1.2;
            height: 2.4em;
            text-align: left;
            word-wrap: break-word;
            display: -webkit-box;
            -webkit-line-clamp: 2;
            -webkit-box-orient: vertical;
        }

    </style>
</head>

<body>

<%@ include file="../../common/header.jsp" %>
<%@ include file="../../common/aside.jsp" %>

    <div id="insertModal" class="modal">
        <h2>프로젝트 생성</h2><br>
        <b>프로젝트명 : </b><input type="text" id="pTitle" name="pTitle">
        <br><br><br>
        <div id="confirmBtn"><a href="#close-modal" rel="modal:close">확인</a></div>
        <div id="cancelBtn"><a href="#" rel="modal:close">취소</a></div>
    </div>
    
	<div id="updateModal" class="modal">
        <h2>프로젝트 수정</h2><br>
        <b>프로젝트명 : </b><input type="text" id="upTitle" name="upTitle">
        <br><br><br>
        <div id="upModalConfirmBtn"><a href="#close-modal" rel="modal:close">확인</a></div>
        <div id="upModalCancelBtn"><a href="#" rel="modal:close">취소</a></div>
    </div>
    
    <div id="container">
        <div id="top">
            <input type="text" size="15" placeholder="search...">
            <div id="searchBtn"><img src="/gt/resources/images/work/board/search_icon.png"></div>
            <div class="right-buttons defaultBtn" id="deleteBtn">삭제</div>
            <div class="right-buttons defaultBtn" id="updateBtn">수정</div>
            <div class="right-buttons defaultBtn" id="insertBtn">
                <a href="#insertModal" rel="modal:open">생성</a>
            </div>
            
			<div class="right-buttons updateBtn" id="updateCancelBtn" style="display: none">취소</div>
			<div class="right-buttons updateBtn" id="updateConfirmBtn" style="display: none">
				<a href="#updateModal" rel="modal:open">확인</a>
			</div>
			
			<div class="right-buttons deleteBtn" id="deleteCancelBtn" style="display: none">취소</div>
			<div class="right-buttons deleteBtn" id="deleteConfirmBtn" style="display: none">
				<a>확인</a>
			</div>
        </div>
        <div id="content">
        
        	<% for(Project p : pjList) { %>
            <div class="project">
            	<input type="hidden" name="pNo" value="<%=p.getpNo()%>" id="pNo" />
            	<img src="/gt/resources/images/work/board/project_icon.png" />
            	<h3><%=p.getpTitle()%></h3>
            </div>
            <% } %>
            
        </div>
    </div>

    <script>
    
    	upBtnChk = false;
    	delBtnChk = false;

        $('#insertBtn').on('click', function() {
            $('#pTitle').val('');
        });

        $('#confirmBtn').on('click', function() {

            var pTitle = $('#pTitle').val();
			var nameChk1 = true;
			var nameChk2 = true;
            
            if(pTitle == '') {
            	$(this).children('a').prop('disabled', true);
                alert('이름을 입력하세요');
                nameChk1 = false;
            }
            
            $('.project').each(function() {
            	
            	if(pTitle == $(this).children('h3').text()) {
            		nameChk2 = false;
            	}

			});
            
            if(!nameChk2) {
            	$(this).children('a').prop('disabled', true);
            	alert('이미 존재하는 프로젝트명 입니다.');
            }
            	
            if(nameChk1 && nameChk2) {
            	
            	$(this).children('a').prop('disabled', false);
            	
            	$.ajax({
            		
            		url : "/gt/insert.pj",
            		data : {
            			"pTitle" : pTitle,
            			"dCode" : "D1"
            			},
            		type : "get",
            		success : function(data) {
            			
        				var $newProject = $('<div>');
        				var $pNo = $('<input>');
        				var $pjImage = $('<img>');
                        var $pTitle = $('<h3>');

                        $newProject.attr('class', 'project');
                        $pNo.attr({
                        	'type' : 'hidden',
                        	'name' : 'pNo',
                        	'value' : data
                        });
                        $pjImage.attr('src', '/gt/resources/images/work/board/project_icon.png');
                        $pTitle.text(pTitle);

                        $newProject.append($pNo);
                        $newProject.append($pjImage);
                        $newProject.append($pTitle);

                        $('#content').prepend($newProject);
        				
        				alert(pTitle+" 프로젝트를 생성했습니다.");
        				
        				location.reload();

					}, error : function(data) {
						consolse.log(data);
					}
            		
            	});

            }

        });

		$('#updateBtn').on('click', function() {
			
			upBtnChk = true;
			
			$('.project').each(function() {
				$(this).css('cursor', 'pointer');
			});
			
			$('.defaultBtn').css('display', 'none');
			$('.updateBtn').css('display', 'block');
			
			$('.project').each(function() {
				
            	var $pjCheck = $('<input>');
                $pjCheck.attr({
                	'type' : 'checkbox',
                	'value' : 'checkedProject',
                	'name' : 'updateProject'
                });
                $pjCheck.addClass('updateChkbox');
                $(this).prepend($pjCheck);            	
				
			});
			
		});
		
		$('.project').on('click', function() {
			
			console.log($(this).children('h3').text());
			
			if($(this).children('.updateChkbox').prop('checked')) {
				
				$(this).children('.updateChkbox').prop('checked', false);
				
			} else {
				
				$('.project').children('.updateChkbox').each(function() {
					$(this).prop('checked', false);
				});
				
				$(this).children('.updateChkbox').prop('checked', true);
				
			}
			
			
			if($(this).children('.deleteChkbox').prop('checked')) {
				
				$(this).children('.deleteChkbox').prop('checked', false);
				
			} else {
				$(this).children('.deleteChkbox').prop('checked', true);
			}
			
		});
		
		$('#updateConfirmBtn').on('click', function() {
			
			var pjCheck = false;
			
			$('.updateChkbox').each(function() {
				
				if($(this).prop('checked')) {
					pjCheck = true;
				}
				
			});
			
			if(pjCheck) {
				$(this).children('a').prop('disabled', false);
			} else {
				$(this).children('a').prop('disabled', true);
				alert('수정할 프로젝트를 선택해 주세요');
			}
			
		});
		
		$('#updateCancelBtn').on('click', function() {
			
			$('.defaultBtn').css('display', 'block');
			$('.updateBtn').css('display', 'none');
			
			$('.project').each(function() {
				
                $('.updateChkbox').remove();            	
				
			});
			
			$('.project').each(function() {
				$(this).css('cursor', 'default');
			});
			
			upBtnChk = false;
			
		});
		
        $('#upModalConfirmBtn').on('click', function() {

        	var $pjDiv;
        	var pTitle;
        	
			$('.updateChkbox').each(function() {
				
				if($(this).prop('checked')) {
					$pjDiv = $(this).parent();
					pNo = $(this).siblings('#pNo').val();
				}
				
			});
        	
            var upTitle = $('#upTitle').val();
			var nameChk1 = true;
			var nameChk2 = true;
            
            if(upTitle == '') {
            	$(this).children('a').prop('disabled', true);
                alert('이름을 입력하세요');
                nameChk1 = false;
            }
            
            $('.project').each(function() {
            	
            	if(upTitle == $(this).children('h3').text()) {
            		nameChk2 = false;
            	}

			});
            
            if(!nameChk2) {
            	$(this).children('a').prop('disabled', true);
            	alert('이미 존재하는 프로젝트명 입니다.');
            }
            	
            if(nameChk1 && nameChk2) {
            	
            	$(this).children('a').prop('disabled', false);
            	
            	$.ajax({
            		
            		url : "/gt/update.pj",
            		data : {
            			"pNo" : pNo,
            			"upTitle" : upTitle
            			},
            		type : "post",
            		success : function(data) {
            				
        				$pjDiv.children('h3').text(upTitle);
        				
        				alert(pTitle+" 프로젝트를 "+upTitle+"로 수정했습니다.");

					}, error : function(data) {
						consolse.log(data);
					}
            		
            	});

            }

        });
        
		$('#deleteBtn').on('click', function() {
			
			delBtnChk = true;
			
			$('.project').each(function() {
				$(this).css('cursor', 'pointer');
			});
			
			$('.defaultBtn').css('display', 'none');
			$('.deleteBtn').css('display', 'block');
			
			$('.project').each(function() {
				
            	var $pjCheck = $('<input>');
                $pjCheck.attr({
                	'type' : 'checkbox',
                	'value' : $(this).children('h3').text(),
                	'name' : 'deleteProject'
                });
                $pjCheck.addClass('deleteChkbox');
                $(this).prepend($pjCheck);            	
				
			});
			
		});
		
		$('#deleteConfirmBtn').on('click', function() {
			
			var pjCheck = false;
			var jsonArr = new Array();
			var index = 0;
			
			$('.deleteChkbox').each(function() {
				
				if($(this).prop('checked')) {
					var jsonObj = new Object();
					pjCheck = true;
					
					jsonArr.push($(this).siblings('input').val());
				}
				
			});
			
			chkList = JSON.stringify(jsonArr);
			
			if(pjCheck) {
				
				$.ajax({
					
            		url : "/gt/delete.pj",
            		data : {
            			"chkList" : chkList
            			},
            		type : "get",
            		success : function(data) {
            				
            			$('.project').each(function() {
							if($(this).children('input').prop('checked')) {
								$(this).remove();
							}
						});
        				
        				alert("프로젝트를 삭제했습니다.");

					}, error : function(data) {
						console.log(data);
					}
					
				});
				
			} else {
				alert('수정할 프로젝트를 선택해 주세요');
			}
			
		});
		
		$('#deleteCancelBtn').on('click', function() {
			
			$('.defaultBtn').css('display', 'block');
			$('.deleteBtn').css('display', 'none');
			
			$('.project').each(function() {
				
                $('.deleteChkbox').remove();            	
				
			});
			
			$('.project').each(function() {
				$(this).css('cursor', 'default');
			});
			
			delBtnChk = false;
			
		});
		
		$('.project').on('dblclick', function pjDbl() {
			
			var pNo = $(this).children('#pNo').val();
			var pTitle = $(this).children('h3').text();
			var eNo = sessionStorage.getItem("loginNo");
			
			if(!upBtnChk && !delBtnChk) {
				location.href = '<%=request.getContextPath()%>/selectList.wo?pNo='+pNo+'&pTitle='+pTitle+'&eNo='+eNo;
			}
			
		})

    </script>

</body>
</html>















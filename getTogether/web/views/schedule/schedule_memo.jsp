<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>일정관리</title>
<script src="/gt/resources/js/jquery-3.3.1.min.js"></script>
<link href="https://fonts.googleapis.com/css?family=Nanum+Gothic" rel="stylesheet">
<link rel="stylesheet" type="text/css" href="../../resources/css/schedule/schedule.css" />
<style>
        body{
			background : #dad5e6;
		}
		#myName{
			font-family : 'Nanum Gothic', sans-serif;
        	font-size : 30px;
        	position: relative;
        	left : 38%;
        }
        #memo_title{
        text-align : left;
        }
        #memo_day{
        position: absolute;
        top : -30px;
        width : 450px;
        color:white;
		background: #5f4d8c;
		font-size:25px;
        }
        #updateBtn {
		 	color : #ffffff;
        	font-size : 18px;
        	width : 60px;
        	-moz-border-radius:10px;
	        -webkit-border-radius:10px;
	        border-radius:10px;
            background-color: #5F4D8C;
            border: 1px solid #5F4D8C;
            transition-duration: 0.4s;
            -webkit-transition-duration: 0.4s;
			position: relative;
			top : 450px;
			left : 145px;
        }
        #updateBtn:hover {
        	cursor : pointer;
            background-color: white;
            color: black;
        }
    </style>
</head>
<body>
<%@ include file = "/views/common/aside.jsp" %>
<%@ include file = "/views/common/header.jsp" %>
		<section style="width : 1530px; height : 80%; background : white; position: absolute; margin-top:  130px; margin-left: 300px;">
		<input type="hidden" id="daydata"/>
		<label style = "font-family : monospace; font-size : 40px;" id ="myName"></label>	
		<div style="margin-left: 100px; position : absolute;">
		<%@ include file = "schedule_calendar.jsp" %>
		</div>
		<div style="margin-left: 800px; position : absolute;">
			<form style="width : 450px; ">
			<div id="memo_day"></div>
            <fieldset style="height : 500px;" class="memo_list">
            <input class = "memoBtn" id = "insertBtn" value="추가">
        	<input class = "memoBtn" id = "deleteBtn" style= "display : none;" value="삭제">
        	<input class = "memoBtn" id = "checkBtn" style= "display : none;" value="완료">
        	<input class = "memoBtn" id="updateBtn" style= "display : none;" value="수정">
        	<input class = "memoBtn" id = "okBtn" style = "display : none;" value="확인">
        	<input class = "memoBtn" id = 'resetBtn' style = "display : none;" value="취소">
        	<div id = "memo_title"></div>
        	<div id= "memo_body">
        	<input type="hidden" id="sNo"/>
        	<label id = "mbtitle" style="display: none">일정 : 
        	<input id = "sTitle" type="text" style = "width : 300px; height : 30px;" />
        	</label><br>
        	<label id = "mblabel" style="position : absolute; display: none">라벨 <%@ include file="color.jsp" %></label>
        	<label id = "mtime" style="left : 50%; position : absolute; display: none">시간 : 
        	<input id = "sTime" type="time"/>
        	</label><br><br><br>
        	<label id = "mbcontent" style="display: none">내용 <br>
        	<textarea id = "sContent" style="width : 400px; height : 200px; resize : none;"/></textarea>
        	</label>
        	</div>
            </fieldset>
            
        </form>
		</div>
		</section>
		<script>
	 		 
		$(function () {

			var date = new Date();
			var year = date.getFullYear();
			var day = date.getDate();
			var month =  date.getMonth()+1;
			
			if(day < 10){
				day = "0"+day;
			}
			if(month < 10){
				month = "0"+month;
			}
			$("#memo_day").html(year + "년 " + month + "월 " +day+"일 메모 리스트");
			$("#myName").html($('#empName').text() +"님의 일정");
			$('#daydata').attr('value',year+month+day);
			$.ajax({
				url : "<%= request.getContextPath()%>/schedule_li.do",
				data : {
					empNo : $("#empNo").text(),
				},
				type : "GET",
				success : function(data){
					
					var $memo_title = $('#memo_title');
					
					if(data.length <= 0){
						var $label = $("<label>");
						$label.text("저장된 메모가 없습니다");
						$label.css('font-size' , '35px');
						$memo_title.append($label);
					} else {
						for(var i in data){
							var $body = $("<div>");
							var $div = $("<div>");
							var $label = $("<label>");
							var $select = $("<input>");
							$select.attr('type','checkbox');
							$select.attr('value',data[i].sNo);
							$label.css("color" , data[i].sColor);
							$label.text("●");
							$div.attr('class','contentview');
							$div.css('display','inline-block');
							$div.css('cursor','pointer');
							$div.css('font-size','24px');
							$div.text(data[i].sTitle);
							$div.append($select);
							$body.append($label ,"&nbsp;", $div ,"<br>");
							$memo_title.append($body);
						}
						$('.contentview').children('input').css('display','none');
						$('#deleteBtn').css('display', 'inline');
						updateview();
					}
				}, error : function(data){
					console.log("실패인가..");
				}
			});
		});
  		 	 function days(day){
  		 		$('#insertBtn').css('display','inline');
  		 		$("#memo_title").children().remove();
  		 		$("#memo_title").text('');
  		 		$('#memo_body').children().css('display','none');
  		 		
  		 		var years = $('#yearSelect').val();
  			 	var month = $('#monthSelect').val();
				if(day < 10){
					day = "0"+day;
				}
				if(month < 10){
					month = "0"+month;
				}
  			 		var daydate = years+month+day;
  			 		$("#memo_day").html(years+"년 "+month+"월 "+day+"일 메모 리스트");
  	  		 		$('#daydata').attr('value',daydate);

  		 		$.ajax({
  		 			url : "<%= request.getContextPath()%>/schedule_dayli.do",
  		 			data : {
  		 				empNo : $("#empNo").text(),
  		 				daydate : daydate
  		 				},
  		 			type : "GET",
  		 			success : function(data) {
  		 				var $memo_title = $('#memo_title');
  						
  						if(data.length <= 0){
  							var $label = $("<label>");
  							$label.text("저장된 메모가 없습니다");
  							$memo_title.append($label);
  							$label.css('font-size' , '35px');
  							$('#deleteBtn').css('display', 'none');
  						} else {
  							for(var i in data){
  								var $body = $("<div>");
  								var $div = $("<div>");
  								var $label = $("<label>");
  								var $select = $("<input>");
  								$select.attr('type','checkbox');
  								$select.attr('value',data[i].sNo);
  								$label.css("color" , data[i].sColor);
  								$label.text("●");
  								$div.attr('class','contentview');
  								$div.css('display','inline-block');
  								$div.css('cursor','pointer');
  								$div.css('font-size','24px');
  								$div.text(data[i].sTitle);
  								$div.append($select);
  								$body.append($label ,"&nbsp;", $div ,"<br>");
  								$memo_title.append($body);
  							}
  							$('.contentview').children().css('display','none');
  							$('#deleteBtn').css('display', 'inline');
  							updateview();
  						}
  		 			}, error : function(data) {
  		 				console.log("에러ㅇ,ㅡㅇ");
  		 			}
  		 		});
		   	 }
  		 	
  		 	 $('#insertBtn').on('click', function() {

				$('.memoBtn').css('display', 'none');
				$('#memo_body').children().css('display','inline');
				$('#memo_body').children().children().val('');
				$('#okBtn').css('display','inline');
				$('#resetBtn').css('display','inline');
				$("#memo_title").css("display","none");
				
			});
			
  		 	$("#okBtn").on("click",function(){
  		 		$('#memo_title').children().remove();
  		 		$("#memo_title").text('');
  		 		if ($("#sTitle").val() == ''){
  		 			alert("제목을 입력해 주세요.");
  		 		} else if ($("#colorcode").val() == ''){
  		 			alert("색깔을 골라주세요");
  		 		} else {
  				$.ajax({
  					url : "<%= request.getContextPath()%>/schedule_in.do",
  					data : {
  						empNo : $("#empNo").text(),
  						sTitle : $("#sTitle").val(),
  						sContent : $("#sContent").val(),
  						sTime : $('#sTime').val(),
  						sColor : $("#colorcode").val(),
  						sDate : $("#daydata").val()
  						},
  					type : "GET",
  					success : function(data){
  						$('#memo_body').children().css('display','none');
						$('.memoPlus').css('display','none');
						$('.memoBtn').css('display','inline');
						$('#updateBtn').css('display','none');
						$('#okBtn').css('display','none');
						$('#checkBtn').css('display','none');
						$('#resetBtn').css('display','none');
						$('#memo_title').css("display","block");
						
  						$.ajax({
  							url : "<%= request.getContextPath()%>/schedule_dayli.do",
  							data : {
  								empNo : $("#empNo").text(),
  								daydate : $("#daydata").val()
  							},
  							type : "GET",
  							success : function(data){
  								console.log("당연대지");
  								
  								var $memo_title = $('#memo_title');
  								
  								for(var i in data){
  									var $body = $("<div>");
  									var $div = $("<div>");
  									var $label = $("<label>");
  									var $select = $("<input>");
  									$select.attr('type','checkbox');
  									$select.attr('value',data[i].sNo);
  									$label.css("color" , data[i].sColor);
  									$label.text("●");
  									$div.attr('class','contentview');
  									$div.css('display','inline-block');
  									$div.css('cursor','pointer');
  									$div.css('font-size','24px');
  									$div.text(data[i].sTitle);
  									$div.append($select);
  									$body.append($label ,"&nbsp;", $div ,"<br>");
  									$memo_title.append($body);
  								}
  									$('.contentview').children('input').css('display','none');
  	  								$('#deleteBtn').css('display', 'inline');
  	  								updateview();
  							}, error : function(data){
  								console.log("실패");
  							}
  						});
  					}, error : function(data){
  						console.log("실팽");
  					}
  				});
  		 		}
  		 		dayselect();
  			});
  		 	
  		 	$('#resetBtn').on('click',function(){
  		 		$('#memo_title').children().remove();
  		 		$("#memo_title").text('');
  		 		$('.memoBtn').css('display', 'inline');
				$('#memo_body').children().css('display','none');
				$('#memo_body').children().children().val('');
				$('#updateBtn').css('display','none');
				$('#okBtn').css('display','none');
				$('#checkBtn').css('display','none');
				$('#resetBtn').css('display','none');
				$("#memo_title").css("display","block");
				
  		 		var daydate = $('#daydata').val();
  		 		$.ajax({
  		 			url : "<%= request.getContextPath()%>/schedule_dayli.do",
  		 			data : {
  		 				empNo : $("#empNo").text(),
  		 				daydate : daydate
  		 				},
  		 			type : "GET",
  		 			success : function(data) {
  		 				var $memo_title = $('#memo_title');
  						
  						if(data.length <= 0){
  							var $label = $("<label>");
  							$label.text("저장된 메모가 없습니다");
  							$label.css('font-size' , '35px');
  							$memo_title.append($label);
  							$('#deleteBtn').css('display', 'none');
  						} else {
  							for(var i in data){
  								var $body = $("<div>");
  								var $div = $("<div>");
  								var $label = $("<label>");
  								var $select = $("<input>");
  								$select.attr('type','checkbox');
  								$select.attr('value',data[i].sNo);
  								$label.css("color" , data[i].sColor);
  								$label.text("●");
  								$div.attr('class','contentview');
  								$div.css('display','inline-block');
  								$div.css('cursor','pointer');
  								$div.css('font-size','24px');
  								$div.text(data[i].sTitle);
  								$div.append($select);
  								$body.append($label ,"&nbsp;", $div ,"<br>");
  								$memo_title.append($body);
  							}
  							$('.contentview').children().css('display','none');
  							$('#deleteBtn').css('display', 'inline');
  							updateview();
  						}
  		 			}, error : function(data) {
  		 				console.log("에러ㅇ,ㅡㅇ");
  		 			}
  		 		});
  		 	});
  		 	$("#deleteBtn").on('click',function(){
  		 		$('#insertBtn').css('display','none');
  		 		$("#checkBtn").css('display','inline');
  		 		$('#memo_title').children().children().children('input').css("display","inline");
  		 		$('#memo_title').children().children('div').css("cursor" , "auto");
  		 		$('#memo_title').children().children('div').children('input').each(function() {
  		 			$(this).on('click',function(e){
  		 				e.stopPropagation();
  		 			});
  		 		if($(this).prop('checked')){
  		 			var sNo = $(this).val();
  		 			var $div = $(this).parent().parent();

  		 			$.ajax({
  		 				url : "<%= request.getContextPath()%>/schedule_de.do?sNo="+sNo,
  		 				data : {sNo : sNo},
  		 				type : "GET",
  		 				success : function(data){
  		 					$div.remove();
  		 				},error : function(data){
  		 					console.log("안댄다.");
  		 				}
  		 		});
  		 		}
  		 		});
  		 	});
  		 	$('#checkBtn').on('click',function(){
				$('#insertBtn').css('display','inline');
				$('#checkBtn').css('display','none');
				$('#memo_title').children().children('div').css("cursor" , "pointer");
				$('#memo_title').children().children('div').children('input').each(function() {
					$(this).prop('checked' , false);
					$(this).css("display","none");
				});
				
				var $memo_title = $("#memo_title");
				if($('#memo_title').children().length <= 0){
					var $label = $("<label>");
					$label.text("저장된 메모가 없습니다");
					$label.css('font-size' , '35px');
					$memo_title.append($label);
					$('#deleteBtn').css('display', 'none');
				}
				dayselect();
			});
  		 	function updateview(){
  		 		$('#memo_title').children().children('.contentview').each(function(e){
  		 			var sNo = $(this).children('input').val();
  		 			
  	  		 		$(this).on('click',function(){
  	  		 			console.log($(this));
  	  	  		 		$.ajax({
  	  	  		 			url : "<%= request.getContextPath()%>/schedule_upview.do",
  	  	  		 			data : {
  	  	  		 				sTitle : $(this).text(),
  	  	  		 				sNo : sNo
  	  	  		 			},
  	  	  		 			type : "GET",
  	  	  		 			success : function(data){
  	  	  		 				console.log("됫네");
  	  	  		 				$("#sNo").val(sNo);
  	  	  		 				$('#memo_title').children().remove();
  	  	  		 				$('#memo_body').children().css('display','inline');
  	  							$('.memoBtn').css('display', 'none');
  	  							$('#updateBtn').css('display','inline');
  	  							$('#resetBtn').css('display','inline');
  	  							
  	  							for(var i in data){
  	  							$("#sTitle").val(data[i].sTitle);
  	  							$("#sTime").val(data[i].sTime);
  	  							$("#sContent").val(data[i].sContent);
  	  							}
  	  							
  	  	  		 			},error : function(data){
  	  	  		 				console.log("안됫네");
  	  	  		 			}
  	  	  		 		});
  	  	  		 	});
  	  		 	});
  		 	}
  		 	$("#updateBtn").on('click',function(){
  		 		$("#memo_title").text('');
  		 		if ($("#sTitle").val() == ''){
  		 			alert("제목을 입력해 주세요.");
  		 		} else if ($("#colorcode").val() == ''){
  		 			alert("색깔을 골라주세요");
  		 		} else {
  		 		$.ajax({
  		 			url : "<%= request.getContextPath()%>/schedule_up.do",
  		 			data : {
  		 				sNo : $("#sNo").val(),
  						sTitle : $("#sTitle").val(),
  						sContent : $("#sContent").val(),
  						sTime : $('#sTime').val(),
  						sColor : $("#colorcode").val(),
  						sDate : $("#daydata").val()
  		 			},
  		 			type : "GET",
  		 			success : function(data){
  		 				$('#updateBtn').css('display','none');
  		 				console.log("됨");
  		 				
  		 				for(var i in data){
							var $body = $("<div>");
							var $div = $("<div>");
							var $label = $("<label>");
							var $select = $("<input>");
							$select.attr('type','checkbox');
							$select.attr('value',data[i].sNo);
							$label.css("color" , data[i].sColor);
							$label.text("●");
							$div.attr('class','contentview');
							$div.css('display','inline-block');
							$div.css('cursor','pointer');
							$div.css('font-size','24px');
							$div.text(data[i].sTitle);
							$div.append($select);
							$body.append($label ,"&nbsp;", $div ,"<br>");
							$memo_title.append($body);
						}
							$('.contentview').children().css('display','none');
							$('#memo_body').children().css('display','none');
							$("#insertBtn").css('display', 'inline');
							$('#deleteBtn').css('display', 'inline');
							$('#resetBtn').css('display', 'none');
							
							$.ajax({
	  							url : "<%= request.getContextPath()%>/schedule_dayli.do",
	  							data : {
	  								empNo : $("#empNo").text(),
	  								daydate : $("#daydata").val()
	  							},
	  							type : "GET",
	  							success : function(data){
	  								console.log("당연대지");
	  								
	  								var $memo_title = $('#memo_title');
	  								
	  								for(var i in data){
	  									var $body = $("<div>");
	  									var $div = $("<div>");
	  									var $label = $("<label>");
	  									var $select = $("<input>");
	  									$select.attr('type','checkbox');
	  									$select.attr('value',data[i].sNo);
	  									$label.css("color" , data[i].sColor);
	  									$label.text("●");
	  									$div.attr('class','contentview');
	  									$div.css('display','inline-block');
	  									$div.css('cursor','pointer');
	  									$div.css('font-size','24px');
	  									$div.text(data[i].sTitle);
	  									$div.append($select);
	  									$body.append($label ,"&nbsp;", $div ,"<br>");
	  									$memo_title.append($body);
	  								}
	  									$('.contentview').children('input').css('display','none');
	  	  								$('#deleteBtn').css('display', 'inline');
	  	  								updateview();
	  							}, error : function(data){
	  								console.log("실패");
	  							}
	  						});
  		 			}, error : function(data){
  		 				console.log("안됨");
  		 			}
  		 		});
  		 	}
  		 	});
  		 	
		</script>
</body>
</html>
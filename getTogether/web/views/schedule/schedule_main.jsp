<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>일정관리</title>
<script src="/gt/resources/js/jquery-3.3.1.min.js"></script>
<link href="https://fonts.googleapis.com/css?family=Nanum+Gothic" rel="stylesheet">
<link rel="stylesheet" type="text/css" href="../../resources/css/schedule.css" />
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
    </style>
</head>
<body>
		<%@ include file="../common/aside.jsp" %>
		<label style = "display : none;" id = "empNo"></label>
		<%@ include file="../common/header.jsp" %>
		<section style="width : 1530px; height : 80%; background : white; position: absolute; margin-top:  130px; margin-left: 300px;">
		<label id = "myName"></label>	
		<div style="margin-left: 100px; position : absolute;">
			<%@ include file="schedule.jsp" %>
		</div>
		<div style="margin-left: 800px; position : absolute;">
			<form style="width : 550px; ">
            <fieldset style="height : 500px;" class="memo_list">
            <legend style="text-align : center;" id="memo_day"></legend>
            <input type="hidden" id="daydata"/>
            <input class = "memoBtn" id = "insertBtn" value="추가">
        	<input class = "memoBtn" id = "deleteBtn" style= "display : none;" value="삭제">
        	<input class = "memoBtn" id = "checkBtn" style= "display : none;" value="완료">
        	<input class = "memoBtn" id = "okBtn" style = "display : none;" value="확인">
        	<input class = "memoBtn" type = "reset" id='resetBtn' style = "display : none;" value="취소">
        	<ul id = "memo_title"></ul>
        	<div id="memo_body">
        	<label id = "mbtitle" style="display: none">일정 : 
        	<input id = "sTitle" type="text" style = "width : 300px; height : 30px;s" />
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
			$("#daydata").attr('value', year+month+day);
			$("#myName").html($('#empName').text() +"님의 일정 관리");
			$("#empNo").html(sessionStorage.getItem("loginNo"));

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
						$label.text("저장된 메모가 없습니다 !");
						$memo_title.append($label);
					} else {
						for(var i in data){
							var $li = $("<li>");
							var $select = $("<input>");
							$select.attr('type','checkbox');
							$li.attr('value',data[i].sNo)
							$li.css("color" , data[i].sColor);
							$li.text(data[i].sTitle);
							$li.append($select);
							$memo_title.append($li);
						}
						$('li').children().css('display','none');
						$('#deleteBtn').css('display', 'inline');
					}
				}, error : function(data){
					console.log("실패인가..");
				}
			});
		});
		
  		 	 function days(day){
  		 		$('#insertBtn').css('display','inline');
  		 		$("#memo_title").children().remove();
  		 		
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
  		 				daydate
  		 				},
  		 			type : "GET",
  		 			success : function(data) {
  		 				var $memo_title = $('#memo_title');
  						
  						if(data.length <= 0){
  							var $label = $("<label>");
  							$label.text("저장된 메모가 없습니다 !");
  							$memo_title.append($label);
  							$('#deleteBtn').css('display', 'none');
  						} else {
  							for(var i in data){
  								var $li = $("<li>");
  								var $select = $("<input>");
  								$select.attr('type','checkbox');
  								$li.attr('value',data[i].sNo);
  								$li.css("color" , data[i].sColor);
  								$li.text(data[i].sTitle);
  								$li.append($select);
  								$memo_title.append($li);
  							}
  							$('li').children().css('display','none');
  							$('#deleteBtn').css('display', 'inline');
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
  		 		$('#memo_title').children('li').remove();
  		 		
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
  						$('#okBtn').css('display','none');
  						$('#resetBtn').css('display','none');
  						$('#memo_title').css("display","block");
  						
  						$.ajax({
  							url : "<%= request.getContextPath()%>/schedule_inli.do",
  							data : {
  								empNo : $("#empNo").text(),
  								sDate : $("#daydata").val()
  								},
  							type : "GET",
  							success : function(data){
  								console.log("당연대지");
  								
  								var $memo_title = $('#memo_title');
  								
  								for(var i in data){
  	  								var $li = $("<li>");
  	  								var $select = $("<input>");
  	  								$select.attr('type','checkbox');
  	  								$li.attr('value',data[i].sNo);
  	  								$li.css("color" , data[i].sColor);
  	  								$li.text(data[i].sTitle);
  	  								$li.append($select);
  	  								$memo_title.append($li);
  	  							}
  								$('li').children().css('display','none');
  	  							$('#deleteBtn').css('display', 'inline');
  							}, error : function(data){
  								console.log("실패");
  							}
  						});
  						
  					}, error : function(data){
  						console.log("실팽");
  					}
  				});
  		 		}
  			});
  		 	$("#deleteBtn").on('click',function(){
  		 		$('#insertBtn').css('display','none');
  		 		$("#checkBtn").css('display','inline');
  		 		$('#memo_title').children().children().css("display","inline");
  		 		
  		 		$('#memo_title').children('li').children('input').each(function() {
  		 		if($(this).prop('checked')){
  		 			var sNo = $(this).parent().val();
  		 			var $li = $(this).parent();
  		 			$.ajax({
  		 				url : "<%= request.getContextPath()%>/schedule_de.do?sNo="+sNo,
  		 				data : sNo,
  		 				type : "GET",
  		 				success : function(data){
  		 					console.log("된다.");
  		 					$li.remove();
  		 				},error : function(data){
  		 					console.log("안댄다.");
  		 				}
  		 		});
  		 		} else {
					
  		 		}
  		 		});
  		 	});
		</script>
</body>
</html>
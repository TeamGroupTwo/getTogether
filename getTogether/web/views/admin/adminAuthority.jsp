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
	::-webkit-scrollbar {width: 8px; height: 8px; border: 3px solid #fff; }
::-webkit-scrollbar-button:start:decrement, ::-webkit-scrollbar-button:end:increment {display: block; height: 10px; background:#efefef}
::-webkit-scrollbar-track {background: #efefef; -webkit-border-radius: 10px; border-radius:10px; -webkit-box-shadow: inset 0 0 4px rgba(0,0,0,.2)}
::-webkit-scrollbar-thumb {height: 50px; width: 50px; background: rgba(0,0,0,.2); -webkit-border-radius: 8px; border-radius: 8px; -webkit-box-shadow: inset 0 0 4px rgba(0,0,0,.1)}


   body{
      background : #dad5e6;
   }
   
   .main {
   	  background:white;
   	  position: absolute;
   	  top: 150px;
   	  left: 420px;
      width : 1300px;
      height: 750px;
      border:0;
      text-align: center;
      
   }
  
   
   table{
   	  border-collapse:collapse;
      border: 2px solid #5f4d8c;
   }

	#firstTable1{
	   margin-top:100px;
	   margin-left:150px;
	   background: white;
	   width:1000px;
	   position: absolute;
	   display: none;
   }
   #firstTable1 th{

      background: #5f4d8c;
      width: 100px;
      height: 30px;
      color: white;
      
   }
   #firstTable1 td{
   	
      width: 100px;
      height: 30px;
      border-bottom: 2px solid gray;
      text-align: center;
   
   }
   	#firstTable3{
	   margin-top:100px;
	   margin-left:150px;
	   background: white;
	   width:1000px;
	   position: absolute;
	   display: none;
   }
     #firstTable3 th{

      background: #5f4d8c;
      width: 100px;
      height: 30px;
      color: white;
      
   }
   #firstTable3 td{
   	
      width: 100px;
      height: 30px;
      border-bottom: 2px solid gray;
      text-align: center;
   
   }
   
   
   #list{
   	background: white; 
   	border: 1px solid black;
  	position:absolute;
  	margin-top: 110px; /* 220px;  */
  	margin-left:150px;
   	width:1010px;
   	height:500px;
   	overflow: auto;
   
   }
   #secondTable{
 	
  	width:1000px;
  	height: 300px;
   }
   
   #secondTable td{
   font-size:15px;
   border-bottom: 2px solid gray;
   }
   
   #secondTable th{
    border-collapse:collapse;
    background:#5f4d8c;
    color:white;
    border: 2px solid #5f4d8c;
   }
   
   select {
    width: 100px;
    height: 20px;
    padding-left: 10px;
    font-size: 13px;
    color: black;
    border: 1px solid #5f4d8c;
    border-radius: 3px;
}
   #searchBtn {
      width:40px;
      height: 34px;
      border: 0px;
      background: #1b5ac2;
      outline: none;
      
      color: #ffffff;
   }
   
    #keyword {
      width: 150px;
      height: 34px;      
      border: 1px solid #036;
      font-size:15px;
      background: #ffffff; 
   }
   
   #searchEmp {
      width:70px;
      height: 35px;
      position: absolute; 
      top:30px; 
      left: 20px;"
   }
   .input1{
   		text-align:left;
   }
  
   

</style>
<title>관리자 사원관리</title>
</head>
<body>
   <%@ include file="adminAside.jsp" %>
   <%@ include file="adminHeader.jsp" %>
   
   <div class="main" >
   		
	    <div>
	       <div style="position: absolute; top: 0px; left: 130px;">
		   <select name="searchEmp" id="searchEmp" >
		      <option value="">전 체</option>
		      <option value="departmentName">부서명</option>
		      <option value="employeeName">직원명</option>
		   </select>
		   </div>
		   
		   <div class="searchArea" align="center" style="position: absolute; top: 30px; left: 230px;">
		      <input type="search" id="keyword" placeholder="내용을 입력하세요" onkeyup="enterCheck();"/>
		      <button id="searchBtn" type="button" onclick="search();">검색</button>
		   </div>
		   
		   
		   <div style="position: absolute; top:30px; left: 1040px;">
		      <button id="createBtn" type="button" onclick="empCreate();" style="background:rgb(95,77,140); color:white; height:25px; cursor: pointer; border:0; border-radius: .25em;">직원생성</button>
		      <button id="cBtn" type="button" onclick="deleteBtn();" style=" background:rgb(95,77,140); color:white; height:25px; cursor: pointer; border:0; border-radius: .25em;">삭제</button>
		   </div>
	   </div>
   
   		<form action="<%=request.getContextPath()%>/eInsert.do" method="post">
	   		<div id="firstTable1">
		      <table id="firstTable2" align="center">
		         <tr>
		         	<th rowspan="2" style="background: white; border:2px solid #5f4d8c; color:black;">직원생성</th>
		            <th>사번</th>
		            <th>아이디</th>
		            <th>비밀번호</th>
		            <th>이름</th>
		            <th>부서</th>
		            <th>직급</th>
		         </tr>
		         <tr>
		            <td class="input1"><input type="text" name="eNo"/></td>
		            <td class="input1"><input type="text" name="eId"/></td>
		            <td class="input1"><input type="text" name="ePwd"/></td>
		            <td class="input1"><input type="text" name="eName"/></td>
		            <td>
			            <select name="rcode" id="rcode">
			               <option value="R1">사원</option>
			               <option value="R2">주임</option>
			               <option value="R3">대리</option>
			               <option value="R4">과장</option>
			               <option value="R5">차장</option>
			               <option value="R6">부장</option>
			            </select>
		            </td>
		            <td>
			            <select name="dcode" id="dcode" align="center" >
			                <option value="D1">회계부</option>
			               <option value="D2">인사부</option>
			               <option value="D3">전략기획부</option>
			               <option value="D4">영업부</option>
			               <option value="D5">개발부</option>
			               <option value="D6">법무부</option>
			            </select>
		            </td>
		         </tr>
		      </table>
		      <div style="margin-left:905px; margin-top:5px; width:100px; ">
		      <button class="firstTableBtn" type="submit" style="background:rgb(95,77,140); color:white; height:25px; cursor: pointer; border:0; border-radius: .25em;">확인</button>&nbsp;
		      <button class="firstTableBtn" type="reset" onclick="resetBtn();" style="background:rgb(95,77,140); color:white; height:25px; cursor: pointer; border:0; border-radius: .25em;">취소</button>
			  </div>  
		   </div>
	   </form>
	   
	   <form action="<%=request.getContextPath()%>/aUpdate.do" method="post">
	   		<div id="firstTable3">
		      <table id="firstTable4" align="center">
		         <tr>
		         	<th rowspan="2" style="background: white; border:2px solid #5f4d8c; color:black;">직원수정</th>
		            <th>사번</th>
		            <th>아이디</th>
		            <th>이름</th>
		            <th>직급</th>
		            <th>부서</th>
		         </tr>
		         <tr>
		            <td class="input1"><input type="text" id="eNo1" name="eNo1" readonly/></td>
		            <td class="input1"><input type="text" id="eId1" name="eId1" readonly/></td>
		            <td class="input1"><input type="text" id="eName1"  name="eName1" readonly/></td>
		            <td>
			            <select name="updateRcode" id="updateRcode">
			                <option value="R1">사원</option>
			               <option value="R2">주임</option>
			               <option value="R3">대리</option>
			               <option value="R4">과장</option>
			               <option value="R5">차장</option>
			               <option value="R6">부장</option>
			            </select>
		            </td>
		            <td>
			            <select name="updateDcode" id="updateDcode" align="center" >
			               <option value="D1">회계부</option>
			               <option value="D2">인사부</option>
			               <option value="D3">전략기획부</option>
			               <option value="D4">영업부</option>
			               <option value="D5">개발부</option>
			               <option value="D6">법무부</option>
			               
			            </select>
		            </td>
		         </tr>
		      </table>
		      <div style="margin-left:825px; margin-top:5px; width:100px; ">
		      <button class="firstTableBtn" type="submit" style="background:rgb(95,77,140); color:white; height:25px; cursor: pointer; border:0; border-radius: .25em;">수정</button>&nbsp;
		      <button class="firstTableBtn" type="reset" onclick="updateRestBtn();" style="background:rgb(95,77,140); color:white; height:25px; cursor: pointer; border:0; border-radius: .25em;">취소</button>
			  </div>  
		   </div>
	   </form>
	   
	   
	   
	   
	   
	   
   
	   <div  id="list" style="background: white; border:0; ">
	      <table id="secondTable">
	         <thead>
	         <tr>
	         	<th id="" style="width:20px;"></th>
	            <th style="width:50px;">사 번</th>
	            <th style="width:100px;">이 름</th>
	            <th style="width:80px;">아이디</th>
	            <th style="width:80px;">부 서</th>
	            <th style="width:80px;">직 급</th>
	            <th style="width:150px;">연락처</th>
	            <th style="width:150px;">이메일</th>
	         </tr>
	         </thead>
	         
	         <tbody>
	        <% for ( Employee e : list) { %>
	         <tr>
	         	<td id='chk'><input type="checkbox"  class="del"  name="check" value=""/></td>
	            <td id="empNo"><%=e.geteNo()%></td>
	            <td><%=e.geteName()%></td>
	            <td><%=e.geteId()%></td>
	            <td><%=e.getdCode()%></td>
	            <td><%=e.getrCode()%></td>
	            <td><%=e.getPhone()%></td>
	            <td><%=e.getEmail()%></td>
	         </tr>
	         <%  } %>
	         </tbody>
	      </table>
	   </div>
   		
   </div>
   
   <script>
   $(function(){
		$('#secondTable tr').mouseenter(function(){
			var su = 0;
			
			$(this).children('#chk').on('click',function(e){
				e.stopPropagation();
				
			});
			$(this).children('th').on('click',function(e){
				e.stopPropagation();
			});
			$(this).children('th').css('cursor', 'default');
			$(this).css({
				"background" : "#dad5e6",
				"cursor":"pointer"
				});
			}).mouseout(function(){
				$(this).css({
					"background": "white"
					});
				}).click(function(){
				
				$('#list').css('margin-top','220px');
				$('#firstTable1').css('display','none');
				$('#firstTable3').css('display','block');	
				
				$('#eNo1').val($(this).children().eq(1).text());
				$('#eId1').val($(this).children().eq(3).text());
				$('#eName1').val($(this).children().eq(2).text());
				
				var rank = $(this).children().eq(5).text();
				switch (rank) {
				case "사원": rank="R1"; break;
				case "주임": rank="R2"; break;
				case "대리": rank="R3"; break;
				case "과장": rank="R4"; break;
				case "차장": rank="R5"; break;
				case "부장": rank="R6"; break;
				}
				$('#updateRcode').children().each(function() {
					if($(this).val()==rank)
						$(this).prop("selected", true);
					else
						$(this).prop("selected", false);
				});
				
				
				var dept = $(this).children().eq(4).text();
				switch (dept) {
				case "회계부": dept="D1"; break;
				case "인사부": dept="D2"; break;
				case "전략기획부": dept="D3"; break;
				case "영업부": dept="D4"; break;
				case "개발부": dept="D5"; break;
				case "법무부": dept="D6"; break;
				}
				$('#updateDcode').children().each(function() {
					if($(this).val() == dept)
						$(this).prop("selected", true);
					else
						$(this).prop("selected", false);
				});	
			});
		});
   
   function nocheck(){
	   $('#secondTable tr').children('th').each(function(e){
		   e.stopPropagation();
	   });
   }
   
   
   function search(){
			location.href='<%=request.getContextPath()%>/esearch.do?con='+$('#searchEmp').val()+"&keyword="+$('#keyword').val();
		}
   
   function empCreate(){
	   $('#list').css('margin-top','220px');
	   $('#firstTable1').css('display','block');
	   $('#firstTable3').css('display','none');
   }
   
   function resetBtn(){
	   
	   $('#list').css('margin-top','100px'); 
	   $('#firstTable1').css('display','none');
	   $('#firstTable3').css('display','none');
   }
   
  function updateRestBtn(){
	   
	   $('#list').css('margin-top','100px'); 
	   $('#firstTable1').css('display','none');
	   $('#firstTable3').css('display','none');
   }
  
  
  
  
  $('#cBtn').on('click', function() {
	  
	     var chklist2 = new Array();
	     
	     $('.del').each(function() {
	      
	        if($(this).prop('checked')) {
	           chklist2.push($(this).parent().siblings('#empNo').text());
	     }
	        
	   });
	     //console.log(chklist);
	     
	     chklist = JSON.stringify(chklist2);
	     
	     $.ajax({
	      
	        url:"<%=request.getContextPath()%>/elistdel.do",
	        data: {chklist : chklist},
	        type : "POST",
	        success : function(data) {
	         
	           $('.del').each(function() {
	               
	              if($(this).prop('checked')) {
	                 $(this).parent().parent().remove();
	           }           
	         });
	           
	      }, error : function(data) {
	         
	      }             
	     });
	    
	}); 
   
   
   
   </script>
</body>
</html>
<%@page import="java.util.Arrays"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<%
			String[] str = {"홍길동,4,컴퓨터공학","유관순,1,국문학과","이순신,3,해양학과" }; 
		%>
		<meta charset="UTF-8">
		<title>Insert title here</title>
		<script src="http://code.jquery.com/jquery-latest.min.js"></script>
		<style>
			table,th,td{border:1px solid black; border-collapse:collapse; text-align: center;}
			th,td{width:150px; heigth:40px;}
		</style>
		<script>
			$(function(){
				var str = [];
				str[0] = '<%= str[0]%>';
				str[1] = '<%= str[1]%>';
				str[2] = '<%= str[2]%>';
				
				var htmlData = "";
				for(var stu of str){
					var stuArr = stu.split(",");
					htmlData += "<tr><td>"+stuArr[0]+"</td>";
					htmlData += "<td>"+stuArr[1]+"</td>";
					htmlData += "<td>"+stuArr[2]+"</td></tr>";
				}
				
				$("#tbody").html(htmlData);
				
				/* 저장 버튼 누르면 테이블에 각 인풋의 값들이 위쪽에 붙게 하기 */
				/* 생각순서: 
					1. 저장버튼 누르면 (어떠한 상황/조건에 작동이 되나?) - $().click()
					2. 테이블에 (어디에 적용되나?) - $("#tbody")
					3. 인풋의 값들이 붙게한다(뭘 할거??) - $().prepend();
				*/
				$("#btn").click(function(){
					var btnData = "";
					var name = $("#name").val();
					var grade= $("#grade").val();
					var major = $("#major").val();
					
					btnData += "<tr><td>"+name+"</td>";
					btnData += "<td>"+grade+"</td>";
					btnData += "<td>"+major+"</td></tr>";
					
					$("#tbody").prepend(btnData);
					
					alert("헉생정보가 저장되었습니다.");
					$("#name").val("");
					$("#grade").val("");
					$("#major").val("");
				});
			});
		</script>
	</head>
	<body>
	<h2>학생성적처리 프로그램</h2>
	<form action="#">
		<label>이름</label>
		<input type="text" name="name" id="name"><br> 
		<label>학년</label>
		<input type="text" name="grade" id="grade"><br> 
		<label>전공</label>
		<input type="text" name="major" id="major"><br> 
		<button id="btn" type="button">저장</button>
	</form>	
	
	<table id="table">
			<tr>
				<th>이름</th>
				<th>학년</th>
				<th>학과</th>
			</tr>
			<tbody id="tbody">
			
			</tbody>
	</table>	
	</body>
</html>
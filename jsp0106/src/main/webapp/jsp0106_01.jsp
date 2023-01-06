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
			});
		</script>
	</head>
	<body>
	<table id="table">
		
			<tr>
				<th>이름</th>
				<th>학년</th>
				<th>학과</th>
			</tr>
			<tbody id="tbody">
				<%-- <% for(String stu:str) {
						String[] stuArr = stu.split(","); 
				%>
				<tr>
					<td><%=stuArr[0] %></td>		
					<td><%=stuArr[1] %></td>		
					<td><%=stuArr[2] %></td>		
				</tr>
				<% } %> --%>
			</tbody>
	</table>	
	</body>
</html>
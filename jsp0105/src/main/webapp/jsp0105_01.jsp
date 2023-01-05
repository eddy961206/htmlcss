<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Insert title here</title>
		<script src="http://code.jquery.com/jquery-latest.min.js"></script>
		<style>
			table,th,td{border:1px solid black; border-collapse: collapse;}
		</style>
	</head>
	<body>
		<%
			String[] data = {"010-1111-2222","010-2222-3333","010-3333-4444",
					"010-4444-5555","010-5555-6666"};
		%>
		<table>
		<% for(int i = 0; i < data.length; i++){%>
				<tr>
					<th>f_tel</th>
					<td><%= data[i].split("-")[0] %></td>
				</tr>
				<tr>
					<th>m_tel</th>
					<td><%= data[i].split("-")[1] %></td>
				</tr>
				<tr>
					<th>l_tel</th>
					<td><%= data[i].split("-")[2] %></td>
				</tr>
		<% }%>
		</table>
		
			
	</body>
</html>
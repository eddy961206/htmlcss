<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>액션태그 - param2 (받기)</title>
	</head>
	<body>
		<!-- jsp1226_10.jsp의 내용 : 
			<jsp:forward page="jsp1226_10_02.jsp">
				<jsp:param name="id" value="aaa" /> 
				<jsp:param name="pw" value="1111" />
			</jsp:forward> 
			에서 보낸 걸 아래처럼 받아
		-->
	
		<% 
			String id = request.getParameter("id"); 
			String pw = request.getParameter("pw"); 
		%>
		
		<h2>아이디 : <%= id %></h2> 
		<h2>패스워드: <%= pw %></h2>
		
	</body>
</html>
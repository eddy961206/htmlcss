<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>response.sendRedirect</title>
	</head>
	<body>
		<% response.sendRedirect("login.html"); %> <!-- 주소창의 주소가 login.html로 바뀌면서 이동  -->
<%-- 		<jsp:forward page="login.html" />  --%>
		<!-- 이렇게 액션태그 쓰면 주소가 http://localhost:8181/jsp1226/jsp1226_07.jsp 그대로이지만 login.html을 보여줌 -->
	</body>
</html>
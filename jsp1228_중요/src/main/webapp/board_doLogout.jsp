<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("utf-8"); %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>로그아웃 체크(borard_doLogin.<%!  %>)</title>
	</head>
	<body>
		<%
			/* 존재하던 세션 싹 다 지우기 */
			session.invalidate();
		%>		
		<script>
			alert("로그아웃 되었습니다.");
			location.href="board_main.jsp";
		</script>
		
	</body>
</html>
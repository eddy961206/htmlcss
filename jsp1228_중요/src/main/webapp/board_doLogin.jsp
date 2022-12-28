<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("utf-8"); %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>로그인 체크(borard_doLogin.<%!  %>)</title>
	</head>
	<body>
		<!-- session 추가 -->
		<%
			/* board_login.jsp으로부터 받아온 데이터를 꺼내기 */
			String id = request.getParameter("id");
			String pw = request.getParameter("pw");
			String nickName = request.getParameter("nickName");
			
			/* 이미 board_login.jsp에서 로그인 된 데이터를 보내준 거니까 여기서 굳이 확인 안하고 바로 세션 만들어줌 */
			session.setAttribute("sessionId", id);
			session.setAttribute("sessionNname", nickName);
			
			/* 로그인 됐으니까 메인페이지로 리다이렉트시킴 */
			response.sendRedirect("board_main.jsp");
			
		%>
		
		<!-- 리턴페이지 : jsp1228_01.jsp로 -->
		
		
	</body>
</html>
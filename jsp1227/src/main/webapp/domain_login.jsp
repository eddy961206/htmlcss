<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>domain_login.jsp</title>
	</head>
	<body>
		<%
			String id = request.getParameter("id");
			String pw = request.getParameter("pw");
			
			if(id.equals("admin") && pw.equals("1111")){
				Cookie loginCookie = new Cookie("cookieId",id);
				Cookie loginNickName = new Cookie("cookieNname","닉넴");
				loginCookie.setMaxAge(60*60);
				loginNickName.setMaxAge(60*60);
				response.addCookie(loginCookie);
				response.addCookie(loginNickName);
		%>
				<script>
					alert("로그인 성공");
					location.href="main.jsp";
				</script>
		<% } else { %>
				<script>
					alert("아이디 또는 비밀번호가 틀립니다..");
					location.href="main_login.jsp";
				</script>
		<% } %>
		
	</body>
</html>
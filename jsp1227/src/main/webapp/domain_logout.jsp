<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>domain_logout.jsp</title>
	</head>
	<body>
		<%
			Cookie[] getCookie = request.getCookies();
			for(int i = 0; i < getCookie.length; i++){
				if(getCookie[i].getName().equals("cookieId") || getCookie[i].getName().equals("cookieNname")){
					getCookie[i].setMaxAge(0);
					response.addCookie(getCookie[i]);
				}
			}
		%>
			<script>
				alert("로그아웃 됐습니다.");
				location.href = "main.jsp";
			</script>
	</body>
</html>
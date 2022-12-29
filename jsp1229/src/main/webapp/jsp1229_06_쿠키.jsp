<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>cookie</title>
	</head>
	<body>
		<h2>쿠키생성 - cookieId, cookieNname</h2>
		<%
			Cookie cook1= new Cookie("cookieId","admin");
			Cookie cook2 = new Cookie("cookieNname","쿠킹");
			
			cook1.setMaxAge(60*60);
			cook2.setMaxAge(60*60);
			
			response.addCookie(cook1);
			response.addCookie(cook2);
		%>
		<%
			session.setAttribute("administrator", "admin2");
			session.setAttribute("nickName", "세션이");
		
		%>
		<button><a href="jsp1229_06_read2.jsp">쿠기 읽기</a></button>		
	</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("utf-8"); %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>로그인</title>
	</head>
	<body>
		<%
			String id= request.getParameter("id");
			String pw= request.getParameter("pw");
			
			if(id.equals("adminid") && pw.equals("1111")) {
// 				response.sendRedirect("main.jsp?checkId=adminid");
		%>
				<!-- form뿐 아니라 아래처럼 파라미터방식으로 데이터 보내는것도 가능. -->
				<script>alert("로그인 성공!!"); location.href="main.jsp?successId=adminid";</script>
		
		<% 		
			}else{
		%>
				<script>alert("아이디 또는 패스워드가 일치하지 않습니다. 다시 로그인해주세요");
					location.href="login.html";
				</script>
		<%
			}
		%>
	</body>
</html>
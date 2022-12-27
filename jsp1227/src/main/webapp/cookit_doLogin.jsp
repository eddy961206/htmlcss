<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>login Check</title>
	</head>
	<body>
		<%
			String id = request.getParameter("id");
			String pw = request.getParameter("pw");
			
			if(id.equals("admin") && pw.equals("1111")){
				session.setAttribute("sessionId", id);
				session.setAttribute("sessionNname", "길동쓰");
		%>		
				<script>
					alert("로그인 됐습니다.");
					location.href="cookit_main.jsp";
				</script>
		<%  } else {  %>		
				<script>
					alert("로그인 실패. 아이디와 비번 확인하세요.");
					location.href="cookit_login.jsp";
				</script>
		<%  }  %>
	</body>
</html>
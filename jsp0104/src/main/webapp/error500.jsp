<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page isErrorPage="true" %> <!-- 애가 트루일때만  -->
<% response.setStatus(200); // 정상페이지임을 알려줌 %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>error500 페이지</title>
		<style>
			*{margin:0; padding:0;}
			div,p {width:1200px; margin:50px auto;}
			img{width:1200px;}
			p{font-size:15px;}
		</style>
	</head>
	<body>
		<div>
			<a href="board_main.jsp"><img src="images/error500.jpg"></a>
		</div>
		<p><%= exception.getMessage() %></p> <!--에러코드 뭔지 알려줌  -->
	 
	</body>
</html>
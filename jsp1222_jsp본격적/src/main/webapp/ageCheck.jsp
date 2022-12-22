<%@page import="java.net.URLEncoder"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>response</title>
	</head>
	<body>
		<%
			request.setCharacterEncoding("utf-8");
		
			String name = URLEncoder.encode(request.getParameter("name"),"utf-8");
			/* 한글을 파라미터로 보낼 때(get) 위처럼 URLEncoder.encode(~~,"utf-8")방식으로 인코딩 한번 해야 */
			int age = Integer.parseInt(request.getParameter("age"));
		
			if(age >= 18){
		%>
				<script>
					alert("당신은 성인입니다. 주류판매가 가능합니다.");
					location.href("pass.jsp");
				</script>		
		<%		
// 			response.sendRedirect("pass.jsp"); /* 1. post(form)방식으로 파라미터 보내는 방식  */
			response.sendRedirect("pass.jsp?age="+age + "&name=" + name); /* 2. get방식으로 파라미터 보내는 방식  */
			} else {
		%>
				<script>alert("당신은 미성년자입니다. 주류판매가 불가능합니다.");</script>		
		<%	
			response.sendRedirect("ng.jsp");
			}
		%>
		
	</body>
</html>
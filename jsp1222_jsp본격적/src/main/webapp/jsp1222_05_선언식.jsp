<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>jsp 선언식</title>
	</head>
	<body>
		<%! /* 선언식 */
			int i = 10;
			String str = "abc";
		%>
		
		<%!
			int sum(int a, int b){
				return a+b;
		 	}
		%>
		
		<%-- 스크립트릿으로 변수 출력 --%>
		<%
			out.println(i+"<br>");
		%>
		
		<%-- 표현식으로 출력 --%>
		<%= sum(1,5) %><br> 
		<%= i %><br>
		<%= str %><br>
		
	</body>
</html>
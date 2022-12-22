<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>sum-1~100,3의 배수만 합</title>
	</head>
	<body>
		<%
			int sum = 0;
			for(int i = 1; i <= 100; i++) {
				if(i%3==0){
					sum += i;
				}
			}
			out.println("<h2>"+ sum +"</h2>" );
		%>
	</body>
</html>
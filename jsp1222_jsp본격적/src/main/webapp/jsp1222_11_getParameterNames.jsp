<%@page import="java.util.Arrays"%>
<%@page import="java.util.Enumeration"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>getParameterNames</title>
		<style>
			table,td{border: 1px solid black; border-collapse: collapse;}
		</style>
	</head>
	<body>
		<%
			request.setCharacterEncoding("utf-8"); /* 한글 안깨지게. 서블릿과 동일  */
			Enumeration e = request.getParameterNames(); /* 변수들을 e에 담아. 받는거 하나하나는 String. 
			하지만 Enumeration의 형태는 Object라서 String으로의 형변환이 필요. (?)  */
			while(e.hasMoreElements()){
				String varName = e.nextElement().toString(); /* 또는 (String)e.nextElement() */
				String[] varValue = request.getParameterValues(varName);
		%>	
				<table>
					<tr>
						<td>변수이름(varName)</td>
						<td><%= varName %></td>
						<td>변수값(varValue)</td>
						<td><%= Arrays.toString(varValue)%></td>
					</tr>
				</table>
		<% 		
			}
		%>
		
	</body>
</html>
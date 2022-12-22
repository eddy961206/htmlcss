<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>request</title>
		<style>
			table,td{border:1px solid black; border-collapse:collapse;}
			td{width:400px; height:40px;}
			table{width:800px; margin:0 auto;}
		</style>
	</head>
	<body>
		<h2>request 정보</h2>
		<%
			String name = request.getServerName();	 	/* 192.168.0.81 */
			int port = request.getServerPort(); 		/* 	8181 */
			String method = request.getMethod();		/* 	GET */
			String protocol = request.getProtocol();	/* 	HTTP/1.1 */
			String context = request.getContextPath();	/* 	/jsp1222 */
			StringBuffer url = request.getRequestURL();	/* 	http://192.168.0.81:8181/jsp1222/jsp1222_10.jsp */
			String uri = request.getRequestURI();		/* 	/jsp1222/jsp1222_10.jsp */
			String ip = request.getRemoteAddr();		/* 	192.168.0.81 */
		%>
		
		<!-- !!!!!!!!파일명 가져오기 중요!!!!!!! -->
		<h2>파일명 : <%= uri.substring(context.length()) %>	</h2>  
		<!--'/jsp1222/jsp1222_10.jsp'(uri) 에서 
			'/jsp1222'(context)를 잘라내면 
			'/jsp1222_10.jsp'(파일명)만 남음   -->
		<form>
			<input type="hidden" name="ip" id="ip" value="<%=ip%>">
		</form>
		<table>
			<tr>
				<td>getServerName</td>
				<td><%= name %></td>
			</tr>
			<tr>
				<td>getServerPort</td>
				<td><%= port %></td>
			</tr>
			<tr>
				<td>getMethod</td>
				<td><%= method %></td>
			</tr>
			<tr>
				<td>getProtocol</td>
				<td><%= protocol %></td>
			</tr>
			<tr>
				<td>getContextPath</td>
				<td><%= context %></td>
			</tr>
			<tr>
				<td>getRequestURL</td>
				<td><%= url %></td>
			</tr>
			<tr>
				<td>getRequestURI</td>
				<td><%= uri %></td>
			</tr>
			<tr>
				<td>getRemoteAddr</td>
				<td><%= ip %></td>
			</tr>
		</table>
		
	</body>
</html>
<%@page import="java.sql.Date"%>
<%@page import="java.sql.Timestamp"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Insert title here</title>
		<style>
			table,th,td{border:1px solid black; border-collapse:collapse;}
			th,td{width:120px; height:40px;}
		</style>
	</head>
	<body>
		<%!
			Connection conn;
			Statement stmt;
			ResultSet rs;
			
			String title,content,userid;
			int no,hit;
			Date bdate;
			
			String query = "select no, title, content, userId, bdate, hit from board";
		%>
		<%
			try {
				Class.forName("oracle.jdbc.driver.OracleDriver");
				conn = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","orauser","1111");
				stmt = conn.createStatement();
				rs = stmt.executeQuery(query);
		%>
				<table>
					<tr>
						<th>번호</th>
						<th>제목</th>
						<th>내용</th>
						<th>작성자</th>
						<th>날짜</th>
						<th>조회수</th>
					</tr>
		
			<%	while(rs.next()){
					no = rs.getInt("no");
					title = rs.getString("title");
					content = rs.getString("content");
					userid = rs.getString("userid");
					bdate = rs.getDate("bdate");
					hit = rs.getInt("hit");%>
		
					<tr>
						<td><%=no %></td>
						<td><%=title %></td>
						<td><%=content %></td>
						<td><%=userid %></td>
						<td><%=bdate%></td>
						<td><%=hit %></td>
					</tr>
		
				
			  <%}%>
				</table>
				
		<% } catch(Exception e){e.printStackTrace();
			} finally{
				try{
					if(rs!=null) rs.close(); 
					if(stmt!=null) stmt.close(); 
					if(conn!=null) conn.close(); 
				} catch(Exception e2){e2.printStackTrace();}
			}
			
		%>
			
		
	</body>
</html>
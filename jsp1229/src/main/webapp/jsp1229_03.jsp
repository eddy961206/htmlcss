<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("utf-8"); %>
<jsp:useBean id="stuScore" class="com.java.ex.StuScore" scope="page"/>
<!-- useBean은 기본생성자만 사용가능 -->
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>학생성적처리</title>
		<style>
			*{margin:0; padding:0;}
			table{width: 400px; margin:0 auto;}
			table,th,td{border:1px solid black; border-collapse: collapse; text-align:center;}
			th,td {wisth:200px; height:40px;}
		</style>
	</head>
	<body>
		<jsp:setProperty name="stuScore" property="*"/>
<%-- 				<jsp:setProperty name="stuScore" property="stuNum" value='<%= Integer.parseInt(request.getParameter("stuNum")) %>'/> --%>
<%-- 				<jsp:setProperty name="stuScore" property="name" value='<%= request.getParameter("name") %>'/> --%>
<%-- 				<jsp:setProperty name="stuScore" property="kor" value='<%= Integer.parseInt(request.getParameter("kor")) %>'/> --%>
<%-- 				<jsp:setProperty name="stuScore" property="eng" value='<%= Integer.parseInt(request.getParameter("eng")) %>'/> --%>
<%-- 				<jsp:setProperty name="stuScore" property="math" value='<%= Integer.parseInt(request.getParameter("math")) %>'/>				 --%>
<%-- 				<jsp:setProperty name="stuScore" property="total" value=''/>				 --%>
<%-- 				<jsp:setProperty name="stuScore" property="avg" value='<jsp:getProperty name="stuScore" property="avg"/>'/>				 --%>
		<table>
			<tr>
				<th>학번</th>
				<td><%= stuScore.getStuNum() %></td>
			</tr>
			<tr>
				<th>이름</th>
				<td><%= stuScore.getName() %></td>
			</tr>	
			<tr>
				<th>국어</th>
				<td><%= stuScore.getKor() %></td>
			</tr>	
			<tr>
				<th>영어</th>
				<td><%= stuScore.getEng() %></td>
			</tr>	
			<tr>	
				<th>수학</th>
				<td><%= stuScore.getMath() %></td>
			</tr>	
			<tr>	
				<th>합계</th>
				<% stuScore.setTotal(stuScore.getKor()+stuScore.getEng()+stuScore.getMath()); %>
				<td>
					<%= stuScore.getTotal() %>
				</td>
			</tr>	
			<tr>	
				<th>평균</th>
				<% stuScore.setAvg(stuScore.getTotal()/3.0); %>
				<td>
					<%= String.format("%.2f", stuScore.getAvg()) %>
				</td>
			</tr>	
<!-- 				<th>이름</th> -->
<!-- 				<th>국어</th> -->
<!-- 				<th>영어</th> -->
<!-- 				<th>수학</th> -->
<!-- 				<th>합계</th> -->
<!-- 				<th>평균</th> -->
<!-- 			</tr> -->
<!-- 			<tr> -->
<%-- 				<td><jsp:getProperty name="stuScore" property='stuNum'/></td> --%>
<%-- 				<td><jsp:getProperty name="stuScore" property='name'/></td> --%>
<%-- 				<td><jsp:getProperty name="stuScore" property='kor'/></td> --%>
<%-- 				<td><jsp:getProperty name="stuScore" property='eng'/></td> --%>
<%-- 				<td><jsp:getProperty name="stuScore" property='math'/></td> --%>
<%-- <%-- 				<td><jsp:getProperty name="stuScore" property="stuNum"/></td> --%>
<%-- <%-- 				<td><jsp:getProperty name="stuScore" property="name"/></td> --%> 
<%-- <%-- 				<td><jsp:getProperty name="stuScore" property="kor"/></td> --%> 
<%-- <%-- 				<td><jsp:getProperty name="stuScore" property="eng"/></td> --%> 
<%-- <%-- 				<td><jsp:getProperty name="stuScore" property="math"/></td> --%> 
<%-- 				<td><jsp:getProperty name="stuScore" property='total'/></td> --%>
<%-- 				<td><jsp:getProperty name="stuScore" property='avg'/></td> --%>
<!-- 			</tr> -->
			
		</table>
	</body>
</html>
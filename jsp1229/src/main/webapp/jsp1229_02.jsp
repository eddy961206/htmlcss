<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("utf-8"); %> <!-- form.jsp에서 post로 데이터 넘어오니까. -->
<jsp:useBean id="student" class="com.java.ex.Student" scope="page"/>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>bean</title>
	</head>
	<body>
<%-- 		<jsp:setProperty name="student" property="*"/> 
    property="*" 쓰면 student객체안의 변수들 알아서 다 가져와서 형변환도 필요없이 다 넣어줌  --%>
		<% String name = request.getParameter("name"); %>
		<% String grade = request.getParameter("grade"); %>
		<p><jsp:setProperty name="student" property="stuNum" value='<%= Integer.parseInt(request.getParameter("stuNum")) %>' /></p>
		<p><jsp:setProperty name="student" property="name" value="<%= name %>" /></p>  <!-- request로 받은 거 string이니까 형변환 주의 -->
		<p><jsp:setProperty name="student" property="age" value='<%= Integer.parseInt(request.getParameter("age")) %>' /></p>
		<p><jsp:setProperty name="student" property="grade" value="<%= Integer.parseInt(grade) %>" /></p>  <!-- 홑따옴표 쌍따옴표 주의 -->
		<p>학번 : <jsp:getProperty name="student" property="stuNum" /></p>
		<p>이름 : <jsp:getProperty name="student" property="name" /></p>
		<p>나이 : <jsp:getProperty name="student" property="age" /></p>
		<p>학년 : <jsp:getProperty name="student" property="grade" /></p>
		<p>request : <%= request.getParameter("name") %></p>
<!-- 		<p>{student.age}</p> -->
<%-- 		<p><%= student.getGrade() %></p> --%>
	
	</body>
</html>
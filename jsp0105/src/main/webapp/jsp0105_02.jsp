<%@page import="java.util.Arrays"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<%
		String[] data = {"010-1111-2222","010-2222-3333","010-3333-4444",
				"010-4444-5555","010-5555-6666"};
	%>
	<head>
		<meta charset="UTF-8">
		<title>Insert title here</title>
		<script src="http://code.jquery.com/jquery-latest.min.js"></script>
		<style>
			table,th,td{border:1px solid black; border-collapse: collapse;}
			th,td{width:150px; heigth:40px; font-size:20px;}
		</style>
		<script>
			var arrData = [];
			arrData[0] = "<%=data[0]%>";
			arrData[1] = "<%=data[1]%>";
			arrData[2] = "<%=data[2]%>";
			
			console.log("배열1개 : <%=data[0]%>");
			console.log("js : "+ arrData[0]);
			
			
			var tel;
			function btn(){
				for(var i of arrData){
					tel = i.split("-"); //tel타입 : String배열.
					console.log(tel);
					var htmlData = "";
					htmlData += "<tr><th>f_tel</th><td>"+ tel[0] +"</td></tr>";
					htmlData += "<tr><th>m_tel</th><td>"+ tel[1] +"</td></tr>";
					htmlData += "<tr><th>l_tel</th><td>"+ tel[2] +"</td></tr>";
					
					$("#table").append(htmlData);
				}//바깥 for
			}
		</script>
	</head>
	<body>
		<% out.println(Arrays.toString(data));%>
		<button onclick="btn()" type="button">데이터 출력</button>
		<table id="table">
<!-- 			<tr> -->
<!-- 				<th>f_tel</th> -->
<!-- 				<td></td> -->
<!-- 			</tr> -->
<!-- 			<tr> -->
<!-- 				<th>m_tel</th> -->
<!-- 				<td></td> -->
<!-- 			</tr> -->
<!-- 			<tr> -->
<!-- 				<th>l_tel</th> -->
<!-- 				<td></td> -->
<!-- 			</tr> -->
		</table>	
	</body>
</html>
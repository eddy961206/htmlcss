<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Insert title here</title>
		<script src="http://code.jquery.com/jquery-latest.min.js"></script>
		<style>
			table,th,td{border:1px solid black; border-collapse: collapse;}
		</style>
	</head>
	<body>
		<%
			String[] data = {"010-1111-2222","010-2222-3333","010-3333-4444",
					"010-4444-5555","010-5555-6666"};
			String[] dataArr2 = {};
			String dataStr =""; 
			for(int i = 0; i < data.length; i++) {
				String htmlData ="";
				dataArr2 = data[i].split("-");
				String name = "";
				for(int j = 0; j < dataArr2.length; j++) {
					htmlData += "<tr>";
					if(j==0){
						name = "f_tel";
					} else if(j==1){
						name = "m_tel";
					} else {
						name = "l_tel";
					}
					htmlData += "<th>"+ name +"</th>";
					htmlData += "<td>"+ dataArr2[j] +"</td>";
					htmlData += "</tr>";
				}
				out.println("<table>"); 
				out.println(htmlData); 
				out.println("</table>"); 
			}
			
		%>
<!-- 		<table> -->
<!-- 			<tr> -->
<!-- 				<th>f_tel</th> -->
<!-- 				<td>010</td> -->
<!-- 			</tr> -->
<!-- 			<tr> -->
<!-- 				<th>m_tel</th> -->
<!-- 				<td>1111</td> -->
<!-- 			</tr> -->
<!-- 			<tr> -->
<!-- 				<th>l_tel</th> -->
<!-- 				<td>2222</td> -->
<!-- 			</tr> -->
<!-- 		</table>	 -->
	</body>
</html>
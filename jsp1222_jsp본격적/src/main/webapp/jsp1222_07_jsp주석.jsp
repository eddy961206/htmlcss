<%@ page import="java.util.Arrays"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>주석</title>
	</head>
	<body>
	
		<%
			int[] arr = {1, 2, 3};
			out.println(Arrays.toString(arr)+"<br>");
		%>	
		<!-- 랜덤숫자를 1개 생성 -->
		<%-- jsp주석 : 변수num의 값에 random 숫자를 저장 --%>
		<%
			int num = 0;
			num = (int)(Math.random()*10)+1;
			out.println(num);
		%>
		
		<script> /* script는 다 노출됨. 하지만 jsp는 주석조차도 소스에 안보여 */
			console.log("num : " + <%=num%>); 
		</script>
		
	</body>
</html>
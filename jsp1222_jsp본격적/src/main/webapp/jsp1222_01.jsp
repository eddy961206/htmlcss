<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%> 
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Insert title here</title>
	</head>
	<body>
		<% /* scriptlet. 안에 자바 사용 가능 */
			for(int i =0; i<10; i++){
				int ranNum = (int)(Math.random()*10)+1; // 1~10
				out.println("<h2>"+ ranNum +"</h2>");
				System.out.println(ranNum);
			}
		%>
	
	</body>
</html>
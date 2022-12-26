<%@page import="javax.tools.ForwardingJavaFileManager"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>cookie read</title>
	</head>
	<body>
		<%
			Cookie[] cookies = request.getCookies(); /* 쿠키 배열로 리턴 */
			if(cookies != null){
				for(int i = 0; i < cookies.length; i++){
					out.println("쿠키 저장변수명 : " + cookies[i].getName() +"<br>");
					out.println("쿠키 저장변수 값 : " + cookies[i].getValue() +"<br>");
					out.println("쿠키 유효시간 : " + cookies[i].getMaxAge() +"<br>");
					out.println("<br>==================================================<br>");
				}//for
			} else {
				out.println("쿠키 데이터가 존재하지 않습니다.");
			}
		%>
		   <!--  
		   쿠키 저장변수명 : JSESSIONID
		   쿠키 저장변수 값 : 0C8CE53759118E862B7079AA7E8B4E6D
		   ==================================================
		   쿠키 저장변수명 : cookieId
		   쿠키 저장변수 값 : aaa
		   ================================================== 
		   쿠키 저장변수명 : cNickName
		   쿠키 저장변수 값 : smile
		   ================================================== 
		   -->
		
		<button><a href="jsp1226_11_delete.jsp">저장한 쿠키 삭제</a></button>
	</body>
</html>
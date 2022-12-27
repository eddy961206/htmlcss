<%@page import="java.util.Enumeration"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>session getAttribute</title>
	</head>
	<body>
		<%
// 			Cookie[] cookies = request.getCookies();
// 			for(int i = 0; i < cookies.length; i++){
// 				if(cookies[i].getName().equals("cookieId")){
					
// 				}
// 				cookies[i].getName();
// 				cookies[i].getValue();
// 			}
			
// 			for(Cookie c : cookies){
// 				c.getName();
// 				c.getValue();
// 			}
		
			// 해당 session 가져오기
			out.println("<h2> 해당 session 가져오기(getAttribute) </h2>");
			out.println("sessionId : " + (String)session.getAttribute("sessionId"));
			out.println("  sessionNname : " + (String)session.getAttribute("sessionNname"));
			out.println("<br>=============================================<br>");
			
			// 모든 session 가져오기
			out.println("<h2>session 모두 가져오기(Enumeration) </h2>");
			String sessionName;
			String sessionValue;
			
			Enumeration enumeration = session.getAttributeNames(); /* 리턴타입 : enumeration(스트링만 넣을 수) */
			while(enumeration.hasMoreElements()){
				sessionName = (String)(enumeration.nextElement());
				sessionValue = (String)(session.getAttribute(sessionName));
				out.println("sessionName : "+ sessionName + "<br>");
				out.println("sessionValue : " + sessionValue + "<br>");
			}
			
			out.println("<br>=============================================<br>");
			out.println("session getId : " + session.getId());
			out.println("session interval : " + session.getMaxInactiveInterval());
			
			out.println("<br>=============================================<br>");
		%>
		<br>
		<button type='button'><a href="jsp1227_02_del.jsp">session 삭제</a></button>
		
	</body>
</html>
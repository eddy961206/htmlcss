<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%> 
    <!-- Jsp가 톰캣에 의해 자바파일로 변환,(서블릿으로 변환?) .java ->.class로 컴파일되고 난 후 실행. ->html실행문 실행. 
    시작은 jsp, 마지막은 html로 출력.  
    원래 자바는 console에다가 출력했는데 이젠 웹에다가 프린트 해서 보는 것 -->
         <!-- 웹서버는 주로 정적인 거만 처리. 대부분은 WAS(웹 어플리케이션 서버)에서.> -->
	<!-- 톰캣이 웹컨테이너. 톰캣jsp에 스레드 기능 있음(스레드 풀). 음식 주문 전에 미리 만들어놓기 가능  -->
	<!-- html은 바로실행됨. 더 빨라 -->
	
	<!-- JSP는 동적. -->
	
<!DOCTYPE html>		
	<html>
	<head>
		<meta charset="UTF-8">
		<title>jsp파일 오픈</title>
	</head>
	<body>
		<h2>jsp파일을 웹브라우저로 오픈합니다.</h2>
		<form action="http://localhost:8181/jsp1220/wCon" method="post">
			<input type="submit" value="전송">
		</form>
	</body>
</html>
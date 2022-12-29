<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>쿠키 읽기</title>
	</head>
	<body>
		<h2>쿠키 이름 : ${cookie.cookieId.name }</h2> <!-- cookie는 쿠키 전체.   'cookieId'가 나옴
								그 중에 id가 cookieId인 애를 찾아서 보여주라.   --> 
		<h2>쿠키 값 : ${cookie.cookieId.value }</h2> <!-- 'admin'이 나옴 -->
		<hr>
		<h2>스크립틀릿 세션 1 : <%= session.getAttribute("administrator") %></h2> <!-- 'admin2'가 나옴 -->
		<!-- getAttribute는 Object 리턴. Object는 페이지 바껴도 살아있을 수 있으니까 저장가능(?) .
		세션에 모든 객체 담을 수. 하지만 보안상 매우 위험-->
		<h2>스크립틀릿 세션 2: <%= session.getAttribute("nickName") %></h2>  <!-- '세션이'가 나옴 -->
		<h2>EL 세션 1 : ${sessionScope.administrator}</h2> <!-- 'admin2'가 나옴 -->
		<h2>EL 세션 2: ${sessionScope.nickName}</h2>  <!-- '세션이'가 나옴 -->
		
	</body>
</html>
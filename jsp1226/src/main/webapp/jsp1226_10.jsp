<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>액션태그 - param (주기)</title>
	</head>
	<body>
		<!--!!!!!!중요!!!!! 다른 pg로 데이터 넘기는 방법 3가지 :  1.form 2.파라미터 3.액션태그 param -->
		<jsp:forward page="jsp1226_10_02.jsp">
			<jsp:param name="id" value="aaa" /> 
			<jsp:param name="pw" value="1111" />
		</jsp:forward>
		
	</body>
</html>
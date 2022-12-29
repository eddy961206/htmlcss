<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:useBean id="member" class="com.java.ex.Member" scope="page"/>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>join02 result</title>
		<style>
			table{width:500px; margin:50px auto;}
			table,tr,th,td{border:1px solid black; border-collapse: collapse;}
		</style>
	</head>
	<body>
	<!-- 표 -->
		<jsp:setProperty property="*" name="member"/>
		<table>
			<tr>
				<th>이름</th>
				<td><jsp:getProperty name="member" property="name"/></td>
			</tr>
			<tr>
				<th>아이디</th>
				<td><%= request.getParameter("id") %></td>
			</tr>
			<tr>
				<th>비밀번호</th>
				<td><jsp:getProperty name="member" property="pw"/></td>
			</tr>
			<tr>
				<th>이메일1</th>
				<td><jsp:getProperty name="member" property="mail_id"/></td>
			</tr>
			<tr>
				<th>이메일2</th>
				<td><jsp:getProperty name="member" property="mail_tail"/></td>
			</tr>
			<tr>
				<th>주소1</th>
				<td><jsp:getProperty name="member" property="address1"/></td>
			</tr>
			<tr>
				<th>주소2</th>
				<td></td>
			</tr>
			<tr>
				<th>휴대전화1</th>
				<td></td>
			</tr>
			<tr>
				<th>휴대전화2</th>
				<td></td>
			</tr>
			<tr>
				<th>휴대전화3</th>
				<td></td>
			</tr>
			<tr>
				<th>생년월일-연도</th>
				<td></td>
			</tr>
			<tr>
				<th>생년월일-월</th>
				<td></td>
			</tr>
			<tr>
				<th>생년월일-일</th>
				<td></td>
			</tr>
			<tr>
				<th>성별</th>
				<td></td>
			</tr>
			<tr>
				<th>뉴스레터 수신여부</th>
				<td></td>
			</tr>
			<tr>
				<th>SMS 수신여부</th>
				<td></td>
			</tr>
			<tr>
				<th>회원번호</th>
				<td></td>
			</tr>
			<tr>
				<th>회원인증번호</th>
				<td></td>
			</tr>
			<tr>
				<th>직업</th>
				<td></td>
			</tr>
			<tr>
				<th>결혼여부</th>
				<td></td>
			</tr>
			<tr>
				<th>관심사</th>
				<td></td>
			</tr>
		</table>
	
	<form action="join02_info_input2.jsp" method="post" name="frm">
		<button>수정</button>
	</form>
	<!-- 수정버튼 클릭시 join02_info_input2.jsp로 데이터 보내서 value값이 나타나게 해 -->
	</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("utf-8"); %>
<jsp:useBean id="member" class="com.java.ex.Member" scope="session"/>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>가입 결과물</title>
		<script src="http://code.jquery.com/jquery-latest.min.js" ></script>
		<style>
			table{width:500px; margin:50px auto;}
			table,tr,th,td{border:1px solid black; border-collapse: collapse;}
			#buttons {width:700px; margin:0 auto; text-align:center;}
		</style>
	</head>
	<body>
		<jsp:setProperty name="member" property="*" />
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
				<td><%= request.getParameter("mail_tail") %></td>
			</tr>
			<tr>
				<th>주소1</th>
				<td><jsp:getProperty name="member" property="address1"/></td>
			</tr>
			<tr>
				<th>주소2</th>
				<td><%= request.getParameter("address2") %></td>
			</tr>
			<tr>
				<th>휴대전화1</th>
				<td><%= request.getParameter("f_tell") %></td>
			</tr>
			<tr>
				<th>휴대전화2</th>
				<td><%= request.getParameter("m_tell") %></td>
			</tr>
			<tr>
				<th>휴대전화3</th>
				<td><%= request.getParameter("l_tell") %></td>
			</tr>
			<tr>
				<th>생년월일-연도</th>
				<td><%= request.getParameter("birth_year") %></td>
			</tr>
			<tr>
				<th>생년월일-월</th>
				<td><%= request.getParameter("birth_month") %></td>
			</tr>
			<tr>
				<th>생년월일-일</th>
				<td><%= request.getParameter("birth_day") %></td>
			</tr>
			<tr>
				<th>양력/음력</th>
				<td><%= request.getParameter("calendar") %></td>
			</tr>
			<tr>
				<th>성별</th>
				<td><%= request.getParameter("gender") %></td>
			</tr>
			<tr>
				<th>뉴스레터 수신여부</th>
				<td><%= request.getParameter("newletter") %></td>
			</tr>
			<tr>
				<th>SMS 수신여부</th>
				<td><%= request.getParameter("sms") %></td>
			</tr>
			<tr>
				<th>회원번호</th>
				<td><%= request.getParameter("m_number") %></td>
			</tr>
			<tr>
				<th>회원인증번호</th>
				<td><%= request.getParameter("v_number") %></td>
			</tr>
			<tr>
				<th>직업</th>
				<td><%= request.getParameter("job") %></td>
			</tr>
			<tr>
				<th>결혼여부</th>
				<td><%= request.getParameter("marital_status") %></td>
			</tr>
			<tr>
				<th>관심사</th>
				<td>
					<% 
						String[] hobbys = request.getParameterValues("hobbys"); 
						String hobby = "";
						for(int i = 0; i < hobbys.length; i++){
							if(i==0) hobby += hobbys[i];
							else hobby += ", " + hobbys[i];
						}
						out.println(hobby);
					%>
				</td>
			</tr>
		</table>
		<script>
			$(function(){
				$("form button:last-child").click(function(){
					location.href="join02_info_input.html";
				});
			});
		</script>
		<form action="join02_info_input_수정.jsp" method="post" name="frm">
			<input type="hidden" name="name" value='<%= request.getParameter("name") %>'>
			<input type="hidden" name="id" value='<%= request.getParameter("id") %>'>
			<input type="hidden" name="pw" value='<%= request.getParameter("pw1") %>'>
			<input type="hidden" name="mail_id" value='<%= request.getParameter("mail_id") %>'>
			<input type="hidden" name="mail_tail" value='<%= request.getParameter("mail_tail") %>'>
			<input type="hidden" name="zipcode" value='<%= request.getParameter("zipcode") %>'>
			<input type="hidden" name="address1" value='<%= request.getParameter("address1") %>'>
			<input type="hidden" name="address2" value='<%= request.getParameter("address2") %>'>
			<input type="hidden" name="f_tell" value='<%= request.getParameter("f_tell") %>'>
			<input type="hidden" name="m_tell" value='<%= request.getParameter("m_tell") %>'>
			<input type="hidden" name="l_tell" value='<%= request.getParameter("l_tell") %>'>
			<input type="hidden" name="birth_year" value='<%= request.getParameter("birth_year") %>'>
			<input type="hidden" name="birth_month" value='<%= request.getParameter("birth_month") %>'>
			<input type="hidden" name="birth_day" value='<%= request.getParameter("birth_day") %>'>
			<input type="hidden" name="calendar" value='<%= request.getParameter("calendar") %>'>
			<input type="hidden" name="gender" value='<%= request.getParameter("gender") %>'>
			<input type="hidden" name="newletter" value='<%= request.getParameter("newletter") %>'>
			<input type="hidden" name="sms" value='<%= request.getParameter("sms") %>'>
			<input type="hidden" name="m_number" value='<%= request.getParameter("m_number") %>'>
			<input type="hidden" name="v_number" value='<%= request.getParameter("v_number") %>'>
			<input type="hidden" name="job" value='<%= request.getParameter("job") %>'>
			<input type="hidden" name="marital_status" value='<%= request.getParameter("marital_status") %>'>
			<!-- 관심사는 직접 만든 string으로 넘겨주기 -->
			<input type="hidden" name="hobbys" value='<%= hobby %>'> 
			<div id="buttons">
				<button type="submit">수정</button>
				<button type="button">재가입</button>
			</div>
		</form>
		<!-- 수정버튼 클릭시 join02_info_input2.jsp로 데이터 보내서 value값이 나타나게 해 -->
	</body>
</html>
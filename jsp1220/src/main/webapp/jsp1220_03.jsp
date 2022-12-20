<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>리솜리조트 회원가입</title>
		<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
		<script>
			function zipBtn(){
			    new daum.Postcode({
			        oncomplete: function(data) {
			        	$()
			        }
			    }).open();
			}
		
		</script>
	</head>
	<body>
		<form action="s06" method="post">
			<label>이름</label><br>
			<input type="text" name="name" id="name"><br>
			<label>아이디</label><br>
			<input type="text" name="id" id="id"><br>
			<label>패스워드</label><br>
			<input type="password" name="pw" id="pw"><br>
			<label>패스워드 확인</label><br>
			<input type="password" name="pwchk" id="pwchk"><br> 
			<label>이메일</label><br>
			<input type="email" name="email" id="email"><br>
			<label>주소</label><br>
			<input type="text" name="address" id="addr1"><br>
			<input type="text" name="address" id="addr2"> <button type="button" onclick="zipBtn()">주소찾기</button><br><br>
			<label>성별</label><br>
			<input type="radio" name="gender" id="male" value="male">
			<label for="male">남자</label>
			<input type="radio" name="gender" id="female" value="female">
			<label for="female">여자</label><br><br>
			<label>취미</label><br>
			<input type="checkbox" name="hobbys" id="game" value="game">
			<label for="game">게임</label>
			<input type="checkbox" name="hobbys" id="golf" value="golf">
			<label for="golf">골프</label>
			<input type="checkbox" name="hobbys" id="swim" value="swim">
			<label for="swim">수영</label>
			<input type="checkbox" name="hobbys" id="book" value="book">
			<label for="book">독서</label>
			<select >
				<option></option>
				<option></option>
				<option></option>
				<option></option>
			</select>
			
			
			
		</form>
	</body>
</html>
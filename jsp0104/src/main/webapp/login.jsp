<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("utf-8"); %>
<!DOCTYPE html>
<html lang="ko">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Pages - Login</title>
  <script src="http://code.jquery.com/jquery-latest.min.js"></script>
  <link href="https://fonts.googleapis.com/css?family=Noto+Sans+KR:400,500,700,900&display=swap&subset=korean" rel="stylesheet">
  <link rel="stylesheet" href="css/style.css">
  <link rel="stylesheet" href="css/login.css">
  <script>
  	$(function(){
  		
  	})
  
  	function loginBtn(){
  		var id = $("#inputId").val();
  		var pw = $("#inputPw").val();
  		if(id.length<2) {
  			alert("아이디 또는 패스워드를 입력하세요.");
  			$("#inputId").focus();
  			return false;
  		}
  		
  		//ajax
  		$.ajax({
  			url:"js/member.json",
  			type:"post",
  			data:{"id":"aaa"},
  			dataType:"json",
  			success:function(data){
  				check=0;
  				for(var mem of data){
  					if(mem.id==id && mem.pw==pw){
  						alert("로그인이 되었습니다.");
  						$("#nickName").val(mem.nickName);
  						check=1;
  						login.submit();
  					}//if
  				}//for
  				
  				if(check==0) {
  					alert("아이디 또는 패스워드가 일치하지 않습니다. 다시 입력하세요.");
  					$("#inputId").focus();
  					return false;
  				}
  				
  			},
  			error: function(){
  				alert("데이터 가져오기 실패");
  			}
  		});//ajax
  		
  		
  	}//loginBtn()
  </script>
</head>
<!-- header 시작 -->
<%@include file="header.jsp" %>
<!-- header 끝 -->
  <section>
    <h1>로그인</h1>

    <article id="category">
      <ul>
        <li class="selected">회원 로그인</li>
        <li>비회원 주문조회</li>
      </ul>  
    </article>

    <form action="doLogin.jsp" name="login" method="post">
      <input type="hidden" name="nickName" id="nickName">
      <div class="id">
        <input type="text" name="id" id="inputId" size="30" placeholder="CJ ONE 통합아이디 6~20자">
      </div>
      <div class="pw">
        <input type="text" name="pw" id="inputPw" size="45" placeholder="비밀번호 영문, 특수문자, 숫자혼합 8~12자">
      </div>

      <div id="save">
        <div class="save"></div>
        <span>아이디 저장</span> <!-- 쿠키 이용 -->
      </div>
  
      <div id="find">
        <span>아이디 찾기</span> <span class="separator">|</span> <span>비밀번호 찾기</span>
      </div>

      <button type="button" onclick="loginBtn()">로그인</button>
    </form>

    <ul class="login-icons">
      <li class="phone"></li>
      <li class="kakao"></li>
      <li class="naver"></li>
      <li class="facebook"></li>
    </ul>

    <div class="sign-up-info">
      <h3>CJ ONE 통합회원이 아니신가요?</h3>
      <p>CJ ONE 통합회원으로 가입하시면 CJ제일제당의 다양한 서비스(COOKIT, CJ THE MARKET, CJ제일제당 홈페이지)를 이용하실 수 있습니다.</p>
      <div class="sign-up">CJ ONE 통합회원 신규가입하기 <div class="arrow">&emsp;</div></div>
    </div>
  </section>
<!-- footer시작 -->
<%@include file="footer.jsp" %>
  <!-- footer 끝 -->
</body>
</html>
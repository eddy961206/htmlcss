<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!DOCTYPE html>
<html>
	<head>
	    <meta charset="UTF-8">
	    <title>로그인</title>
	    <link rel="stylesheet" href="css/style1.css">
	    <!-- 제이쿼리 필수 링크!!!!  -->
	    <script src="http://code.jquery.com/jquery-latest.min.js"></script> 
	    <script>
	    	function checkBtn(){
	    		var idVal = $("#uId").val();
	    		var pwVal = $("#uPw").val();
	    		
	    		if(idVal == "" || idVal == null) {
	    			alert("아이디를 입력해주세요.");
	    			$("#uId").focus();
	    			return false; 
	    		} 
	    		if(pwVal == "" || pwVal == null) {
	    			alert("패스워드를 입력해주세요.");
	    			$("#uPw").focus();
	    			return false;
	    		} 
    			frm.submit();
    			//document.frm.submit(); // 이게 정석
	    	}
	    </script>
	</head>
	<body>
		<div id="wrap">
		    <div id="header">
		        <h1>
		            <a href="#" id="h_logo"></a>
		        </h1>
		    </div>
		    <div id="container">
		        <div id="content">
		            <div style="margin-bottom: 7px"></div>
		            <form action="s01" method="post" name="frm">
		                <fieldset style="border: 0">
		                    <div class="id_area">
		                        <div class="input_row" id="id_area">
		                            <span class="input_box">
		                                <input type="text" name="id" id="uId" class="int" placeholder="아이디">
		                            </span>
		                        </div>
		                    </div>
		                    <div class="pw_area">
		                        <div class="input_row" id="pw_area">
		                            <span class="input_box">
		                                <input type="text" name="pw" id="uPw" class="int" placeholder="비밀번호">
		                            </span>
		                        </div>
		                    </div>
		                    <input class="btn_login" type="button" onclick="checkBtn()" value="로그인">
		                </fieldset>
		            </form>
		        </div>
		    </div>
		</div>
	</body>
</html>
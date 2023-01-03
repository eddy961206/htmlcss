$(function() {
	//------------------페이지 로딩시 바로 실행-----------------------
	var nameChk = /^[ㄱ-ㅎ|ㅏ-ㅣ|가-힣]{2,}$/;
	var idChk = /^[a-zA-Z]{1}[a-zA-Z0-9_]{3,15}$/;
	var pwChk = /^(?=.*[a-zA-Z])(?=.*[0-9])(?=.*[!@#$%^&*()]).{5,}$/;
	var f_tellChk = /^[0-9]{3}$/;
	var m_tellChk = /^[0-9]{3,4}$/;
	var l_tellChk = /^[0-9]{4}$/;

	//생일 관련
	var today = new Date();
	var year = today.getFullYear();
	// 1900 ~ 현재년도까지 연 생성
	var yearData = "<option selected>선택</option>";
	for (var i = year; i >= 1900; i--) {
		yearData += "<option value='" + i + "' id='"+ "year" + i +"'>" + i + "</option>";
	}
	$("#birth_year").html(yearData);

	// 1~12월까지 월 생성
	var monthData = "<option selected>선택</option>";
	for (var i = 1; i <= 12; i++) {
		monthData += "<option value='" + i + "' id='"+ "month" + i + "'>" + i + "</option>";
	}
	$("#birth_month").html(monthData);

	// 1 ~ 31일 까지 일 생성
	var dayData = "<option selected>선택</option>";
	for (var i = 1; i <= 31; i++) {
		dayData += "<option value='" + i + "' id='"+ "day" + i + "'>" + i + "</option>";
	}
	$("#birth_day").html(dayData);

	//--------------------페이지 로딩시 실행 끝----------------------

	//-----------------------버튼 클릭시 실행-------------------------

	// id 정규표현식 체크
	$("#id").keyup(function(){
		var id = $("#id").val();
		if (!idChk.test(id)) {
			$("#idChkTxt").css("color","red");
			$("#idChkTxt").text("첫글자는 영문자,특수문자는 _만 가능합니다.");
			return false;
		} else {
			$("#idChkTxt").css("color","blue");
			$("#idChkTxt").text("중복확인을 꼭 해주세요!");
		}
	});
	
	// 아이디 중복확인 버튼 클릭 시
	$("#idChkBtn").click(function() {
		// 입력받은 아이디를 json파일의 아이디와 중복확인
		$.ajax({
			url: "js/member.json",
			type: "post",
			data: { "id": $("#id").val() },
			dataType: "json",
			success: function(data) {
				for (var i of data) {
					if ($("#id").val() == i.id) {
						$("#idChkTxt").css("color", "red");
						$("#idChkTxt").text("아이디가 존재합니다. 다른 아이디를 사용하세요.");
						return false;
					} else {
						$("#idChkTxt").css("color", "blue");
						$("#idChkTxt").text("아이디를 사용하셔도 좋습니다.");
					}
				}
			},
			error: function() {
				alert("데이터 가져오기 실패");
			}
		});
	}); //$("#idChkBtn").click 끝


	// pw체크
	$("#pw1").keyup(function() {
		var pw1 = $("#pw1").val();
		if (!pwChk.test(pw1)) {
			$("#pw1ChkTxt").css("color", "red");
			$("#pw1ChkTxt").text("특수문자,영문자,숫자 1개이상 입력 !!");
		} else {
			$("#pw1ChkTxt").css("color", "blue");
			$("#pw1ChkTxt").text("정상적으로 입력하셨습니다!!");
		}
	}); // $("#pw1").keyup 끝

	// pw와 pw2 같은지 체크
	$("#pw2").keyup(function() {
		var pw1 = $("#pw1").val();
		var pw2 = $("#pw2").val();
		if (pw1 != pw2) {
			$("#pw2ChkTxt").text("패스워드가 일치하지 않습니다. 다시 확인하세요.");
			$("#pw2ChkTxt").css("color", "red");
		} else {
			$("#pw2ChkTxt").css("color", "blue");
			$("#pw2ChkTxt").text("패스워드가 일치합니다!");
		}
	}); //$("#pw2ChkTxt").click 끝

	//email 선택시 인풋박스에 값 대입
	$("#selectMail").change(function() {
		if ($("#selectMail").val() == "") {
			$("#mail_tail").prop("readonly", false);
			$("#mail_tail").val("").attr("placeholder","이메일을 직접 입력해주세요.").focus();
			return false; // return false 하는 건 if를 빠져나가고자 하는 게 아니라 change함수 빠져나가려고.
							//즉 아래 코드는 실행 안하겠다는 의미
		} 
		$("#mail_tail").val($("#selectMail").val());
		$("#mail_tail").prop("readonly", true);
		
		
	}); //$("#selectMail").change 끝

	//주소 입력
	$("#daumZip").click(function() {
		new daum.Postcode({
			oncomplete: function(data) {
				$("#f_postal").val(data.zonecode);
				$("#address1").val(data.address);
			} 
		}).open();
	}); ////다음주소찾기 연결 끝

	// 가입하기 버튼 클릭시 name체크,전화번호체크
	$("#submitBtn").click(function() {
//		var name = $("#name").val();
//		if (!nameChk.test(name)) {
//			alert("이름은 두 자리 이상의 한글만 가능합니다.");
//			return false;
//		}
//
//		var f_tell = $("#f_tell").val();
//		if (!f_tellChk.test(f_tell)) {
//			alert("전화번호 첫번째 칸은 3자리의 숫자만 가능합니다.");
//			$("#f_tell").focus();
//			return false;
//		} 
//		var m_tell = $("#m_tell").val();
//		if (!m_tellChk.test(m_tell)) {
//			alert("전화번호 두번째 칸은 3에서 4자리의 숫자만 가능합니다.");
//			$("#m_tell").focus();
//			return false;
//		}
//		var l_tell = $("#l_tell").val();
//		if (!l_tellChk.test(l_tell)) {
//			alert("전화번호 세번째 칸은 4자리의 숫자만 가능합니다.");
//			$("#l_tell").focus();
//			return false;
//		}
//
//
//		//check가 3개 이상 체크를 해야 함
//		if($("input:checkbox[name=hobbys]:checked").length > 0){
//			if ($("input:checkbox[name=hobbys]:checked").length < 3) {
//				alert("취미를 3개 이상 체크를 하셔야 합니다.");
//				return false;
//			}
//		} 
		
		alert("회원가입이 완료되었습니다.");
		agree.submit();


	}); // $("#submitBtn").click 끝
	
	// 윤달있는 연도 찾아서 당해 2월은 29일로 설정
	// 1. 년도가 4로 나눠지며, 100으로 나눌때 나머지 0이 아니어야 함.
	// 2. 또는 400으로 나눌때 나머지가 0인 해.
	var monthArr = [31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31];
	$("#birth_year").change(function(){
		var selectedYear = $("#birth_year").val();
		if ((selectedYear % 4 == 0 && selectedYear % 100 != 0) || selectedYear % 400 == 0) {
			monthArr[1] = 29;
		} else {
			monthArr[1] = 28;
		}
	});
	
	// 월 변경시 일 수 바쀠게
	$("#birth_year, #birth_month").change(function() {
		var monthDate = 0;
		monthDate = monthArr[$("#birth_month").val() - 1];
		changeMonth(monthDate);
	}); // $("#birth_month").change 끝
	
	
	//-----------------------버튼 클릭시 실행 끝 -------------------------

});//제이쿼리 $(function({})) 끝

// 일 수 option태그 생성하는 changeMonth함수
function changeMonth(monthDate) {
	var dayData = "<option selected>선택</option>";
	for (var i = 1; i <= monthDate; i++) {
		dayData += "<option value='" + i + "'>" + i + "</option>";
	}
	$("#birth_day").html(dayData);
}//changeMonth()함수

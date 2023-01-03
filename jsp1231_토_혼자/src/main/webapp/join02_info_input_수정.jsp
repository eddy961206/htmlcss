<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("utf-8"); %>
<jsp:useBean id="member" class="com.java.ex.Member" scope="session"/>
<%-- <jsp:setProperty name="member" property="*"/> --%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<script src="http://code.jquery.com/jquery-latest.min.js" ></script>
		<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
		<script src="js/js1231_혼자.js"></script>
		<link rel="stylesheet" type="text/css" href="css/style_header.css">
		<link rel="stylesheet" type="text/css" href="css/style_join02_info_input.css">
		<link rel="stylesheet" type="text/css" href="css/style_footer.css">
		<title>회원가입 - 회원정보입력</title>
	</head>
	<body>
		<header>
			<div id="nav_up">
				<ul>
					<li><a href="#">회원가입</a></li>
					<li><a href="#">로그인</a></li>
					<li><a href="#">고객행복센터</a></li>
					<li><a href="#">배송지역검색</a></li>
					<li><a href="#">기프트카드 등록</a></li>
				</ul>
			</div>	
			<nav>
				<a href="#"></a>
				<ul>
					<li><a href="#">COOKIT소개</a></li>
					<li><a href="#">COOKIT메뉴</a></li>
					<li><a href="#">리뷰</a></li>
					<li><a href="#">이벤트</a></li>
					<li><a href="#">MY쿡킷</a></li>
				</ul>
				<ul>
					<li>
						<a href="#"><span>장바구니</span></a>
					</li>
					<li>
						<a href="#"><span>메뉴찾기</span></a>
					</li>
				</ul>
			</nav>
		</header>
		
		
		<section>
			<form name="agree" method="post" action="enroll_result.jsp">
				<div id="subBanner"></div>
				<div id="locationN">
					<ul>
						<li>HOME</li>
						<li>회원가입</li>
						<li>회원정보입력</li>
					</ul>
				</div>
				
				<div id="sub_top_area">
					<h3>회원가입</h3>
				</div>
				
				<div id="join_step_div">
					<ul>
						<li>
							<span>STEP.1</span>
							<p>약관동의</p>
						</li>
						<li>
							<span>STEP.2</span>
							<p>회원정보</p>
						</li>
						<li>
							<span>STEP.3</span>
							<p>회원가입완료</p>
						</li>
					</ul>
				</div>
				
				<h4>
					필수 정보 입력 
					<span>(* 항목은 필수 항목입니다.)</span>
				</h4>
				<fieldset class="fieldset_class">
					<dl id="join_name_dl">
						<dt>
							<div></div>
							<label for="name">이름</label>
						</dt>
						<dd>
							<input type="text" id="name" name="name" value=<jsp:getProperty name="member" property="name"/> />  * 두자리 이상의 한글만 입력 가능합니다.
						</dd>
					</dl>
					
					<dl id="join_id_dl">
						<dt>
							<div></div>
							<label for="id">아이디</label>
						</dt>
						<dd>
							<input type="text" id="id" name="id" value=<jsp:getProperty name="member" property="id"/>  />
							<input type="button" id="idChkBtn" value="중복확인"/>
							<span id="idChkTxt" style="color:blue;">중복확인을 꼭 해주세요!</span>
							<span>* 4~16자리의 영문, 숫자, 특수기호(_)만 사용하실 수 있습니다.(첫 글자는 영문)</span>
						</dd>
					</dl>
					<dl id="join_pw1_dl">
						<dt>
							<div></div>
							<label for="pw1">비밀번호</label>
						</dt>
						<dd>
							<input type="text" id="pw1" name="pw1" value=<jsp:getProperty name="member" property="pw"/>  />
							<span id="pw1ChkTxt">비밀번호를 입력하세요.</span>
							<span>영문, 숫자, 특수문자 모두 조합 시 8자리 이상 입력</span>
						</dd>
					</dl>
					<dl id="join_pw2_dl">
						<dt>
							<div></div>
							<label for="pw2">비밀번호 확인</label>
						</dt>
						<dd>
							<input type="password" id="pw2" name="pw2" />
							<span id="pw2ChkTxt">비밀번호가 같은지 확인해주세요.</span>
						</dd>
					</dl>
					<dl id="join_mail_dl">
						<dt>
							<div></div>
							<label for="mail_id">이메일</label>
						</dt>
						<dd>
							<input type="text" id="mail_id" name="mail_id" value='<jsp:getProperty name="member" property="mail_id"/>' />
							<span>@</span>
							<input type="text" id="mail_tail" name="mail_tail">
							<select name="selectMail" id="selectMail" >
								<option value="" >직접입력</option>
								<option value="gmail.com" 
								<% if(request.getParameter("mail_tail").equals("gmail.com")) out.println("selected");%>>
								지메일
								</option>
								<option value="daum.net" 
								<% if(request.getParameter("mail_tail").equals("daum.net")) out.println("selected"); %>>
								한메일(다음) 
								</option>
								<option value="naver.com" 
								<% if(request.getParameter("mail_tail").equals("naver.com")) out.println("selected"); %>>
								네이버
								</option>
								<option value="nate.com" 
								<% if(request.getParameter("mail_tail").equals("nate.com")) out.println("selected"); %>>
								네이트
								</option>
							</select>
						</dd>
					</dl>
					
					<dl id="join_address_dl">
						<dt> 
							<div></div>
							<label for="">주소</label>
						</dt>
						<dd>
							<input type="text" id="f_postal" name="f_postal"  value=<jsp:getProperty name="member" property="zipcode"/> />
							<input type="button" id="daumZip" value="우편번호"/>
							<input type="text" id="address1" name="address1" value=<jsp:getProperty name="member" property="address1"/>  />
							<input type="text" id="address2" name="address2" value=<jsp:getProperty name="member" property="address2"/>  />
						</dd>
						
					</dl>
					
					<dl id="join_tell_dl">
						<dt>
							<div></div>
							<label for="f_tell">휴대전화</label>
						</dt>
						<dd>
							<input type="text" id="f_tell" name="f_tell" value=<jsp:getProperty name="member" property="f_tell"/> />
							<span> - </span>
							<input type="text" id="m_tell" name="m_tell" value=<jsp:getProperty name="member" property="m_tell"/> />
							<span> - </span>
							<input type="text" id="l_tell" name="l_tell" value=<jsp:getProperty name="member" property="l_tell"/> />
						</dd>
					</dl>
					<dl id="join_birth_dl">
						<dt>
							<div></div>
							<label for="birth_year">생년월일</label>
						</dt>
						<dd>
							<select id="birth_year" name="birth_year" >
							    <!-- 1900년도 부터 현재년도 추가 -->
							</select>
							<span>년</span>
							<select id="birth_month" name="birth_month"  >
								<!-- 1월 부터 12월 추가 -->
							</select>
							<span>월</span>
							<select id="birth_day" name="birth_day"  >
								<option selected>선택</option>
								<option value="1">1</option>
							</select>
							<span>일</span>
							<div>
								<input type="radio" name="calendar" id="solar" value="solar" <%if(request.getParameter("calendar").equals("solar")) out.println("checked"); %>/>
								<label for="solar">양력</label>
								<input type="radio" name="calendar" id="lunar" value="lunar" <%if(request.getParameter("calendar").equals("lunar")) out.println("checked"); %>/>
								<label for="lunar">음력</label>
							</div>
						</dd>
					</dl>
					<dl id="join_gender_dl">
						<dt>
							<div></div>
							<label for="">성별</label>
						</dt>
						<dd>
							<div>
								<input type="radio" name="gender" id="male" value="male" <%if(request.getParameter("gender").equals("male")) out.println("checked"); %>/>
								<label for="male">남성</label>
								<input type="radio" name="gender" id="female" value="female" <%if(request.getParameter("gender").equals("female")) out.println("checked"); %>/>
								<label for="female">여성</label>
							</div>
						</dd>
					</dl>
					<dl id="join_newsletter_dl">
						<dt>
							<div></div>
							<label for="">뉴스레터 수신여부</label>
						</dt>
						<dd>
							<span>이메일을 통한 상품 및 이벤트 정보 수신에 동의합니다.</span>
							<div>
								<input type="radio" name="newletter" id="newletter_y" value="yes" <%if(request.getParameter("newletter").equals("yes")) out.println("checked"); %>/>
								<label for="newletter_y">예</label>
								<input type="radio" name="newletter" id="newletter_n" value="no" <%if(request.getParameter("newletter").equals("no")) out.println("checked"); %>/>
								<label for="newletter_n">아니오</label>
							</div>
						</dd>
					</dl>
					<dl id="join_sms_dl">
						<dt>
							<div></div>
							<label for="">SMS 수신여부</label>
						</dt>
						<dd>
							<span>이메일을 통한 상품 및 이벤트 정보 수신에 동의합니다.</span>
							<div>
								<input type="radio" name="sms" id="sms_y" value="yes" <%if(request.getParameter("sms").equals("yes")) out.println("checked"); %>/>
								<label for="sms_y">예</label>
								<input type="radio" name="sms" id="sms_n" value="no" <%if(request.getParameter("sms").equals("no")) out.println("checked"); %>/>
								<label for="sms_n">아니오</label>
							</div>
						</dd>
					</dl>
				</fieldset>

								
				<h4>
					분양 회원 정보 입력 
					<span>(다구좌 회원일 경우 가지고 계신 카드번호 중 하나를 입력해 주시면 됩니다)</span>
				</h4>
				<fieldset class="fieldset_class">
					<dl id="join_member_number_dl">
						<dt>
							<label for="m_number">회원번호</label>
						</dt>
						<dd>
							<input type="text" name="m_number" id="m_number" value=<jsp:getProperty name="member" property="m_number"/>/>
							<span>하이픈(-)이나 띄어쓰기 없이 입력해 주시기 바랍니다.</span>
						</dd>
					</dl>
					<dl id="join_verification_number_dl">
						<dt>
							<label for="v_number">회원인증번호</label>
						</dt>
						<dd>
							<input type="text" name="v_number" id="v_number" value=<jsp:getProperty name="member" property="v_number"/>/>
							<span>숫자 4자리 입력</span>
						</dd>
					</dl>
				</fieldset>
				
				<h4>
					선택 입력 정보 
				</h4>
				<fieldset class="fieldset_class">
					<dl id="join_job_dl">
						<dt>
							<label for="job">직업</label>
						</dt>
						<dd>
							<select id="job" name="job">
								<option selected>선택</option>
								<option value="worker" <%if(request.getParameter("job").equals("worker")) out.println("selected"); %>>회사원</option>
								<option value="self" <%if(request.getParameter("job").equals("self")) out.println("selected");%>>자영업자</option>
								<option value="freelancer" <%if(request.getParameter("job").equals("freelancer")) out.println("selected");%>>프리랜서</option>
								<option value="housewife" <%if(request.getParameter("job").equals("housewife")) out.println("selected");%>>전업주부</option>
								<option value="student" <%if(request.getParameter("job").equals("student")) out.println("selected");%>>학생</option>
								<option value="etc" <%if(request.getParameter("job").equals("etc")) out.println("selected");%>>기타</option>						
							</select>
						</dd>
					</dl>
					<dl id="join_marital_status_dl">
						<dt>
							<label for="">결혼여부</label>
						</dt>
						<dd>
							<input type="radio" name="marital_status" id="marital_status_y" value="yes" <%if(request.getParameter("marital_status").equals("yes")) out.println("checked"); %>/>
							<label for="marital_status_y">예</label>
							<input type="radio" name="marital_status" id="marital_status_n" value="no" <%if(request.getParameter("marital_status").equals("no")) out.println("checked"); %>/>
							<label for="marital_status_n">아니오</label>
						</dd>
					</dl>
					<script> 
						$(function(){ // 페이지 한번 더 읽어들여야 가져올 수 있음
							// 로딩시 생년월일 자동선택
							$("#birth_year").val($("#year<%=request.getParameter("birth_year")%>").val());
							$("#birth_month").val($("#month<%=request.getParameter("birth_month")%>").val());
							$("#birth_day").val($("#day<%=request.getParameter("birth_day")%>").val());
							
							// 로딩시 이메일 자동선택
							if($("#selectMail").val()=="") {
								$("#mail_tail").val('<%= request.getParameter("mail_tail") %>');
							} else {
								$("#mail_tail").val($("#selectMail").val());
								$("#mail_tail").prop("readonly", true);
							}
						});// $(function(){}) 끝
					</script>
					<dl id="join_interests_dl">
						<dt>
							<label for="">관심사</label>
						</dt>
						<dd>
							<ul>
								<li>
									<input type="checkbox" name="hobbys" id="computer" value="computer" <%if(request.getParameter("hobbys").contains("computer")) out.println("checked"); %>/>
									<label for="computer">컴퓨터/인터넷</label>
								</li>
								<li>
									<input type="checkbox" name="hobbys" id="movie" value="movie" <%if(request.getParameter("hobbys").contains("movie")) out.println("checked"); %>/>
									<label for="movie">영화/비디오</label>
								</li>
								<li>
									<input type="checkbox" name="hobbys" id="music" value="music" <%if(request.getParameter("hobbys").contains("music")) out.println("checked"); %>/>
									<label for="music">음악</label>
								</li>
								<li>
									<input type="checkbox" name="hobbys" id="shopping" value="shopping" <%if(request.getParameter("hobbys").contains("shopping")) out.println("checked"); %>/>
									<label for="shopping">쇼핑</label>
								</li>
								<li>
									<input type="checkbox" name="hobbys" id="game" value="game" <%if(request.getParameter("hobbys").contains("game")) out.println("checked"); %>/>
									<label for="game">게임</label>
								</li>
								<li>
									<input type="checkbox" name="hobbys" id="culture" value="culture" <%if(request.getParameter("hobbys").contains("culture")) out.println("checked"); %>/>
									<label for="culture">문화/예술</label>
								</li>
								<li>
									<input type="checkbox" name="hobbys" id="parenting" value="parenting" <%if(request.getParameter("hobbys").contains("parenting")) out.println("checked"); %>/>
									<label for="parenting">육아/아동</label>
								</li>
								<li>
									<input type="checkbox" name="hobbys" id="cooking" value="cooking" <%if(request.getParameter("hobbys").contains("cooking")) out.println("checked"); %>/>
									<label for="cooking">요리</label>
								</li>
								<li>
									<input type="checkbox" name="hobbys" id="interier" value="interier" <%if(request.getParameter("hobbys").contains("interier")) out.println("checked"); %>/>
									<label for="interier">인테리어</label>
								</li>
								<li>
									<input type="checkbox" name="hobbys" id="leisure" value="leisure" <%if(request.getParameter("hobbys").contains("leisure")) out.println("checked"); %>/>
									<label for="leisure">레저/여가</label>
								</li>
								<li>
									<input type="checkbox" name="hobbys" id="health" value="health" <%if(request.getParameter("hobbys").contains("health")) out.println("checked"); %>/>
									<label for="health">건강/다이어트</label>
								</li>
								<li>
									<input type="checkbox" name="hobbys" id="fashion" value="fashion" <%if(request.getParameter("hobbys").contains("fashion")) out.println("checked"); %>/>
									<label for="fashion">패션/미용</label>
								</li>
							</ul>
						</dd>
					</dl>
				</fieldset>
				<div id="info_input_button">
					<input type="reset" value="취소하기" />
					<input type="button" id="submitBtn" value="가입하기" />
				</div>
				
			</form>
		</section>
		
		
		
		
		
		
		
		<footer>
			<div id="footer_wrap">
				<div id="footer_cont">
					<div id="fl_l">
						<a href="#"></a>
						<p>© COOKIT ALL RIGHTS RESERVED</p>
					</div>
					<div id="fl_c">
						<ul>
							<li><a href="#">이용약관</a></li>
							<li><a href="#">개인정보처리 방침</a></li>
							<li><a href="#">법적고지</a></li>
							<li><a href="#">사업자정보 확인</a></li>
						</ul>
						<div id="fl_c_info">
							<p>씨제이제일제당(주)</p>
							<p>대표이사 : 손경식,강신호,신현재</p>
							<p>사업자등록번호 : 104-86-09535</p>
							<p>주소 : 서울 중구 동호로 330 CJ제일제당 센터 (우) 04560</p>
							<p>통신판매업신고 중구 제 07767호</p>
							<p>개인정보보호책임자 : 조영민</p>
							<p>이메일 : cjon@cj.net</p>
							<p>호스팅제공자 : CJ올리브네트웍스㈜</p>
							<p>고객님은 안전거래를 위해 현금등으로 결제시 LG U+ 전자 결제의 매매보호(에스크로) 서비스를 이용하실 수 있습니다. <a href="#">가입 사실 확인</a></p>
						</div>
					</div>
					<div id="fl_r">
						<span>cj그룹계열사 바로가기 ▼</span>
						<dl>
							<dt>고객행복센터</dt>
								<dd>1688-1920</dd>
						</dl>
						<a href="#">1:1문의</a>						
					</div>
				</div>
			</div>
		
		
		
		</footer>
	</body>
</html>
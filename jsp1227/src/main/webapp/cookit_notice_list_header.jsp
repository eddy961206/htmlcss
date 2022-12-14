<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
  <header>
    <ul>
      <%
      	if(session.getAttribute("sessionId") == null){
      %>
      		<li>회원가입</li> <span>|</span>
            <li><a href="cookit_login.jsp">로그인</a></li> <span>|</span>
      <%} else {%>
      		<li>회원정보</li> <span>|</span>
            <li><a href="cookit_login.jsp">로그아웃</a></li> <span>|</span>
      <%}%>
      <li><a href="cookit_notice_list.jsp">고객행복센터</a></li> <span>|</span>
      <li>배송지역검색</li> <span>|</span>
      <li>기프트카드 등록</li>
    </ul>
  </header>
  <nav>
    <div class="logo"></div>

    <div id="search">
      <div class="search"></div><br>
      <span>메뉴찾기</span>
    </div>

    <div id="cart">
      <div class="cart"></div><br>
      <span>장바구니</span>
    </div>

    <div class="nav-menu">
      <ul>
        <li>COOKIT소개</li>
        <li>COOKIT 메뉴</li>
        <li>리뷰</li>
        <li><a href="cookit_event_list.jsp">이벤트</a></li>
        <li>MY쿡킷</li>
      </ul>  
    </div>
  </nav>
package com.java.ex;
//서블릿은 f11 재부팅 해야지만 반영됨. jsp는 안그래도 됨
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
//맵핑
@WebServlet("/wn") //맵핑방법 2가지 : 1. 이것처럼 어노테이션 사용(대부분) 2. web.xml에다 선언.
public class webCon extends HttpServlet {

	// doGet과 doPost 동시에 사용되게 하려고 한곳에 모아두는. 각각에 doAction호출
	protected void doAction(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("doAction");
				
	}
	
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("get방식으로 접근했습니다."); //페이지 들어가거나 f5누르면 실행
		doAction(request,response);
	}

	// 웹에서 유일하게 post로 들어올 수 있는 방법 : form태그에서 method를 post로 해놨을 때. 나머지는 다 get.
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("post방식으로 접근했습니다.");
		doAction(request,response);
	}
	

}

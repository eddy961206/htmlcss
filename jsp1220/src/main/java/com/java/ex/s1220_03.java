package com.java.ex;

import java.io.IOException;
import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/s03")
public class s1220_03 extends HttpServlet {
	
	public void init(ServletConfig config) throws ServletException {
		//servlet 최초실행이 될 때 1번 실행
		System.out.println("Servlet 실행 될때 init() 실행됐습니다.");
	}

	public void destroy() {
		// servlet이 자원 해제될 때 1번 실행
		System.out.println("Servlet 종료될 때 destroy() 실행됐습니다.");
	}

	protected void doAction(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("doAction");
	}
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("doGet");
		doAction(request, response);
	}
		

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("doPost");
		doAction(request, response);
	}

}

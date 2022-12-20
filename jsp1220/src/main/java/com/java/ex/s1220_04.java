package com.java.ex;

import java.io.IOException;

import javax.annotation.PostConstruct;
import javax.annotation.PreDestroy;
import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/s04")
public class s1220_04 extends HttpServlet {
	
	@PostConstruct
	private void postConstruct_Start() {
		System.out.println("선처리 PostConstruct() 실행");
	}
	
	@PreDestroy
	private void preDestroy_end(){
		System.out.println("후처리 PreDestroy() 실행");
	}
	
	public void init(ServletConfig config) throws ServletException {
		System.out.println("init() 실행");
	}
	
	public void destroy() {
		System.out.println("destroy() 실행");
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

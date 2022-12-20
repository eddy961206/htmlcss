package com.java.ex;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.swing.text.html.HTML;

// html에서 form 만들어 -> input text박스 1개, button 1개  
// 버튼 클릭하면 자바스크립트로 alert('테스트') 띄워보세요

@WebServlet("/s02")

public class s1220_02 extends HttpServlet {
	
	protected void doAction(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("doAction");
		request.setCharacterEncoding("utf-8"); //form post 통해서 서버로 정보들이 request 로 넘어올 때 넘어온 한글 데이터가 깨지지 않기위해.
		response.setContentType("text/html; charset=utf-8");
		PrintWriter writer = response.getWriter();
		
		writer.println("<html>");
		writer.println("<head>");
		writer.println("<script>");
		writer.println("function btn(){alert('테스트');}");
		writer.println("</script>");
		writer.println("</head>");
		writer.println("<body>");
		writer.println("<form action='' method='get'><input type='text' name='name'><button type='button' onclick='btn()'>버튼</button></form>");
		writer.println("</body>");
		writer.println("</html>");
		
		writer.close();
		
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

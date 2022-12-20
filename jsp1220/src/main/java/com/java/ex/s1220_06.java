package com.java.ex;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Arrays;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/s06")
public class s1220_06 extends HttpServlet {
	
	protected void doAction(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String name="", id="", pw="", pwChk="", email="", addr1="", addr2="", gender="", grade="";
		String[] hobbys = null;
		
		System.out.println("doAction");
		request.setCharacterEncoding("utf-8");
		
		name = request.getParameter("name");
		id = request.getParameter("id");
		pw = request.getParameter("pw");
		pwChk = request.getParameter("pwChk");
		email = request.getParameter("email");
		addr1 = request.getParameter("addr1");
		addr2 = request.getParameter("addr2");
		gender = request.getParameter("gender");
		hobbys = request.getParameterValues("hobbys");
		grade = request.getParameter("grade");
		
		System.out.println("이름 : "+name);
		
		response.setContentType("text/html; charset=utf-8");
		PrintWriter writer = response.getWriter();
		writer.println("<html><head>");
		writer.println("<style>table,td{border:1px solid black; border-collapse:collapse;}</style>");
		writer.println("</head><body>");
		writer.println("<h2>회원정보</h2>");
		writer.println("<table><tr><td>name</td><td>"+ name +"</td></tr>");
		writer.println("<tr><td>id</td><td>"+ id +"</td></tr>");
		writer.println("<tr><td>pw</td><td>"+ pw +"</td></tr>");
		writer.println("<tr><td>email</td><td>"+ email +"</td></tr>");
		writer.println("<tr><td>gender</td><td>"+ gender +"</td></tr>");
		writer.println("<tr><td>address1</td><td>"+ addr1 +"</td></tr>");
		writer.println("<tr><td>address2</td><td>"+ addr2 +"</td></tr>");
		writer.println("<tr><td>hobbys</td><td>"+ Arrays.toString(hobbys) +"</td></tr>");
		writer.println("<tr><td>grade</td><td>"+ grade +"</td></tr>");
		writer.println("</table></body></html>");
		
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

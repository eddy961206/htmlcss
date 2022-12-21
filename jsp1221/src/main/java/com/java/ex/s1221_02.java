package com.java.ex;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/s01")
public class s1221_02 extends HttpServlet {
	
	protected void doAction(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8"); //한글처리
		System.out.println("doAction");
		
		String name = "", id = "",pw1 = "",pw2 = "",mail_id = ""
		,f_tell = "",m_tell = "",l_tell = "",birth_year = "",birth_month = "", birth_day = "",
		gender = "",sms = "",m_number = "",v_number = "",job = "",marital_status = "";
		String[] hobbys = null;
		name = request.getParameter("name");
		id = request.getParameter("id");
		pw1 = request.getParameter("pw1");
		pw2 = request.getParameter("pw2");
		mail_id = request.getParameter("mail_id");
		f_tell = request.getParameter("f_tell");
		m_tell = request.getParameter("m_tell");
		l_tell = request.getParameter("l_tell");
		birth_year = request.getParameter("birth_year");
		birth_month = request.getParameter("birth_month");
		birth_day = request.getParameter("birth_day");
		gender = request.getParameter("gender");
		sms = request.getParameter("sms");
		m_number = request.getParameter("m_number");
		v_number = request.getParameter("v_number");
		job = request.getParameter("job");
		marital_status = request.getParameter("marital_status");
		hobbys = request.getParameterValues("hobbys");
		
		response.setContentType("text/html; charset=utf-8");
		PrintWriter writer = response.getWriter();
		writer.println("<html><head></head><body>");
		writer.println("<h2>"+ name + "</h2>");
		writer.println("<h2>"+ id + "</h2>");
		writer.println("<h2>"+ pw1 + "</h2>");
		writer.println("<h2>"+ pw2 + "</h2>");
		writer.println("</body></html>");
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

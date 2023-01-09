<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>오라클 연결</title>
	</head>
	<body>
		<%! 
			Connection conn;
			Statement stmt;
			ResultSet rs;
			
			String driver = "oracle.jdbc.driver.OracleDriver";
			String url = "jdbc:oracle:thin@localhost:1521:xe";
			String uid = "orauser";
			String upw = "1111";
			String query = "select * from member";
		%>
		<%	
			try{
				Class.forName(driver); // OracleDriver 로딩  --> sql구문 실행시켰다는 의미
				conn = DriverManager.getConnection(url, uid, upw); //Connection 객체 생성 --> orauser접속에 접속
				stmt = conn.createStatement(); //statement객체 squl실행 --> 워크시트 창이 뜨는 것
				rs = stmt.executeQuery(query); //sql구문 실행 --> 쿼리 적고 실행
				
				while(rs.next()){
					String id = rs.getString("id"); //varchar2로 되있으니까 getString으로 받
					String pw = rs.getString("pw");
					String name = rs.getString("name");
					String phone = rs.getString("phone");
					
					out.println("아이디 : " + id + ", 패스워드 : " + pw + " ,이름 : "+name+", 전화번호 : " + phone);
					
				}
			} catch(Exception e) {
				try {
					if(rs != null) rs.close();
					if(stmt != null) stmt.close();
					if(conn != null) conn.close();
				} catch(Exception e2) {
					
				}
			}
		%>
	</body>
</html>
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
		<title>Oracle</title>
	</head>
	<body>
		<%!
			Connection conn;
			Statement stmt;
			ResultSet rs;
			String id,pw,name,phone;
			int employee_id; //오라클에서 desc로 데이터 타입 확인 필요
			String emp_name;
			double salary,realsalary;
		%>
		<%
			try {
				Class.forName("oracle.jdbc.driver.OracleDriver"); //sql Developer 열기
				conn = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe", "orauser", "1111");  //사용자이름과 비번을 입력해서 커넥트
				stmt = conn.createStatement(); // 워크시트 창 띄워줌
				// employees-사원번호, 사원명, 월급, (월급+월급*커미션) 출력
// 				String query = "select * from members";
				String query = "select employee_id, emp_name, salary, salary + nvl(salary*commission_pct,0)realsalary from employees";
				rs = stmt.executeQuery(query); // 쿼리문을 실행(F9)누른거나 마찬가지
				
				while(rs.next()){
					employee_id = rs.getInt("employee_id");
					emp_name = rs.getString("emp_name");
					salary = rs.getDouble("salary");
					realsalary = rs.getDouble("realsalary");
					
					out.println("사원번호 : "+employee_id+", 이름 : "+emp_name+", 월급 : "+salary+", 실제월급 : "+ realsalary + "<br>");
					
					
					
				}
				
				
				
			} catch(Exception e) { e.printStackTrace();
			} finally {
				try {
					if(rs!=null) rs.close();  //여는 것의 역순으로 닫아야
					if(stmt!=null) stmt.close();
					if(conn!=null) conn.close();
				} catch(Exception e2){ e2.printStackTrace();}
			}
		
		%>
		
		
	</body>
</html>
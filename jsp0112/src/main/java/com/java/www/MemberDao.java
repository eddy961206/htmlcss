package com.java.www;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

public class MemberDao { //얘는 서블릿 아니라서 request, response 없어.그래서 세션도 못만들어.
	Connection conn = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	Context init = null;
	DataSource ds = null;
	String id,pw,name,phone,gender,hobby;
	String[] hobbys = null;
	int result = 0;
	
	//회원정보 수정 메소드
	public int updateMember(String id2, String pw2, String name2, String phone2, String gender2, String hobby2) {
		try {
			conn = getConnection();
			String query = "update member set name=?,phone=?,gender=?,hobby=? where id=?";
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, name2);
			pstmt.setString(2, phone2);
			pstmt.setString(3, gender2);
			pstmt.setString(4, hobby2);
			pstmt.setString(5, id2);
			result = pstmt.executeUpdate(); // 업데이트 시도 후 0 또는 1 반환
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if(pstmt!=null) pstmt.close(); //업데이트면 받아오는 거 없으니까 rs 없음
				if(conn!=null) conn.close();
			} catch (Exception e2) {
				e2.printStackTrace();
			}
		}
		return result;
	}//updateMember()
	
	
	//회원정보 1명 검색 메소드 (수정용도)
	public MemberDto selectMemberOne(String id) {
		MemberDto mdto = null;
		
		try {
			conn = getConnection(); // 내가 직접 만든 getConnection메소드를 호출하는 것임
			String query = "select * from member where id=?";
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
			if(rs.next()) { //무조건 값 하나만 나옴. 회원정보 수정이니까.
				id = rs.getString("id");
				pw = rs.getString("pw");
				name = rs.getString("name");
				phone = rs.getString("phone");
				gender = rs.getString("gender");
				hobby = rs.getString("hobby");
				mdto = new MemberDto(id,pw,name,phone,gender,hobby);
			}
			
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if(rs!=null) rs.close();
				if(pstmt!=null) pstmt.close();
				if(conn!=null) conn.close();
			} catch (Exception e2) {
				e2.printStackTrace();
			}
		}//try
		return mdto;
	}// selectMemberOne()메소드
	
	
	//회원가입 메소드
	public int insertMember(String id2, String pw2, String name2, String phone2, String gender2, String hobby2) {
		try {
			conn = getConnection(); // 내가 직접 만든 getConnection메소드를 호출하는 것임
			String query = "insert into member values(?,?,?,?,?,?)";
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, id2);
			pstmt.setString(2, pw2);
			pstmt.setString(3, name2);
			pstmt.setString(4, phone2);
			pstmt.setString(5, gender2);
			pstmt.setString(6, hobby2);
			result = pstmt.executeUpdate();
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if(rs!=null) rs.close();
				if(pstmt!=null) pstmt.close();
				if(conn!=null) conn.close();
			} catch (Exception e2) {
				e2.printStackTrace();
			}
		}
		return result; // 0또는 1. db에 정보 입력 성공하면 1, 실패하면 0이 담김.
	}//insertMember()
	
	
	//전체회원리스트 메소드
	public ArrayList<MemberDto> selectMemberAll(){
		ArrayList<MemberDto> list = new ArrayList<>(); //회원객체(mdto)들을 담을 수 있는 ArrayList 생성.
		
		try { //회원 객체를 list에 담기
			conn = getConnection(); //db와 연결. 리소스 많이 잡아먹으니까 필요할 때만 연결하는게 좋아 // 내가 직접 만든 getConnection메소드를 호출하는 것임
			
			String query = "select * from member";
			pstmt = conn.prepareStatement(query);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				id = rs.getString("id");
				System.out.println("id : "+id);
				pw = rs.getString("pw");
				name = rs.getString("name");
				phone = rs.getString("phone");
				gender = rs.getString("gender");
				hobby = rs.getString("hobby");
				list.add(new MemberDto(id,pw,name,phone,gender,hobby)); //회원객체들 만들어서 list에 다 담기
			}
			
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if(rs!=null) rs.close();
				if(pstmt!=null) pstmt.close();
				if(conn!=null) conn.close();
			} catch (Exception e2) {
				e2.printStackTrace();
			}
		}
		return list; //회원 객체들이 가득 담긴 리스트를 리턴
	}//selectMemberAll()메소드
	
	// 로그인 확인 메소드
	public MemberDto selectLogin(String id, String pw) { //로그인 버튼 클릭시 회원 있는지 확인 용도. 
		MemberDto mdto = new MemberDto(); //빈 회원(멤버) 객체 생성
		try {
			// db연결
			conn = getConnection(); // 내가 직접 만든 getConnection메소드를 호출하는 것임
			String query = "select * from member where id=? and pw=?";
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, id); //여기서 id는 form태그로 넘어온 값임(매개변수로 넘겨받음)
			pstmt.setString(2, pw);
			rs = pstmt.executeQuery(); //쿼리의 결괏값이 rs에 담김
			if(rs.next()) {
				mdto.setId(rs.getString("id")); //mdto 멤버 객체의 인스턴스 변수id에    db에서 받아온 id값을 대입.
				mdto.setPw(rs.getString("pw")); //마찬가지
				mdto.setName(rs.getString("name")); //쿼리에 and name=? 할 필요 없음. 어차피 rs에 다 들어오니까.
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if(rs!=null) rs.close();
				if(pstmt!=null) pstmt.close();
				if(conn!=null) conn.close();
			} catch (Exception e2) {
				e2.printStackTrace();
			}
		}//try-catch 끝
		return mdto; //회원객체 리턴해줌
	}// selectLogin()
	
	
	//Connection 연결 메소드 - conn리턴함
	public Connection getConnection() {
		Connection connection = null;
		try {  
			init = new InitialContext();
			ds = (DataSource)init.lookup("java:comp/env/jdbc/Oracle18c");
			connection = ds.getConnection(); //여기까지 db연결
		} catch (Exception e) {
			e.printStackTrace();
		} 
		/*
			 * finally { try { if(connection!=null) connection.close(); } catch (Exception
			 * e2) { e2.printStackTrace(); } }
		이거까지 하면 커넥션 끊어버리게 됨*/		
		return connection;
	}//getConnection()

	
	
}//MemerDao클래스

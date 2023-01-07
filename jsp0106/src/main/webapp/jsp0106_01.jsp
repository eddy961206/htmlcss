<%@page import="java.util.Arrays"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<%
			String[] str = {"홍길동,4,컴퓨터공학","유관순,1,국문학과","이순신,3,해양학과" }; 
		%>
		<meta charset="UTF-8">
		<title>Insert title here</title>
		<script src="http://code.jquery.com/jquery-latest.min.js"></script>
		<style>
			table,th,td{border:1px solid black; border-collapse:collapse; text-align: center;}
			th,td{width:150px; heigth:40px;}
		</style>
		<script>
		/* (자바스크립트 사용) 
			1. '추가'버튼을 클릭하면  		-어떤 상황/조건일때? (when)
			2. 쭉쭉 추가되어 붙게 하라 		-무엇을 실행?(what) -- 최종 목적. 긴 본문
			3. 각 input 태그에 들어간 값들이 	-누구를 가지고? (who) --대상
			4. 테이블의 아래쪽에 				-어디에? (where)
		*/
		/* 
			생각 순서:
				
				-----------------WHAT의 단계---------------
				0. 목적 파악. 
					큰 그림만. 결과적으로 뭘 원하나? 
							- 값들이 표에 추가되길 원함
							
				1. 어느 조건에 그렇게 되게 할건지 파악.  WHEN
					어느 상황,조건,타이밍에? 
							- '추가'버튼을 클릭할 때.(페이지 로딩되자마자, 글자가 입력되자마자가 될 수도.)
								-$("#addBtn").click(function(){})
				
				2. 무엇을 할건지 파악. (1번의 세부내용) 
					원하는 동작,행위,프로세스? 
							- 데이터 받아오고 => 그걸 html 테이블 태그로 생성 => 테이블에 붙이기 
								$().append()					
				----------------WHAT의 단계 끝---------------			
							
				---------------HOW의 단계----------------
				3. 대상이 누군지 파악 
					누구를 가지고 그렇게(테이블에 붙이기) 할 건가? 
							- 인풋태그들에 들어오는 값들을 가지고.
								$("#name").val()
						
				4. 적용 위치를 파악
					그 누구를(인풋태그들에 들어오는 값들을) 어디다가 적용시킬 건가? 
							- tbody태그에.
								$("#tbody").
				--------------HOW의 단계 끝----------------
				
		*/
			$(function(){
				
				$("#btn").click(function(){ /* 1. '추가'버튼을 클릭하면  		-어떤 상황/조건일때? (when) */
					var inputData="";
					var name = $("#name").val();  
					var grade = $("#grade").val(); /* 3. 각 input 태그에 들어간 값들이 	-대상이 누구? (who) */ 
					var major = $("#major").val(); 
					
					inputData += "<tr><td>"+name+"</td>";
					inputData += "<td>"+grade+"</td>";    	/* 4. '쭉쭉 추가되어서' 	-무엇을 실행?(what) -- 긴 본문 */
					inputData += "<td>"+major+"</td></tr>";
					
					$("#tbody").append(inputData); /* 2. '붙게하라' : append() 3. '테이블의 아래쪽에' : $("#tbody") */
				})//버튼클릭시
				
				var str = [];
				str[0] = '<%= str[0]%>';
				str[1] = '<%= str[1]%>';
				str[2] = '<%= str[2]%>';
				
				var htmlData = "";
				for(var stu of str){
					var stuArr = stu.split(",");
					htmlData += "<tr><td>"+stuArr[0]+"</td>";
					htmlData += "<td>"+stuArr[1]+"</td>";
					htmlData += "<td>"+stuArr[2]+"</td></tr>";
				}
				
				$("#tbody").html(htmlData);
			});
		</script>
	</head>
	<body>
	<label>이름</label>
	<input type="text" id="name"><br> 
	<label>학년</label>
	<input type="text" id="grade"><br> 
	<label>학과</label>
	<input type="text" id="major"><br> 
	<input type="button" id="btn" value="추가">
	<table id="table">
		
			<tr>
				<th>이름</th>
				<th>학년</th>
				<th>학과</th>
			</tr>
			<tbody id="tbody">
				<%-- <% for(String stu:str) {
						String[] stuArr = stu.split(","); 
				%>
				<tr>
					<td><%=stuArr[0] %></td>		
					<td><%=stuArr[1] %></td>		
					<td><%=stuArr[2] %></td>		
				</tr>
				<% } %> --%>
			</tbody>
	</table>	
	</body>
</html>

<%@page import="sub1.User5"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%
	// 전송 데이터 수신
	String name = request.getParameter("name");

	// 수정 데이터 선언
	User5 user5 = null;

	//-----------------------------
	// 데이터베이스 작업 - 수정 데이터 조회
	//-----------------------------
	String host = "jdbc:mysql://127.0.0.1:3306/studydb";
	String user = "jamie010323";
	String pass = "1234";
	
	try {
		// 1) 드라이버 로드
		Class.forName("com.mysql.cj.jdbc.Driver");

		// 2) 데이터베이스 접속
		Connection conn = DriverManager.getConnection(host, user, pass);
				
		// 3) SQL 실행 객체 생성
		String sql = "SELECT * FROM `Use5` WHERE `name` = ?";
		PreparedStatement psmt = conn.prepareStatement(sql);
		psmt.setString(1, name);

		// 4) SQL 실행
		ResultSet rs = psmt.executeQuery();

		// 5) 결과셋처리
		if(rs.next()){
			user5 = new User5();
			user5.setName(rs.getString(1));
			user5.setGender(rs.getString(2));
			user5.setAge(rs.getString(3));
			user5.setAddr(rs.getString(4));
		}

		// 6) 데이터베이스 종료
		rs.close();
		psmt.close();
		conn.close();
		}catch(Exception e){
			e.printStackTrace();
		}
	
%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>user5::수정</title>
	</head>
	<body>
		<h3>User5 수정</h3>
		<a href="/ch05/1_jdbc.jsp">메인</a>
		<a href="/ch05/user5/list.jsp">등록</a>
		
		<form action="/ch05/user5/proc/modify.jsp" method="post">
			<table border="1">
		<tr>
				<td>이름</td>
				<td><input type="text" name="name" placeholder="이름 입력"></td>
			</tr>
			<tr>
				<td>성별</td>
				<td>
					<label><input type="radio" name="gender" value="M">남</label>
					<label><input type="radio" name="gender" value="F">여</label>
				</td>
			</tr>
			<tr>
				<td>나이</td>
				<td><input type="number" name="age" placeholder="나이 입력"></td>
			</tr>
			<tr>
				<td>주소</td>
				<td><input type="text" name="addr" placeholder="주소 입력"></td>
			</tr>
			<tr>				
				<td colspan="2" align="right">
					<input type="submit" value="등록하기">
				</td>
			</tr>
		</table>
	  </form>
	</body>
</html>
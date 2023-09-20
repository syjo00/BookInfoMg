<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file ="DBconnection.jsp" %>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인 및 비번 체크</title>
</head>
<body>
<%
	request.setCharacterEncoding("UTF-8");
	
	String id = request.getParameter("id");
	String pw = request.getParameter("pw");
	
	session.setAttribute("id", request.getParameter("id"));
	session.setMaxInactiveInterval(1800);
	
	
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	String str = "";

	
	try {
		String sql = "select * from login where id =? and pw =?";
		// pstmt 생성
		pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, id);
		pstmt.setString(2, pw);
		
		// sql실행
		rs = pstmt.executeQuery();
		
		if(rs.next()){
			id = rs.getString("id");
			pw = rs.getString("pw");
			
			session.setAttribute("user_id", id);
 			session.setAttribute("user_name", pw); 
 			
			 response.sendRedirect("loginMain.jsp");
		}else { // 로그인 실패
/* 			out.println("아이디와 비밀번호를 확인하세요"); */
 			response.sendRedirect("login_fail.jsp"); 
		}
		
	} catch (Exception e){
		e.printStackTrace();
		response.sendRedirect("login.jsp");
	} finally {
		try{
			if(pstmt != null) pstmt.close();
			if(rs != null) rs.close();
		} catch(Exception e){
			e.printStackTrace();
		}
	}

%>
</body>
</html>
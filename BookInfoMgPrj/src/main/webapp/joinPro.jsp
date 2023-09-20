<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file ="DBconnection.jsp" %>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
	request.setCharacterEncoding("UTF-8");
	
	String id = request.getParameter("id");
	String pw = request.getParameter("pw");
	
	PreparedStatement pstmt = null;
	String str = "";
	
	try {
		String sql = "insert into login values (?,?)";
		pstmt=conn.prepareStatement(sql);
		pstmt.setString(1, id);
		pstmt.setString(2, pw);
		
		pstmt.executeUpdate();
		out.println("회원가입 성공.");
	} catch (Exception e){
		e.printStackTrace();
		out.println("회원가입 실패.");
	} finally {
		if (pstmt != null)
			try {
				pstmt.close();
			} catch (SQLException sqle){
				out.println("pstmt 개체를 닫는데 실패하였습니다.");
			}
	}

%>

<a href="login.jsp">로그인</a>


</body>
</html>
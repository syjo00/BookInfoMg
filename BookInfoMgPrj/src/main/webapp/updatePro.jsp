<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<%@ include file="DBconnection.jsp"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>data 수정 처리</title>
</head>
<body>

	<%
	request.setCharacterEncoding("UTF-8");

    String isbn = request.getParameter("isbn");
    String title= request.getParameter("title");
    String author = request.getParameter("author");
    int price = Integer.parseInt(request.getParameter("price")); 
    String publisher = request.getParameter("publisher");
    String category = request.getParameter("category");
    String description = request.getParameter("description");
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	String str = "";
	try {
		String sql = "select isbn from BIDB where isbn = ?";
		pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, isbn);
		rs = pstmt.executeQuery();
		if (rs.next()) {
			String risbn = rs.getString("isbn");
		if (isbn.equals(risbn)) {
			sql = "update BIDB set price = ?, publisher = ?, category = ?, description = ? where isbn = ?";
		    pstmt = conn.prepareStatement(sql);
		    pstmt.setInt(1, price);
		    pstmt.setString(2, publisher);
		    pstmt.setString(3, category);
		    pstmt.setString(4 , description);
		    pstmt.setString(5 , isbn);
			pstmt.executeUpdate();
		}}
		str = "BIDB 테이블에 있던 레코드를 수정했습니다.";
	} catch (Exception e) {
		e.printStackTrace();
		str = "BIDB 테이블에 있던 레코드 수정에 실패했습니다";
	} finally {
		if (pstmt != null)
			try {
		pstmt.close();
			} catch (SQLException sqle) {
			}
		if (conn != null)
			try {
		conn.close();
			} catch (SQLException sqle) {
			}
	}
	%>
	<%=str %>
	 <p align="center">	 
	 <button type="button" onclick="location.href='main.jsp'">메인메뉴</button>&nbsp;&nbsp;
	 </p>
</body>
</html>

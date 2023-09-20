<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<%@ include file="DBConnection.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>데이터 삭제</title>
</head>
<body>
	<%
	request.setCharacterEncoding("UTF-8");

	String isbn = request.getParameter("isbn");


	PreparedStatement pstmt = null;
	String str = "";
	ResultSet rs = null;
	System.out.print("test");
	
	try {
		
		String sql = "select isbn from BIDB where isbn = ?";
		pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, isbn);
		rs = pstmt.executeQuery();
	
		if(rs.next()){
		String rIsbn = rs.getString("isbn");
		System.out.print("test2");


		if(isbn.equals(rIsbn)){
			sql = "delete from BIDB  where isbn=? ";
			System.out.print("test3");
		pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, isbn);
		pstmt.executeUpdate();
	
		str = "ISBN을 사용해 책 정보를 삭제했습니다.";	
		
		}else{
			out.println("ISBN이 틀렸습니다.");}

	} 
		}catch(Exception e){
		e.printStackTrace();
		str="isbn 삭제 실패했습니다.";
	} finally {
		if (rs != null)
			try {rs.close();}
	catch (SQLException sqle) {
		System.out.println("rs 객체를 닫는데 실패하였습니다.");
			}
		if (pstmt != null)
			try {pstmt.close();} 
		catch (SQLException sqle) {
		System.out.println("pstmt 객체를 닫는데 실패하였습니다.");
			}
		if (conn != null)
			try {conn.close();} 
		catch (SQLException sqle) {
		System.out.println("conn 객체를 닫는데 실패하였습니다.");
			}
	}
	%>
	<%=str %>
	<p align="center">
	<button onclick="location='main.jsp'">메인</button>
	<button type="button" onclick="location.href='insert.jsp'">데이터 입력</button>&nbsp;&nbsp;
	 <button type="button" onclick="location.href='update.jsp'">데이터 수정</button>&nbsp;&nbsp;
	 <button type="button" onclick="location.href='delete.jsp'">데이터 삭제</button>&nbsp;&nbsp;
	 <button type="button" onclick="location.href='select.jsp'">데이터 조회</button>&nbsp;&nbsp;
	 </p>
</body>
</html>
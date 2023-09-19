<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "java.sql.*" %>   
<%@ include file="DBconnection.jsp"%>
<!DOCTYPE html> 
<html>
<head>
<meta charset="UTF-8">
<title>데이터 입력 처리-customer</title>
</head>
<body>
<% 
	request.setCharacterEncoding("UTF-8");

   String isbn = request.getParameter("isbn");
   String title= request.getParameter("title");
   int price = Integer.parseInt(request.getParameter("price")); 
   String author = request.getParameter("author");
   String publisher = request.getParameter("publisher");
   String category = request.getParameter("category");
   String description = request.getParameter("description");
      

	PreparedStatement pstmt = null;
	String str = "";
	   
   	try{
	  	
	  String sql= "insert into BIDB values(?, ?, ?, ?, ?, ?, ?)";
	  pstmt = conn.prepareStatement(sql);
	  pstmt.setString(1, isbn);
	  pstmt.setString(2, title);
	  pstmt.setInt(3, price);
	  pstmt.setString(4, author);
	  pstmt.setString(5, publisher);
	  pstmt.setString(6, category);
	  pstmt.setString(7, description);	  
	  
	  pstmt.executeUpdate();
  		str = "BIDB 테이블에 새로운 레코드를 추가했습니다.";

	}catch(Exception e){ 
		e.printStackTrace();
		 str = "BIDB 테이블에 새로운 레코드를 추가에 실패했습니다";
	}finally{
		 if(pstmt != null) try{pstmt.close();}catch(SQLException sqle){}
		 if(conn != null) try{conn.close();}catch(SQLException sqle){}
		}
%>
	 <%=str %>
	  <p align="center">	 
	 <button type="button" onclick="location.href='Sample1_customerinsertform.jsp'">데이터 입력</button>&nbsp;&nbsp;
	 <button type="button" onclick="location.href='Sample1_customerupdateform.jsp'">데이터 수정</button>&nbsp;&nbsp;
	 <button type="button" onclick="location.href='Sample1_customerdeleteform.jsp'">데이터 삭제</button>&nbsp;&nbsp;
	 <button type="button" onclick="location.href='Sample1_customerselectform.jsp'">데이터 조회</button>&nbsp;&nbsp;
	 </p>
</body>
</html>
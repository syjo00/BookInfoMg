<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = 'java.sql.*'  %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
	Connection conn = null;
	try{
	String Url = "jdbc:oracle:thin:@localhost:1521:xe";
	String dbId = "master";
	String dbPassword = "1234";
	Class.forName("oracle.jdbc.driver.OracleDriver");
	conn = DriverManager.getConnection(Url, dbId, dbPassword);
	out.print("DB 연결 성공");
	}catch (Exception e){
		e.printStackTrace();
	}
	
%>
</body>
</html>
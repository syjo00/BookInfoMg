<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<%
	//인증정보(세션삭제)
	//리다이렉트
	
	session.invalidate();
	response.sendRedirect("login.jsp");
%>
</head>
<body>

</body>
</html>
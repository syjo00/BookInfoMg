<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import='java.sql.*'%>
<%@ include file="main.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
</head>
<body>
	<h2>BIDB테이블에 레코드 추가</h2>
	<form method="post" action="insertPro.jsp" style = "text-align : center">
		ISBN: <input type="text" name="isbn" maxlength="20"><br>
		책제목: <input type="text" name="title" maxlength="50"><br>
		저자: <input type="text" name="author" maxlength="6"><br>
		가격: <input type="text" name="price" maxlength="40"><br>
		출판사: <input type="text" name="publisher" maxlength="50"><br>
		카테고리: <input type="text" name="category" maxlength="50"><br>
		상세설명: <input type="text" name="description" maxlength="50"><br>
		<input type="submit" value="입력완료">
		<input type="reset" value="초기화">
	</form>

</body>
</html>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ include file="DBconnection.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>데이터 삭제</title>
</head>
<body>
<h2 align = "center">책 삭제</h2>

<form align = "center" action = "deletePro.jsp" method="post">

ISBN:<input type="text" name="isbn" maxlength = "30"><br>
<input type="submit" value="입력완료">
&nbsp;&nbsp;<input type="reset" value="입력취소">

</form>
</body>
</html>

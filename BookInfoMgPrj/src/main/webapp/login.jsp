<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인 페이지</title>
</head>
<body>
	<h2>로그인 및 회원 가입 페이지 이동 화면 구성</h2>
	<form method="post" action="loginPro.jsp">
		<label>
			아이디: <input type="text" name="id" maxlength="15" required="required"><br>
		</label>
		<label>
			패스워드: <input type="password" name="pw" maxlength="15" required="required" ><br>
		</label>
		
		<input type="submit" value="로그인">&nbsp; &nbsp;
		<input type="button" value="회원가입" onclick="location.href='join.jsp'">
	</form>
</body>
</html>
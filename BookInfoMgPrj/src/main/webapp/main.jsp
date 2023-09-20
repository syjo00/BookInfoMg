<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>메뉴 페이지</title>
<style>
    /* 간단한 메뉴 스타일링 (필요에 따라 수정) */
    .menu-bar {
        display: flex;
        justify-content: space-around;
        padding: 20px;
        background-color: #f5f5f5;
    }
    .menu-bar a {
        text-decoration: none;
        padding: 10px 15px;
        background-color: #333;
        color: #fff;
        border-radius: 5px;
    }
    .menu-bar a:hover {
        background-color: #555;
    }
</style>
</head>
<body>
<%String  id = (String)session.getAttribute("id"); %>
<%=id %> <button onclick = "location.href = 'login.jsp'">로그아웃</button>
<div id="wrap">
	
    <header id="header">
        <div class="header_area box_inner clear">	
          <!--   <h1>메뉴바</h1> -->
            <!-- 메뉴바 -->
            <div class="menu-bar">
                <a href="insert.jsp">입력</a>
                <a href="list.jsp">조회</a>
                <a href="update.jsp">수정</a>
                <a href="delete.jsp">삭제</a>
            </div>
        </div>
    </header>

</body>
</html>

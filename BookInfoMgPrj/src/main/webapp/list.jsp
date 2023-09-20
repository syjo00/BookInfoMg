<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@page import="java.sql.Connection"%>
<%@page import="javax.servlet.jsp.tagext.TryCatchFinally"%>
<%@page import="java.sql.PreparedStatement"%>   
<%@page import ="java.sql.*" %> 

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>BookInformationListSearch</title>
</head>
<style>
	    /* 검색 입력 필드와 셀렉트 박스 스타일 */
    #searchType  {
    	margin-top : 15px;
        width: 100px;
        height: 30px;        
    }
    
    	h2{		
		text-align:center	
	}
    
</style>
<body>
<h2>Book Information List Search</h2>
	<table width="800" border="1" align="center" >
		<tr align="center">
	      <td width="100">ISBN</td>
            <td width="100">Title</td>
            <td width="100">Author</td>
            <td width="100">Publisher</td>
            <td width="100">Price</td>
            <td width="100">Category</td>
            <td width="100">Description</td>
		</tr>
	<%
	
	Connection conn = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	
	try{
		
		String driver = "oracle.jdbc.OracleDriver";
		String url ="jdbc:oracle:thin:@localhost:1521:xe";
		String dbId="master";
		String dbPass="1234";
		
		Class.forName("oracle.jdbc.driver.OracleDriver");
		conn = DriverManager.getConnection(url, dbId, dbPass);
		
		String sql = "select * from books_info";
		pstmt = conn.prepareStatement(sql);
		rs = pstmt.executeQuery();
		
		while(rs.next()){
			
			String isbn = rs.getString("isbn");
			String title = rs.getString("title");
			String author = rs.getString("author");
			String publisher = rs.getString("publisher");
			String price = rs.getString("price");			
			String category = rs.getString("category");
			String description = rs.getString("description");
		
%>		

		<tr align="center">
			<td width ="80"><%=isbn %></td>
			<td width ="80"><%=title %></td>
			<td width ="80"><%=author %></td>
			<td width ="80"><%=publisher %></td>	
			<td width ="80"><%=price %></td>					
			<td width ="100"><%=category %></td>
			<td width ="100"><%=description %></td>
		</tr>
		
<%		
		}//while
		
	}catch(Exception e){
		e.printStackTrace();
	}finally{
		
		if(rs!=null)
		try{rs.close();}
		catch(SQLException sqle){}
		
		if(pstmt!=null)
			try{pstmt.close();}
			catch(SQLException sqle){}
		
		if(conn!=null)
			try{conn.close();}
			catch(SQLException sqle){}
		
	}
%>	
		
	</table>
	
	
	<form action="./ListPro.jsp" method="get">
		<select id="sel" name="sel">
		   <option name="sel" value="title">Title</option>
		   <option name="sel" value="author">Author</option>
		</select>
	 <input type="text" name="want">
	 <input type="submit" value="search">

	
</body>
</html>
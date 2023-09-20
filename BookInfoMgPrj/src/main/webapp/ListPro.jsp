<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="java.sql.*" %>
<%@ include file="DBconnection.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
    #searchType  {
    	margin-top : 15px;
        width: 100px;
        height: 30px;        
    }
    
    	h2{		
		text-align:center	
	}
</style>
</head>
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
		request.setCharacterEncoding("UTF-8");
		String sel = request.getParameter("sel");
		String want= request.getParameter("want");
		
		ResultSet rs=null;
		PreparedStatement pstmt = null;
		String sql;
		
		try{
			if(sel.equals("title")){
				sql="select * from BIDB where "+sel+"  like ?";
				pstmt=conn.prepareStatement(sql);
				pstmt.setString(1, "%"+want+"%");
				
			}else if(sel.equals("author")){
				sql="select * from BIDB where "+sel+" like ?";
				pstmt=conn.prepareStatement(sql);
				pstmt.setString(1, "%"+want+"%");
				
			}
				
			rs=pstmt.executeQuery();
			while(rs.next()){
				String isbn=rs.getString(1);
				String title=rs.getString(2);
				int price=rs.getInt(3);
				String author=rs.getString(4);
				String publisher=rs.getString(5);
				String category=rs.getString(6);
				String description=rs.getString(7);
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
			}
		}catch (Exception e){
			
		}finally{
			if (rs != null) {
		        try {
		            rs.close();
		        } catch (SQLException e) {
		            e.printStackTrace();
		        }
		    }
		    if (pstmt != null) {
		        try {
		            pstmt.close();
		        } catch (SQLException e) {
		            e.printStackTrace();
		        }
		    }
		    if (conn != null) {
		        try {
		            conn.close();
		        } catch (SQLException e) {
		            e.printStackTrace();
		        }
		    }
		}
		
	%>
</table>
<form action="./ListPro.jsp" method="get">
	<select id="sel" name="sel" style="margin-left : 350px;">
		<option name="sel" value="title">Title</option>
		<option name="sel" value="author">Author</option>
	</select>
<input type="text" name="want">
<input type="submit" value="search">
</form>
</body>
</html>
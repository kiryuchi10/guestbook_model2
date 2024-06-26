﻿﻿<%@page import="java.sql.Connection"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.DriverManager"%>
<%@ page import="java.sql.*" %>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>방명록</title>
</head>
<body>
	<form action="add.jsp" method="post">
	<table border=1 width=500>
		  <tr>
            <td>이름</td>
            <td><input type="text" name="name" required></td>
        </tr>
        <tr>
            <td>비밀번호</td>
            <td><input type="password" name="password" required></td>
        </tr>
        <tr>
            <td>내용</td>
            <td><textarea name="content" required></textarea></td>
        </tr>
        <tr>
            <td colspan="2" align="right"><input type="submit" value="확인"></td>
        </tr>
	</table>
	</form>
	<br/>
	
		<table width=510 border=1>
		<tr>
			<td>[1]</td>
			<td>홍길동</td>
			<td>2018-01-15</td>
			<td><a href="delete.jsp">삭제</a></td>
		</tr>
		<tr>
			<td colspan=4>안녕하세요<br/>첫번째글입니다.</td>
		</tr>
	</table>
        <br/>
	<table width=510 border=1>
		<tr>
			<td>[1]</td>
			<td>장실산</td>
			<td>2018-01-15</td>
			<td><a href="delete.jsp">삭제</a></td>
		</tr>
		<tr>
			<td colspan=4>안녕하세요<br/>두번째글입니다.</td>
		</tr>
	</table>
        <br/>
  <%
        // 오라클 DB 연결 설정
        Connection conn = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        String url = "jdbc:oracle:thin:@localhost:1521:xe";
        String user = "himedia"; // 오라클 사용자명
        String password = "himedia"; // 오라클 비밀번호

        try {
            Class.forName("oracle.jdbc.driver.OracleDriver");
            conn = DriverManager.getConnection(url, user, password);
            String sql = "SELECT * FROM guestbook ORDER BY no DESC";
            pstmt = conn.prepareStatement(sql);
            rs = pstmt.executeQuery();

            while(rs.next()) {
                int no = rs.getInt("no");
                String name = rs.getString("name");
                String reg_date = rs.getString("reg_date");
                String content = rs.getString("content");
    %>
	

        <%
            }
        } catch(Exception e) {
        	e.printStackTrace();
        } finally {
        	if(rs != null) rs.close();
        	if(pstmt != null) pstmt.close();
        	if(conn != null) conn.close();
        }
        
        %>
</body>
</html>
<%@ page import="java.sql.*" %>
<%@ page contentType="text/html; charset=UTF-8" %>
<%
    String name = request.getParameter("name");
    String password = request.getParameter("password");
    String content = request.getParameter("content");
    out.println("1 string password:"+password);
    if (name != null && password != null && content != null) {
        Connection conn = null;
        PreparedStatement pstmt = null;
        String url = "jdbc:oracle:thin:@localhost:1521:xe";
        String user = "himedia"; 
        String passwordDB = "himedia"; 

        try {
        	out.println("2 string password:"+password);
            Class.forName("oracle.jdbc.driver.OracleDriver");
            conn = DriverManager.getConnection(url, user, passwordDB);
            String sql = "INSERT INTO guestbook (no, name, password, content, reg_date) VALUES (seq_guestbook_no.nextval, ?, ?, ?, sysdate)";
            pstmt = conn.prepareStatement(sql);
            pstmt.setString(1, name);
            pstmt.setString(2, password);
            pstmt.setString(3, content);
            int result = pstmt.executeUpdate();
            if (result > 0) {
                response.sendRedirect("index.jsp");
            } else {
                out.println("데이터 입력에 실패했습니다.");
            }
        } catch(Exception e) {
            e.printStackTrace();
            out.println("오류가 발생했습니다: " + e.getMessage());
        } finally {
            if(pstmt != null) try { pstmt.close(); } catch(SQLException e) {}
            if(conn != null) try { conn.close(); } catch(SQLException e) {}
        }
    } else {
    	out.println("3 string password:"+password);
        out.println("모든 필드를 입력해주세요.");
    }
%>
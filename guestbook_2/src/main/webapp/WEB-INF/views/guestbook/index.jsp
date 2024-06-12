<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page import="java.util.List" %>
<%@ page import="himedia.vo.BookListVo" %>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>방명록</title>
</head>
<body>
    <h1>방명록</h1>
    <a href="guestbook?a=form">새 방명록 작성</a>
    <br><br>
    <%
        List<BookListVo> list = (List<BookListVo>) request.getAttribute("list");
        if (list != null) {
            for (BookListVo vo : list) {
    %>
    <table width="510" border="1">
        <tr>
            <td>[<%= vo.getNo() %>]</td>
            <td><%= vo.getName() %></td>
            <td><%= vo.getReg_date() %></td>
            <td>
                <a href="guestbook?a=deleteform&no=<%= vo.getNo() %>">삭제</a>
            </td>
        </tr>
        <tr>
            <td colspan="4"><%= vo.getContent().replace("\n", "<br/>") %></td>
        </tr>
    </table>
    <br/>
    <%
            }
        }
    %>
</body>
</html>
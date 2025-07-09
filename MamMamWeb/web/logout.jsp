<%@ page contentType="text/html; charset=UTF-8" %>
<%
    session.invalidate();           // xoá toàn bộ session
    response.sendRedirect("home.jsp");
%>

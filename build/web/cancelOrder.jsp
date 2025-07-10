<%@ page import="java.util.List" %>
<%@ page import="model.Order" %>
<%
    String orderId = request.getParameter("orderId");
    List<Order> orders = (List<Order>) session.getAttribute("orders");

    if (orderId != null && orders != null) {
        for (Order o : orders) {
            if (o.getId().equals(orderId) && "pending".equals(o.getStatus())) {
                o.setStatus("canceled");
                break;
            }
        }
    }

    response.sendRedirect("myorders.jsp?status=canceled");
%>

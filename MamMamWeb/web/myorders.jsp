<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"
         import="java.util.*, java.text.DecimalFormat, Model.Order, Model.CartItem" %>

<%
    DecimalFormat fmt = new DecimalFormat("#,###");
    List<Order> orders = (List<Order>) session.getAttribute("orders");
%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <title>Đơn hàng của tôi</title>
        <link rel="stylesheet" href="css/myorders.css">
        <script>

            function toggleDetail(id) {
                const box = document.getElementById('detail-' + id);
                box.style.display = box.style.display === 'none' ? 'block' : 'none';
            }
        </script>
    </head>
    <body>

        <h1 class="title"> ĐƠN HÀNG CỦA TÔI</h1>

        <% if (orders == null || orders.isEmpty()) { %>
        <p class="no-order">Bạn chưa có đơn hàng nào.</p>
        <% } else {
            for (Order o : orders) {
                String oid = o.getId();
                String status = o.getStatus();
                int step = switch (status) {
                    case "preparing" ->
                        1;
                    case "delivering" ->
                        2;
                    case "completed" ->
                        3;
                    default ->
                        0;
                };
        %>

        <div class="order-card">
            <div class="order-head">
                <span>Mã đơn: <strong><%= oid%></strong></span>
                <span class="badge <%= status%>">
                    <%= switch (status) {
                        case "pending" ->
                            " Chờ xác nhận";
                        case "preparing" ->
                            " Đang chuẩn bị";
                        case "delivering" ->
                            " Đang giao";
                        case "completed" ->
                            " Đã giao";
                        default ->
                    " Đã hủy";
            }%>
                </span>
            </div>

            <!-- Timeline trạng thái -->
            <div class="tracker">
                <div class="step <%= step >= 0 ? "done" : ""%>">Chờ xác nhận</div>
                <div class="step <%= step >= 1 ? "done" : ""%>">Đang chuẩn bị</div>
                <div class="step <%= step >= 2 ? "done" : ""%>">Đang giao</div>
                <div class="step <%= step >= 3 ? "done" : ""%>">Đã giao</div>
            </div>

            <!-- Tổng tiền + nút chi tiết -->
            <div class="summary">
                <p>Tổng tiền: <strong><%= fmt.format(o.getTotalAmount())%> VND</strong></p>
                <button class="detail-btn" onclick="toggleDetail('<%= oid%>')">Xem chi tiết</button>
            </div>

            <!-- Bảng món ăn -->
            <div class="detail" id="detail-<%= oid%>" style="display:none;">
                <table>
                    <tr><th>Món</th><th>SL</th><th>Giá</th><th>Thành tiền</th></tr>
                            <% for (CartItem it : o.getItems()) {%>
                    <tr>
                        <td><%= it.getName()%></td>
                        <td><%= it.getQuantity()%></td>
                        <td><%= fmt.format(it.getPrice())%></td>
                        <td><%= fmt.format(it.getTotal())%></td>
                    </tr>
                    <% } %>
                </table>
            </div>
        </div>
        <% }
    }%>

    </body>
</html>


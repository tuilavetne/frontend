<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.List" %>
<%@ page import="model.Order, model.CartItem" %>
<%
    List<Order> orders = (List<Order>) session.getAttribute("orders");
    String statusFilter = request.getParameter("status");
%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Đơn Mua</title>
    <link rel="stylesheet" href="css/myorders.css">
</head>
<body>
    <div id="cancel-popup" class="popup-overlay" style="display:none;">
        <div class="popup">
            <p>Bạn có chắc chắn muốn hủy đơn hàng này?</p>
            <div class="popup-actions">
                <form id="cancelForm" method="post" action="cancelOrder.jsp">
                    <input type="hidden" name="orderId" id="popupOrderId">
                    <button type="submit" class="confirm-btn">Xác nhận</button>
                    <button type="button" class="cancel-btn" onclick="closePopup()">Không</button>
                </form>
            </div>
        </div>
    </div>

    <header class="main-header">
        <div class="logo">
            <img src="images/logo.png" alt="Mam Mam Logo">
            <span class="brand-name">Măm Măm</span>
        </div>
        <nav class="menu">
            <a href="home.jsp">Home</a>
            <a href="menu.jsp">Menu</a>
            <a href="cart.jsp">Cart</a>
            <a href="logout.jsp" class="logout">Logout</a>
        </nav>
    </header>

    <div class="orders-container">
        <h2>Đơn Mua</h2>
        <div class="tabs">
            <a href="myorders.jsp" class="tab <%= (statusFilter == null) ? "active" : "" %>">Tất cả</a>
            <a href="myorders.jsp?status=pending" class="tab <%= "pending".equals(statusFilter) ? "active" : "" %>">Đang chuẩn bị</a>
            <a href="myorders.jsp?status=shipping" class="tab <%= "shipping".equals(statusFilter) ? "active" : "" %>">Vận chuyển</a>
            <a href="myorders.jsp?status=completed" class="tab <%= "completed".equals(statusFilter) ? "active" : "" %>">Hoàn thành</a>
            <a href="myorders.jsp?status=canceled" class="tab <%= "canceled".equals(statusFilter) ? "active" : "" %>">Đã hủy</a>
        </div>

        <div class="order-list">
            <% if (orders != null && !orders.isEmpty()) {
                for (Order o : orders) {
                    if (statusFilter != null && !statusFilter.equals(o.getStatus())) continue;
                    String orderId = o.getId();
                    List<CartItem> items = o.getItems();
            %>
            <div class="order-card" onclick="toggleDetails('<%= orderId %>')">
                <div class="order-header">
                    <span class="shop-name"><strong>Măm Măm</strong></span>
                    <span class="order-status <%= o.getStatus() %>">
                        <%
                            String statusText = "Không rõ";
                            switch (o.getStatus()) {
                                case "pending": statusText = "Đang chuẩn bị"; break;
                                case "shipping": statusText = "Vận chuyển"; break;
                                case "completed": statusText = "Hoàn thành"; break;
                                case "canceled": statusText = "Đã hủy"; break;
                            }
                        %>
                        <%= statusText %>
                    </span>
                </div>

                <% if (!items.isEmpty()) { %>
                    <div class="order-item">
                        <img src="images/<%= items.get(0).getImage() %>" alt="food">
                        <div class="details">
                            <p class="name"><%= items.get(0).getName() %></p>
                            <p class="qty">Số lượng: <%= items.get(0).getQuantity() %></p>
                        </div>
                        <div class="price">
                            <p class="discounted"><%= String.format("%,.0f", items.get(0).getTotal()) %> đ</p>
                        </div>
                    </div>
                <% } %>

                <div class="more-info" id="details-<%= orderId %>" style="display:none;">
                    <p><strong>Người nhận:</strong> <%= o.getFullName() %></p>
                    <p><strong>SĐT:</strong> <%= o.getPhone() %></p>
                    <p><strong>Địa chỉ:</strong> <%= o.getAddress() %></p>
                    <p><strong>Ghi chú:</strong> <%= o.getNote() %></p>
                    <% for (int i = 1; i < items.size(); i++) { CartItem item = items.get(i); %>
                        <div class="order-item">
                            <img src="images/<%= item.getImage() %>" alt="food">
                            <div class="details">
                                <p class="name"><%= item.getName() %></p>
                                <p class="qty">Số lượng: <%= item.getQuantity() %></p>
                            </div>
                            <div class="price">
                                <p class="discounted"><%= String.format("%,.0f", item.getTotal()) %> đ</p>
                            </div>
                        </div>
                    <% } %>
                </div>

                <% if (items.size() > 1) { %>
                    <button class="toggle-btn" onclick="event.stopPropagation(); toggleItems('<%= orderId %>', this)">Xem thêm</button>
                <% } %>

                <div class="order-footer">
                    <span class="total">Tổng: <strong><%= String.format("%,.0f", o.getTotalAmount()) %> đ</strong></span>
                    <% if ("completed".equals(o.getStatus())) { %>
                        <button class="rate-btn" onclick="event.stopPropagation();">Đánh giá</button>
                    <% } else if ("pending".equals(o.getStatus())) { %>
                        <button class="cancel-btn" onclick="event.stopPropagation(); confirmCancel('<%= orderId %>')">Hủy đơn</button>
                    <% } %>
                </div>
            </div>
            <% } } else { %>
                <p class="empty">Không có đơn hàng nào phù hợp.</p>
            <% } %>
        </div>
    </div>

    <footer>
        <div class="footer-content">
            <div class="contact-info">
                <h3>CONTACT INFORMATION</h3>
                <p>Mam Mam Korean Food<br>
                    Address: FPT University, Da Nang<br>
                    HOTLINE: 0123.456.789<br>
                    Email: mammam.food@gmail.com
                </p>
            </div>
            <div class="logo-footer">
                <img src="images/logo.png" alt="Mam Mam Logo">
            </div>
        </div>
    </footer>

    <script>
    function confirmCancel(orderId) {
        document.getElementById("popupOrderId").value = orderId;
        document.getElementById("cancel-popup").style.display = "flex";
    }

    function closePopup() {
        document.getElementById("cancel-popup").style.display = "none";
    }

    function toggleItems(orderId, btn) {
        const more = document.getElementById("details-" + orderId);
        if (more.style.display === "none") {
            more.style.display = "block";
            btn.innerText = "Ẩn bớt";
        } else {
            more.style.display = "none";
            btn.innerText = "Xem thêm";
        }
    }

    function toggleDetails(orderId) {
        const section = document.getElementById("details-" + orderId);
        if (section) section.style.display = section.style.display === 'none' ? 'block' : 'none';
    }
    </script>
</body>
</html>

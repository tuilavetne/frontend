<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" import="java.util.*, java.text.DecimalFormat, model.CartItem, model.Order, java.util.ArrayList" %>
<%
    boolean isSubmitted = "POST".equalsIgnoreCase(request.getMethod());

    List<CartItem> cart = (List<CartItem>) session.getAttribute("cart");
    if (cart == null) cart = new ArrayList<>();

    int totalItems = 0;
    double total = 0;
    for (CartItem item : cart) {
        totalItems += item.getQuantity();
        total += item.getTotal();
    }

    double shippingFee = total > 500000 ? 0 : 20000;
    double grandTotal = total + shippingFee;

    DecimalFormat formatter = new DecimalFormat("#,###");
%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Thanh toán - Mam Mam</title>
    <link rel="stylesheet" href="css/checkout.css">
</head>
<body>

<header>
    <div class="logo"><img src="images/logo.png" alt="Mam Mam Logo"></div>
    <nav>
        <a href="home.jsp">Home</a>
        <a href="menu.jsp">Menu</a>
        <a href="cart.jsp">Cart</a>
        <a href="myorders.jsp">My Orders</a>
    </nav>
</header>

<h1>THANH TOÁN</h1>

<% if (!isSubmitted) { %>
<!-- ===== FORM ĐẶT HÀNG ===== -->
<div class="checkout-container">
    <div class="left">
        <h2>Thông tin giao hàng</h2>
        <form action="checkout.jsp" method="post" onsubmit="return validateForm()">
            <label>Họ và tên: <span style="color:red">*</span></label>
            <input type="text" name="fullName" id="fullName" required>

            <label>Số điện thoại: <span style="color:red">*</span></label>
            <input type="tel" name="phone" id="phone" required>

            <label>Địa chỉ giao hàng: <span style="color:red">*</span></label>
            <textarea name="address" required></textarea>

            <label>Ghi chú đơn hàng:</label>
            <input type="text" name="note">

            <label>Phương thức thanh toán:</label>
            <div class="payment-methods">
                <label><input type="radio" name="payment" value="COD" checked>
                       Thanh toán khi nhận hàng (COD)</label>
                <label><input type="radio" name="payment" value="Momo"> Ví Momo</label>
                <label><input type="radio" name="payment" value="Bank"> Thẻ ngân hàng</label>
            </div>

            <button type="submit" class="btn-submit">ĐẶT HÀNG NGAY</button>
        </form>
    </div>

    <div class="right">
        <h2>Đơn hàng của bạn</h2>
        <p><strong>Số món:</strong> <%= totalItems %></p>
        <p><strong>Tạm tính:</strong> <%= formatter.format(total) %> VND</p>
        <p><strong>Phí vận chuyển:</strong> <%= formatter.format(shippingFee) %> VND</p>
        <hr>
        <p><strong>Tổng thanh toán:</strong>
           <span style="color:#a52a2a;"><%= formatter.format(grandTotal) %> VND</span></p>
    </div>
</div>

<!-- VALIDATION -->
<script>
function validateForm() {
    const name  = document.getElementById('fullName').value.trim();
    const phone = document.getElementById('phone').value.trim();
    const nameRegex  = /^[a-zA-ZÀ-ỹ\s]+$/;
    const phoneRegex = /^[0-9]{10}$/;

    if (!nameRegex.test(name)) {
        alert("Họ và tên chỉ được chứa chữ cái và khoảng trắng.");
        return false;
    }
    if (!phoneRegex.test(phone)) {
        alert("Số điện thoại phải gồm đúng 10 chữ số.");
        return false;
    }
    return true;
}
</script>

<% } else { %>
<!-- ===== THÔNG BÁO THÀNH CÔNG ===== -->
<div class="success-box">
    <h1> Đặt hàng thành công!</h1>
    <p><strong>Khách hàng:</strong> <%= request.getParameter("fullName") %></p>
    <p><strong>SĐT:</strong> <%= request.getParameter("phone") %></p>
    <p><strong>Địa chỉ:</strong> <%= request.getParameter("address") %></p>
    <p><strong>Ghi chú:</strong> <%= request.getParameter("note") %></p>
    <p><strong>Thanh toán:</strong> <%= request.getParameter("payment") %></p>

    <h3>Chi tiết đơn hàng:</h3>
    <table class="order-table" border="1" cellpadding="8" cellspacing="0">
        <tr><th>Món</th><th>Số lượng</th><th>Đơn giá</th><th>Thành tiền</th></tr>
        <% for (CartItem item : cart) { %>
            <tr>
                <td><%= item.getName() %></td>
                <td><%= item.getQuantity() %></td>
                <td><%= formatter.format(item.getPrice()) %> VND</td>
                <td><%= formatter.format(item.getTotal()) %> VND</td>
            </tr>
        <% } %>
    </table>
    <p><strong>Phí ship:</strong> <%= formatter.format(shippingFee) %> VND</p>
    <p><strong>Tổng thanh toán:</strong> <%= formatter.format(grandTotal) %> VND</p>
    <p><strong>Trạng thái:</strong> <span style="color:orange;">Chờ xử lý</span></p>
    
</div>

<%-- Lưu đơn vào session orders --%>
<%
    List<Order> orders = (List<Order>) session.getAttribute("orders");
    if (orders == null) orders = new ArrayList<>();

    String orderId = "OD" + System.currentTimeMillis();
    Order newOrder = new Order(
        orderId,
        request.getParameter("fullName"),
        request.getParameter("phone"),
        request.getParameter("address"),
        request.getParameter("note"),
        request.getParameter("payment"),
        new ArrayList<>(cart)
    );
    orders.add(newOrder);
    session.setAttribute("orders", orders);

    session.removeAttribute("cart"); 
%>
<% } %>

</body>
</html>

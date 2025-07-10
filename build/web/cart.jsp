<%@ page import="java.util.*, model.CartItem" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.text.DecimalFormat" %>
<%
    DecimalFormat formatter = new DecimalFormat("#,###");
%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Giỏ hàng - Mam Mam</title>
    <link rel="stylesheet" href="css/style.css">
    <link rel="stylesheet" href="css/login.css">
    <link rel="stylesheet" href="css/menu.css">
    <link rel="stylesheet" href="css/cart.css">
</head>
<body>

<!-- Header -->
<header>
    <div class="logo">
        <img src="images/logo.png" alt="Mam Mam Logo">
    </div>
    <nav>
        <a href="home.jsp">Home</a>
        <a href="menu.jsp">Menu</a>
        <a href="cart.jsp">Cart</a>
        <button class="login-btn" onclick="openLoginModal()">Login</button>
    </nav>
</header>

<%
    List<CartItem> cart = (List<CartItem>) session.getAttribute("cart");
    if (cart == null || cart.isEmpty()) {
%>
    <!-- Giỏ hàng trống -->
    <div class="empty-cart">
        <div class="empty-cart-content">
            <div class="empty-text">
                <h1 class="empty-message">GIỎ HÀNG CỦA BẠN<br>ĐANG TRỐNG.<br>HÃY ĐẶT MÓN NGAY!</h1>
                <a class="order-btn" href="menu.jsp">ĐẶT HÀNG NGAY</a>
            </div>
            <div class="empty-image">
                <img src="images/cart_icon.jpg" alt="Giỏ hàng trống" />
            </div>
        </div>
    </div>
<%
    } else {
        double total = 0;
        int totalItems = 0;
%>
    <!-- Giỏ hàng có món -->
    <h2 class="cart-title">GIỎ HÀNG CỦA TÔI</h2>
    <div class="cart-container">
        <div class="cart-items">
<%
        for (CartItem item : cart) {
            total += item.getTotal();
            totalItems += item.getQuantity();
%>
            <div class="cart-item">
                <img src="images/<%= item.getImage() %>" alt="<%= item.getName() %>" />
                <div class="cart-info">
                    <h3><%= item.getName() %></h3>

                    <form action="update-note" method="post" class="note-form">
                        <input type="hidden" name="name" value="<%= item.getName() %>"/>
                        <input type="text" name="note" value="<%= item.getNote() == null ? "" : item.getNote() %>" placeholder="Ghi chú..." class="note-input"/>
                    </form>

                    <form class="quantity-form">
                        <input type="hidden" name="name" value="<%= item.getName() %>"/>
                        <button type="button" class="btn-dec">-</button>
                        <span class="item-quantity"><%= item.getQuantity() %></span>
                        <button type="button" class="btn-inc">+</button>
                    </form>

                    <p>Đơn giá: <span class="item-price"><%= item.getPrice() %></span> VND</p>
                    <p>Thành tiền: <span class="item-subtotal"><%= item.getTotal() %></span> VND</p>

                    <a class="remove-btn" href="remove-from-cart?name=<%= item.getName() %>">Xóa</a>
                </div>
            </div>
<%
        }
%>
        </div>
        <div class="cart-summary">
            <h3>Hóa đơn</h3>
            <p><strong>Tổng món:</strong> <span id="total-items"><%= totalItems %></span></p>
            <p><strong>Tổng đơn:</strong> <span id="total-amount"><%= formatter.format(total) %></span> VND</p>
            <a class="checkout-btn" href="checkout.jsp">THANH TOÁN NGAY</a>
        </div>
    </div>
<%
    }
%>

<!-- Script tăng/giảm số lượng -->
<script>
    function formatCurrency(value) {
        return value.toLocaleString('vi-VN');
    }

    function updateTotals() {
        let totalItems = 0;
        let totalAmount = 0;

        document.querySelectorAll('.cart-item').forEach(item => {
            const quantity = parseInt(item.querySelector('.item-quantity').textContent);
            const price = parseFloat(item.querySelector('.item-price').textContent);
            const subtotal = item.querySelector('.item-subtotal');

            const itemTotal = quantity * price;
            subtotal.textContent = formatCurrency(itemTotal);
            totalItems += quantity;
            totalAmount += itemTotal;
        });

        document.getElementById('total-items').textContent = totalItems;
        document.getElementById('total-amount').textContent = formatCurrency(totalAmount);
    }

    document.querySelectorAll('.quantity-form').forEach(form => {
        const quantitySpan = form.querySelector('.item-quantity');
        const cartItem = form.closest('.cart-item');

        form.querySelector('.btn-dec').addEventListener('click', () => {
            let quantity = parseInt(quantitySpan.textContent);
            if (quantity > 1) {
                quantity--;
                quantitySpan.textContent = quantity;
                updateTotals();
            }
        });

        form.querySelector('.btn-inc').addEventListener('click', () => {
            let quantity = parseInt(quantitySpan.textContent);
            quantity++;
            quantitySpan.textContent = quantity;
            updateTotals();
        });
    });
</script>

<!-- Footer -->
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

<!-- Modal login -->
<div id="loginModal" class="modal" style="display: none;">
    <div class="modal-content">
        <span class="close" onclick="closeLoginModal()">&times;</span>
        <img src="images/logo.png" alt="Mam Mam Logo" class="modal-logo">
        <h1 class="modal-title">MĂM MĂM</h1>
        <h2 class="modal-subtitle">VUI LÒNG ĐĂNG NHẬP</h2>
        <form action="login" method="post">
            <label>Username</label>
            <input type="text" name="username" placeholder="Số điện thoại/ Gmail" required>
            <label>Password</label>
            <input type="password" name="password" required>
            <div class="forgot">
                <a href="#">Quên mật khẩu?</a>
            </div>
            <button type="submit">Submit</button>
        </form>
        <p class="register">
            Bạn chưa có tài khoản? <a href="register.jsp"><strong>Đăng ký ngay</strong></a>
        </p>
    </div>
</div>

<!-- Script login modal -->
<script>
    function openLoginModal() {
        document.getElementById('loginModal').style.display = 'block';
    }
    function closeLoginModal() {
        document.getElementById('loginModal').style.display = 'none';
    }
    window.onclick = function(event) {
        const modal = document.getElementById('loginModal');
        if (event.target === modal) {
            closeLoginModal();
        }
    };
</script>

</body>
</html>

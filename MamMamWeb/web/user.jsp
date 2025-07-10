<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="Model.User"%>
<%@page session="true"%>
<%
    User user = (User) session.getAttribute("user");
    if (user == null) {
        response.sendRedirect("login.jsp");
        return;
    }
%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <title>Hồ sơ người dùng</title>
        <link rel="stylesheet" href="css/profile.css">
    </head>
    <body>
        <header>
            <div class="logo">
                <a href="home"><img src="images/logo.png" alt="Mam Mam Logo"></a>
            </div>
            <nav>
                <a href="home">Home</a>
                <a href="menu">Menu</a>
                <a href="cart.jsp">Cart</a>

                <% if (user == null) { %>
                <a href="login.jsp" class="login-btn">Login</a>
                <% } else { %>
                <a href="user.jsp">My Profile</a>
                <% }%>
            </nav>
        </header>

        <main class="profile-container">
            <h2>HỒ SƠ CỦA TÔI</h2>
            <p>Quản lý thông tin để bảo mật tài khoản</p>

            <form action="UpdateProfileServlet" method="post" class="profile-form">
                <label>Họ: <input type="text" name="lastname" value="<%= user.getLastname()%>" required></label>
                <label>Tên: <input type="text" name="name" value="<%= user.getFirstname()%>" required></label>
                <label>Số điện thoại: <input type="text" name="phone" value="<%= user.getPhone()%>" required></label>
                <label>Email: <input type="email" name="email" value="<%= user.getEmail()%>" required></label>
                <div class="gender-box">
                    <span>Giới tính:</span>
                    <label><input type="radio" name="gender" value="Nam" <%= "Nam".equals(user.getGender()) ? "checked" : ""%>> Nam</label>
                    <label><input type="radio" name="gender" value="Nữ" <%= "Nữ".equals(user.getGender()) ? "checked" : ""%>> Nữ</label>
                    <label><input type="radio" name="gender" value="Khác" <%= "Khác".equals(user.getGender()) ? "checked" : ""%>> Khác</label>
                </div>
                <button type="submit">Lưu thay đổi</button>
            </form>

            <% String msg = (String) request.getAttribute("message");
                if (msg != null) {%>
            <p class="message"><%= msg%></p>
            <% }%>
        </main>

        <footer>
            <div class="footer-content">
                <div class="contact-info">
                    <h3>CONTACT INFORMATION</h3>
                    <p>Mam Mam Korean Food<br>
                        Address: FPT University, Hoa Hai Ward, Ngu Hanh Son District, Da Nang City<br>
                        HOTLINE: 0123.456.789<br>
                        Email: mammam.food@gmail.com
                    </p>
                </div>
                <div class="logo-footer">
                    <img src="images/logo.png" alt="Mam Mam Logo">
                </div>
            </div>
        </footer>
    </body>
</html>

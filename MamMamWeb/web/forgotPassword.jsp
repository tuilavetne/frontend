<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="Model.User"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Quên mật khẩu</title>
    <link rel="stylesheet" href="css/forgotPassword.css">
</head>
<body>
    <div class="modal-content">
        <img src="images/logo.png" alt="Mam Mam Logo" class="modal-logo">
        <h1 class="modal-title">MĂM MĂM</h1>
        <h2 class="modal-subtitle">KHÔI PHỤC MẬT KHẨU</h2>

        <form action="ResetPasswordServlet" method="post">
            <label>Email đã đăng ký</label>
            <input type="email" name="email" placeholder="Nhập email của bạn" required>

            <label>Mật khẩu mới</label>
            <input type="password" name="newPassword" placeholder="Nhập mật khẩu mới" required>

            <label>Xác nhận mật khẩu</label>
            <input type="password" name="confirmPassword" placeholder="Xác nhận mật khẩu" required>

            <button type="submit">Đặt lại mật khẩu</button>
        </form>

        <p style="text-align: center; margin-top: 10px;">
            <a href="home">Quay về trang chủ</a>
        </p>
    </div>
</body>
</html>


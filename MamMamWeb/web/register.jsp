<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <title>Đăng ký - Mam Mam</title>
        <link rel="stylesheet" href="css/register.css"> 
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
    </head>
    <body>
        <div class="login-container">
            <img src="images/logo.png" alt="Mam Mam Logo" class="logo">
            <h1 class="title">ĐĂNG KÝ</h1>

            <form action="register" method="post" class="register-form">
                <input type="text" name="lastname" placeholder="Họ" required>
                <input type="text" name="firstname" placeholder="Tên" required>
                <input type="text" name="phone" placeholder="Số điện thoại" required>
                <input type="email" name="email" placeholder="E-mail">
                <input type="password" name="password" placeholder="Mật khẩu" required>
                <input type="password" name="confirmPassword" placeholder="Xác nhận mật khẩu" required>

                <select name="gender" required>
                    <option value="">Giới tính</option>
                    <option value="male">Nam</option>
                    <option value="female">Nữ</option>
                    <option value="other">Khác</option>
                </select>


                <div class="policy">
                    <input type="checkbox" required> Đồng ý với 
                    <a href="#">Chính sách, quy định chung</a> và 
                    <a href="#">Thông báo bảo mật cá nhân</a>
                </div>

                <button type="submit" class="submit-btn">ĐĂNG KÝ</button>
            </form>

            <p class="register">Bạn đã có tài khoản? <a href="login.jsp"><strong>Đăng nhập</strong></a></p>
        </div>
    </body>
</html>

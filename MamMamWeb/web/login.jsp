<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <title>Login - Mam Mam</title>
        <link rel="stylesheet" href="css/login.css">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
    </head>
    <body>
        <div class="login-container">
            <img src="images/logo.png" alt="Mam Mam Logo" class="logo">
            <h1 class="title">MĂM MĂM</h1>
            <h2 class="subtitle">VUI LÒNG ĐĂNG NHẬP</h2>

            <form action="login" method="post">
                <label for="username">Username</label>
                <input type="text" id="username" name="username" placeholder="Số điện thoại/ Gmail" required>

                <label for="password">Password</label>
                <input type="password" id="password" name="password" required>

                <a href="#" onclick="goToForgotPassword()">Quên mật khẩu?</a>
                <button type="submit">Submit</button>
            </form>

            <p class="register">
                Bạn chưa có tài khoản? <a href="#" onclick="openRegisterModal()"><strong>Đăng ký ngay</strong></a>
            </p>
        </div>
        <!-- Modal -->
        <div id="registerModal" class="modal">
            <div class="modal-content">
                <span class="close" onclick="closeRegisterModal()">&times;</span>
                <div class="modal-body" id="registerContent">
                    <!-- register.jsp sẽ được load ở đây -->
                </div>
            </div>
        </div>

        <!-- JavaScript để hiển thị modal và load register.jsp -->
        <script>
            function openRegisterModal() {
                // Gọi file register.jsp bằng AJAX
                fetch('register.jsp')
                        .then(response => response.text())
                        .then(html => {
                            document.getElementById('registerContent').innerHTML = html;
                            document.getElementById('registerModal').style.display = 'block';
                        })
                        .catch(error => {
                            alert("Lỗi khi tải form đăng ký!");
                            console.error(error);
                        });
            }

            function closeRegisterModal() {
                document.getElementById('registerModal').style.display = 'none';
            }
        </script>

        <script>
            function goToForgotPassword() {
                // Đóng modal (nếu có)
                document.getElementById('loginModal').style.display = 'none';
                // Chuyển trang
                window.location.href = 'forgotPassword.jsp';
            }
        </script>

    </body>
</html>

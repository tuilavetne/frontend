<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Chỉnh sửa thông tin nhân viên</title>
    <link rel="stylesheet" href="css/employee_profile.css">
</head>
<body>
    <header class="navbar">
        <div class="logo">
            <img src="images/logo.png" alt="Mam Mam Logo">
        </div>
        <h2>Thông tin nhân viên</h2>
    </header>

    <main class="profile-section">
        <h3>Chỉnh sửa thông tin cá nhân</h3>
        <form action="UpdateEmployeeServlet" method="post" class="profile-form">
            <label>Mã nhân viên:</label>
            <input type="text" name="id" value="${employee.id}" readonly>

            <label>Họ tên:</label>
            <input type="text" name="name" value="${employee.name}" required>

            <label>Email:</label>
            <input type="email" name="email" value="${employee.email}" required>

            <label>Số điện thoại:</label>
            <input type="text" name="phone" value="${employee.phone}" required>

            <label>Địa chỉ:</label>
            <input type="text" name="address" value="${employee.address}" required>

            <button type="submit">Lưu thay đổi</button>
        </form>
    </main>
</body>
</html>

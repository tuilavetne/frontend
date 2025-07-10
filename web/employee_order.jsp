<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>Quản lý đơn hàng</title>
    <link rel="stylesheet" href="css/employee_order.css">
</head>
<body>
    <header class="navbar">
        <div class="logo">
            <img src="images/logo.png" alt="Mam Mam Logo">
        </div>
        <h2>Quản lý đơn hàng</h2>
    </header>

    <main class="order-table-section">
        <h3>Đơn hàng</h3>
        <table class="order-table">
            <thead>
                <tr>
                    <th>Mã đơn hàng</th>
                    <th>Tên khách hàng</th>
                    <th>Món đã đặt</th>
                    <th>Số lượng</th>
                    <th>Tổng tiền</th>
                    <th>Ngày đặt</th>
                    <th>Trạng thái</th>
                </tr>
            </thead>
            <tbody>
                <c:forEach var="o" items="${orderList}">
                    <tr>
                        <td>${o.id}</td>
                        <td>${o.customerName}</td>
                        <td>${o.items}</td>
                        <td>${o.quantity}</td>
                        <td>${o.total} đ</td>
                        <td>${o.date}</td>
                        <td class="status ${o.status == 'Chờ xử lý' ? 'status-pending' : (o.status == 'Đã xác nhận' ? 'status-confirmed' : 'status-delivered')}">
                            ${o.status}
                        </td>
                    </tr>
                </c:forEach>
            </tbody>
        </table>
    </main>
</body>
</html>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>Xử lý đơn hàng</title>
    <link rel="stylesheet" href="css/employee_order.css">
</head>
<body>
    <header class="navbar">
        <div class="logo">
            <img src="images/logo.png" alt="Mam Mam Logo">
        </div>
        <h2>Xử lý đơn hàng</h2>
    </header>

    <main class="order-table-section">
        <h3>Danh sách đơn hàng cần xử lý</h3>
        <table class="order-table">
            <thead>
                <tr>
                    <th>Mã đơn</th>
                    <th>Khách hàng</th>
                    <th>Món ăn</th>
                    <th>Số lượng</th>
                    <th>Tổng tiền</th>
                    <th>Ngày đặt</th>
                    <th>Trạng thái</th>
                    <th>Hành động</th>
                </tr>
            </thead>
            <tbody>
                <c:forEach var="o" items="${orders}">
                    <tr>
                        <td>${o.id}</td>
                        <td>${o.customerName}</td>
                        <td>${o.foodName}</td>
                        <td>${o.quantity}</td>
                        <td>${o.totalPrice}</td>
                        <td>${o.orderDate}</td>
                        <td class="status ${o.status == 'Chờ xử lý' ? 'status-pending' : (o.status == 'Đã xác nhận' ? 'status-confirmed' : 'status-delivered')}">
                            ${o.status}
                        </td>
                        <td>
                            <form method="post" action="HandleOrderServlet">
                                <input type="hidden" name="orderId" value="${o.id}">
                                <button type="submit" name="action" value="confirm" class="btn-confirm">Xác nhận</button>
                                <button type="submit" name="action" value="cancel" class="btn-cancel">Hủy</button>
                            </form>
                        </td>
                    </tr>
                </c:forEach>
            </tbody>
        </table>
    </main>
</body>
</html>


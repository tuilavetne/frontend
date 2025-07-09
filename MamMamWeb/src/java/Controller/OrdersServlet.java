package controller;

import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.util.List;
import java.util.UUID;
import Model.CartItem;
import Model.Order;

@WebServlet("/orders")
public class OrdersServlet extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        request.setCharacterEncoding("UTF-8");

        String fullName = request.getParameter("fullName");
        String phone = request.getParameter("phone");
        String address = request.getParameter("address");
        String note = request.getParameter("note");
        String payment = request.getParameter("payment");

        HttpSession session = request.getSession();
        List<CartItem> cart = (List<CartItem>) session.getAttribute("cart");

        if (cart == null || cart.isEmpty()) {
            response.sendRedirect("cart.jsp");
            return;
        }

        String orderId = "ORD-" + UUID.randomUUID().toString().substring(0, 8);
        Order order = new Order(orderId, fullName, phone, address, note, payment, cart);

        session.removeAttribute("cart");

        List<Order> orders = (List<Order>) session.getAttribute("orders");
        if (orders == null) {
            orders = new java.util.ArrayList<>();
        }
        orders.add(order);
        session.setAttribute("orders", orders);

        request.setAttribute("order", order);
        request.getRequestDispatcher("orders.jsp").forward(request, response);
    }
}

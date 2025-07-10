package controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import java.io.IOException;
import model.User;

@WebServlet("/register")
public class RegisterServlet extends HttpServlet {
    protected void doPost(HttpServletRequest req, HttpServletResponse res)
            throws ServletException, IOException {

        req.setCharacterEncoding("UTF-8");

        // Lấy thông tin từ form
        String lastName = req.getParameter("lastname");
        String firstName = req.getParameter("firstname");
        String phone = req.getParameter("phone");
        String email = req.getParameter("email");
        String password = req.getParameter("password");
        String gender = req.getParameter("gender");

        // Tạo user
        User user = new User(lastName, firstName, phone, email, password, gender);

        // Lưu vào session
        HttpSession session = req.getSession();
        session.setAttribute("user", user); // lưu toàn bộ đối tượng user
        session.setAttribute("userPhone", phone); // để login check
        session.setAttribute("userPassword", password); // để login check
        session.setAttribute("loggedIn", true);

        res.sendRedirect("home.jsp");
    }
}

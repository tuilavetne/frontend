package controller;

import model.User;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;
import java.io.IOException;

@WebServlet(name = "UpdateUserServlet", urlPatterns = {"/UpdateUserServlet"})
public class UpdateUserServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        // Lấy session hiện tại
        HttpSession session = request.getSession();
        User user = (User) session.getAttribute("user");

        if (user == null) {
            response.sendRedirect("login.jsp");
            return;
        }

        // Lấy dữ liệu từ form
        String firstname = request.getParameter("name");
        String phone = request.getParameter("phone");
        String email = request.getParameter("email");
        String gender = request.getParameter("gender");

        // Cập nhật vào user object
        user.setFirstname(firstname);
        user.setPhone(phone);
        user.setEmail(email);
        user.setGender(gender);
    
        // Gán lại vào session để hiển thị
        session.setAttribute("user", user);
        request.setAttribute("message", "Cập nhật thành công!");
        request.getRequestDispatcher("user.jsp").forward(request, response);
    }
}

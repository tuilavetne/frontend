/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import model.User;

/**
 *
 * @author vongoc
 */

@WebServlet("/login")
public class LoginServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        request.setCharacterEncoding("UTF-8");

        String account = request.getParameter("phone"); 
        String password = request.getParameter("password");

        HttpSession session = request.getSession();
        User user = (User) session.getAttribute("user");
        String registeredPhone = (String) session.getAttribute("userPhone");
        String registeredPassword = (String) session.getAttribute("userPassword");

        if (user != null) {
            String registeredEmail = user.getEmail();
            boolean accountMatch = account.equals(registeredPhone) || account.equalsIgnoreCase(registeredEmail);
            boolean passwordMatch = password.equals(registeredPassword);

            if (accountMatch && passwordMatch) {
                session.setAttribute("loggedIn", true);
                session.setAttribute("user", user);
                response.sendRedirect("home.jsp");
                return;
            }
        }

        request.setAttribute("error", "Số điện thoại hoặc email hoặc mật khẩu không đúng.");
        request.getRequestDispatcher("login.jsp").forward(request, response);
    }
}

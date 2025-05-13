/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controllers;

import Models.UserDAO;
import Models.Users;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

/**
 *
 * @author ADMIN
 */
public class ControllorAdmin extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet ControllorAdmin</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet ControllorAdmin at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession();
        String id = request.getParameter("id");
        String name = request.getParameter("name");
        boolean check = false;
        String account = request.getParameter("account");
        String password = request.getParameter("password");
        String birthdate = request.getParameter("birthdate");
        String email = request.getParameter("email");
        String phone = request.getParameter("phone");
        UserDAO da = new UserDAO();
        if (request.getParameter("op1") != null) {
            if (request.getParameter("op1").equals("1")) {
                response.setContentType("text/html;charset=UTF-8");
                Users a = new Users(name, account, password, birthdate, email, phone, "1");
                da.updateAllById(a, id);
            } else if (request.getParameter("op1").equals("2")) {
                if (request.getParameter("status").equals("1")) {
                    da.updateStatusById(id, "0");
                } else {
                    da.updateStatusById(id, "1");
                }
            } else if (request.getParameter("op1").equals("3")) {
                if (da.checkLibrian()) {
                    da.updateUserToLibrian(id);
                } else {
                    request.setAttribute("error", "Vai trò Libirian đã tồn tại");
                    request.getRequestDispatcher("manager_user.jsp").forward(request, response);
                }
            }
        } else if (request.getParameter("op2") != null) {
            Users a = new Users(name, account, password, birthdate, email, phone, "1");
            if (!da.checkExistUserNoStatus(account)) {
                if (da.checkExistEmail(email)) {
                    request.setAttribute("account", account);
                    request.setAttribute("name", name);
                    request.setAttribute("phone", phone);
                    request.setAttribute("birthday", birthdate);
                    request.setAttribute("error1", "This email already exists.");
                    request.getRequestDispatcher("manager_user.jsp").forward(request, response);
                } else {
                    da.add(new Users(name, account, password, birthdate, email, phone, "1"));
                    session.setAttribute("listuser", da.getAllUser());
                    check = true;
                }
            } else {
                request.setAttribute("account", account);
                request.setAttribute("name", name);
                request.setAttribute("email", email);
                request.setAttribute("phone", phone);
                request.setAttribute("birthday", birthdate);
                request.setAttribute("error1", "This account already exists.");
                request.getRequestDispatcher("manager_user.jsp").forward(request, response);
            }
        }
        session.setAttribute("listuser", da.getAllUser());
        response.sendRedirect("manager_user.jsp?result=" + (check ? "Add Successed Fully" : ""));
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}

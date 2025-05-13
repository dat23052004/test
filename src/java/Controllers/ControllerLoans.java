/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controllers;

import Models.BookDAO;
import Models.LoanDAO;
import Models.Loans;
import Models.Users;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.util.ArrayList;

/**
 *
 * @author ADMIN
 */
public class ControllerLoans extends HttpServlet {

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
            out.println("<title>Servlet ControllerLoans</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet ControllerLoans at " + request.getContextPath() + "</h1>");
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
        BookDAO bookDA = new BookDAO();
        LoanDAO loanDA = new LoanDAO();
        HttpSession session = request.getSession();
        String mode = request.getParameter("mode");

        //1  laf update quantity
        if (mode != null && mode.equals("1")) {
            String id = request.getParameter("id");
            String number = request.getParameter("number");
            bookDA.updateQuantityById(id, number);
            session.setAttribute("librian_books", bookDA.getAllBooks());
            response.sendRedirect("librarian_updatebook.jsp");
        } else if (mode != null && mode.equals("2")) {
            String date = request.getParameter("date");
            String id = request.getParameter("id");
            loanDA.updatePickUpDate(id, date);
            session.setAttribute("librian_updatepickup", loanDA.getLoansNonePickUp());
            response.sendRedirect("librarian_updatepickupdate.jsp");
        } else if (mode != null && mode.equals("3")) {
            String date = request.getParameter("date");
            String id = request.getParameter("id");
            loanDA.updateReturnDate(id, date);
            session.setAttribute("librian_updatereturn", loanDA.getLoansPickUp());
            response.sendRedirect("librarian_updatereturndate.jsp");
        }
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
        LoanDAO da = new LoanDAO();
        if (request.getParameter("op") == null) {
            Users current = (Users) session.getAttribute("user");
            String idBook = request.getParameter("id_book");
            String idUser = current.getId();
            String quantity = request.getParameter("quantity");
            da.addLoan(idBook, idUser, quantity);
            ArrayList<Loans> data2 = da.getLoanByUserId(current.getId());
            session.setAttribute("data2", data2);
            response.sendRedirect("profile_borrowed.jsp");
        } else {
            if (request.getParameter("op").equals("1")) {
                String id = request.getParameter("id");
                String user_id = request.getParameter("user_id");
                String book_id = request.getParameter("book_id");
                String borrow_date = request.getParameter("borrow_date");
                String due_date = request.getParameter("due_date");
                String pickup_date = request.getParameter("pickup_date");
                String return_date = request.getParameter("return_date");
                String status = request.getParameter("status");
                String quantity = request.getParameter("quantity");
                Loans a = new Loans(id, user_id, book_id, borrow_date, due_date, pickup_date, return_date, status, quantity);
                da.Update(a);
            } else if (request.getParameter("op").equals("2")) {
                String id = request.getParameter("id");
                da.Del(id);
            }
            session.setAttribute("loanlist", da.getAllLoansForAdmin());
            response.sendRedirect("manager_loan.jsp");
        }
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

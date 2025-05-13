/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controllers;

import Models.Favorite;
import Models.FavoriteDAO;
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
public class ControllerBookFavorite extends HttpServlet {

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
            out.println("<title>Servlet ControllerBookFavorite</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet ControllerBookFavorite at " + request.getContextPath() + "</h1>");
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
        HttpSession session = request.getSession();

        String idbook = request.getParameter("idbook");
        String iduser = request.getParameter("iduser");
        FavoriteDAO da = new FavoriteDAO();
        if (request.getParameter("mode") != null && request.getParameter("mode").equals("1")) {
            da.Add(iduser, idbook);
            session.setAttribute("checkcr", true);
        } else if (request.getParameter("mode") != null && request.getParameter("mode").equals("2")) {
            da.DeleteById(iduser, idbook);
            session.setAttribute("checkcr", false);
        }
        ArrayList<Favorite> data3 = da.getFavoriteByUserId(iduser);
        session.setAttribute("data3", data3);
        response.sendRedirect("detailbook.jsp");
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
        String userid = request.getParameter("userid");
        String bookid = request.getParameter("bookid");
        FavoriteDAO da = new FavoriteDAO();
        if (request.getParameter("delete") != null) {
            da.DeleteById(userid,bookid);
            session.setAttribute("checkcr", true);
        }
        ArrayList<Favorite> data3 = da.getFavoriteByUserId(userid);
        session.setAttribute("data3", data3);
        response.sendRedirect("favorite.jsp");
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

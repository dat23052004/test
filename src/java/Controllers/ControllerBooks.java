package Controllers;

/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
import Models.BookDAO;
import Models.Books;
import Models.CategoryDAO;
import Models.FavoriteDAO;
import Models.LoanDAO;
import Models.UserDAO;
import Models.Users;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.time.LocalDate;
import java.util.ArrayList;

/**
 *
 * @author ADMIN
 */
public class ControllerBooks extends HttpServlet {

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
            out.println("<title>Servlet ControllerBooks</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet ControllerBooks at " + request.getContextPath() + "</h1>");
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
        ArrayList<Books> data = bookDA.getNewBooks();
        HttpSession session = request.getSession();
        FavoriteDAO favoDA = new FavoriteDAO();
        session.setAttribute("data", data);
        if (request.getParameter("mode") != null && request.getParameter("mode").equals("1")) {
            //chuyển hướng sang bên detail khi kích vào thẻ a ở bên home_user.jsp
            String id = request.getParameter("id");
            LocalDate currentDate = LocalDate.now();
            bookDA.updateBookCurrent();
            Books p = bookDA.getBookById(id);           
            Users d = (Users) session.getAttribute("user");     
            session.setAttribute("bookcr", p);
            if(d!=null)
                session.setAttribute("checkcr", favoDA.checkFavorite(d.getId(), id));
            response.sendRedirect("detailbook.jsp");
        } else {
            request.getRequestDispatcher("home.jsp").forward(request, response);
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
        UserDAO userDA = new UserDAO();
        HttpSession session = request.getSession();
        BookDAO bookDA = new BookDAO();
        CategoryDAO cateDA = new CategoryDAO();
        LoanDAO loanDA = new LoanDAO();
        BookDAO bookDa = new BookDAO();
        String id = request.getParameter("id");
        String title = request.getParameter("title");
        String author = request.getParameter("author");
        String category = request.getParameter("category");
        String quantity = request.getParameter("quantity");
        String image = request.getParameter("image");
        String introducing = request.getParameter("introducing");
        String count = request.getParameter("count");
        String language = request.getParameter("language");
        String publish = request.getParameter("publish");

        if (request.getParameter("op1") != null) {
            if (request.getParameter("op1").equals("1")) {
                Books a = new Books(id, title, author, category, quantity, image, introducing, count, language, publish);
                bookDa.updateBook(a);
            } else if (request.getParameter("op1").equals("2")) {
                Books a = new Books(id, title, author, category, quantity, image, introducing, count, language, publish);
                if (request.getParameter("status").equals("1")) {
                    bookDa.updateStatus(id, "0");
                } else if (request.getParameter("status").equals("0")) {
                    bookDa.updateStatus(id, "1");
                }
            }
        } else if (request.getParameter("op2") != null) {
            Books a = new Books(id, title, author, category, quantity, image, introducing, count, language, publish);
            bookDa.Add(a);

        }
        ArrayList<String> countbook = new ArrayList<>();
        countbook.add(loanDA.getCountBooksBorrow());
        countbook.add(bookDA.getCountAllBooks());
        session.setAttribute("listcountBO", countbook);
        session.setAttribute("listcountCA", cateDA.getListCountCategory());
        session.setAttribute("listbook", bookDa.getAllBooksForAdmin());
        response.sendRedirect("manager_book.jsp");
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

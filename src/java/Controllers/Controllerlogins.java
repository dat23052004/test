package Controllers;

/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
import Models.BookDAO;
import Models.Books;
import Models.Categories;
import Models.CategoryDAO;
import Models.Favorite;
import Models.FavoriteDAO;
import Models.LoanDAO;
import Models.Loans;
import Models.Users;
import Models.UserDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.net.URLEncoder;
import java.util.ArrayList;
import java.util.Date;

/**
 *
 * @author ADMIN
 */
public class Controllerlogins extends HttpServlet {

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
            out.println("<title>Servlet logins</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet logins at " + request.getContextPath() + "</h1>");
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

        UserDAO userDA = new UserDAO();
        String account = request.getParameter("account");
        String password = request.getParameter("pass");
        String name = request.getParameter("name");
        String email = request.getParameter("email");
        String phone = request.getParameter("phone");
        String birthday = request.getParameter("birthday");
        if (!(account == null)) {
            if (!userDA.checkExistUser(account)) {
                if (userDA.checkExistEmail(email)) {
                    request.setAttribute("account1", account);
                    request.setAttribute("name", name);
                    request.setAttribute("phone", phone);
                    request.setAttribute("birthday", birthday);
                    request.setAttribute("error1", "This email already exists.");
                } else {
                    userDA.add(new Users(name, account, password, birthday, email, phone, "1"));
                    request.setAttribute("mode", "signup");
                    request.setAttribute("result", "Registration successful! Please log in to continue.");
                }
            } else {
                request.setAttribute("account1", account);
                request.setAttribute("name", name);
                request.setAttribute("email", email);
                request.setAttribute("phone", phone);
                request.setAttribute("birthday", birthday);
                request.setAttribute("error1", "This account already exists.");
            }
        }

        request.getRequestDispatcher("Login.jsp").forward(request, response);

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
        //Xử lý phần từ trang detail_book sang trang login và từ login chuyển sang loans

        String account = request.getParameter("account");
        String password = request.getParameter("password");
        UserDAO userDA = new UserDAO();
        FavoriteDAO favoDAO = new FavoriteDAO();
        HttpSession session = request.getSession();
        BookDAO bookDA = new BookDAO();
        CategoryDAO cateDA = new CategoryDAO();
        LoanDAO loanDA = new LoanDAO();
        if (userDA.checkUser(account, password)) {
            if (userDA.getinforbyAccount(account).getRule().equals("1")) {
                ArrayList<Categories> data1 = cateDA.getListCategory();
                ArrayList<Books> data = bookDA.getNewBooks();
                session.setAttribute("data", data); 
                session.setAttribute("data1", data1);
                Users user = userDA.getinforbyAccount(account);
                session.setAttribute("user", user);
                ArrayList<Loans> data2 = loanDA.getLoanByUserId(user.getId());
                session.setAttribute("data2", data2);
                ArrayList<Favorite> data3 = favoDAO.getFavoriteByUserId(user.getId());
                session.setAttribute("data3", data3);
                //tất cả đoạn này để sử lý phần chưa đăng nhập
                if (request.getParameter("status") != null && request.getParameter("status").equals("1")) {
                    response.sendRedirect("loans.jsp");
                } else if (request.getParameter("status") != null && request.getParameter("status").equals("2")) {
                    response.sendRedirect("detailbook.jsp");
                } else {
                    response.sendRedirect("home_user.jsp");
                }
            } else if (userDA.getinforbyAccount(account).getRule().equals("2")) {
                session.setAttribute("librian_books", bookDA.getAllBooks());
                session.setAttribute("librian_loans", loanDA.getAllLoans());
                session.setAttribute("librian_updatereturn", loanDA.getLoansPickUp());
                session.setAttribute("librian_updatepickup", loanDA.getLoansNonePickUp());
                response.sendRedirect("librarian_updatebook.jsp");
            } else if (userDA.getinforbyAccount(account).getRule().equals("3")) {
                session.setAttribute("loanlist", loanDA.getAllLoansForAdmin());
                session.setAttribute("categoryList", cateDA.getListCategory());
                session.setAttribute("listuser", userDA.getAllUser());
                session.setAttribute("listbook", bookDA.getAllBooksForAdmin());
                ArrayList<String> countbook = new ArrayList<>();
                countbook.add(loanDA.getCountBooksBorrow());
                countbook.add(bookDA.getCountAllBooks());
                session.setAttribute("listcountBO", countbook);
                session.setAttribute("listcountCA", cateDA.getListCountCategory());
                response.sendRedirect("home_admin.jsp");
            }
        } else {
            request.setAttribute("error3", "Invalid username or password.");
            request.setAttribute("account", account);
            request.setAttribute("mode", "signup");
            request.getRequestDispatcher("Login.jsp").forward(request, response);

        }
    }
}

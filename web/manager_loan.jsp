<%-- 
    Document   : manager_loan
    Created on : Mar 16, 2025, 3:22:51 PM
    Author     : ADMIN
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Admin Dashboard - Quản Lý Mượn Sách</title>
        <style>
            body {
                font-family: Arial, sans-serif;
                margin: 0;
                padding: 0;
                background-color: #f4f4f4;
            }
            .sidebar {
                width: 250px;
                background: #333;
                color: white;
                position: fixed;
                top: 0;
                left: 0;
                height: 100%;
                padding: 20px;
            }
            .sidebar a {
                color: white;
                text-decoration: none;
                display: block;
                padding: 10px;
                margin-bottom: 10px;
                background: #444;
                border-radius: 5px;
            }
            .container {
                margin-left: 270px;
                padding: 20px;
            }
            table {
                width: 100%;
                border-collapse: collapse;
                background: white;
            }
            th, td {
                border: 1px solid #ddd;
                padding: 10px;
                text-align: left;
            }
            th {
                background: #3498db;
                color: white;
            }
            .actions button {
                padding: 5px 10px;
                margin: 2px;
                border: none;
                cursor: pointer;
                border-radius: 3px;
            }
            .edit {
                background: #f1c40f;
            }
            .delete {
                background: #e74c3c;
                color: white;
            }
        </style>
    </head>
    <body>
        <div class="sidebar">
            <h2>📚 Admin Panel</h2>
            <a href="home_admin.jsp">📊 Dashboard</a>
            <a href="manager_user.jsp">👥 Quản Lý Người Dùng</a>
            <a href="manager_book.jsp">📖 Quản Lý Sách</a>
            <a href="manager_loan.jsp">📚 Quản Lý Mượn Sách</a>
            <a href="admin_setting.jsp">⚙️ Cài Đặt</a>
        </div>
        <div class="container">
            <h1>📚 Quản Lý Mượn Sách</h1>
            <table>
                <thead>
                    <tr>
                        <th>ID Mượn</th>
                        <th>ID người mượn</th>
                        <th>ID sách</th>
                        <th>Ngày mượn</th>
                        <th>Hạn Trả</th>
                        <th>Ngày Lấy sách</th>
                        <th>Ngày Trả sách</th>
                        <th>Trạng thái</th>
                        <th>Số lượng</th>
                    </tr>
                </thead>
                <tbody>
                <form action="Loans" method="post">
                    <c:forEach items="${sessionScope.loanlist}" var="a">
                        <input type="hidden" name="status" value="${a.getStatus()}">
                        <input type="hidden" name="id" value="${a.getId()}">
                        <tr>
                            <td>${a.getId()}</td>
                            <td><input type="text" name="user_id" value="${a.getUser_id()}"></td>
                            <td><input type="text" name="book_id" value="${a.getBook_id()}"></td>
                            <td><input type="date" name="borrow_date" value="${a.getBorrow_date().substring(0, 10)}"></td>
                            <td><input type="date" name="due_date" value="${a.getDue_date().substring(0, 10)}"></td>
                            <td><input type="date" name="pickup_date" value="${a.getPickup_date().substring(0, 10)}"></td>
                            <td><input type="date" name="return_date" value="${a.getReturn_date().substring(0, 10)}"></td>
                            <td><input type="text"  value="${a.getEmail()}"></td>
                            <td><input type="text" name="quantity" value="${a.getQuantity()}"></td>
                            <td class="actions">
                                <button name="op" type="submit" value="1" class="edit">Update</button>
                                <button name="op" type="submit" value="2" class="delete">Delete</button>
                            </td>
                        </tr>
                    </c:forEach>
                </form>
                </tbody>
            </table>
        </div>
    </body>
</html>


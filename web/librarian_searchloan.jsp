<%-- 
    Document   : librarian_searchloan
    Created on : Mar 16, 2025, 3:54:19 PM
    Author     : ADMIN
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Tra Cứu Mượn Sách</title>
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
                text-align: center;
            }
            .search-box {
                margin-bottom: 20px;
            }
            .search-box input {
                padding: 10px;
                width: 50%;
                border: 1px solid #ccc;
                border-radius: 5px;
            }
            .table-container {
                background: white;
                padding: 20px;
                border-radius: 5px;
                box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            }
            table {
                width: 100%;
                border-collapse: collapse;
                margin-top: 20px;
            }
            th, td {
                border: 1px solid #ddd;
                padding: 10px;
                text-align: left;
            }
            th {
                background-color: #3498db;
                color: white;
            }
        </style>
        <script>
            function searchBook() {
                let input = document.getElementById("searchInput").value.toLowerCase();
                let rows = document.querySelectorAll("tbody tr");
                rows.forEach(row => {
                    let bookTitle = row.cells[1].textContent.toLowerCase();
                    row.style.display = bookTitle.includes(input) ? "" : "none";
                });
            }
        </script>
    </head>
    <body>
        <div class="sidebar">
            <h2>📚 Thủ Thư</h2>
            <a href="librarian_updatebook.jsp">📖 Quản Lý Sách</a>
            <a href="librarian_updatepickupdate.jsp">📅 Cập Nhật Ngày Đến Lấy</a>
            <a href="librarian_updatereturndate.jsp" class="active">📅 Cập Nhật Ngày Trả</a>
            <a href="librarian_searchloan.jsp" class="active">🔍 Tra Cứu Mượn Sách</a>
        </div>
        <div class="container">
            <h1>🔍 Tra Cứu Mượn Sách</h1>
            <div class="search-box">
                <input type="text" id="searchInput" onkeyup="searchBook()" placeholder="Nhập tên sách...">
            </div>
            <div class="table-container">
                <table>
                    <thead>
                        <tr>
                            <th>Mã Mượn</th>
                            <th>Tên Sách</th>
                            <th>Số lượng</th>
                            <th>Người Mượn</th>
                            <th>Email</th>
                            <th>Ngày Mượn</th>
                            <th>Ngày Lấy</th>
                            <th>Hạn Trả</th>
                            <th>Ngày Trả</th>
                            <th>Trạng thái</th>
                        </tr>
                    </thead>
                    <tbody>
                        <c:forEach items="${librian_loans}" var="a">
                            <tr>
                                <td>${a.getId()}</td>
                                <td>${a.getBook_id()}</td>
                                <td>${a.getQuantity()}</td>
                                <td>${a.getUser_id()}</td>
                                <td>${a.getEmail()}</td>
                                <td>${a.getBorrow_date()}</td>
                                <td>${a.getPickup_date()}</td>
                                <td>${a.getDue_date()}</td>
                                <td>${a.getReturn_date()}</td>
                                <td>${a.getStatus()}</td>  
                            </tr>
                        </c:forEach> 
                    </tbody>
                </table>
            </div>
        </div>
    </body>
</html>

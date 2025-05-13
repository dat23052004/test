<%-- 
    Document   : librarian_updatereturndate
    Created on : Mar 16, 2025, 3:52:05 PM
    Author     : ADMIN
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Thủ Thư - Cập Nhật Ngày Trả Sách</title>
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
            button {
                padding: 5px 10px;
                border: none;
                background: #28a745;
                color: white;
                cursor: pointer;
                border-radius: 4px;
            }
            button:hover {
                background: #218838;
            }
        </style>
        <script>
            function setTodayDate() {
                let today = new Date().toISOString().split('T')[0];
                document.querySelectorAll("input[type='date']").forEach(input => {
                    input.value = today;
                });
            }
            window.onload = setTodayDate;
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
            <h1>📅 Danh Sách Khoản Mượn</h1>
            <div class="table-container">
                <table>
                    <thead>
                        <tr>
                            <th>Mã Mượn</th>
                            <th>Người Mượn</th>
                            <th>Email</th>
                            <th>Ngày Trả</th>
                            <th>Xác Nhận</th>
                        </tr>
                    </thead>

                    <tbody>
                    <c:forEach items="${librian_updatereturn}" var="a">
                            <tr>
                        <form action="Loans">
                            <td>${a.getId()}</td>
                            <td>${a.getUser_id()}</td>
                            <td>${a.getEmail()}</td>
                            <td><input name="date" type="date"></td>
                            <td><button type="submit">Xác Nhận Trả Sách</button></td>
                            <input type="hidden" name="id" value="${a.getId()}">
                            <input type="hidden" name="mode" value="3">
                        </form>
                        </tr>
                    </c:forEach>
                    </tbody>
                </table>
            </div>
        </div>
    </body>
</html>

<%-- 
    Document   : manager_user
    Created on : Mar 16, 2025, 3:19:20 PM
    Author     : ADMIN
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Admin Dashboard - Quản Lý Người Dùng</title>
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
                left: -250px;
                height: 100%;
                padding: 20px;
                transition: left 0.3s;
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
                margin-left: 20px;
                padding: 20px;
                transition: margin-left 0.3s;
            }
            .toggle-btn {
                position: fixed;
                left: 10px;
                top: 10px;
                background: #3498db;
                color: white;
                padding: 10px;
                border: none;
                cursor: pointer;
                border-radius: 5px;
                z-index: 1000;
            }
            .show-sidebar .sidebar {
                left: 0;
            }
            .show-sidebar .container {
                margin-left: 270px;
            }
            table {
                width: 100%;
                border-collapse: collapse;
                background: white;
                border-radius: 10px;
                overflow: hidden;
                box-shadow: 0px 5px 15px rgba(0, 0, 0, 0.1);
                table-layout: fixed;
            }
            th, td {
                border: 1px solid #ddd;
                padding: 12px;
                text-align: left;
                word-wrap: break-word;
                overflow: hidden;
            }
            th {
                background: #3498db;
                color: white;
                text-transform: uppercase;
            }
            tbody tr:nth-child(even) {
                background-color: #f9f9f9;
            }
            tbody tr:hover {
                background-color: #f1f1f1;
            }
            .actions button {
                padding: 8px 12px;
                margin: 2px;
                border: none;
                cursor: pointer;
                border-radius: 5px;
                font-size: 14px;
                transition: background 0.3s ease;
            }
            .edit {
                background: #f1c40f;
                color: white;
            }
            .edit:hover {
                background: #d4ac0d;
            }
            .delete {
                background: #e74c3c;
                color: white;
            }
            .delete:hover {
                background: #c0392b;
            }
            .promote {
                background: #2ecc71;
                color: white;
            }
            .promote:hover {
                background: #27ae60;
            }
            input[type="radio"] {
                margin-right: 5px;
            }
            select{
                width: 90px;
            }

            .search-box {
                margin-bottom: 20px;
            }
            .search-box input {
                padding: 10px;
                width: 300px;
                border: 1px solid #ddd;
                border-radius: 5px;
            }
            .add-user-form {
                margin-bottom: 20px;
                background: white;
                padding: 15px;
                border-radius: 10px;
                box-shadow: 0px 5px 15px rgba(0, 0, 0, 0.1);
            }
            .add-user-form input, .add-user-form button {
                padding: 10px;
                margin: 5px;
                border: 1px solid #ddd;
                border-radius: 5px;
            }
            .add-user-form button {
                background: #3498db;
                color: white;
                cursor: pointer;
            }
            .add-user-form button:hover {
                background: #2980b9;
            }
            .actions button {
                padding: 8px 12px;
                margin: 2px;
                border: none;
                cursor: pointer;
                border-radius: 5px;
                font-size: 14px;
                transition: background 0.3s ease;
                width: 100px;
            }
            td input {
                width: 100%;
                border: none;
                background: transparent;
                text-align: left;
                word-wrap: break-word;
                overflow: auto;
                white-space: normal;
            }
            td input:focus {
                outline: none;
                border-bottom: 1px solid #3498db;
            }
            thead th{
                font-size: 13px;
            }
            input[name="phone"][type="number"]::-webkit-inner-spin-button,
            input[name="phone"][type="number"]::-webkit-outer-spin-button {
                -webkit-appearance: none;
                margin: 0;
            }

            input[name="phone"][type="number"] {
                -moz-appearance: textfield; /* Firefox */
            }
        </style>
        <script>
            function toggleSidebar() {
                document.body.classList.toggle('show-sidebar');
            }
            function searchUser() {
                let input = document.getElementById("searchInput").value.toLowerCase();
                let rows = document.querySelectorAll("tbody tr");
                rows.forEach(row => {
                    let name = row.cells[1].textContent.toLowerCase();
                    if (name.includes(input)) {
                        row.style.display = "";
                    } else {
                        row.style.display = "none";
                    }
                });
            }
        </script>
    </head>
    <body>
        <button class="toggle-btn" onclick="toggleSidebar()">☰</button>
        <div class="sidebar">
            <h2>📚 Admin Panel</h2>
            <a href="home_admin.jsp">📊 Dashboard</a>
            <a href="manager_user.jsp">👥 Quản Lý Người Dùng</a>
            <a href="manager_book.jsp">📖 Quản Lý Sách</a>
            <a href="manager_loan.jsp">📚 Quản Lý Mượn Sách</a>
            <a href="admin_setting.jsp">⚙️ Cài Đặt</a>
        </div>
        <div class="container">
            <h1>👥 Quản Lý Người Dùng</h1>
            <div class="search-box">
                <input type="text" id="searchInput" placeholder="🔍 Tìm kiếm theo tên..." onkeyup="searchUser()">
            </div>
            <div class="add-user-form">
                <h2>➕ Thêm Người Dùng</h2>
                <%  String result = request.getParameter("result"); %>
                <p style="color: red">${error1}</p>
                <p style="color: green"><%=result%></p>
                <form action="admin" method="post">
                    <input  type="text" value="${name}" name="name" placeholder="Tên Người Dùng" required>
                    <input type="text" value="${account}" name="account" placeholder="Account" required>
                    <input type="password"  name="password" placeholder="Password" required>
                    <input type="date" value="${birthday}" name="birthdate" required>
                    <input type="email" value="${email}" name="email" placeholder="Email" required>
                    <input type="text" value="${phone}" name="phone" placeholder="Phone" required>
                    <button name="op2" type="submit">Thêm</button>
                </form>
            </div>
            <p style="color: red">${error}</p>
            <table>
                <thead>
                    <tr>
                        <th style="width: 2%">ID</th>
                        <th style="width: 10%">Tên Người Dùng</th>
                        <th>Account</th>
                        <th>Password</th>
                        <th>Birthdate</th>
                        <th style="width: 15%">Email</th>
                        <th style="width: 6%">Phone</th>
                        <th style="width: 5%">Role</th>
                        <th style="width: 3.5%">Status</th>
                        <th>Created</th>
                    </tr>
                </thead>
                <tbody>
                    <c:forEach items="${sessionScope.listuser}" var="a">
                        <tr>
                    <form action="admin" method="post">
                        <input type="hidden" name="id" value="${a.getId()}">
                        <input type="hidden" name="status" value="${a.getStatus()}">
                        <td>${a.getId()}</td>
                        <td><input type="text" name="name" value="${a.getName()}"></td>
                        <td><input type="text" name="account" value="${a.getAccount()}"></td>
                        <td><input type="text" name="password" value="${a.getPassword()}"></td>
                        <td><input type="date" name="birthdate" value="${a.getBirthday()}"></td>
                        <td><input type="email" name="email" value="${a.getEmail()}"></td>
                        <td><input type="number" name="phone" value="${a.getPhone()}"></td>
                        <td><input type="text" readonly value="${a.getRule()}"></td>
                        <td>
                            <c:if test="${a.getStatus() eq '1'}"> Hoạt Động </c:if> 
                            <c:if test="${a.getStatus() eq '0'}"> Ngừng Hoạt Động </c:if>
                            </td>
                            <td>${a.getCreateat()}</td>
                        <td class="actions">
                            <button name="op1" value="1" type="submit" class="edit">Update</button>
                            <c:if test="${a.getStatus() eq '1'}"> <button name="op1" value="2" type="submit" class="delete">Khóa tài khoản</button> </c:if> 
                            <c:if test="${a.getStatus() eq '0'}"> <button name="op1" value="2" type="submit" class="delete">Mở khóa tài khoản</button> </c:if>
                            
                            <button name="op1" value="3" type="submit" class="promote">Up to Libarian</button>
                        </td>
                    </form>
                    </tr>
                </c:forEach>
                </tbody>
            </table>
        </div>
    </body>
</html>


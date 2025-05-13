<%-- 
    Document   : librarian_updatebook
    Created on : Mar 16, 2025, 3:42:08 PM
    Author     : ADMIN
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
         <title>Dashboard - Thủ Thư</title>
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
        .dashboard-container {
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
        table, th, td {
            border: 1px solid #ccc;
        }
        th, td {
            padding: 10px;
            text-align: left;
        }
        th {
            background: #3498db;
            color: white;
        }
        button {
            padding: 5px 10px;
            border: none;
            background: #27ae60;
            color: white;
            cursor: pointer;
            border-radius: 4px;
        }
        button:hover {
            background: #219150;
        }
    </style>
</head>
<body>
    <div class="sidebar">
        <h2>📚 Thủ Thư Panel</h2>
        <a href="librarian_updatebook.jsp">📖 Quản Lý Sách</a>
            <a href="librarian_updatepickupdate.jsp">📅 Cập Nhật Ngày Đến Lấy</a>
            <a href="librarian_updatereturndate.jsp" class="active">📅 Cập Nhật Ngày Trả</a>
            <a href="librarian_searchloan.jsp" class="active">🔍 Tra Cứu Mượn Sách</a>
    </div>
    <div class="container">
        <h1>📦 Cập Nhật Số Lượng Sách</h1>
        <div class="dashboard-container">
            <table>
                <tr>
                    <th>Tên Sách</th>
                    <th>Tác Giả</th>
                    <th>Số Lượng</th>
                    <th>Hành Động</th>
                </tr>
                <c:forEach items="${librian_books}" var="a">
                    <tr>
                    <form action="Loans">
                        <td>${a.getTitle()}</td>
                        <td>${a.getAuthor()}</td>
                        <td><input type="number" name="number" value="${a.getQuantity()}"></td>
                        <td><button>Cập Nhật</button></td>
                        <input type="hidden" name="id" value="${a.getId()}">
                        <input type="hidden" name="mode" value="1">
                    </form>
                    </tr>
                </c:forEach>
            </table>
        </div>
    </div>
</body>
</html>


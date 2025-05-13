<%-- 
    Document   : manager_book
    Created on : Mar 16, 2025, 6:52:30 PM
    Author     : ADMIN
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Admin Dashboard - Quản Lý Sách</title>
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
            .books-container {
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
                padding: 8px;
                text-align: left;
            }
            th {
                background: #3498db;
                color: white;
            }
            button {
                padding: 5px 10px;
                border: none;
                cursor: pointer;
                border-radius: 4px;
            }
            .edit-btn {
                background: #f1c40f;
                color: white;
            }
            .delete-btn {
                background: #e74c3c;
                color: white;
            }
            .add-btn {
                background: #2ecc71;
                color: white;
                padding: 10px 15px;
                margin-bottom: 10px;
            }
            .form-container {
                display: none;
                background: white;
                padding: 20px;
                border-radius: 5px;
                box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
                margin-top: 20px;
            }
            .form-group {
                margin-bottom: 10px;
            }
            .form-group label {
                display: block;
                font-weight: bold;
            }
            .form-group input, .form-group select {
                width: 100%;
                padding: 8px;
                margin-top: 5px;
                border: 1px solid #ddd;
                border-radius: 4px;
            }
            .form-group textarea {
                height: 100px;
                width: 100%;
            }
            thead th{
                font-size: 12px;
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
            <h1>📖 Quản Lý Sách</h1>
            <div class="books-container">
                <button class="add-btn" onclick="document.getElementById('addBookForm').style.display = 'block'">➕ Thêm Sách</button>
                <form action="books" method="post">
                    <div id="addBookForm" class="form-container">
                        <h2>Thêm Sách</h2>
                        <div class="form-group">
                            <label>Tên Sách</label>
                            <input required="" name="title" type="text" id="bookTitle">
                        </div>
                        <div class="form-group">
                            <label>Tác Giả</label>
                            <input required="" name="author" type="text" id="bookAuthor">
                        </div>
                        <div class="form-group">
                            <label>Thể Loại</label>
                            <select name="category">
                                <c:forEach items="${sessionScope.categoryList}" var="a">
                                    <option value="${a.getId()}">${a.getName()}</option>
                                </c:forEach>
                            </select>
                        </div>
                        <div class="form-group">
                            <label>Số Lượng</label>
                            <input name="quantity" type="number" id="bookQuantity" min="1" required="" value="1">
                        </div>
                        <div class="form-group">
                            <label>Giới Thiệu</label>
                            <textarea required="" name="introducing" id="bookIntroduction"></textarea>
                        </div>
                        <div class="form-group">
                            <label>Số Trang</label>
                            <input required="" name="count" type="number" id="bookPageCount" min="1">
                        </div>
                        <div class="form-group">
                            <label>Đường dẫn ảnh</label>
                            <input required="" name="image" type="text" id="img">
                        </div>
                        <div class="form-group">
                            <label>Ngôn Ngữ</label>
                            <input required="" name="language" type="text" id="bookLanguage">
                        </div>
                        <button name="op2">Thêm</button>
                    </div>
                </form>
                <table>
                    <thead>
                        <tr>
                            <th>ID</th>
                            <th>Tên Sách</th>
                            <th>Tác Giả</th>
                            <th>Thể Loại</th>
                            <th>Số lượng</th>
                            <th>Đường dẫn ảnh</th>
                            <th>Giới thiệu</th>
                            <th>Số trang</th>
                            <th>Ngôn ngữ</th>
                            <th>Năm phát hành</th>
                            <th>Trạng thái</th>
                            <th>Hành Động</th>
                        </tr>
                    </thead>
                    <tbody id="bookTableBody">

                        <c:forEach items="${listbook}" var="a">
                        <form action="books" method="post">
                            <input type="hidden" name="id" value="${a.getId()}">
                            <tr>
                                <td>${a.getId()}</td>
                                <td><input type="text" name="title" value="${a.getTitle()}"></td>
                                <td><input type="text" name="author" value="${a.getAuthor()}"></td>
                                <td>
                                    <select name="category">
                                        <c:forEach items="${sessionScope.categoryList}" var="b">
                                            <option <c:if test="${b.getId() eq a.getCategory()}"> selected </c:if> value="${a.getCategory()}">${b.getName()}</option>
                                        </c:forEach>
                                    </select>
                                </td>
                                <td><input type="text" name="quantity" value="${a.getQuantity()}"></td>
                                <td><input type="text" name="image" value="${a.getImage()}"></td>
                                <td><input type="text" name="introducing" value="${a.getIntroducing()}"></td>
                                <td><input type="text" name="count" value="${a.getCount()}"></td>
                                <td><input type="text" name="language" value="${a.getLanguage()}"></td>
                                <td><input type="number" name="publish" value="${a.getPublish()}"></td>
                                <td><c:if test="${a.getStatus() eq '1'}"><input type="hidden" name="status" value="1">Hoạt Động</c:if><c:if test="${a.getStatus() eq '0'}"><input type="hidden" name="status" value="0">Ngừng Hoạt Động</c:if></td>
                                    <td>
                                        <button name="op1" type="submit" value="1" class="edit-btn">️Update</button>
                                        <c:if test="${a.getStatus() eq '1'}">
                                            <button name="op1" type="submit" value="2" class="delete-btn">️Delete</button>
                                        </c:if>
                                        <c:if test="${a.getStatus() eq '0'}">
                                            <button name="op1" type="submit" value="2" class="delete-btn">️Un-Delete</button>       
                                        </c:if>
                                    </td>
                                </tr>
                            </form>
                    </c:forEach>

                    </tbody>
                </table>
            </div>
        </div>

    </body>
</html>


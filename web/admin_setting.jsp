<%-- 
    Document   : manager_setting
    Created on : Mar 16, 2025, 3:34:23 PM
    Author     : ADMIN
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Admin Dashboard - Cài Đặt</title>
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
            .settings-container {
                background: white;
                padding: 20px;
                border-radius: 5px;
                box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);

                width: fixed;
            }
            .setting-item {
                margin-bottom: 15px;
            }
            label {
                display: inline-block;
                width:200px;
                font-weight: bold;
            }
            input {
                width: 60%;
                padding: 8px;
                margin-top: 5px;
                border: 1px solid #ccc;
                border-radius: 4px;
            }
            button {
                padding: 10px 15px;
                border: none;
                background: #3498db;
                color: white;
                cursor: pointer;
                border-radius: 4px;
            }
            button:hover {
                background: #2980b9;
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
            <h1>⚙️ Cài Đặt</h1>
            <div class="settings-container">
                <div class="setting-item">
                    <label for="old-password">Mật khẩu cũ:</label>
                    <input type="password" id="old-password" placeholder="Nhập mật khẩu cũ">
                </div>
                <div class="setting-item">
                    <label for="new-password">Mật khẩu mới:</label>
                    <input type="password" id="new-password" placeholder="Nhập mật khẩu mới">
                </div>
                <div class="setting-item">
                    <label for="confirm-password">Xác nhận mật khẩu mới:</label>
                    <input type="password" id="confirm-password" placeholder="Nhập lại mật khẩu mới">
                </div>
                <button>Lưu Cài Đặt</button>
            </div>
        </div>
    </body>
</html>


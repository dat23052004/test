<!DOCTYPE html>
<html lang="vi">
<head>
    <%@ page contentType="text/html; charset=UTF-8" %>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Đổi Mật Khẩu - Thư Viện Online</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
            background: url('https://wallpapercave.com/wp/wp5984568.jpg') no-repeat center center fixed;
            background-size: cover;
            display: flex;
            flex-direction: row;
            min-height: 100vh;
            justify-content: center;
            align-items: flex-start;
            padding-top: 50px;
        }
        .sidebar {
            width: 200px;
            background: rgba(0, 0, 0, 0.8);
            color: white;
            padding: 20px;
            position: fixed;
            left: 0;
            top: 0;
            height: 100%;
            display: flex;
            flex-direction: column;
            align-items: center;
        }
        .sidebar a {
            color: white;
            text-decoration: none;
            padding: 10px;
            display: block;
            text-align: center;
            margin: 10px 0;
            border-radius: 5px;
            transition: 0.3s;
        }
        .sidebar a:hover {
            background: #ffcc00;
            color: black;
        }
        .container {
            width: 90%;
            max-width: 400px;
            background: rgba(255, 255, 255, 0.9);
            border-radius: 10px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            padding: 40px;
            text-align: center;
            margin-left: 220px;
        }
        .input-group {
            margin-bottom: 15px;
            text-align: left;
        }
        .input-group label {
            display: block;
            font-weight: bold;
            margin-bottom: 5px;
        }
        .input-group input {
            width: 100%;
            padding: 10px;
            border: 1px solid #ccc;
            border-radius: 5px;
        }
        .submit-btn {
            background: #3498db;
            color: white;
            border: none;
            padding: 10px 20px;
            font-size: 16px;
            border-radius: 5px;
            cursor: pointer;
            transition: 0.3s;
        }
        .submit-btn:hover {
            background: #2980b9;
        }
    </style>
</head>
<body>
    <div class="sidebar">
        <a href="home_user.jsp">🏠 Trang Chủ</a>
        <a href="profile_borrowed.jsp">📚 Sách Đã Mượn</a>
        <a href="profile_password.jsp">🔑 Đổi Mật Khẩu</a>
        <a href="profile_notification.jsp">🔔 Thông Báo</a>
    </div>
    <div class="container">
        <h2>🔑 Đổi Mật Khẩu</h2>
        <form action="user" method="post">
            <div style="color: red">${error}</div>
            <div class="input-group">
                <label for="currentPassword">Mật khẩu hiện tại</label>
                <input type="password" id="currentPassword" name="currentPassword" required>
            </div>
            <div class="input-group">
                <label for="newPassword">Mật khẩu mới</label>
                <input type="password" id="newPassword" name="newPassword" required>
            </div>
            <div class="input-group">
                <label for="confirmPassword">Xác nhận mật khẩu mới</label>
                <input type="password" id="confirmPassword" name="confirmPassword" required>
            </div>
            <button class="submit-btn" type="submit">🔄 Cập Nhật Mật Khẩu</button>
        </form>
    </div>
</body>
</html>
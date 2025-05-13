<!DOCTYPE html>
<html lang="vi">
<head>
    <%@ page contentType="text/html; charset=UTF-8" %>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Hồ Sơ Cá Nhân - Thư Viện Online</title>
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
            align-items: center;
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
            max-width: 600px;
            background: rgba(255, 255, 255, 0.9);
            border-radius: 10px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            padding: 40px;
            text-align: center;
            margin-left: 220px;
        }
        .profile-info {
            text-align: left;
            padding: 15px;
            background: #f7f7f7;
            border-radius: 5px;
            margin-bottom: 20px;
        }
        .profile-info h2 {
            color: #2980b9;
        }
        .profile-actions {
            display: flex;
            justify-content: space-between;
            margin-top: 20px;
        }
        .btn {
            background: #3498db;
            color: white;
            padding: 10px 15px;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            font-size: 14px;
        }
        .btn:hover {
            background: #2980b9;
        }
        .logout-btn {
            background: #e74c3c;
        }
        .logout-btn:hover {
            background: #c0392b;
        }
    </style>
</head>
<body>
    <div class="sidebar">
        <a href="home_user.jsp">🏠 Trang Chủ</a>
        <a href="profile_borrowed.jsp">📚 Sách Đã Mượn</a>
        <a href="favorite.jsp">📚 Sách Yêu Thích</a>
        <a href="profile_password.jsp">🔑 Đổi Mật Khẩu</a>
        <a href="profile_notification.jsp">🔔 Thông Báo</a>
    </div>
    <div class="container">
        <h2>📄 Hồ Sơ Cá Nhân</h2>
        <div class="profile-info">
            <h2>👤 ${sessionScope.user.getName()}</h2>
            <p><strong>Email:</strong> ${sessionScope.user.getEmail()}</p>
            <p><strong>Ngày Tham Gia:</strong> ${sessionScope.user.getCreateat()}</p>
            <p><strong>Sách Đã Mượn:</strong> </p>
        </div>
        <div class="profile-actions">
            <button class="btn" onclick="window.location.href='profile_update.jsp'">✏️ Chỉnh Sửa</button>
            <form action="Reset">
                <button class="btn logout-btn" type="submit">🚪 Đăng Xuất</button>
            </form>
        </div>
    </div>
</body>
</html>

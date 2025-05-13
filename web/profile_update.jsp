<!DOCTYPE html>
<html lang="vi">
<head>
    <%@ page contentType="text/html; charset=UTF-8" %>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Chỉnh Sửa Hồ Sơ - Thư Viện Online</title>
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
            max-width: 500px;
            background: rgba(255, 255, 255, 0.9);
            border-radius: 10px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            padding: 40px;
            text-align: center;
            margin-left: 220px;
        }
        .form-group {
            text-align: left;
            margin-bottom: 15px;
        }
        label {
            font-weight: bold;
        }
        input[type="text"], input[type="email"], input[type="date"] {
            width: 100%;
            padding: 10px;
            margin-top: 5px;
            border: 1px solid #ccc;
            border-radius: 5px;
        }
        .btn {
            background: #3498db;
            color: white;
            padding: 10px 15px;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            font-size: 14px;
            margin-top: 10px;
        }
        .btn:hover {
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
        <h2>✏️ Chỉnh Sửa Hồ Sơ</h2>
        <form action="user" >
            <div class="form-group">
                <label for="fullName">Họ và Tên:</label>
                <input type="text" id="name" name="name" value="${sessionScope.user.getName()}" required>
            </div>
            <div class="form-group">
                <label for="birthday">Ngày Sinh:</label>
                <input type="date" id="birthday" name="birthday" value="${sessionScope.user.getBirthday()}" required>
            </div>
            <div class="form-group">
                <label for="email">Email:</label>
                <input type="email" id="email" name="email" value="${sessionScope.user.getEmail()}" required>
            </div>
            <div class="form-group">
                <label for="phone">Số Điện Thoại:</label>
                <input type="text" id="phone" name="phone" value="${sessionScope.user.getPhone()}" required>
            </div>
            <button type="submit" class="btn">💾 Lưu Thay Đổi</button>
        </form>
    </div>
</body>
</html>

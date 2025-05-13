<!DOCTYPE html>
<html lang="vi">
<head>
    <%@ page contentType="text/html; charset=UTF-8" %>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Thông Báo - Thư Viện Online</title>
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
            max-width: 800px;
            background: rgba(255, 255, 255, 0.9);
            border-radius: 10px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            padding: 40px;
            text-align: center;
            margin-left: 220px;
        }
        .notification-list {
            list-style: none;
            padding: 0;
        }
        .notification-item {
            background: white;
            color: black;
            padding: 15px;
            margin: 10px 0;
            border-radius: 5px;
            box-shadow: 0 2px 5px rgba(0, 0, 0, 0.2);
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
        <h2>🔔 Thông Báo</h2>
        <ul class="notification-list">
            <c:forEach items="${sessionScope.notifications}" var="notification">
                <li class="notification-item">${notification.message} - <em>${notification.date}</em></li>
            </c:forEach>
        </ul>
    </div>
</body>
</html>

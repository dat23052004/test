<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="vi">
<head>
    <%@ page contentType="text/html; charset=UTF-8" %>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Sách Đã Mượn - Thư Viện Online</title>
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
        .search-bar {
            margin-bottom: 15px;
        }
        table {
            width: 100%;
            border-collapse: collapse;
            background: white;
            border-radius: 5px;
            overflow: hidden;
        }
        table, th, td {
            border: 1px solid #ddd;
        }
        th, td {
            padding: 10px;
            text-align: left;
        }
        th {
            background: #3498db;
            color: white;
             text-align: center
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
        <h2>📚 Sách Đã Mượn</h2>
        <input type="text" class="search-bar" placeholder="🔍 Tìm kiếm sách..." onkeyup="searchBooks()">
        <table  id="borrowedBooksTable">
            <tr>
                <th style="width: 120px">Tên Sách</th>
                <th>Ngày Mượn</th>
                <th>Ngày Lấy sách</th>
                <th>Hạn Trả</th>
                <th>Số lượng</th>
                <th>Trạng Thái</th>
            </tr>
            <c:forEach items="${sessionScope.data2}" var="a">
                <tr>
                    <td>${a.getUser_id()}</td>
                    <td>${a.getBorrow_date()}</td>
                    <td>${a.getPickup_date()}</td>
                    <td>${a.getDue_date()}</td>
                    <td>${a.getQuantity()}</td>
                    <td>${a.getStatus()}</td>
                </tr>
            </c:forEach>
        </table>
    </div>
    <script>
        function searchBooks() {
            let input = document.querySelector(".search-bar").value.toLowerCase();
            let table = document.getElementById("borrowedBooksTable");
            let tr = table.getElementsByTagName("tr");
            for (let i = 1; i < tr.length; i++) {
                let td = tr[i].getElementsByTagName("td")[0];
                if (td) {
                    let textValue = td.textContent || td.innerText;
                    tr[i].style.display = textValue.toLowerCase().includes(input) ? "" : "none";
                }
            }
        }
    </script>
</body>
</html>

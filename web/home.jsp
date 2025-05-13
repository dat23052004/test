
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="vi">
    <head>
        <%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Danh Mục Sách - Thư Viện Số</title>
        <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
        <style>
            body {
                font-family: 'Poppins', sans-serif;
                margin: 0;
                padding: 0;
                background: url('https://wallpapercave.com/wp/wp5984568.jpg') no-repeat center center fixed;
                background-size: cover;
                display: flex;
                flex-direction: column;
                align-items: center;
                min-height: 100vh;
                color: white;
            }

            .header {
                width: 100%;
                background: linear-gradient(135deg, #252050, #3d348b);
                color: white;
                padding: 15px 0px;
                font-size: 24px;
                font-weight: bold;
                box-shadow: 0 4px 10px rgba(0, 0, 0, 0.3);
                position: fixed;
                top: 0;
                left: 0;
                z-index: 1000;
                display: flex;
                justify-content: center;
                align-items: center;
                position: relative;
            }

            .login-link {
                position: absolute;
                right: 20px;
                top: 50%;
                transform: translateY(-50%);
                font-size: 16px;
            }

            .login-link a {
                color: white;
                text-decoration: none;
                font-weight: bold;
                transition: all 0.3s ease;
                padding: 8px 15px; /* Tạo khoảng cách giữa chữ và viền */
                border: 2px solid white; /* Thêm viền trắng */
                border-radius: 5px; /* Bo góc viền */
            }

            .login-link a:hover {
                color: #ffcc00;
                border-color: #ffcc00; /* Đổi màu viền khi hover */
                background: rgba(255, 255, 255, 0.2); /* Hiệu ứng nền khi hover */
            }

            .navbar {
                width: 100%;
                background: rgba(0, 0, 0, 0.8);
                padding: 15px 0;
                text-align: center;
                margin: 2px;
            }
            .navbar a {
                color: white;
                text-decoration: none;
                padding: 10px 20px;
                font-size: 16px;
                font-weight: bold;
                transition: all 0.3s ease;
            }
            .navbar a:hover {
                background: #ffcc00;
                color: black;
                border-radius: 5px;
            }
            .search-bar {
                width: 100%;
                display: flex;
                justify-content: center;
                margin: 10px 0;
            }

            .search-bar input {
                width: 300px;
                padding: 8px;
                font-size: 16px;
                border: 2px solid #ffcc00; /* Viền vàng nổi bật */
                border-radius: 5px;
                outline: none;
                background: rgba(255, 255, 255, 0.9); /* Nền sáng hơn */
                color: black;
                text-align: center;
            }

            .search-bar input::placeholder {
                color: rgba(0, 0, 0, 0.6); /* Màu placeholder dễ nhìn hơn */
            }
            .container {
                padding: 0px 20px 20px;
                text-align: center;
                width: 90%;
                max-width: 1000px;
                background: rgba(0, 0, 0, 0.6);
                border-radius: 15px;
            }
            .trending-container {
                position: relative;
                width: 80%;
                margin: auto;
                overflow: hidden;
                display: flex;
                align-items: center;
                justify-content: center;
            }
            .book-list {
                display: flex;
                gap: 20px;
                overflow-x: auto;
                white-space: nowrap;
                padding: 10px 0;
                max-width: 100%;
                scrollbar-width: none;
            }
            .book-list::-webkit-scrollbar {
                display: none;
            }
            .book {
                min-width: 200px;
                max-width: 200px;
                text-align: center;
                background: white;
                padding: 10px;
                border-radius: 8px;
                box-shadow: 0 2px 5px rgba(0, 0, 0, 0.2);
            }
            .book img {
                width: 100%;
                height: 270px;
                border-radius: 5px;
                object-fit: cover;
            }
            .book:hover {
                transform: translateY(-5px);
                box-shadow: 0 10px 20px rgba(0, 0, 0, 0.3);
            }
            .scroll-btn {
                background: rgba(0, 0, 0, 0.5);
                color: white;
                border: none;
                padding: 10px 15px;
                cursor: pointer;
                font-size: 20px;
                border-radius: 50%;
                position: absolute;
                z-index: 10;
            }
            .prev {
                left: 10px;
            }
            .next {
                right: 10px;
            }
        </style>
        <script src="https://kit.fontawesome.com/a076d05399.js" crossorigin="anonymous"></script>
    </head>
    <body>
        <div class="header">
            Thư Viện Số
            <div class="login-link">
                <a href="Login.jsp">Đăng Nhập</a>
            </div>
        </div>
        <div class="navbar">
            <a href="home.jsp">Trang Chủ</a>
            <a href="category.jsp">Danh Mục</a>
            <a href="">Liên Hệ</a>
        </div>
        <div class="search-bar">
            <form action="Search" >
                <input type="text" name="name_book" id="searchInput" placeholder="🔍 Tìm kiếm sách..." onkeyup="searchBooks()"> <button type="submit">Tìm kiếm</button>
            </form>
        </div>
        <div class="container">
            <h2>📚 Sách mới về</h2>
            <div class="trending-container">
                <button class="scroll-btn prev" onclick="scrollBooks(-300)">&#10094;</button>
                <div class="book-list" id="bookList">
                    <c:forEach items="${sessionScope.data}" var="a">
                        <div class="book">
                            <a href="books?id=${a.getId()}&mode=1"><img src="${a.getImage()}" alt="${a.getTitle()}"/></a> 
                            <br>
                            <strong>${a.getTitle()}</strong>
                            <br>
                        </div>
                    </c:forEach>
                </div>
                <button class="scroll-btn next" onclick="scrollBooks(300)">&#10095;</button>
            </div>
        </div>

        <script>
            function scrollBooks(amount) {
                document.getElementById('bookList').scrollBy({left: amount, behavior: 'smooth'});
            }
        </script>
    </body>
    <footer style="background: rgba(0, 0, 0, 0.8); color: white; text-align: center; padding: 10px; position: fixed; bottom: 0; width: 100%;">
        © 2025 Thư Viện Online. Mọi quyền được bảo lưu.
    </footer>
</html>



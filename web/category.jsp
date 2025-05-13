<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="vi">
    <head>
        <meta charset="UTF-8">
        <%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Danh Mục Sách - Thư Viện Số</title>
        <style>
            body {
                font-family: 'Poppins', sans-serif;
                margin: 0;
                padding: 0;
                display: flex;
                flex-direction: column;
                align-items: center;
                justify-content: center;
                min-height: 100vh;
                color: white;
                background: url('img/background.jpg') no-repeat center center fixed;
                background-size: cover;
            }

            .navbar {
                width: 100%;
                background: rgba(0, 0, 0, 0.8);
                padding: 15px 0;
                text-align: center;
                position: fixed;
                top: 0;
                left: 0;
                z-index: 1000;
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

            .container {
                padding: 80px 20px 20px;
                text-align: center;
                width: 90%;
                max-width: 1000px;
                background: rgba(0, 0, 0, 0.6);
                border-radius: 15px;
            }
            .categories {
                display: grid;
                grid-template-columns: repeat(auto-fit, minmax(250px, 1fr));
                gap: 20px;
            }

            .category {
                border: 2px solid rgba(255, 255, 255, 0.8); /* Viền trắng nhẹ */
                border-radius: 10px; /* Bo góc cho đẹp */
                box-shadow: 0 4px 10px rgba(0, 0, 0, 0.5); /* Đổ bóng giúp nổi khối */
                background: rgba(0, 0, 0, 0.3); /* Nền tối nhẹ để phân biệt block */
                padding: 20px;
            }
            .category:hover {
                transform: scale(1.05);
                box-shadow: 0 10px 20px rgba(0, 0, 0, 0.4);
            }

            .category i {
                font-size: 50px;
                margin-bottom: 10px;
                color: #252050;
                transition: color 0.3s ease;
            }

            .category:hover i {
                color: #ffcc00;
            }

            .category h3 {
                margin: 10px 0 5px;
                font-size: 20px;
                color: #252050;
            }

            .category p {
                font-size: 14px;
                color: #666;
                height: 120px;
                padding-bottom: 0px; 
            }
            .category h3, .category p {
                color: white; /* Đổi màu chữ thành trắng để nổi bật */
                text-shadow: 2px 2px 4px rgba(0, 0, 0, 0.7); /* Tạo viền mờ giúp chữ nổi */
            }
            .category:hover h3, .category:hover p {
                color: #ffcc00;
            }

            .back-btn, .borrow-btn {
                display: inline-block;
                margin-top: 20px;
                padding: 15px 30px;
                background: #ffcc00;
                color: black;
                text-decoration: none;
                font-weight: bold;
                border-radius: 5px;
                transition: 0.3s;
            }

            .back-btn:hover, .borrow-btn:hover {
                background: #e6b800;
            }

            /* Responsive: Khi màn hình nhỏ hơn 768px, hiển thị 2 cột */
            @media (max-width: 768px) {
                .category {
                    width: calc(50% - 20px); /* Chia 2 cột */
                }
            }

            /* Responsive: Khi màn hình nhỏ hơn 500px, hiển thị 1 cột */
            @media (max-width: 500px) {
                .category {
                    width: 100%; /* Chỉ hiển thị 1 cột */
                }
            }
        </style>
        <script src="https://kit.fontawesome.com/a076d05399.js" crossorigin="anonymous"></script>
    </head>
    <body>
        <div class="navbar">
            <a <c:if test="${sessionScope.user eq null}" > href="home.jsp"</c:if>
               <c:if test="${sessionScope.user != null}" > href="home_user.jsp"</c:if>>Trang Chủ</a>
                <a>Danh Mục</a>
                <a href="#">Liên Hệ</a>
            </div>
            <div class="container">
                <h2>📚 Khám Phá Các Danh Mục</h2>
                <div class="categories">  
                    <!-- Danh sách danh mục -->

                <c:forEach items="${sessionScope.data1}" var="a">
                    <a style="text-decoration: none" href="category?id=${a.getId()}">
                        <div class="category">
                            <i class="fas fa-book"></i>
                            <h3>${a.getName()}</h3>
                            <p>${a.getIntroduction()}</p>
                        </div>
                    </a>
                </c:forEach>
            </div>

            <!-- Nút Quay lại -->
            <div>
                <a <c:if test="${sessionScope.user eq null}"> href="home.jsp"</c:if>
                <c:if test="${sessionScope.user != null}"> href="home_user.jsp"</c:if> class="borrow-btn">Quay lại</a>
            </div>
        </div>
    </body>
</html>
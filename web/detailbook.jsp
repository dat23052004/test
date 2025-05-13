<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="vi">
    <head>
        <%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Chi Tiết Sách - Thư Viện Số</title>
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
                color: #f5f5f5;
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
            .header a {
                position: absolute;
                right: 20px;
                bottom: 10px;
            }
            .header img {
                width: 40px;
                height: 40px;
                border-radius: 50%;
            }
            .login-link a {
                color: white;
                font-size: 16px;
                padding-bottom: 20px;
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
                margin-top: 2px;
                width: 100%;
                background: rgba(0, 0, 0, 0.8);
                padding: 15px 0;
                text-align: center;
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
                background: rgba(0, 0, 0, 0.8);
                padding: 40px;
                border-radius: 15px;
                text-align: center;
                width: 90%;
                max-width: 900px;
                box-shadow: 0 4px 10px rgba(0, 0, 0, 0.5);
                margin-top: 20px;
            }
            .book img {
                width: 200px;
                height: 250px;
                max-width: 200px;
                border-radius: 10px;
            }
            h2, p {
                color: #ffcc00;
            }
            .description {
                background: rgba(255, 255, 255, 0.2);
                padding: 15px;
                border-radius: 10px;
                margin-top: 15px;
                font-size: 18px;
                color: #fff;
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
        </style>
    </head>
    <body>

        <div class="header">Thư Viện Số <c:if test="${sessionScope.user eq null}" ><div class="login-link">
                    <a href="Login.jsp">Đăng Nhập</a>
                </div></c:if>
            <c:if test="${sessionScope.user != null}" ><a href="profile.jsp"><img src="https://cellphones.com.vn/sforum/wp-content/uploads/2023/10/avatar-trang-4.jpg" alt="Avatar"></a></c:if></div>
            <div class="navbar">
                <a href="home.jsp">Trang Chủ</a>
                <a href="#">Danh Mục</a>
                <a href="#">Liên Hệ</a>
            </div>
            <div class="container">
                <h2>${sessionScope.bookcr.getTitle()}</h2>
            <div class="book">
                <img src="${sessionScope.bookcr.getImage()}" alt="Error"/>
                <p><strong>Tác giả:</strong> ${sessionScope.bookcr.getAuthor()}</p>
                <p><strong>Xuất bản:</strong> ${sessionScope.bookcr.getPublish()}</p>
                <p><strong>Ngôn ngữ:</strong> ${sessionScope.bookcr.getLanguage()}</p>
                <p><strong>Số trang:</strong> ${sessionScope.bookcr.getCount()}</p>
                <p><strong>Số lượng còn lại:</strong> ${sessionScope.bookcr.getQuantity()}</p>
            </div>
            <div class="description">
                <p><strong>Giới thiệu:</strong> ${sessionScope.bookcr.getIntroducing()}</p>
            </div>
            <a<c:if test="${sessionScope.user eq null}"> href="Login.jsp?status=1"</c:if>
              <c:if test="${sessionScope.user != null}"> href="loans.jsp"</c:if> class="borrow-btn">Mượn sách</a>
              <a <c:if test="${sessionScope.user eq null}">href="Login.jsp?status=2"</c:if> <c:if test="${sessionScope.user != null}"> <c:if test="${!sessionScope.checkcr}">  href="favorite?mode=1&idbook=${sessionScope.bookcr.getId()}&iduser=${sessionScope.user.getId()}" </c:if> <c:if test="${sessionScope.checkcr}">  href="favorite?mode=2&idbook=${sessionScope.bookcr.getId()}&iduser=${sessionScope.user.getId()}" </c:if> </c:if> class="back-btn">
                  <c:if test="${!sessionScope.checkcr}"> Thêm mục yêu thích</c:if> <c:if test="${sessionScope.checkcr}"> Xóa mục yêu thích</c:if></a>
            <a href="javascript:history.back()" class="back-btn">Quay lại</a>

        </div>
    </body>
</html>

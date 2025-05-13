<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="vi">
    <head>
        <%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Mượn Sách - Thư Viện Số</title>
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
            }
            .header img {
                width: 40px;
                height: 40px;
                border-radius: 50%;
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
                max-width: 600px;
                box-shadow: 0 4px 10px rgba(0, 0, 0, 0.5);
                margin-top: 20px;
            }
            .book img {
                width: 100%;
                max-width: 200px;
                border-radius: 10px;
            }
            h2, p {
                color: #ffcc00;
            }
            .loan-form {
                margin-top: 20px;
                text-align: left;
            }
            .loan-form label {
                font-weight: bold;
            }
            .loan-form input {
                width: 100%;
                padding: 10px;
                margin-top: 5px;
                border-radius: 5px;
                border: none;
                font-size: 16px;
            }
            .button-container {
                display: flex;
                justify-content: center;
                gap: 20px;
                margin-top: 20px;
            }
            .confirm-btn, .back-btn {
                padding: 15px 30px;
                background: #ffcc00;
                color: black;
                text-decoration: none;
                font-weight: bold;
                border-radius: 5px;
                transition: 0.3s;
                text-align: center;
                border: none;
                cursor: pointer;
            }
            .confirm-btn:hover, .back-btn:hover {
                background: #e6b800;
            }
            select {
                width: 100%;
                padding: 12px;
                border-radius: 5px;
                background-color: #333;
                color: #fff;
                font-size: 16px;
                border: 1px solid #444;
                appearance: none;
                cursor: pointer;
                transition: 0.3s ease-in-out;
            }

            select:focus {
                outline: none;
                border-color: #ffcc00;
            }

            /* Style for the dropdown arrow */
            select::-ms-expand {
                display: none;
            }

            /* Custom arrow using CSS */
            .select-container {
                position: relative;
                display: inline-block;
                width: 100%;
            }

            .select-container::after {
                content: '\25BC';
                font-size: 18px;
                color: white;
                position: absolute;
                right: 15px;
                top: 50%;
                transform: translateY(-50%);
                pointer-events: none;
            }

            option {
                background-color: #333;
                color: white;
                padding: 10px;
                font-size: 16px;
            }

            option:hover {
                background-color: #555;
            }
            .out-of-stock-message {
                color: #ff0000; /* Màu đỏ để làm nổi bật cảnh báo */
                background-color: rgba(255, 0, 0, 0.2); /* Nền đỏ nhạt để làm rõ thông báo */
                padding: 15px;
                border-radius: 5px;
                font-weight: bold;
                font-size: 18px;
                margin-top: 10px;
                text-align: center;
                border: 1px solid #ff0000; /* Viền đỏ */
                box-shadow: 0 4px 8px rgba(255, 0, 0, 0.3); /* Thêm bóng để nổi bật */
            }
        </style>
    </head>
    <body>
        <div class="header">Thư Viện Số <a href="profile.jsp"><img src="https://cellphones.com.vn/sforum/wp-content/uploads/2023/10/avatar-trang-4.jpg" alt="Avatar"></a></div>
        <div class="navbar">
            <a href="home_user.jsp">Trang Chủ</a>
            <a href="category.jsp">Danh Mục</a>
            <a href="#">Liên Hệ</a>
        </div>

        <div class="container">
            <h2>Mượn Sách</h2>
            <div class="book">
                <img src="${sessionScope.bookcr.getImage()}" alt="${sessionScope.bookcr.getTitle()}"/>
                <p><strong>Tiêu đề:</strong> ${sessionScope.bookcr.getTitle()}</p>
                <p><strong>Tác giả:</strong> ${sessionScope.bookcr.getAuthor()}</p>
                <p><strong>Xuất bản:</strong> ${sessionScope.bookcr.getPublish()}</p>
                <p><strong>Ngôn ngữ:</strong> ${sessionScope.bookcr.getLanguage()}</p>
                <p><strong>Số trang:</strong> ${sessionScope.bookcr.getCount()}</p>
                <p><strong>Số lượng có sẵn:</strong> ${sessionScope.bookcr.getQuantity()}</p>
            </div>
            <form action="Loans" method="post" class="loan-form">
                <label for="quantity">Số lượng muốn mượn:</label>
                <c:if test="${sessionScope.bookcr.getQuantity() eq '0'}">
                    <div class="out-of-stock-message">
                        Xin lỗi, sách đã hết.
                    </div>
                </c:if>
                <c:if test="${sessionScope.bookcr.getQuantity() ne '0'}">
                    <div class="select-container">
                        <select name="quantity">
                            <c:forEach var="i" begin="1" end="${sessionScope.bookcr.getQuantity()}">
                                <option value="${i}">${i}</option>
                            </c:forEach>
                        </select>
                    </div>
                </c:if>
                
                <input type="hidden" name="id_book" value="${sessionScope.bookcr.getId()}">
                <p style="color: red; font-size: 18px; margin-top: 20px;">Lưu ý: Thời hạn trả sách sẽ tính từ ngày bạn xác nhận mượn đến 14 ngày sau. Và bạn có thể lấy sách bất cứ lúc nào trong khoảng thời gian này. Sách sẽ tự động trả về kho trong trường hợp bạn ko thể đến mượn.</p>
                <div class="button-container">
                    <c:if test="${sessionScope.bookcr.getQuantity() ne '0'}">
                        <button type="submit" class="confirm-btn">Xác nhận mượn</button>
                    </c:if>
                    <a href="javascript:history.back()" class="back-btn">Quay lại</a>
                </div>
            </form>

        </div>
    </body>
</html>

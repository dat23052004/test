<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="vi">
    <head>
        <meta charset="UTF-8">
        <%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Danh sách sách</title>
        <style>
            body {
                font-family: Arial, sans-serif;
                padding: 20px;
                background: url('https://wallpapercave.com/wp/wp5984568.jpg') no-repeat center center fixed;
                background-size: cover;
                color: white; /* Chữ màu trắng để dễ đọc trên nền tối */
            }

            /* Nút Trang chủ */
            .back-button {
                position: absolute;
                top: 20px;
                left: 20px;
            }

            .back-button .home-icon {
                width: 50px; /* Kích thước icon */
                height: 50px;
                transition: transform 0.3s;
            }

            .back-button .home-icon:hover {
                transform: scale(1.1); /* Hiệu ứng phóng to nhẹ khi hover */
            }

            /* Tiêu đề Thể loại */
            .category-header {
                display: flex;
                justify-content: center;
                align-items: center;
                gap: 15px;
                font-size: 22px;
                font-weight: bold;
                margin-bottom: 20px;
            }

            .category-header .category-name {
                color: #FFD700; /* Màu vàng nổi bật */
            }

            .category-header .book-count {
                background: #ff5722;
                color: white;
                padding: 5px 15px;
                border-radius: 15px;
                font-size: 18px;
            }

            /* Danh sách sách */
            .book-container {
                display: grid;
                grid-template-columns: repeat(7, 1fr); /* 7 quyển mỗi dòng */
                grid-gap: 30px;
                padding: 20px;
            }

            .book-item {
                background: rgba(255, 255, 255, 0.9);
                padding: 15px;
                text-align: center;
                border-radius: 8px;
                box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
                transition: transform 0.2s;
                color: black;
                height: 288px;
            }

            .book-item:hover {
                transform: scale(1.05);
            }

            .book-item img {
                width: 100px;
                height: 150px;
                object-fit: cover;
                border-radius: 5px;
            }

            .book-item h4 {
                margin: 10px 0 5px;
                font-size: 16px;
            }

            .book-item p {
                font-size: 14px;
                color: #333;
            }

            /* Nút Quay lại */
            .return-button {
                display: block;
                width: fit-content;
                margin: 30px auto;
                padding: 10px 20px;
                background: #4CAF50;
                color: white;
                font-size: 18px;
                text-decoration: none;
                border-radius: 5px;
                text-align: center;
                transition: 0.3s;
            }

            .return-button:hover {
                background: #45a049;
            }
           
        </style>
    </head>
    <body>
       
        <!-- Nút Trang chủ (Biểu tượng ngôi nhà) -->
        <a  <c:if test="${sessionScope.user eq null}" > href="home.jsp"</c:if>
            <c:if test="${sessionScope.user != null}" > href="home_user.jsp"</c:if> class="back-button">
          <img src="https://www.illinoisworknet.com/DownloadPrint/IWN2018_icon-homedashboard_IWNOrange.png" alt="Home" class="home-icon">
         </a>
         <div class="category-header">
        <span class="book-count">${quanlity_book_category} sách</span>
        </div>
        <div class="book-container">
            <c:forEach items="${list_search}" var="a">
                <a style="text-decoration: none" href="books?id=${a.getId()}&mode=1">
                    <div class="book-item">
                        <img src="${a.getImage()}" alt="Sách 1">
                        <h4>${a.getTitle()}</h4>
                        <p>${a.getAuthor()}</p>
                    </div>
                </a>
            </c:forEach>
        </div>
        <!-- Nút Quay lại -->
        <a href="javascript:history.back()" class="return-button">Quay lại</a>

    </script>
</body>
</html>
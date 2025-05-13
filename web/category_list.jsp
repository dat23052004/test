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
                color: white;
            }

            .back-button {
                position: absolute;
                top: 20px;
                left: 20px;
            }

            .back-button .home-icon {
                width: 50px;
                height: 50px;
                transition: transform 0.3s;
            }

            .back-button .home-icon:hover {
                transform: scale(1.1);
            }

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
                color: #FFD700;
            }

            .category-header .book-count {
                background: #ff5722;
                color: white;
                padding: 5px 15px;
                border-radius: 15px;
                font-size: 18px;
            }

            .book-container {
                display: grid;
                grid-template-columns: repeat(7, 1fr);
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
            .search-container {
                text-align: center;
                margin-bottom: 20px;
            }
            .search-input {
                padding: 10px;
                font-size: 16px;
                width: 300px;
                border-radius: 5px;
                border: none;
            }
            .search-button {
                padding: 10px 15px;
                font-size: 16px;
                background: #ff5722;
                color: white;
                border: none;
                border-radius: 5px;
                cursor: pointer;
            }
            .search-button:hover {
                background: #e64a19;
            }
        </style>
    </head>
    <body>
        <a href="<c:choose><c:when test='${sessionScope.user eq null}'>home.jsp</c:when><c:otherwise>home_user.jsp</c:otherwise></c:choose>" class="back-button">
            <img src="https://www.illinoisworknet.com/DownloadPrint/IWN2018_icon-homedashboard_IWNOrange.png" alt="Home" class="home-icon">
        </a>
        <div class="search-container">
            <input type="text" id="searchInput" class="search-input" placeholder="Nhập tên sách..." onkeyup="searchBooks()">
        </div>
        <div class="category-header">
            <span class="category-name">Thể loại: ${category_current.getName()}</span>
            <span class="book-count">${quanlity_book_category} sách</span>
        </div>
        <div class="book-container" id="bookContainer">
            <c:forEach items="${list_book_category}" var="a">
                <a style="text-decoration: none" href="books?id=${a.getId()}&mode=1" class="book-link">
                    <div class="book-item">
                        <img src="${a.getImage()}" alt="Sách">
                        <h4 class="book-title">${a.getTitle()}</h4>
                        <p>${a.getAuthor()}</p>
                    </div>
                </a>
            </c:forEach>
        </div>
        <script>
            function searchBooks() {
                let input = document.getElementById("searchInput").value.toLowerCase();
                let books = document.querySelectorAll(".book-link");
                books.forEach(book => {
                    let title = book.querySelector(".book-title").textContent.toLowerCase();
                    book.style.display = title.includes(input) ? "block" : "none";
                });
            }
        </script>
    </body>
</html>
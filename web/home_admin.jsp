<%-- 
    Document   : home_admin
    Created on : Mar 16, 2025, 3:14:34 PM
    Author     : ADMIN
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Admin Dashboard - Quản Lý Thư Viện</title>
        <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
        <style>
            body {
                font-family: Arial, sans-serif;
                margin: 0;
                padding: 0;
                background-color: #f4f4f4;
            }
            .sidebar {
                width: 250px;
                background: #333;
                color: white;
                position: fixed;
                top: 0;
                left: 0;
                height: 100%;
                padding: 20px;
            }
            .sidebar a {
                color: white;
                text-decoration: none;
                display: block;
                padding: 10px;
                margin-bottom: 10px;
                background: #444;
                border-radius: 5px;
            }
            .container {
                margin-left: 270px;
                padding: 20px;
            }
            .chart-container {
                width: 60%;
                margin: auto;
            }
        </style>
    </head>
    <body>
        <div class="sidebar">
            <h2>📚 Admin Panel</h2>
            <a href="home_admin.jsp">📊 Dashboard</a>
            <a href="manager_user.jsp">👥 Quản Lý Người Dùng</a>
            <a href="manager_book.jsp">📖 Quản Lý Sách</a>
            <a href="manager_loan.jsp">📚 Quản Lý Mượn Sách</a>
            <a href="admin_setting.jsp">⚙️ Cài Đặt</a>
        </div>
        <div class="container">
            <h1>📊 Tổng Quan</h1>
            <div class="chart-container">
                <canvas id="bookCategoryChart"></canvas>
            </div>
            <div class="chart-container">
                <canvas id="bookStatusChart"></canvas>
            </div>
            <script>
                var categoryLabels = [
                <c:forEach var="name" items="${sessionScope.categoryList}" varStatus="loop">
                "${name.getName()}"<c:if test="${!loop.last}">,</c:if>
                </c:forEach>
                ];
                var categoryData = [
                <c:forEach var="count" items="${sessionScope.listcountCA}" varStatus="loop">
                    ${count}<c:if test="${!loop.last}">,</c:if>
                </c:forEach>
                ];

                var bookdata = [
                <c:forEach var="count" items="${sessionScope.listcountBO}" varStatus="loop">
                    ${count}<c:if test="${!loop.last}">,</c:if>
                </c:forEach>
                ];
                function generateRandomColors(numColors) {
                    var colors = [];
                    for (var i = 0; i < numColors; i++) {
                        var color = 'rgb(' +
                                Math.floor(Math.random() * 255) + ',' +
                                Math.floor(Math.random() * 255) + ',' +
                                Math.floor(Math.random() * 255) + ')';
                        colors.push(color);
                    }
                    return colors;
                }

                var backgroundColors = generateRandomColors(categoryLabels.length);

                var ctx1 = document.getElementById('bookCategoryChart').getContext('2d');
                var bookCategoryChart = new Chart(ctx1, {
                    type: 'pie',
                    data: {
                        labels: categoryLabels,
                        datasets: [{
                                data: categoryData,
                                backgroundColor: backgroundColors
                            }]
                    },
                    options: {
                        responsive: true,
                        maintainAspectRatio: false,
                        plugins: {
                            legend: {
                                position: 'right'
                            }
                        }
                    }
                });

                var ctx2 = document.getElementById('bookStatusChart').getContext('2d');
                var bookStatusChart = new Chart(ctx2, {
                    type: 'bar',
                    data: {
                        labels: ['Sách đang mượn', 'Sách còn lại'],
                        datasets: [{
                                label: 'Tình trạng sách',
                                data: bookdata,
                                backgroundColor: ['#e74c3c', '#2ecc71']
                            }]
                    }
                });
            </script>
        </div>
    </body>
</html>


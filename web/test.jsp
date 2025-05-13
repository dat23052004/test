<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="vi">
    <head>
        <meta charset="UTF-8">
        <%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
         <title>Poster Wonderfarm</title>
    <style>
        body {
            text-align: center;
            font-family: Arial, sans-serif;
            background-color: #f8f5eb;
            margin: 0;
            padding: 20px;
        }
        .poster {
            position: relative;
            display: inline-block;
            width: 80%;
            max-width: 800px;
        }
        .poster img {
            width: 100%;
            border-radius: 10px;
        }
        .slogan {
            position: absolute;
            top: 10%;
            width: 100%;
            font-size: 24px;
            font-weight: bold;
            color: #d24d00;
            text-shadow: 2px 2px 4px rgba(0, 0, 0, 0.2);
        }
    </style>
</head>
<body>
    <div class="poster">
        <p class="slogan">Bộ tam Wonderfarm - Mới hơn, gần hơn, Chất hơn!</p>
        <img src="/mnt/data/3 lon (2).png" alt="Bộ ba sản phẩm Wonderfarm">
        <input type="file" name="fileUpload">
    </div>
</body>
</html>

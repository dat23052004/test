<%-- 
    Document   : login
    Created on : Mar 11, 2025, 4:56:10 PM
    Author     : ADMIN
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>Slide Navbar</title>
        <link rel="stylesheet" type="text/css" href="slide navbar style.css">
        <style>
            body{
                margin: 0;
                padding: 0;
                display: flex;
                justify-content: center;
                align-items: center;
                min-height: 100vh;
                font-family: 'Jost', sans-serif;
                background: linear-gradient(to bottom, #0f0c29, #302b63, #24243e);
            }
            .main{
                width: 350px;
                height: 630px;
                background: red;
                overflow: hidden;
                background: url("https://doc-08-2c-docs.googleusercontent.com/docs/securesc/68c90smiglihng9534mvqmq1946dmis5/fo0picsp1nhiucmc0l25s29respgpr4j/1631524275000/03522360960922298374/03522360960922298374/1Sx0jhdpEpnNIydS4rnN4kHSJtU1EyWka?e=view&authuser=0&nonce=gcrocepgbb17m&user=03522360960922298374&hash=tfhgbs86ka6divo3llbvp93mg4csvb38") no-repeat center/ cover;
                border-radius: 10px;
                box-shadow: 5px 20px 50px #000;
            }
            #chk{
                display: none;
            }
            .signup{
                position: relative;
                width:100%;
                height: 100%;
            }
            label{
                color: #fff;
                font-size: 2.3em;
                justify-content: center;
                display: flex;
                margin: 40px;
                margin-bottom:  40px;
                font-weight: bold;
                cursor: pointer;
                transition: .5s ease-in-out;
            }
            input{
                width: 60%;
                height: 10px;
                background: #e0dede;
                justify-content: center;
                display: flex;
                margin: 20px auto;
                padding: 12px;
                border: none;
                outline: none;
                border-radius: 5px;
            }
            button{
                width: 60%;
                height: 40px;
                margin: 10px auto;
                justify-content: center;
                display: block;
                color: #fff;
                background: #573b8a;
                font-size: 1em;
                font-weight: bold;
                margin-top: 30px;
                outline: none;
                border: none;
                border-radius: 5px;
                transition: .2s ease-in;
                cursor: pointer;
            }
            button:hover{
                background: #6d44b8;
            }
            .login{
                height: 560px;
                background: #eee;
                border-radius: 60% / 10%;
                transform: translateY(-180px);
                transition: .8s ease-in-out;
            }
            .login label{
                color: #573b8a;
                transform: scale(.6);
            }

            #chk:checked ~ .login{
                transform: translateY(-600px);
            }
            #chk:checked ~ .login label{
                transform: scale(1);
            }
            #chk:checked ~ .signup label{
                transform: scale(.6);
            }
            input[name="phone"][type="number"]::-webkit-inner-spin-button,
            input[name="phone"][type="number"]::-webkit-outer-spin-button {
                -webkit-appearance: none;
                margin: 0;
            }

            input[name="phone"][type="number"] {
                -moz-appearance: textfield; /* Firefox */
            }
            .conter{
                display: flex;
                flex-direction: column;
            }
        </style>
        <link href="https://fonts.googleapis.com/css2?family=Jost:wght@500&display=swap" rel="stylesheet">
    </head>
    <body>
        <div class="conter">
            <div class="main">  	
                <input type="checkbox" id="chk" aria-hidden="true">

                <div class="signup">
                    <form action="logins" >
                        <label for="chk" aria-hidden="true" style="margin-bottom: 5px">Sign up</label>
                        <c:if test="${not empty error1}">
                            <p style="color: orange; margin: 20px; text-align: center;">${error1}</p>
                        </c:if>
                        <input type="text" value="${account1}" name="account" placeholder="Account" required="">
                        <input type="password" name="pass" placeholder="Password" required="">
                        <input type="text" value="${name}" name="name" placeholder="User name" required="">
                        <input type="email" value="${email}" name="email" placeholder="Email" required="">
                        <input type="number" value="${phone}" name="phone" placeholder="Phone" required="">
                        <input type="date" value="${birthday}" name="birthday" required="">
                        <button type="submit">Sign up</button>
                    </form>
                </div>
                <div class="login">
                    <form action="logins" method="post">                
                        <label for="chk" aria-hidden="true">Login</label>
                        <c:if test="${not empty result}">
                            <p style="color: green;font-size: 15px ;  margin-top: 10px; text-align: center;">${result}</p>
                        </c:if>
                        <c:if test="${not empty error3}">
                            <p style="color: red; text-align: center;">${error3}</p>
                        </c:if>
                        <input type="text" value="${account}" name="account" placeholder="Account" required="">
                        <input type="password" name="password" placeholder="Password" required="">
                        <%
                             String status = request.getParameter("status");
                        %>   
                        <input type="hidden" name="status" value="<%=status%>">
                        <button type="submit">Login</button>
                    </form>
                </div>
            </div>
            <div><a style="text-decoration: none" href="Reset"><button>Trang trủ</button></a></div>

        </div>
        <script>
            window.onload = function () {
                // Lấy mode từ request attribute (do Servlet setAttribute gửi sang)
                let modeFromServer = "${mode}";

                // Lấy mode từ URL (nếu có)
                const params = new URLSearchParams(window.location.search);
                let modeFromURL = params.get("mode");

                // Ưu tiên mode từ URL nếu có, nếu không thì dùng mode từ Servlet
                let mode = modeFromURL ? modeFromURL : modeFromServer;

                // Nếu mode là "signup", chuyển form sang đăng ký
                if (mode === "signup") {
                    document.getElementById("chk").checked = true;
                }
            };
        </script>
    </body>
</html> 

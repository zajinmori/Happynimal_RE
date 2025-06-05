<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>로그인</title>
    <style>
        body {
            margin: 0;
            font-family: 'Segoe UI', sans-serif;
            background-color: #f7f7f7;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
        }

        .login-wrapper {
            display: flex;
            width: 800px;
            box-shadow: 0 4px 12px rgba(0, 0, 0, 0.1);
            border-radius: 12px;
            overflow: hidden;
            background-color: #ffffff;
        }

        .login-image {
            flex: 1;
            background: url('/resources/img/realLoginImg.png') center center / cover no-repeat;
        }

        .login-container {
            flex: 1;
            padding: 40px;
            display: flex;
            flex-direction: column;
            justify-content: center;
        }

        .login-container h2 {
            color: #00712D;
            font-size: 28px;
            margin-bottom: 24px;
        }

        .login-container input {
            width: 100%;
            padding: 12px;
            margin-bottom: 16px;
            border: 1px solid #ccc;
            border-radius: 6px;
            font-size: 16px;
        }

        .login-container button {
            background-color: #FF9100;
            color: white;
            padding: 12px;
            border: none;
            border-radius: 6px;
            font-size: 16px;
            cursor: pointer;
            transition: background-color 0.2s ease-in-out;
        }

        .login-container button:hover {
            background-color: #00712D;
        }

        .error-message {
            color: red;
            margin-bottom: 16px;
            font-size: 14px;
        }

    </style>
</head>
<body>

<div class="login-wrapper">
    <div class="login-image"></div>

    <div class="login-container">
        <h2>로그인</h2>

        <!-- 로그인 실패 시 메시지 출력 -->
        <c:if test="${not empty param.error}">
            <div class="error-message">아이디 또는 비밀번호가 잘못되었습니다.</div>
        </c:if>



        <form action="<c:url value='/login.do' />" method="post">
            <input type="text" name="username" placeholder="아이디" required />
            <input type="password" name="password" placeholder="비밀번호" required />
            <button type="submit">로그인</button>
        </form>
    </div>
</div>
</body>
</html>

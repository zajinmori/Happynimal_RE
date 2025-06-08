<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>회원가입</title>
    <style>
        body {
            font-family: 'Arial', sans-serif;
            background-color: #f7f7f7;
        }

        .container {
            width: 400px;
            margin: 60px auto;
            padding: 30px;
            background-color: white;
            box-shadow: 0 0 10px rgba(0,0,0,0.1);
            border-radius: 10px;
        }

        h2 {
            text-align: center;
            margin-bottom: 20px;
        }

        label {
            font-weight: bold;
        }

        .form-group {
            margin-bottom: 15px;
        }

        input[type="text"],
        input[type="password"],
        input[type="email"] {
            width: 100%;
            padding: 10px;
            box-sizing: border-box;
            border: 1px solid #ccc;
            border-radius: 5px;
            margin-top: 5px;
        }

        .radio-group {
            display: flex;
            justify-content: space-between;
            margin-bottom: 20px;
        }

        button {
            width: 100%;
            padding: 10px;
            background-color: #4CAF50;
            color: white;
            border: none;
            border-radius: 5px;
            font-size: 16px;
            cursor: pointer;
        }

        button:hover {
            background-color: #45a049;
        }
    </style>
</head>
<body>
<div class="container">
    <h2>회원가입</h2>
    <form method="post" action="/registerOk.do">

        <div class="radio-group">
            <label><input type="radio" name="role" value="USER" checked> 일반 사용자</label>
            <label><input type="radio" name="role" value="ADMIN"> 관리자</label>
        </div>

        <div class="form-group">
            <label>아이디</label>
            <input type="text" name="id" placeholder="아이디" required />
        </div>

        <div class="form-group">
            <label>비밀번호</label>
            <input type="password" name="password" placeholder="비밀번호" required />
        </div>

        <div class="form-group">
            <label>이름</label>
            <input type="text" name="name" placeholder="이름" required />
        </div>

        <div class="form-group">
            <label>주민등록번호</label>
            <input type="text" name="ssn" placeholder="000000-0000000" />
        </div>

        <div class="form-group">
            <label>전화번호</label>
            <input type="text" name="telephone" placeholder="010-1234-5678" />
        </div>

        <div class="form-group">
            <label>주소</label>
            <input type="text" name="address" placeholder="주소" />
        </div>

        <div class="form-group">
            <label>이메일</label>
            <input type="email" name="email" placeholder="example@email.com" />
        </div>

        <div class="form-group">
            <label>닉네임</label>
            <input type="text" name="nickname" placeholder="닉네임" />
        </div>

        <button type="submit">회원가입</button>
    </form>
</div>
</body>
</html>

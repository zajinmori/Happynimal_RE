<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="ko">
<head>

    <meta charset="utf-8">
    <title>Happynimal</title>
    <meta content="width=device-width, initial-scale=1.0" name="viewport">
    <meta content="" name="keywords">
    <meta content="" name="description">
    <link rel="icon" href="https://happynimal-bucket.s3.ap-northeast-2.amazonaws.com/img/favicon.png">
    <!-- Google Web Fonts -->
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Open+Sans:ital,wdth,wght@0,75..100,300..800;1,75..100,300..800&family=Playfair+Display:ital,wght@0,400..900;1,400..900&display=swap" rel="stylesheet">

    <!-- Icon Font Stylesheet -->
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.15.4/css/all.css"/>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.4.1/font/bootstrap-icons.css" rel="stylesheet">

    <!-- Libraries Stylesheet -->
    <link href="<c:url value='/resources/lib/animate/animate.min.css'/>" rel="stylesheet">
    <link href="<c:url value='/resources/lib/owlcarousel/assets/owl.carousel.min.css'/>" rel="stylesheet">


    <!-- Customized Bootstrap Stylesheet -->
    <link href="<c:url value='/resources/css/bootstrap.min.css' />" rel="stylesheet">

    <!-- Template Stylesheet -->
    <link href="<c:url value='/resources/css/style.css' />" rel="stylesheet">
    <style>
        body {
            background-color: #F6FFF8;
        }

        .thank-container {
            max-width: 600px;
            margin: 100px auto;
            padding: 40px;
            background: #fff;
            border-radius: 16px;
            box-shadow: 0 8px 24px rgba(0,0,0,0.1);
            text-align: center;
        }

        .thank-container h1 {
            font-size: 2.5rem;
            color: #00712D;
            margin-bottom: 20px;
        }

        .thank-container p {
            font-size: 1.2rem;
            color: #333;
            margin-bottom: 30px;
        }

        .thank-container .btn {
            background-color: #00712D;
            color: white;
            padding: 12px 24px;
            font-size: 1rem;
            border-radius: 8px;
        }

        .thank-container .btn:hover {
            background-color: #005A22;
        }

        .checkmark {
            font-size: 60px;
            color: #00A86B;
            margin-bottom: 20px;
        }
    </style>
</head>
<body>

<div class="thank-container">
    <div class="checkmark">🐶❤️😺</div>
    <h1>회원가입이 완료되었습니다!</h1>
    <p>Happynimal에 오신 것을 진심으로 환영합니다.<br>지금 바로 로그인하고 서비스를 이용해보세요.</p>
    <a href="login.do" class="btn">로그인 하러 가기</a>
</div>

</body>
</html>

<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html lang="en">

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
        /* 컨테이너 배경 유지 */
        #detail-container {
            background-color: #fff9e6; /* 연한 크림색 */
        }

        /* 카드 스타일 */
        .detail-card {
            background-color: #ffffff;
            border-radius: 0.5rem;
            box-shadow: 0 0.5rem 1rem rgba(0,0,0,0.1);
            padding: 2rem;
        }

        /* 제목 스타일 */
        .detail-header {
            font-size: 2rem;
            color: #00712D;
            text-align: center;
            margin-bottom: 1.5rem;

        }

        /* 지도 박스에 라운드 부여 */
        #map {
            width: 100%;
            height: 350px;
            border-radius: 0.5rem;
            overflow: hidden;
            margin-bottom: 2rem;
            border: 1px solid rgba(0,0,0,0.05);
        }

        /* 테이블 기본 스타일 리셋 */
        #detail-table {
            width: 100%;
            border-collapse: collapse;
        }
        #detail-table th,
        #detail-table td {
            padding: 0.75rem 1rem;
            vertical-align: middle;
        }
        /* 헤더에 포인트 컬러 */
        #detail-table th {
            background-color: #00712D;
            color: #ffffff;
            width: 30%;
            font-weight: 400;
            border: none;
            font-size: 17px;
            text-align: center;
        }
        /* 데이터 셀 */
        #detail-table td {
            background-color: #fafafa;
            color: #333;
            border: none;
            font-size: 17px;
        }
        /* 짝수행만 배경 살짝 다르게 */
        #detail-table tr:nth-child(even) td {
            background-color: #f0f0f0;
        }

        /* 버튼 컨테이너 */
        #button-container {
            text-align: center;
            margin-top: 2rem;
        }
        .action-button {
            background-color: #00712D;
            color: #fff;
            border: none;
            border-radius: 0.25rem;
            padding: 0.6rem 1.4rem;
            margin: 0 0.5rem;
            font-size: 1rem;
            transition: background-color 0.3s;
        }
        .action-button:hover {
            background-color: #FF9100;
            text-decoration: none;
            color: #fff;
        }
    </style>

</head>

<body>

<!-- Spinner Start -->
<div id="spinner" class="show bg-white position-fixed translate-middle w-100 vh-100 top-50 start-50 d-flex align-items-center justify-content-center">
    <div class="spinner-border text-primary" style="width: 3rem; height: 3rem;" role="status">
        <span class="sr-only">Loading...</span>
    </div>
</div>
<!-- Spinner End -->

<!-- Navbar & Hero Start -->
<div class="container-fluid position-relative p-0">
    <jsp:include page="/WEB-INF/views/common/nav.jsp" />

    <!-- Header Start -->
    <div class="container-fluid bg-breadcrumb">
        <div class="container text-center py-5" style="max-width: 900px;">
            <h4 class="text-white display-4 mb-4 wow fadeInDown" data-wow-delay="0.1s">입양신청서 상세정보</h4>
            <ol class="breadcrumb d-flex justify-content-center mb-0 wow fadeInDown" data-wow-delay="0.3s">
                <li class="breadcrumb-item"><a href="index.do">Home</a></li>
                <li class="breadcrumb-item"><a href="#">Adoption</a></li>
                <li class="breadcrumb-item active text-primary">Adoption Check</li>
            </ol>
        </div>
    </div>
    <!-- Header End -->
</div>
<!-- Navbar & Hero End -->

<div class="container-fluid feature py-5" id="detail-container">
    <h2 class="detail-header">입양신청서 상세보기</h2>
    <div class="row justify-content-center">
        <div class="col-lg-8">
            <div class="detail-card">
                <table id="detail-table">
                    <tr><th>입양 동물</th><td>${adoptionDetail.petname}(고유번호: ${adoptionDetail.petId})</td></tr>
                    <tr><th>이름</th><td>${adoptionDetail.name}</td></tr>
                    <tr><th>성별</th><td>${adoptionDetail.gender eq 'M' ? '남성' : '여성'}</td></tr>
                    <tr><th>나이</th><td>${adoptionDetail.age} 세</td></tr>
                    <tr><th>전화번호</th><td>${adoptionDetail.telephone}</td></tr>
                    <tr><th>이메일</th><td>${adoptionDetail.email}</td></tr>
                    <tr><th>통화 가능 시간</th><td>${adoptionDetail.calltime}시</td></tr>
                    <tr><th>지역</th><td>${adoptionDetail.region}</td></tr>
                    <tr><th>결혼 여부</th><td>${adoptionDetail.maritalStatus eq '1' ? '기혼' : '미혼'}</td></tr>
                    <tr><th>직업</th><td>${adoptionDetail.job}</td></tr>
                    <tr><th>과거 반려동물 경험</th><td>${adoptionDetail.q1 eq '1' ? '있음' : '없음'}</td></tr>
                    <tr><th>경험 설명</th><td>${adoptionDetail.q1Memo}</td></tr>
                    <tr><th>현재 반려동물 여부</th><td>${adoptionDetail.q2 eq '1' ? '있음' : '없음'}</td></tr>
                    <tr><th>가족(성인)</th><td>${adoptionDetail.q3Adult}명</td></tr>
                    <tr><th>가족(미성년자)</th><td>${adoptionDetail.q3Minor}명</td></tr>
                    <tr><th>주택 형태</th><td>
                        <c:choose>
                            <c:when test="${adoptionDetail.q4 eq '1'}">아파트</c:when>
                            <c:when test="${adoptionDetail.q4 eq '2'}">단독주택</c:when>
                            <c:when test="${adoptionDetail.q4 eq '3'}">빌라/다세대</c:when>
                            <c:when test="${adoptionDetail.q4 eq '4'}">원룸</c:when>
                        </c:choose>
                    </td></tr>
                    <tr><th>가족 의견</th><td>
                        <c:choose>
                            <c:when test="${adoptionDetail.q5 eq '0'}">모두 반대</c:when>
                            <c:when test="${adoptionDetail.q5 eq '1'}">부분 찬성</c:when>
                            <c:when test="${adoptionDetail.q5 eq '2'}">모두 찬성</c:when>
                        </c:choose>
                    </td></tr>
                    <tr><th>입양 이유</th><td>${adoptionDetail.q6Memo}</td></tr>
                    <tr><th>아기 출생 시 계속 입양 가능?</th><td>${adoptionDetail.q7 eq '1' ? '예' : '아니오'}</td></tr>
                    <tr><th>부재 시 관리 계획</th><td>${adoptionDetail.q8}</td></tr>
                    <tr><th>중성화 수술 의견</th><td>${adoptionDetail.q9}</td></tr>
                    <tr><th>가정 방문 동의</th><td>${adoptionDetail.q10}</td></tr>
                    <tr><th>10년 이상 책임 가능?</th><td>${adoptionDetail.q11 eq '1' ? '예' : '아니오'}</td></tr>
                    <tr><th>입양비·수술 동의</th><td>${adoptionDetail.q12 eq '1' ? '예' : '아니오'}</td></tr>
                    <tr><th>기타 의견</th><td>${adoptionDetail.q13}</td></tr>
                </table>
                <br>
                <a href="adoptioncheck.do">← 목록으로 돌아가기</a>

            </div>
        </div>
    </div>
</div>


<!-- Modal Search Start -->
<div class="modal fade" id="searchModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog modal-fullscreen">
        <div class="modal-content rounded-0">
            <div class="modal-header">
                <h4 class="modal-title mb-0" id="exampleModalLabel">Search by keyword</h4>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body d-flex align-items-center">
                <div class="input-group w-75 mx-auto d-flex">
                    <input type="search" class="form-control p-3" placeholder="keywords" aria-describedby="search-icon-1">
                    <span id="search-icon-1" class="input-group-text btn border p-3"><i class="fa fa-search text-white"></i></span>
                </div>
            </div>
        </div>
    </div>
</div>
<!-- Modal Search End -->

<!-- feature Start -->

<!-- feature End -->




<!-- Copyright Start -->
<div class="container-fluid copyright py-4">
    <div class="container">
        <div class="row g-4 align-items-center">
            <div class="col-md-6 text-center text-md-start mb-md-0">
                <span class="text-body"><a href="#" class="border-bottom text-white"><i class="fas fa-copyright text-light me-2"></i>Happynimal</a>, All right reserved.</span>
            </div>
        </div>
    </div>
</div>
<!-- Copyright End -->


<!-- Back to Top -->
<a href="#" class="btn btn-secondary btn-lg-square rounded-circle back-to-top"><i class="fa fa-arrow-up"></i></a>


<!-- JavaScript Libraries -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0/dist/js/bootstrap.bundle.min.js"></script>
<script src="<c:url value='/resources/lib/wow/wow.min.js' />"></script>
<script src="<c:url value='/resources/lib/easing/easing.min.js'/>"></script>
<script src="<c:url value='/resources/lib/waypoints/waypoints.min.js'/>"></script>
<script src="<c:url value='/resources/lib/counterup/counterup.min.js'/>"></script>
<script src="<c:url value='/resources/lib/owlcarousel/owl.carousel.min.js'/>"></script>


<!-- Template Javascript -->
<script src="<c:url value='/resources/js/main.js'/>"></script>

</body>

</html>
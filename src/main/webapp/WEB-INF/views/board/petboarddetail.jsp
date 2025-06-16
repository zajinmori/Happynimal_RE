<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page isELIgnored="false" %>

<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html lang="en">

<style>
    .pet-detail-container {
        display: flex;
        flex-direction: column;
        align-items: center;
        gap: 30px;
        padding: 40px 20px;
    }

    /* 이미지 슬라이더 영역 */
    .image-container {
        position: relative;
        max-width: 600px;
        margin: 0 auto;
        text-align: center;
    }

    .card-image-container {
        display: flex;
        justify-content: center;
        align-items: center;
    }

    .dcard-image {
        display: none;
    }

    .dcard-image.active {
        display: block;
    }

    .dcard-image img {
        width: 100%;
        height: 400px;
        max-height: 450px;
        object-fit: contain;
        border-radius: 10px;
        box-shadow: 0 0 12px rgba(0,0,0,0.2);
    }

    /* 화살표 버튼 */
    .arrow-btn {
        position: absolute;
        top: 50%;
        transform: translateY(-50%);
        background: rgba(0, 0, 0, 0);
        color: darkorange;
        font-size: 60px;
        border: none;
        padding: 16px 20px;
        border-radius: 50%;
        cursor: pointer;
        z-index: 2;
    }

    .left-btn {

        left: -100px;
    }

    .right-btn {

        right: -100px;
    }

    /* 정보 카드 */
    .pet-info-card {
        max-width: 600px;
        width: 100%;
        background-color: #fffdf5;
        border: 1px solid #eee;
        border-radius: 10px;
        padding: 30px 40px;
        box-shadow: 0 2px 10px rgba(0,0,0,0.1);
        font-size: 18px;
    }

    .pet-info-card dl {
        display: grid;
        grid-template-columns: 1fr 2fr;
        row-gap: 12px;
        column-gap: 10px;
    }

    .pet-info-card dt {
        font-weight: bold;
        text-align: right;
        color: #333;
    }

    .pet-info-card dd {
        margin: 0;
        color: #444;
    }


</style>

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
</head>


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
            <h4 class="text-white display-4 mb-4 wow fadeInDown" data-wow-delay="0.1s">상세보기</h4>
            <ol class="breadcrumb d-flex justify-content-center mb-0 wow fadeInDown" data-wow-delay="0.3s">
                <li class="breadcrumb-item"><a href="index.do">Home</a></li>
                <li class="breadcrumb-item"><a href="#">Adoption</a></li>
                <li class="breadcrumb-item active text-primary">Pet Board</li>
            </ol>
        </div>
    </div>
    <!-- Header End -->
</div>
<!-- Navbar & Hero End -->

<div class="pet-detail-container">
    <!-- 이미지 슬라이더 -->
    <div class="image-container">
        <button class="arrow-btn left-btn" onclick="prevImage()"><i class="fas fa-angle-left"></i></button>
        <div class="card-image-container">
            <c:forEach var="img" items="${pet.images}" varStatus="status">
                <div class="dcard-image ${status.index == 0 ? 'active' : ''}">
                    <img src="${img.url}" alt="동물사진 ${status.index}">
                </div>
            </c:forEach>
        </div>
        <button class="arrow-btn right-btn" onclick="nextImage()"><i class="fas fa-angle-right"></i></button>
    </div>

<div class="pet-info-card">

    <dl>
        <dt>이름: </dt><dd>${pet.name}</dd>
        <dt>나이: </dt><dd>${pet.age}세</dd>
        <dt>품종: </dt><dd>${pet.petInfo}</dd>
        <dt>무게: </dt><dd>${pet.weight}Kg</dd>
        <dt>성별: </dt>
        <dd>
            <c:choose>
                <c:when test="${pet.gender == 'M'}">수컷</c:when>
                <c:when test="${pet.gender == 'F'}">암컷</c:when>
            </c:choose>
        </dd>
        <dt>중성화 여부: </dt>
        <dd>
            <c:choose>
                <c:when test="${pet.neutered == 'Y'}">O</c:when>
                <c:when test="${pet.neutered == 'N'}">X</c:when>
                <c:otherwise>정보없음</c:otherwise>
            </c:choose>
        </dd>
        <dt>발견 장소: </dt><dd>${pet.location}</dd>
        <dt>보호소: </dt><dd>${pet.shelterName}</dd>
        <dt>등록일자: </dt>
        <dd>
            <fmt:formatDate value="${pet.regdate}" pattern="yyyy년 M월 d일"/>
        </dd>

    </dl>

</div>
    <div class="text-center my-4">
        <a href="petboard.do" class="btn btn-primary btn-lg">목록으로</a>
        <a href="adoptioninfo.do" class="btn btn-primary btn-lg">🐶입양하기😺</a>
    </div>


<%--        <div id="button-container">--%>
<%--            <button type="button" class="action-button" id="edit-button" onclick="location.href='volunteeredit.do?seq=${VolunteerListDTO.seq}';">수정하기</button>--%>
<%--            <button type="button" class="action-button" id="delete-button" onclick="location.href='volunteerdel.do?seq=${VolunteerListDTO.seq}';">삭제하기</button>--%>
<%--            <button type="button" class="action-button" id="back-button" onclick="location.href='volunteerboard.do';">목록으로 돌아가기</button>--%>
<%--        </div>--%>

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
<script src="<c:url value='/resources/js/PetBoardDetail.js'/>"></script>




</body>

</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>

<!DOCTYPE html>
<html lang="en">


<style>
    .custom-img {
        width: 100%;
        height: 280px;         /* 원하는 높이로 조절 */
        object-fit: cover;
        border-radius: 10px;   /* 예쁘게 라운딩 */
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
            <h4 class="text-white display-4 mb-4 wow fadeInDown" data-wow-delay="0.1s">기다리는 친구들</h4>
            <ol class="breadcrumb d-flex justify-content-center mb-0 wow fadeInDown" data-wow-delay="0.3s">
                <li class="breadcrumb-item"><a href="index.do">Home</a></li>
                <li class="breadcrumb-item"><a href="#">Adoption</a></li>
                <li class="breadcrumb-item active text-primary">PetBoard</li>
            </ol>
        </div>
    </div>
    <!-- Header End -->
</div>
<!-- Navbar & Hero End -->

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

            <a href="" class="btn btn-primary rounded-pill d-inline-flex flex-shrink-0 py-2 px-4">로그인</a>
        </div>
    </div>
</div>
<!-- Modal Search End -->

<!-- About Start -->
<div class="board-container">


    <div class="container mt-5">
        <div class="row">
            <c:forEach var="pet" items="${petList}">
                <div class="col-md-4 mb-4 d-flex">
                    <div class="card h-100 shadow-sm w-100">
                        <img src="${pet.randomImage}" class="card-img-top custom-img" alt="동물 이미지">
                        <div class="card-body text-center">
                            <h5 class="card-title">${pet.name}</h5>
                            <p class="card-text">나이: ${pet.age}살</p>
                            <p class="card-text">보호소: ${pet.shelterName}</p>
                            <a href="petdetail.do?seq=${pet.id}" class="btn btn-primary">상세보기</a>
                        </div>
                    </div>

                </div>
            </c:forEach>
        </div>
    </div>
</div>

<sec:authorize access="hasRole('ROLE_ADMIN')">
    <div class="text-center my-4">
        <a href="petadd.do" class="btn btn-primary btn-lg">유기동물 등록</a>
    </div>
</sec:authorize>

<div class="pagination mt-4 text-center">
    <c:if test="${pageInfo.startPage > 1}">
        <a href="petboard.do?page=${pageInfo.startPage - 1}">이전</a>
    </c:if>

    <c:forEach begin="${pageInfo.startPage}" end="${pageInfo.endPage}" var="i">
        <a href="petboard.do?page=${i}" class="${i == pageInfo.currentPage ? 'active' : ''}">${i}</a>
    </c:forEach>

    <c:if test="${pageInfo.endPage < pageInfo.totalPage}">
        <a href="petboard.do?page=${pageInfo.endPage + 1}">다음</a>
    </c:if>
</div>



    <div class="container-fluid copyright py-4">
        <div class="container">
            <div class="row g-4 align-items-center">
                <div class="col-md-6 text-center text-md-start mb-md-0">
                    <span class="text-body"><a href="#" class="border-bottom text-white"><i class="fas fa-copyright text-light me-2"></i>Happynimal</a>, All right reserved.</span>
                </div>
                <div class="col-md-6 text-center text-md-end text-body">            


                </div>
            </div>
        </div>
    </div>



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





    <script src="<c:url value='/resources/js/main.js'/>"></script>
</body>

</html>
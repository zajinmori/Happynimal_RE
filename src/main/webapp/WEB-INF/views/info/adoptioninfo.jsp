<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

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
            .breadcrumb a { color: #fff; }
            /* Adoption Info Section */
            .adopt-info { padding: 80px 0; }
            /* Expand container for wider cards */
            .adopt-info .container { max-width: 1400px; }
            .adopt-info .section-title h2 {
                font-size: 2.75rem;
                color: #00712D;
                margin-bottom: 1rem;
            }
            .adopt-info .section-title p {
                font-size: 1.125rem;
                color: #666;
                margin-bottom: 3rem;
            }
            .info-card {
                background: #fff;
                border-radius: 16px;
                box-shadow: 0 6px 18px rgba(0,0,0,0.1);
                transition: transform 0.3s ease, box-shadow 0.3s ease;
                /* allow horizontal overflow if needed */
                overflow-x: auto;
            }
            .info-card:hover {
                transform: translateY(-8px);
                box-shadow: 0 12px 24px rgba(0,0,0,0.15);
            }
            .info-card .icon {
                font-size: 2.5rem;
                color: #00712D;
                margin-bottom: 1rem;
            }
            .info-card h4 {
                font-size: 1.5rem;
                color: #333;
                margin-bottom: 0.75rem;
            }
            .info-card p,
            .info-card ul {
                font-size: 1rem;
                color: #555;
                line-height: 1.6;
                text-align: left;
                white-space: nowrap; /* prevent wrapping */
            }
            .info-card ul { padding-left: 1.4rem; margin-top: 0; }
            .info-card ul li { margin-bottom: 0.75rem; }
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
                    <h4 class="text-white display-4 mb-4 wow fadeInDown" data-wow-delay="0.1s">입양안내</h4>
                    <ol class="breadcrumb d-flex justify-content-center mb-0 wow fadeInDown" data-wow-delay="0.3s">
                        <li class="breadcrumb-item"><a href="index.do">Home</a></li>
                        <li class="breadcrumb-item"><a href="#">Adoption</a></li>
                        <li class="breadcrumb-item active text-primary">Adoption Information</li>
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
                </div>
            </div>
        </div>
        <!-- Modal Search End -->

        <!-- Adoption Info Content -->
        <!-- Adoption Info Content -->
        <section class="adopt-info">
            <div class="container">
                <div class="section-title text-center">
                    <h2>유기동물 입양 안내</h2>
                    <p>사랑받을 자격이 있는 반려동물들을 위한, 쉽고 안전한 입양 안내를 제공합니다.</p>
                </div>
                <div class="row g-4">
                    <!-- Original about text as bullet list -->
                    <div class="col-md-4">
                        <div class="info-card p-4 h-100">
                            <div class="icon text-center"><i class="fa fa-paw"></i></div>
                            <h4 class="text-center" style="color: #FF9100;">입양 안내</h4><br>
                            <ul>
                                <li>보호소로 유입되는 유기동물 수 증가</li>
                                <li>각기 다른 사연으로 보호소에 머무는 반려동물</li>
                                <li>사랑받을 자격이 있는 소중한 생명</li>
                                <li>입양자도 준비된 환경에서 새로운 시작 가능</li>
                                <li>입양 전·후 지속적인 지원과 정보 제공</li>
                            </ul>
                        </div>
                    </div>
                    <!-- Procedure -->
                    <div class="col-md-4">
                        <div class="info-card p-4 h-100">
                            <div class="icon text-center"><i class="fa fa-list-alt"></i></div>
                            <h4 class="text-center" style="color: #FF9100;">입양 절차</h4><br>
                            <ul>
                                <li>입양신청: 원하는 동물을 선택해 신청서를 작성합니다.</li>
                                <li>상담 및 평가: 생활환경과 준비 상황을 확인합니다.</li>
                                <li>사전 방문: 자택 방문 면담을 통해 적합성을 검토합니다.</li>
                                <li>입양 결정: 최종 승인 후 새로운 시작을 진행합니다.</li>
                                <li>입양 후 관리: 지속적인 상담과 지원을 제공합니다.</li>
                            </ul>
                        </div>
                    </div>
                    <!-- Meaning -->
                    <div class="col-md-4">
                        <div class="info-card p-4 h-100">
                            <div class="icon text-center"><i class="fa fa-heart"></i></div>
                            <h4 class="text-center" style="color: #FF9100;">입양의 의미</h4><br>
                            <ul>
                                <li>새로운 가족을 만나 새로운 삶을 시작하는 기회</li>
                                <li>보호소에 공간과 자원 여유 제공</li>
                                <li>사랑과 행복을 나누는 여정의 시작</li>
                            </ul>
                        </div>
                    </div>
                </div>
            </div>
        </section>




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
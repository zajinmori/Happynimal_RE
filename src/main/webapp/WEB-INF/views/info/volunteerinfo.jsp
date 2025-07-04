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
            /* Volunteer Info Section */
            .volunteer-info { background: #FFFBE6; padding: 80px 0; }
            .volunteer-info .section-title h2 {
                font-size: 2.75rem;
                color: #00712D;
                margin-bottom: 0.5rem;
            }
            .volunteer-info .section-title p {
                font-size: 1.125rem;
                color: #666;
                margin-bottom: 2.5rem;
            }
            .vol-card {
                background: #fff;
                border-radius: 16px;
                box-shadow: 0 6px 18px rgba(0,0,0,0.1);
                transition: transform 0.3s ease, box-shadow 0.3s ease;
                padding: 2rem;
                text-align: center;
                height: 100%;
                display: flex;
                flex-direction: column;
                justify-content: flex-start;
            }
            .vol-card:hover {
                transform: translateY(-6px);
                box-shadow: 0 12px 24px rgba(0,0,0,0.15);
            }
            .vol-card .icon {
                font-size: 2.5rem;
                color: #00712D;
                margin-bottom: 1rem;
            }
            .vol-card h4 {
                font-size: 1.5rem;
                color: #333;
                margin-bottom: 1rem;
            }
            .vol-card p,
            .vol-card ul {
                font-size: 1rem;
                color: #555;
                line-height: 1.6;
                text-align: left;
                margin: 0 auto;
                max-width: 400px;
            }
            .vol-card ul { padding-left: 1.2rem; }
            .vol-card ul li { margin-bottom: 0.75rem; }
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
                    <h4 class="text-white display-4 mb-4 wow fadeInDown" data-wow-delay="0.1s">봉사활동 안내</h4>
                    <ol class="breadcrumb d-flex justify-content-center mb-0 wow fadeInDown" data-wow-delay="0.3s">
                        <li class="breadcrumb-item"><a href="index.do">Home</a></li>
                        <li class="breadcrumb-item"><a href="#">Activity</a></li>
                        <li class="breadcrumb-item active text-primary">Volunteer Information</li>
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

        <!-- Volunteer Info Content -->
        <section class="volunteer-info">
            <div class="container">
                <div class="section-title text-center">
                    <h2>유기동물 봉사활동 안내</h2>
                    <p>보호소 동물들에게 따뜻한 손길을 건네는 다양하고 의미 있는 봉사활동입니다.</p>
                </div>
                <div class="row g-4 justify-content-center">
                    <!-- Activity Description Card -->
                    <div class="col-md-6 col-lg-4">
                        <div class="vol-card">
                            <div class="icon"><i class="fa fa-paw"></i></div>
                            <h4 style="color: #FF9100;">활동 내용</h4>
                            <p>유기동물 보호소에서 보호 중인<br> 동물들에게 따뜻한 손길을 전합니다.</p><br>
                            <ul>
                                <li>동물 먹이 주기 및 돌보기</li>
                                <li>보호소 청소 및 생활환경 정비</li>
                                <li>반려동물 산책 및 놀이 지원</li>
                                <li>기타 봉사 지원 활동</li>
                            </ul>
                        </div>
                    </div>
                    <!-- Procedure Card -->
                    <div class="col-md-6 col-lg-4">
                        <div class="vol-card">
                            <div class="icon"><i class="fa fa-calendar-check"></i></div>
                            <h4 style="color: #FF9100;">신청 절차</h4><br>
                            <ul>
                                <li>신청서 작성: 온라인 폼에 필수 정보 입력</li>
                                <li>일정 조율: 가능한 날짜와 시간 안내</li>
                                <li>활동 참여: 정해진 일정에 맞춰 방문</li>
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
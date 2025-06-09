<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html lang="en">

    <head>
        <meta charset="utf-8">
        <title>Happynimal</title>
        <meta content="width=device-width, initial-scale=1.0" name="viewport">
        <meta content="" name="keywords">
        <meta content="" name="description">
        <link rel="icon" href="resources/img/favicon.png">
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
            .content-wrapper {
                background: transparent;
                padding: 60px 0;
                max-width: none;
            }
            /* Center card horizontally */
            #resultbox { display: flex; justify-content: center; }
            .result-card {
                background: #FFFBE6;
                border-radius: 24px;
                box-shadow: 0 12px 30px rgba(0,0,0,0.1);
                max-width: 900px;
                width: 80%;
                overflow: hidden;
                transition: transform 0.3s ease, box-shadow 0.3s ease;
            }
            .result-card:hover {
                transform: translateY(-10px) scale(1.03);
                box-shadow: 0 24px 60px rgba(0,0,0,0.15);
            }
            .result-card-header {
                background: linear-gradient(135deg, #00712D 0%, #39B54A 100%);
                padding: 36px;
                text-align: center;
            }
            .result-card-header h3 {
                margin: 0;
                color: #fff;
                font-size: 2.2rem;
                letter-spacing: 0.5px;
            }
            .result-card-body {
                padding: 36px;
                text-align: center;
            }
            .pet-name {
                font-size: 2.5rem;
                font-weight: 700;
                color: #FF7F50;
                margin: 24px 0;
            }
            .pet-image {
                width: 100%;
                border-radius: 16px;
                margin: 30px 0;
                object-fit: cover;
            }
            .pet-desc {
                font-size: 1.5rem;
                line-height: 1.8;
                color: #444;
                margin-bottom: 36px;
            }
            .retry-btn {
                display: inline-block;
                padding: 16px 36px;
                background: #FFDFBA;
                color: #333;
                border-radius: 24px;
                text-decoration: none;
                font-weight: 700;
                box-shadow: 0 6px 18px rgba(0,0,0,0.1);
                transition: transform 0.2s ease, box-shadow 0.2s ease;
            }
            .retry-btn:hover {
                transform: translateY(-6px);
                box-shadow: 0 12px 30px rgba(0,0,0,0.15);
            }
            @media (max-width: 1200px) { .result-card { width: 90%; } }
            @media (max-width: 992px) { .result-card { width: 95%; } }
            @media (max-width: 576px) {
                .result-card-header h3 { font-size: 1.8rem; }
                .pet-name { font-size: 1.8rem; }
                .pet-desc { font-size: 1.1rem; }
                .retry-btn { padding: 14px 28px; }
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
                    <h4 class="text-white display-4 mb-4 wow fadeInDown" data-wow-delay="0.1s">반려동물 추천 결과</h4>
                    <ol class="breadcrumb d-flex justify-content-center mb-0 wow fadeInDown" data-wow-delay="0.3s">
                        <li class="breadcrumb-item"><a href="index.do">Home</a></li>
                        <li class="breadcrumb-item"><a href="#">Pages</a></li>
                        <li class="breadcrumb-item active text-primary">Quiz Result</li>
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

        <!-- About Start -->

        <!-- Full-width Content Wrapper -->
        <div class="content-wrapper">
            <!-- Result Card Start -->
            <div id="resultbox">
                <div class="result-card">
                    <div class="result-card-header">
                        <h3>당신에게 딱 맞는 반려동물</h3>
                    </div>
                    <div class="result-card-body">
                        <c:choose>
                            <c:when test="${not empty result}">
                                <div class="pet-name">${result.recommended}</div>
                                <c:if test="${not empty result.url}">
                                    <img src="${result.url}" alt="결과 이미지" class="pet-image" />
                                </c:if>
                                <p class="pet-desc"><c:out value="${fn:replace(result.result, '!', '!<br/>')}" escapeXml="false"/></p>
                            </c:when>
                            <c:otherwise>
                                <p class="pet-desc">추천 결과를 찾을 수 없습니다. 다시 시도해 주세요.</p>
                            </c:otherwise>
                        </c:choose>
                        <a href="quiz.do" class="retry-btn"><i class="fas fa-redo-alt"></i> 다시 하기</a>
                    </div>
                </div>
            </div>
            <!-- Result Card End -->
        </div>
        <!-- Full-width Content Wrapper End -->

        
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
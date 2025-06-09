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
            .resultBtn {
                display: block;
                margin: 2rem auto 0;
                background: linear-gradient(135deg, #00712D 0%, #39B54A 100%);
                color: #fff;
                border: none;
                padding: 16px 40px;
                font-size: 1.1rem;
                font-weight: 600;
                border-radius: 24px;
                box-shadow: 0 8px 20px rgba(0,0,0,0.1);
                cursor: pointer;
                transition: transform 0.2s ease, box-shadow 0.2s ease;
            }
            .resultBtn:hover {
                transform: translateY(-4px);
                box-shadow: 0 12px 30px rgba(0,0,0,0.15);
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
                    <h4 class="text-white display-4 mb-4 wow fadeInDown" data-wow-delay="0.1s">나랑 맞는 반려동물 테스트</h4>
                    <ol class="breadcrumb d-flex justify-content-center mb-0 wow fadeInDown" data-wow-delay="0.3s">
                        <li class="breadcrumb-item"><a href="index.html">Home</a></li>
                        <li class="breadcrumb-item"><a href="#">Pages</a></li>
                        <li class="breadcrumb-item active text-primary">My Pet Test❤️</li>
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

        <!-- About Start -->ㅁ
        <div class="container-fluid about py-5">
            <h1 id="testsubject">나랑 맞는 반려동물 테스트</h1>
            <br><br>
            <form id="quiz" action="/calculateResult.do" method="post">
                <ol style="list-style: none;">
                    <li class="testthing">
                        <p class="question">당신의 생활 스타일은 어떠신가요?</p>
                        <label><input type="radio" name="q1" value="1">집에서 조용히 보내는 걸 선호</label><br>
                        <label><input type="radio" name="q1" value="2">가끔 외출하는 편</label><br>
                        <label><input type="radio" name="q1" value="3">활동적인 생활을 좋아함</label>
                    </li>
                    <br><br>
                    <li class="testthing">
                        <p class="question">반려동물을 관리하는 시간은 어느정도가 좋으신가요?</p>
                        <label><input type="radio" name="q2" value="1">최소한의 관리가 좋음 </label><br>
                        <label><input type="radio" name="q2" value="2">적당한 관리 시간 </label><br>
                        <label><input type="radio" name="q2" value="3">많은 시간 투자 </label>
                    </li>
                    <br><br>
                    <li class="testthing">
                        <p class="question">반려동물의 성격에서 가장 원하는 특성은 무엇인가요?</p>
                        <label><input type="radio" name="q3" value="1">독립적이고 조용함 </label><br>
                        <label><input type="radio" name="q3" value="2">애정이 많고 친근함 </label><br>
                        <label><input type="radio" name="q3" value="3">활발하고 장난기 많음 </label>
                    </li>
                    <br><br>
                    <li class="testthing">
                        <p class="question">새로운 환경에 대한 적응력은 어떤가요?</p>
                        <label><input type="radio" name="q4" value="1">안정적인 환경을 선호 </label><br>
                        <label><input type="radio" name="q4" value="2">새로운 것을 시도해 보는 편 </label><br>
                        <label><input type="radio" name="q4" value="3">변화에 잘 적응함 </label>
                    </li>
                    <br><br>
                    <li class="testthing">
                        <p class="question">친구나 가족과의 관계는 어떠세요?</p>
                        <label><input type="radio" name="q5" value="1">혼자 있는 걸 좋아함</label><br>
                        <label><input type="radio" name="q5" value="2">소규모 모임을 선호 </label><br>
                        <label><input type="radio" name="q5" value="3">많은 사람과 어울리는 걸 좋아함 </label>
                    </li>
                    <br><br>
                    <li class="testthing">
                        <p class="question">스트레스가 해소되는 시간은 언제일까요?</p>
                        <label><input type="radio" name="q6" value="1">혼자 있는 시간 </label><br>
                        <label><input type="radio" name="q6" value="2">친구와의 대화 </label><br>
                        <label><input type="radio" name="q6" value="3">운동이나 외출 </label>
                    </li>
                    <br><br>
                    <li class="testthing">
                        <p class="question">주거 공간은 어떻게 되나요?</p>
                        <label><input type="radio" name="q7" value="1">작은 아파트 </label><br>
                        <label><input type="radio" name="q7" value="2">중간 크기의 집 </label><br>
                        <label><input type="radio" name="q7" value="3">큰 집이나 마당이 있는 집 </label>
                    </li>
                    <br><br>
                    <li class="testthing">
                        <p class="question">유기동물의 배경을 얼마나 중요하게 생각하나요?</p>
                        <label><input type="radio" name="q8" value="1">크게 신경 쓰지 않음 </label><br>
                        <label><input type="radio" name="q8" value="2">조금은 고려함 </label><br>
                        <label><input type="radio" name="q8" value="3">매우 중요하게 생각함 </label>
                    </li>
                    <br><br>
                    <li class="testthing">
                        <p class="question">반려동물이 소리내는 것에 대해 어떻게 생각하나요?</p>
                        <label><input type="radio" name="q9" value="1">조용한게 좋음 </label><br>
                        <label><input type="radio" name="q9" value="2">가끔 소리내는 건 괜찮음 </label><br>
                        <label><input type="radio" name="q9" value="3">항상 함께 시끄럽게 지내고 싶음 </label>
                    </li>
                    <br><br>
                    <li class="testthing">
                        <p class="question">유기동물 입양의 가장 큰 이유는?</p>
                        <label><input type="radio" name="q10" value="1">독립적인 반려동물이 필요해서 </label><br>
                        <label><input type="radio" name="q10" value="2">따뜻한 가족이 필요해서 </label><br>
                        <label><input type="radio" name="q10" value="3">활발하게 함께 놀고 싶어서 </label>
                    </li>
                    
                </ol>
                <button class="resultBtn" type="submit">결과 보기</button>
            </form>
        </div>
        <!-- About End -->

        <!-- Fact Counter -->
        
        <!-- Fact Counter -->

        <!-- feature Start -->
       
        <!-- feature End -->

        <!-- Footer Start -->
        
        <!-- Copyright Start -->
        <div class="container-fluid copyright py-4">
            <div class="container">
                <div class="row g-4 align-items-center">
                    <div class="col-md-6 text-center text-md-start mb-md-0">
                        <span class="text-body"><a href="#" class="border-bottom text-white"><i class="fas fa-copyright text-light me-2"></i>Happynimal</a>, All right reserved.</span>
                    </div>
                    <div class="col-md-6 text-center text-md-end text-body">
                        <!--/*** This template is free as long as you keep the below author’s credit link/attribution link/backlink. ***/-->
                        <!--/*** If you'd like to use the template without the below author’s credit link/attribution link/backlink, ***/-->
                        <!--/*** you can purchase the Credit Removal License from "https://htmlcodex.com/credit-removal". ***/-->
                        Designed By <a class="border-bottom text-white" href="https://htmlcodex.com">HTML Codex</a> Distributed By <a class="border-bottom text-white" href="https://themewagon.com">ThemeWagon</a>
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
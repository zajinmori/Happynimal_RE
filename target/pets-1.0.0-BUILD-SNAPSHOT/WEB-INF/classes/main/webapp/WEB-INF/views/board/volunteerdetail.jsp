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
        <link rel="icon" href="/pet/resources/img/favicon.png">
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
            <nav class="navbar navbar-expand-lg navbar-light px-4 px-lg-5 py-3 py-lg-0">
                <a href="/pet/index.do" class="navbar-brand p-0">
                    <h1 class="text-primary"><img src="/pet/resources/img/logo2.png"></img>Happynimal</h1>
                    <!-- <img src="img/logo.png" alt="Logo"> -->
                </a>
                <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarCollapse">
                    <span class="fa fa-bars"></span>
                </button>
                <div class="collapse navbar-collapse" id="navbarCollapse">
                    <div class="navbar-nav ms-auto py-0">
                         <a href="/pet/index.do" class="nav-item nav-link">Home</a>
                        <a href="/pet/about.do" class="nav-item nav-link">소개</a>
                        <div class="nav-item dropdown">
                            <a href="#" class="nav-link dropdown-toggle" data-bs-toggle="dropdown">입양</a>
                            <div class="dropdown-menu m-0">
                                <a href="/pet/adoptioninfo.do" class="dropdown-item">입양안내</a>
                                <a href="/pet/petboard.do" class="dropdown-item">기다리는 친구들</a>
                                <a href="/pet/applicationadoption.do" class="dropdown-item">입양신청</a>
                                <a href="/pet/review.do" class="dropdown-item ">입양후기</a>
                            </div>
                        </div>
                        
        
                        <div class="nav-item dropdown">
                            <a href="#" class="nav-link dropdown-toggle active" data-bs-toggle="dropdown">활동</a>
                            <div class="dropdown-menu m-0">
                                <a href="/pet/volunteerinfo.do" class="dropdown-item">봉사활동 안내</a>
                                <a href="/pet/volunteerboard.do" class="dropdown-item active">봉사활동 모집</a>
                                <a href="/pet/missingboard.do" class="dropdown-item">실종 게시판</a>
                            </div>
                        </div>
                        <a href="/pet/shelter.do" class="nav-item nav-link">보호소 및 병원</a>
                        <a href="/pet/donation.do" class="nav-item nav-link">후원</a>
                    </div>
                    <div class="d-none d-xl-flex me-3">
                        <div class="d-flex flex-column pe-3 border-end border-primary">
                           
                        </div>
                    </div>
                    
                    <a href="" class="btn btn-primary rounded-pill d-inline-flex flex-shrink-0 py-2 px-4">로그인</a>
                </div>
            </nav>

            <!-- Header Start -->
            <div class="container-fluid bg-breadcrumb">
                <div class="container text-center py-5" style="max-width: 900px;">
                    <h4 class="text-white display-4 mb-4 wow fadeInDown" data-wow-delay="0.1s">봉사활동 모집 상세정보</h4>
                    <ol class="breadcrumb d-flex justify-content-center mb-0 wow fadeInDown" data-wow-delay="0.3s">
                        <li class="breadcrumb-item"><a href="/pet/index.do">Home</a></li>
                        <li class="breadcrumb-item"><a href="#">Active</a></li>
                        <li class="breadcrumb-item active text-primary">Volunteer Board</li>
                    </ol>    
                </div>
            </div>
            <!-- Header End -->
        </div>
        <!-- Navbar & Hero End -->
        
          <div class="container-fluid feature bg-light py-5" id="detail-container">
    <h2 id="review-detail-title">게시글 상세보기</h2>
    <div class="container py-5" id="detail-table-container">
    
        <table id="detail-table">
        	<tr class="table-row">
                <th class="table-header">번호</th>
                <td class="table-data" id="detail-seq">${VolunteerListDTO.seq}</td>
            </tr>
            <tr class="table-row">
                <th class="table-header">제목</th>
                <td class="table-data" id="detail-title">${VolunteerListDTO.title}</td>
            </tr>
            <tr class="table-row">
                <th class="table-header">아이디</th>
                <td class="table-data" id="detail-id">${VolunteerListDTO.idMemberShelter}</td>
            </tr>
            <tr class="table-row">
                <th class="table-header">날짜</th>
                <td class="table-data" id="detail-regdate">${VolunteerListDTO.regdate}</td>
            </tr>
            <tr class="table-row">
                <th class="table-header">내용</th>
                <td class="table-data" id="detail-content">
                    <div id="content-text">${VolunteerListDTO.content}</div>
                </td>
            </tr>
            <tr class="table-row">
                <th class="table-header">봉사시작일</th>
                <td class="table-data" id="detail-volunteer-start">${VolunteerListDTO.dateVolunteerStart}</td>
            </tr>
            <tr class="table-row">
                <th class="table-header">봉사종료일</th>
                <td class="table-data" id="detail-volunteer-end">${VolunteerListDTO.dateVolunteerEnd}</td>
            </tr>
            <tr class="table-row">
                <th class="table-header">모집시작일</th>
                <td class="table-data" id="detail-recruit-start">${VolunteerListDTO.dateRecruitStart}</td>
            </tr>
            <tr class="table-row">
                <th class="table-header">모집종료일</th>
                <td class="table-data" id="detail-recruit-end">${VolunteerListDTO.dateRecruitEnd}</td>
            </tr>
            <tr class="table-row">
                <th class="table-header">모집인원</th>
                <td class="table-data" id="detail-num-count">${VolunteerListDTO.numCount}</td>
            </tr>
        </table>
        
        <div id="button-container">
            <button type="button" class="action-button" id="edit-button" onclick="location.href='/pet/volunteeredit.do?seq=${VolunteerListDTO.seq}';">수정하기</button>
            <button type="button" class="action-button" id="delete-button" onclick="location.href='/pet/volunteerdel.do?seq=${VolunteerListDTO.seq}';">삭제하기</button>
            <button type="button" class="action-button" id="back-button" onclick="location.href='/pet/volunteerboard.do';">목록으로 돌아가기</button>
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
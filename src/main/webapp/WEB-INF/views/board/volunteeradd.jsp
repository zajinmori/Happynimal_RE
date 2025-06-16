<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<!DOCTYPE html>
<html lang="en">
	<style>
        body {
            background-color: #FFFFFF
        }
        .form-card {
            max-width: 800px;
            margin: 3rem auto;
            border-radius: 1rem;
            box-shadow: 0 1rem 2rem rgba(0,0,0,0.1);
            overflow: hidden;
        }
        .form-card .card-header {
            background: #00712D;
            color: #fff;
            font-size: 1.5rem;
            font-weight: 500;
            text-align: center;
        }
        .form-card .form-floating > .form-control,
        .form-card .form-floating > .form-select {
            border-radius: 0.75rem;
        }
        .form-card .form-control:focus,
        .form-card .form-select:focus {
            box-shadow: 0 0 0 0.25rem rgba(46, 204, 113, 0.25);
        }
        .form-card .btn-submit {
            background: #00712D;
            border: none;
            border-radius: 50px;
            padding: 0.75rem 2rem;
            font-size: 1.1rem;
            transition: transform 0.2s;
        }
        .form-card .btn-submit:hover {
            transform: translateY(-2px);
            background-color: #FF9100;
        }
        .form-card .form-floating > label {
            color: #000 !important;
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
                    <h4 class="text-white display-4 mb-4 wow fadeInDown" data-wow-delay="0.1s">봉사활동 모집</h4>
                    <ol class="breadcrumb d-flex justify-content-center mb-0 wow fadeInDown" data-wow-delay="0.3s">
                        <li class="breadcrumb-item"><a href="index.do">Home</a></li>
                        <li class="breadcrumb-item"><a href="#">Volunteer</a></li>
                        <li class="breadcrumb-item active text-primary">VolunteerBoard</li>
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


        <section class="notice">
            <div class="card form-card">
                <div class="card-header">
                    📋 봉사활동 모집 등록
                </div>
                <div class="card-body p-4">
                    <form method="POST" action="/volunteeraddok.do">
                        <div class="row g-3">
                            <!-- 보호소 선택 -->
                            <div class="col-md-6 form-floating">
                                <select class="form-select" id="shelterSeq" name="shelterSeq" required>
                                    <option value="" disabled selected>보호소를 선택하세요</option>
                                    <option value="1">남양동물보호센터</option>
                                    <option value="2">한국동물구조관리협회</option>
                                    <option value="3">한국야생동물보호협회</option>
                                    <option value="4">고양시동물보호센터</option>
                                    <option value="6">이성준동물병원</option>
                                    <option value="5">남양주시동물보호센터</option>
                                    <option value="7">용인시 동물보호센터</option>
                                    <option value="8">시흥동물누리보호센터</option>
                                    <option value="9">평택시유기동물보호소</option>
                                    <option value="10">가나동물병원</option>
                                    <option value="11">펫앤쉘터동물병원</option>
                                    <option value="12">수원시 동물보호센터</option>
                                    <option value="13">양평군유기동물보호소</option>
                                    <option value="14">하남동물보호센터</option>
                                    <option value="15">오산 유기동물보호소</option>
                                    <option value="16">위더스 동물보호센터</option>
                                    <option value="17">광주TNR동물병원초월</option>
                                    <option value="18">광주TNR동물병원송정</option>
                                    <option value="19">24시아이동물메디컬</option>
                                    <option value="20">광명반함센터</option>
                                    <option value="21">부천시수의사회</option>
                                    <option value="22">구리반려동물문화센터</option>
                                    <option value="23">가평군유기동물보호소</option>
                                    <option value="24">의왕시청</option>
                                    <option value="25">안성시농업기술센터</option>
                                    <option value="26">로뎀동물병원</option>
                </select>
                    <label for="shelterSeq">모집기관(보호소)</label>
                </div>

                 <!-- 제목 -->
                 <div class="col-md-6 form-floating">
                     <input type="text" class="form-control" id="title" name="title"
                            placeholder="제목을 입력하세요" maxlength="100" required>
                     <label for="title">제목</label>
                 </div>

                 <!-- 내용 -->
                 <div class="col-12 form-floating">
            <textarea class="form-control" placeholder="모집 내용을 입력하세요"
                      id="content" name="content" style="height: 120px;" required></textarea>
                     <label for="content">내용</label>
                 </div>

                            <div class="col-md-6 form-floating">
                                <input type="date" class="form-control" id="dateVolunteerStart"
                                       name="dateVolunteerStart" required>
                                <label for="dateVolunteerStart">봉사 시작일</label>
                            </div>
                            <div class="col-md-6 form-floating">
                                <input type="date" class="form-control" id="dateVolunteerEnd"
                                       name="dateVolunteerEnd" required>
                                <label for="dateVolunteerEnd">봉사 종료일</label>
                            </div>

                            <div class="col-md-6 form-floating">
                                <input type="date" class="form-control" id="dateRecruitStart"
                                       name="dateRecruitStart" required>
                                <label for="dateRecruitStart">모집 시작일</label>
                            </div>
                            <div class="col-md-6 form-floating">
                                <input type="date" class="form-control" id="dateRecruitEnd"
                                       name="dateRecruitEnd" required>
                                <label for="dateRecruitEnd">모집 종료일</label>
                            </div>

                            <div class="col-md-4 offset-md-4 form-floating">
                                <input type="number" class="form-control" id="personnel"
                                       name="personnel" min="1" placeholder=" " required>
                                <label for="personnel">모집 인원</label>
                            </div>

             </div>

      <!-- 제출 버튼 -->
      <div class="text-center mt-4">
          <button type="submit" class="btn btn-submit">
              등록하기
          </button>
      </div>
      </form>
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
    <script>
    
    	
    
    </script>
    </body>

</html>







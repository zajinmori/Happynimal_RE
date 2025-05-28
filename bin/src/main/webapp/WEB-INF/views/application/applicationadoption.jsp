<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
        <link href="/pet/resources/lib/animate/animate.min.css" rel="stylesheet">
        <link href="/pet/resources/lib/owlcarousel/assets/owl.carousel.min.css" rel="stylesheet">


        <!-- Customized Bootstrap Stylesheet -->
        <link href="/pet/resources/css/bootstrap.min.css" rel="stylesheet">

        <!-- Template Stylesheet -->
        <link href="/pet/resources/css/style.css" rel="stylesheet">
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
                        <a href="/pet/about.do" class="nav-item nav-link active">소개</a>
                        <div class="nav-item dropdown">
                            <a href="#" class="nav-link dropdown-toggle" data-bs-toggle="dropdown">입양</a>
                            <div class="dropdown-menu m-0">
                                <a href="/pet/adoptioninfo.do" class="dropdown-item">입양안내</a>
                                <a href="/pet/petboard.do" class="dropdown-item">기다리는 친구들</a>
                                <a href="/pet/applicationadoption.do" class="dropdown-item">입양신청</a>
                                <a href="/pet/review.do" class="dropdown-item">입양후기</a>
                            </div>
                        </div>
                        
        
                        <div class="nav-item dropdown">
                            <a href="#" class="nav-link dropdown-toggle" data-bs-toggle="dropdown">활동</a>
                            <div class="dropdown-menu m-0">
                                <a href="/pet/volunteerinfo.do" class="dropdown-item">봉사활동 안내</a>
                                <a href="/pet/volunteerboard.do" class="dropdown-item">봉사활동 모집</a>
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
                    <h4 class="text-white display-4 mb-4 wow fadeInDown" data-wow-delay="0.1s">입양신청</h4>
                    <ol class="breadcrumb d-flex justify-content-center mb-0 wow fadeInDown" data-wow-delay="0.3s">
                        <li class="breadcrumb-item"><a href="/pet/index.do">Home</a></li>
                        <li class="breadcrumb-item"><a href="#">Pages</a></li>
                        <li class="breadcrumb-item active text-primary">AdoptionApplication</li>
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
        <div class="bad">
            <h1 id="applicationadop">유기동물 입양 신청서</h1><br>
    <form id="applicationform" action="/applicationadoption.do/submit" method="post">
        <div id="good">
        <label class="adoptionquestion" for="name">이름</label>
        <input class="userans" type="text" id="name" name="name" required><br><br>

        <label class="adoptionquestion" for="gender">성별</label>
        <input class="userans" type="radio" id="male" name="gender" value="M"> 남성
        <input class="userans" type="radio" id="female" name="gender" value="F"> 여성<br><br>

        <label class="adoptionquestion" for="age">나이</label>
        <input class="userans" type="number" id="age" name="age" required min="19" max="65"> 세<br><br>

        <label class="adoptionquestion" for="tel">연락처</label>
        <input class="userans" type="tel" id="tel" name="tel" pattern="[0-9]{2,3}-[0-9]{3,4}-[0-9]{4}" placeholder="예: 010-1234-5678" required> 
        <br><br>

        <label class="adoptionquestion" for="email">이메일</label>
        <input class="userans" type="email" id="email" name="email" pattern="[a-z0-9._%+\-]+@[a-z0-9.\-]+\.[a-z]{2,}$" required><br><br>

        <label class="adoptionquestion" for="preferredCallTime">통화하기 편한 시간</label>
        <select class="userans" id="preferredCallTime" name="preferredCallTime" required>
            <option value="9">09시</option>
            <option value="10">10시</option>
            <option value="11">11시</option>
            <option value="12">12시</option>
            <option value="13">13시</option>
            <option value="14">14시</option>
            <option value="15">15시</option>
            <option value="16">16시</option>
            <option value="17">17시</option>
        </select><br><br>

        <label class="adoptionquestion" for="area">지역</label>
        <select class="userans"> id="area" name="area" required>
            <option value="경기">경기도</option>
            <option value="서울">서울특별시</option>
            <option value="부산">부산광역시</option>
            <option value="인천">인천광역시</option>
            <option value="광주">광주광역시</option>
            <option value="대구">대구광역시</option>
            <option value="대전">대전광역시</option>
            <option value="울산">울산광역시</option>
            <option value="세종">세종특별자치시</option>
            <option value="강원">강원특별자치도</option>
            <option value="충북">충청북도</option>
            <option value="충남">충청남도</option>
            <option value="전북">전북특별자치도</option>
            <option value="전남">전라남도</option>
            <option value="경북">경상북도</option>
            <option value="경남">경상남도</option>
            <option value="제주">제주특별자치도</option>
        </select>
            <br><br>

        <label class="adoptionquestion" for="isMarried">결혼을 하셨습니까?</label>
        <input class="userans" type="radio" name="isMarried" value="1"> 결혼함&nbsp;
        <input class="userans" type="radio" name="isMarried" value="0"> 결혼하지 않음<br><br>

        <label class="adoptionquestion" for="job">직업</label>
        <input class="userans" type="text" id="job" name="job" required><br><br>

        <label class="adoptionquestion" for="hasPetExperience">과거 반려동물을 키운 경험이 있습니까?</label>
        <input class="userans" type="radio" name="hasPetExperience" value="1"> 있음&nbsp;
        <input class="userans" type="radio" name="hasPetExperience" value="0"> 없음<br><br>

        <label class="adoptionquestion" for="petExperienceDetails">과거 반려동물 경험 서술</label>
        <textarea class="userans" id="petExperienceDetails" name="petExperienceDetails"></textarea><br><br>

        <label class="adoptionquestion" for="hasCurrentPet">현재 반려동물 여부</label>
        <input class="userans" type="radio" name="hasCurrentPet" value="1"> 있음&nbsp;
        <input class="userans" type="radio" name="hasCurrentPet" value="0"> 없음<br><br>
        
        <label class="adoptionquestion" for="familyadult">가족 인원 수(성인)</label>
        <input class="userans" type="number" id="familyadult" name="familyadult" required min="1" max="20"> 명<br><br>
        <label class="adoptionquestion" for="familykid">가족 인원 수(미성년자)</label>
        <input class="userans" type="number" id="familykid" name="familykid" required min="0" max="20"> 명<br><br>
        
        <label class="adoptionquestion" for="familymind">입양에 대한 가족들의 입장</label>
        <input class="userans" type="radio" name="familymind" value="0"> 본인제외 모두반대&nbsp;&nbsp;
        <input class="userans" type="radio" name="familymind" value="1"> 부분 찬성&nbsp;&nbsp;
        <input class="userans" type="radio" name="familymind" value="2"> 모두 찬성 <br><br>

        <label class="adoptionquestion" for="reasonadoption">입양을 원하는 이유</label>
        <textarea class="userans" id="reasonadoption" name="reasonadoption"></textarea><br><br>

        <label class="adoptionquestion" for="babyborn">만약 댁에서 새로운 아기가 출생할 경우 입양된 동물을 계속 키우실 수 있겠습니까?</label>
        <input class="userans" type="radio" name="babyborn" value="1"> 예&nbsp;
        <input class="userans" type="radio" name="babyborn" value="0"> 아니오<br><br>
        

        <label class="adoptionquestion" for="absence">귀하와 가족의 부재시(여행,명절,휴가 등) 반려동물을 어떻게 관리하실 예정이신가요?</label>
        <textarea class="userans" id="absence" name="absence"></textarea><br><br>


        <label class="adoptionquestion" for="neutering">반려동물 중성화수술에 대한 의견을 남겨주세요</label>
        <textarea class="userans" id="neutering" name="neutering"></textarea><br><br>

        
        <label class="adoptionquestion" for="visit">저희가 귀하의 가정을 사전약속 하에 방문하는 것에 대해서는 어떻게 생각하시나요?</label>
        <textarea class="userans" id="visit" name="visit"></textarea><br><br>


        <label class="adoptionquestion" for="returnpet">반려동물을 입양하시려면, 입양비(구조 동물의 구조와 치료, 구제비로 사용)를 납부하셔야 하며 불임 수술 시행에도 동의하셔야 합니다. 동의하십니까?</label>
        <input class="userans" type="radio" name="returnpet" value="1"> 예&nbsp;
        <input class="userans" type="radio" name="returnpet" value="0"> 아니오<br><br>


        <label class="adoptionquestion" for="opinion">그 외에 입양 신청에 관해 덧붙이고자 하시는 말씀이 있으시면 적어주시기 바랍니다.</label>
        <textarea class="userans" id="opinion" name="opinion"></textarea><br><br>







        

        <button id="submission" type="submit">제출</button>
    </div>
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
    <script src="/pet/resources/lib/wow/wow.min.js"></script>
    <script src="/pet/resources/lib/easing/easing.min.js"></script>
    <script src="/pet/resources/lib/waypoints/waypoints.min.js"></script>
    <script src="/pet/resources/lib/counterup/counterup.min.js"></script>
    <script src="/pet/resources/lib/owlcarousel/owl.carousel.min.js"></script>
    

    <!-- Template Javascript -->
    <script src="/pet/resources/js/main.js"></script>
    </body>

</html>
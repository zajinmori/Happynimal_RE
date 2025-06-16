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
    /* 전체 섹션 배경 및 정렬 */
    section.notice {
      background-color: #f4f6f9;
      padding: 60px 20px;
    }

    /* 폼 컨테이너 카드 스타일 */
    .page-title {
      max-width: 1000px;
      margin: 0 auto;
      background: whitesmoke;
      border-radius: 18px;
      padding: 50px 40px;
      box-shadow: 0 20px 40px rgba(0, 0, 0, 0.06);
      animation: fadeInUp 0.5s ease;
    }

    /* 헤더 텍스트 스타일 */
    .page-title h2 {
      font-size: 32px;
      text-align: center;
      font-weight: 700;
      margin-bottom: 40px;
      color: #00712D;
    }

    /* 입력 요소 공통 스타일 */
    #form-container form label {
      font-weight: 600;
      margin-bottom: 6px;
      color: #444;
      display: block;
    }

    #form-container form input,
    #form-container form select,
    #form-container form textarea {
      width: 100%;
      padding: 12px 16px;
      border: 1px solid #dcdcdc;
      border-radius: 12px;
      font-size: 15px;
      margin-bottom: 20px;
      background-color: #fafafa;
      transition: all 0.2s ease-in-out;
    }

    #form-container form input:focus,
    #form-container form select:focus,
    #form-container form textarea:focus {
      border-color: #6c63ff;
      background-color: #fff;
      box-shadow: 0 0 0 4px rgba(108, 99, 255, 0.15);
      outline: none;
    }

    /* 제출 버튼 */
    #form-container form button[type="submit"] {
      width: 100%;
      padding: 14px;
      background-color: #00712D;
      color: white;
      font-size: 17px;
      font-weight: bold;
      border: none;
      border-radius: 12px;
      transition: background 0.3s ease-in-out;
    }

    #form-container form button[type="submit"]:hover {
      background-color: #FF9100;
    }

    /* 이미지 미리보기 스타일 */
    #previewContainer img {
      width: 100px;
      height: 100px;
      object-fit: cover;
      border-radius: 10px;
      border: 1px solid #e0e0e0;
      box-shadow: 0 2px 5px rgba(0,0,0,0.08);
    }

    /* 애니메이션 */
    @keyframes fadeInUp {
      from {
        opacity: 0;
        transform: translateY(30px);
      }
      to {
        opacity: 1;
        transform: translateY(0);
      }
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
      <h4 class="text-white display-4 mb-4 wow fadeInDown" data-wow-delay="0.1s">유기동물 등록</h4>
      <ol class="breadcrumb d-flex justify-content-center mb-0 wow fadeInDown" data-wow-delay="0.3s">
        <li class="breadcrumb-item"><a href="index.do">Home</a></li>
        <li class="breadcrumb-item"><a href="#">Adoption</a></li>
        <li class="breadcrumb-item active text-primary">AdoptionBoard</li>
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

  <div class="page-title">

    <h2 id="volunteeradd">유기동물 등록</h2>
    <div id="form-container">
      <form id="myForm" method="POST" action="/petaddok.do" enctype="multipart/form-data">


        <label>보호소</label>
        <select name="seqShelterId" required>
          <option value="1">남양동물보호센터</option>
          <option value="2">한국동물구조관리협회</option>
          <option value="3">한국야생동물보호협회</option>
          <option value="4">고양시동물보호센터</option>
          <option value="5">남양주시동물보호센터</option>
          <option value="6">이성준동물병원</option>
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
        </select><br/>

        <!-- LOCATION -->
        <label>발견 장소: </label>
        <input type="text" name="location" maxlength="300" required /><br/>

        <!-- NAME -->
        <label>이름: </label>
        <input type="text" name="name" maxlength="30" required /><br/>

        <label>품종: </label>
        <input type="text" name="petInfo" maxlength="30" required /><br/>

        <!-- GENDER -->
        <label>성별: </label>
        <select name="gender" required>
          <option value="M">수컷</option>
          <option value="F">암컷</option>
        </select><br/>

        <!-- NEUTERED -->
        <label>중성화 여부: </label>
        <select name="neutered" required>
          <option value="Y">예</option>
          <option value="N">아니오</option>
        </select><br/>

        <!-- AGE -->
        <label>나이(세): </label>
        <input type="number" name="age" min="0" max="99" required /><br/>

        <!-- WEIGHT -->
        <label>몸무게(kg): </label>
        <input type="number" name="weight" step="0.1" min="0" required /><br/>

        <!-- DETAIL -->
        <label>상세 설명: </label><br/>
        <textarea name="detail" rows="5" cols="50" required></textarea><br/>

        <!-- 이미지 파일 업로드 -->
        <label>이미지 첨부: </label>
        <input type="file" name="images" id="imageInput" multiple /><br/><br/>
        <div id="previewContainer" style="display: flex; flex-wrap: wrap; gap: 10px;"></div>

        <button type="submit">등록하기</button>

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

<%--유기동물 게시판 등록 페이지에서 사진 미리보기--%>
<script src="<c:url value='/resources/js/petBoard.js'/>"></script>

</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

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
            /* 컨테이너 배경 유지 */
            #detail-container {
                background-color: #fff9e6; /* 연한 크림색 */
            }

            /* 카드 스타일 */
            .detail-card {
                background-color: #ffffff;
                border-radius: 0.5rem;
                box-shadow: 0 0.5rem 1rem rgba(0,0,0,0.1);
                padding: 2rem;
            }

            /* 제목 스타일 */
            .detail-header {
                font-size: 2rem;
                color: #00712D;
                text-align: center;
                margin-bottom: 1.5rem;

            }

            /* 지도 박스에 라운드 부여 */
            #map {
                width: 100%;
                height: 350px;
                border-radius: 0.5rem;
                overflow: hidden;
                margin-bottom: 2rem;
                border: 1px solid rgba(0,0,0,0.05);
            }

            /* 테이블 기본 스타일 리셋 */
            #detail-table {
                width: 100%;
                border-collapse: collapse;
            }
            #detail-table th,
            #detail-table td {
                padding: 0.75rem 1rem;
                vertical-align: middle;
            }
            /* 헤더에 포인트 컬러 */
            #detail-table th {
                background-color: #00712D;
                color: #ffffff;
                width: 20%;
                font-weight: 500;
                border: none;
                font-size: 20px;
                text-align: center;
            }
            /* 데이터 셀 */
            #detail-table td {
                background-color: #fafafa;
                color: #333;
                border: none;
                font-size: 17px;
            }
            /* 짝수행만 배경 살짝 다르게 */
            #detail-table tr:nth-child(even) td {
                background-color: #f0f0f0;
            }

            /* 버튼 컨테이너 */
            #button-container {
                text-align: center;
                margin-top: 2rem;
            }
            .action-button {
                background-color: #00712D;
                color: #fff;
                border: none;
                border-radius: 0.25rem;
                padding: 0.6rem 1.4rem;
                margin: 0 0.5rem;
                font-size: 1rem;
                transition: background-color 0.3s;
            }
            .action-button:hover {
                background-color: #FF9100;
                text-decoration: none;
                color: #fff;
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
                    <h4 class="text-white display-4 mb-4 wow fadeInDown" data-wow-delay="0.1s">봉사활동 모집 상세정보</h4>
                    <ol class="breadcrumb d-flex justify-content-center mb-0 wow fadeInDown" data-wow-delay="0.3s">
                        <li class="breadcrumb-item"><a href="index.do">Home</a></li>
                        <li class="breadcrumb-item"><a href="#">Active</a></li>
                        <li class="breadcrumb-item active text-primary">Volunteer Board</li>
                    </ol>    
                </div>
            </div>
            <!-- Header End -->
        </div>
        <!-- Navbar & Hero End -->

        <div class="container-fluid feature py-5" id="detail-container">
            <h2 class="detail-header">게시글 상세보기</h2>
            <div class="row justify-content-center">
                <div class="col-lg-8">
                    <div class="detail-card">
                        <!-- 지도 그릴 div -->
                        <div id="map"></div>

                        <!-- 상세 테이블 -->
                        <table id="detail-table">
                            <tr>
                                <th>제목</th>
                                <td>${VolunteerListDTO.title}</td>
                            </tr>
                            <tr>
                                <th>모집기관(보호소)</th>
                                <td>${VolunteerListDTO.shelterName}</td>
                            </tr>
                            <tr>
                                <th>내용</th>
                                <td>${VolunteerListDTO.content}</td>
                            </tr>
                            <tr>
                                <th>봉사 기간</th>
                                <td>
                                    <fmt:formatDate value="${VolunteerListDTO.dateVolunteerStart}" pattern="yyyy-MM-dd"/> ~ <fmt:formatDate value="${VolunteerListDTO.dateVolunteerEnd}" pattern="yyyy-MM-dd"/>
                                </td>
                            </tr>
                            <tr>
                                <th>모집 기간</th>
                                <td>
                                    <fmt:formatDate value="${VolunteerListDTO.dateRecruitStart}" pattern="yyyy-MM-dd"/> ~ <fmt:formatDate value="${VolunteerListDTO.dateRecruitEnd}" pattern="yyyy-MM-dd"/>
                                </td>
                            </tr>
                            <tr>
                                <th>모집인원</th>
                                <td>${VolunteerListDTO.personnel}명</td>
                            </tr>
                            <tr>
                                <th>등록일자</th>
                                <td><fmt:formatDate value="${VolunteerListDTO.regdate}"/></td>
                            </tr>
                        </table>

                        <!-- 버튼들 -->
                        <div id="button-container">
                            <sec:authorize access="hasRole('ROLE_ADMIN')">
                                <button class="action-button"
                                        onclick="location.href='volunteeredit.do?seq=${VolunteerListDTO.seq}'">
                                    수정하기
                                </button>
                                <button class="action-button"
                                        onclick="location.href='volunteerdel.do?seq=${VolunteerListDTO.seq}'">
                                    삭제하기
                                </button>
                            </sec:authorize>
                            <button class="action-button"
                                    onclick="location.href='volunteerboard.do'">
                                목록으로 돌아가기
                            </button>
                        </div>
                    </div>
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

        <script src="//dapi.kakao.com/v2/maps/sdk.js?appkey=1f82e3629ef09c1d71731d2b1e7263c8&libraries"></script>

        <!-- 지도 스크립트 -->
        <script>
            var lat = ${VolunteerListDTO.latitude};
            var lng = ${VolunteerListDTO.longitude};

            var container = document.getElementById('map');
            var options = {
                center: new kakao.maps.LatLng(lat, lng),
                level: 3
            };

            var map = new kakao.maps.Map(container, options);

            var markerPosition = new kakao.maps.LatLng(lat, lng);
            var marker = new kakao.maps.Marker({
                position: markerPosition
            });

            marker.setMap(map);
        </script>

    </body>

</html>
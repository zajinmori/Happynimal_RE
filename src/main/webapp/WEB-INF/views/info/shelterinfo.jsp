<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="en">

<style>


    .content td{
        border: 1px solid black;
        padding: 8px 12px;
        text-align: center;
    }

    .shelter-wrapper {
        display: flex;
        justify-content: center;
        align-items: center;
        margin-top: 50px; /* 위와의 간격 */
        margin-bottom: 50px;
        padding: 0 20px;
    }

    .table-body {
        border: none;
        border-collapse: collapse;
        background-color: white;
    }

    .table-body td,
    .table-body th {
        border: none;
        border-bottom: 1px solid #ccc;
        padding: 12px 20px;
        text-align: center;
        width: 35%;
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


        <script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=1f82e3629ef09c1d71731d2b1e7263c8&libraries=clusterer"></script>
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
                    <h4 class="text-white display-4 mb-4 wow fadeInDown" data-wow-delay="0.1s">보호소 및 병원</h4>
                    <ol class="breadcrumb d-flex justify-content-center mb-0 wow fadeInDown" data-wow-delay="0.3s">
                        <li class="breadcrumb-item"><a href="index.do">Home</a></li>
                        <li class="breadcrumb-item"><a href="#">Pages</a></li>
                        <li class="breadcrumb-item active text-primary">Shelter and Hospital</li>
                    </ol>    
                </div>
            </div>
            <!-- Header End -->
        </div>
        <!-- Navbar & Hero End -->



       <%--Map 들어갑니다--%>

       <!-- 전체 컨테이너 -->
               <div class="shelter-container">
                   <div class="shelter-wrapper">
                       <div id="map" style="width:800px; height:1100px; border-radius: 25px; box-shadow: 2px 5px 15px rgba(0,0,0,0.25); position: relative; z-index: 2; "></div>

                       <div class="tb_wrap" style="max-height: 1100px; overflow-y: auto; padding: 55px 65px; background: #fff; border-raidus: 0 25px 25px 0; ransform: translateX(-50px); padding-left: 100px; box-sizing: border-box; ">
                           <div class="scr_wrap" style="width: 100%; height: 100%;">
                               <table class="table-body">
                                   <tbody>
                                   <c:if test="${not empty shelterLocations}">
                                       <c:forEach items="${shelterLocations}" var="loc" varStatus="status">
                                           <tr class="content">
                                               <td><a href="#" class="shelter-link" data-index="${status.index}">${loc.name}</a></td>
                                               <td>${loc.address}</td>
                                               <td>${loc.telephone}</td>
                                           </tr>
                                       </c:forEach>
                                   </c:if>
                                   </tbody>
                               </table>
                           </div>
                       </div>
                   </div>
               </div>










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

           var container = document.getElementById('map');
           var options = {
               center: new kakao.maps.LatLng(37.5665, 126.9780),
               level: 9
           };
           var map = new kakao.maps.Map(container, options);

           // 보호소 정보 배열
           const locations = [
               <c:forEach var="loc" items="${shelterLocations}" varStatus="status">
               {
                   name: "<c:out value='${loc.name}'/>",
                   lat: ${loc.latitude},
                   lng: ${loc.longitude},
                   address: "<c:out value='${loc.address}'/>",
                   tel: "<c:out value='${loc.telephone}'/>"
               }<c:if test="${!status.last}">,</c:if>
               </c:forEach>
           ];

           let markers = [];
           let infowindows = [];
           let currentInfowindow = null;

           locations.forEach(function(loc, index) {
               const marker = new kakao.maps.Marker({
                   map: map,
                   position: new kakao.maps.LatLng(loc.lat, loc.lng),
                   title: loc.name
               });

               const iwContent =
                   '<div style="padding:10px; width:200px; background:#FFFBE6; ' +
                   'box-shadow: 0 0 0 2px #00712D; border-radius: 8px;">' +
                   '<b style="color:#ff9100; font-size:16px;">' + loc.name + '</b><br>' +
                   '<span style="color:#333; font-size:14px;">' + loc.address + '</span><br>' +
                   '<span style="color:#555; font-size:13px;">' +
                   (loc.tel && loc.tel.trim() !== '' ? loc.tel : '전화번호 없음') +
                   '</span>' +
                   '</div>';

               const infowindow = new kakao.maps.InfoWindow({
                   content: iwContent,
                   removable: true
               });

               kakao.maps.event.addListener(marker, 'click', function () {
                   if (currentInfowindow) {
                       currentInfowindow.close();
                   }

                   map.setCenter(marker.getPosition());
                   infowindow.open(map, marker);
                   currentInfowindow = infowindow;
               });

               // 배열 저장
               markers.push(marker);
               infowindows.push(infowindow);
           });

           document.querySelectorAll('.shelter-link').forEach((el) => {
               el.addEventListener('click', function (e) {
                   e.preventDefault();

                   const index = parseInt(this.dataset.index, 10);
                   const marker = markers[index];
                   const infowindow = infowindows[index];

                   if (currentInfowindow) {
                       currentInfowindow.close();
                   }

                   map.setCenter(marker.getPosition());
                   infowindow.open(map, marker);
                   currentInfowindow = infowindow;
               });
           });

       </script>

    </body>

</html>
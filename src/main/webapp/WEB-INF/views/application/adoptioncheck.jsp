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

    <!-- <head> 안에 추가 -->
    <style>
        .board-container {
            max-width: 900px;
            margin: 3rem auto;
            padding: 2.5rem;
            background-color: #FFF9E6;
            border-radius: 1rem;
            box-shadow: 0 1rem 2rem rgba(0,0,0,0.1);
        }

        .board-title {
            font-size: 2.2rem;
            color: #FF9100;
            text-align: center;
            margin-bottom: 2rem;
            position: relative;
        }
        .board-title::after {
            content: '';
            display: block;
            width: 6rem;
            height: 4px;
            background: #FF9100;
            margin: 0.5rem auto 0;
            border-radius: 2px;
        }

        .board-table {
            width: 100%;
            border-collapse: collapse;
            overflow: hidden;
            border-radius: 0.5rem;
            box-shadow: 0 0.5rem 1.5rem rgba(0,0,0,0.08);
        }

        .board-table thead th {
            background: #00712D;
            color: #fff;
            padding: 1rem 1.2rem;
            text-transform: uppercase;
            letter-spacing: 0.5px;
            font-size: 1rem;
        }

        .board-table tbody tr {
            background: #fff;
            transition: transform 0.2s ease, box-shadow 0.2s ease;
        }
        .board-table tbody tr:hover {
            transform: translateY(-4px);
            box-shadow: 0 0.5rem 1rem rgba(0,0,0,0.1);
        }

        .board-table tbody td {
            padding: 0.9rem 1rem;
            border-bottom: 1px solid #eee;
            color: #444;
            font-size: 0.9rem;
            text-align: center;
        }

        /* 링크 스타일 */
        .board-table tbody a {
            color: #00712D;
            text-decoration: none;
            font-weight: 500;
        }
        .board-table tbody a:hover {
            text-decoration: underline;
        }

        /* 페이지네이션 */
        .pagination {
            display: flex;
            justify-content: center;
            gap: 0.4rem;
            margin-top: 1.5rem;
        }
        .pagination a {
            display: block;
            padding: 0.5rem 0.9rem;
            background: #fff;
            border: 1px solid #ddd;
            border-radius: 0.4rem;
            color: #555;
            text-decoration: none;
            font-size: 0.9rem;
            transition: background 0.3s, color 0.3s;
        }
        .pagination a:hover {
            background: #FF9100;
            color: #fff;
            border-color: #FF9100;
        }
        .pagination a.active {
            background: #FF9100;
            color: #fff;
            border: 1px solid #FF9100;
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
            <h4 class="text-white display-4 mb-4 wow fadeInDown" data-wow-delay="0.1s">봉사활동 모집</h4>
            <ol class="breadcrumb d-flex justify-content-center mb-0 wow fadeInDown" data-wow-delay="0.3s">
                <li class="breadcrumb-item"><a href="index.do">Home</a></li>
                <li class="breadcrumb-item"><a href="#">Activity</a></li>
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

<!-- About Start -->
<div class="board-container">
    <h1 class="board-title">전송된 입양 신청서</h1>

    <table class="board-table">
        <colgroup>
            <col style="width: 60%;">
            <col style="width: 20%;">
            <col style="width: 20%;">
        </colgroup>
        <thead>
        <tr>
            <th>신청자 ID</th>
            <th>사는 지역</th>
            <th>작성일</th>
        </tr>
        </thead>
        <tbody>
        <c:if test="${not empty adoptionList}">
            <c:forEach items="${adoptionList}" var="al">
                <tr>
                    <td>
                        <a href="adoptiondetail.do?seq=${al.seq}">
                                ${al.idMember}
                        </a>
                    </td>

                    <td>${al.region}</td>

                    <td>
                        <c:choose>
                            <c:when test="${not empty al.regdate}">
                                <fmt:formatDate value="${al.regdate}" pattern="yyyy-MM-dd"/>
                            </c:when>
                            <c:otherwise>
                                -
                            </c:otherwise>
                        </c:choose>
                    </td>
                </tr>
            </c:forEach>
        </c:if>
        </tbody>
    </table>

    <div class="pagination">
        <c:if test="${pageInfo.startPage > 1}">
            <a href="adoptioncheck.do?page=${pageInfo.startPage-1}">&laquo;</a>
        </c:if>
        <c:forEach begin="${pageInfo.startPage}" end="${pageInfo.endPage}" var="i">
            <a href="adoptioncheck.do?page=${i}"
               class="${i == pageInfo.currentPage ? 'active' : ''}">
                    ${i}
            </a>
        </c:forEach>
        <c:if test="${pageInfo.endPage < pageInfo.totalPage}">
            <a href="adoptioncheck.do?page=${pageInfo.endPage+1}">&raquo;</a>
        </c:if>
    </div>
</div>


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
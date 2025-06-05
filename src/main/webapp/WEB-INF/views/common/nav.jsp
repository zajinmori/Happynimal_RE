<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>


<nav class="navbar navbar-expand-lg navbar-light px-4 px-lg-5 py-3 py-lg-0">
    <a href="index.do" class="navbar-brand p-0">
        <h1 class="text-primary">
            <img src="resources/img/logo2.png"/>Happynimal</h1>
    </a>
    <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarCollapse">
        <span class="fa fa-bars"></span>
    </button>
    <div class="collapse navbar-collapse" id="navbarCollapse">
        <div class="navbar-nav ms-auto py-0">
            <a href="index.do" class="nav-item nav-link active">Home</a>
            <a href="about.do" class="nav-item nav-link">소개</a>
            <div class="nav-item dropdown">
                <a href="#" class="nav-link dropdown-toggle" data-bs-toggle="dropdown">입양</a>
                <div class="dropdown-menu m-0">
                    <a href="adoptioninfo.do" class="dropdown-item">입양안내</a>
                    <a href="petboard.do" class="dropdown-item">기다리는 친구들</a>
                    <a href="applicationadoption.do" class="dropdown-item">입양신청</a>
                    <a href="review.do" class="dropdown-item">입양후기</a>
                </div>
            </div>


            <div class="nav-item dropdown">
                <a href="#" class="nav-link dropdown-toggle" data-bs-toggle="dropdown">활동</a>
                <div class="dropdown-menu m-0">
                    <a href="volunteerinfo.do" class="dropdown-item">봉사활동 안내</a>
                    <a href="volunteerboard.do" class="dropdown-item">봉사활동 모집</a>
                </div>
            </div>
            <a href="shelter.do" class="nav-item nav-link">보호소 및 병원</a>
        </div>
        <div class="d-none d-xl-flex me-3">
            <div class="d-flex flex-column pe-3 border-end border-primary">

            </div>
        </div>

        <%--로그인 상태일때--%>
        <sec:authorize access="isAuthenticated()">
            <span style="color: #cecece; margin-right: 10px; font-size: 12px">
                <span style="color: #FF9100; font-size: 15px">
                [<sec:authentication property="principal.nickname" />]
                </span>
                    님 환영해요!
            </span>
            <form action="${pageContext.request.contextPath}/logout" method="post" style="display:inline;">
                <button type="submit" class="btn btn-primary rounded-pill d-inline-flex flex-shrink-0 py-2 px-4">
                    로그아웃
                </button>
            </form>
        </sec:authorize>

        <%--비로그인 상태일 때--%>
        <sec:authorize access="isAnonymous()">
            <a href="login.do" class="btn btn-primary rounded-pill d-inline-flex flex-shrink-0 py-2 px-4">
                로그인
            </a>
        </sec:authorize>
    </div>
</nav>
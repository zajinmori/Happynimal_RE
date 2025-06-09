<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
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
                    <h4 class="text-white display-4 mb-4 wow fadeInDown" data-wow-delay="0.1s">입양신청</h4>
                    <ol class="breadcrumb d-flex justify-content-center mb-0 wow fadeInDown" data-wow-delay="0.3s">
                        <li class="breadcrumb-item"><a href="index.do">Home</a></li>
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

    <%--@elvariable id="application" type=""--%>
    <form:form modelAttribute="application" action="/adoptionAplicationOk.do" method="post">
        <div id="good">
        <%--@declare id="q11"--%><%--@declare id="q12"--%><%--@declare id="q7"--%><%--@declare id="q5"--%><%--@declare id="q4"--%><%--@declare id="q2"--%><%--@declare id="q1"--%><%--@declare id="maritalstatus"--%><label class="adoptionquestion" for="name">이름</label>
        <form:input path="name" cssClass="userans"/><br><br>

            <label class="adoptionquestion">성별</label>
            <label><form:radiobutton path="gender" value="M" cssClass="userans" /> 남성</label>
            <label><form:radiobutton path="gender" value="F" cssClass="userans" /> 여성</label>
            <br><br>

            <label class="adoptionquestion" for="age">나이</label>
        <form:input path="age" cssClass="userans" type="number" min="19" max="65"/> 세<br><br>

        <label class="adoptionquestion" for="telephone">연락처</label>
        <form:input path="telephone" id="telephone" cssClass="userans" placeholder="예: 010-1234-5678"/>
        <form:errors path="telephone" cssClass="error"/>
        <br><br>

        <label class="adoptionquestion" for="email">이메일</label>
        <form:input path="email" id="email" cssClass="userans" placeholder="이메일 입력"/>
        <form:errors path="email" cssClass="error"/>

        <label class="adoptionquestion" for="calltime">통화하기 편한 시간</label>
            <form:select path="calltime" id="calltime" cssClass="userans">
                <form:option value="" label="선택하세요" />
                <form:option value="9" label="09시" />
                <form:option value="10" label="10시" />
                <form:option value="11" label="11시" />
                <form:option value="12" label="12시" />
                <form:option value="13" label="13시" />
                <form:option value="14" label="14시" />
                <form:option value="15" label="15시" />
                <form:option value="16" label="16시" />
                <form:option value="17" label="17시" />
            </form:select>
            <form:errors path="calltime" cssClass="error"/><br><br>

        <label class="adoptionquestion" for="region">지역</label>
            <form:select path="region" id="region" cssClass="userans">
                <form:option value="" label="선택하세요" />
                <form:option value="경기" label="경기도" />
                <form:option value="서울" label="서울특별시" />
                <form:option value="부산" label="부산광역시" />
                <form:option value="인천" label="인천광역시" />
                <form:option value="광주" label="광주광역시" />
                <form:option value="대구" label="대구광역시" />
                <form:option value="대전" label="대전광역시" />
                <form:option value="울산" label="울산광역시" />
                <form:option value="세종" label="세종특별자치시" />
                <form:option value="강원" label="강원특별자치도" />
                <form:option value="충북" label="충청북도" />
                <form:option value="충남" label="충청남도" />
                <form:option value="전북" label="전북특별자치도" />
                <form:option value="전남" label="전라남도" />
                <form:option value="경북" label="경상북도" />
                <form:option value="경남" label="경상남도" />
                <form:option value="제주" label="제주특별자치도" />
            </form:select>
            <form:errors path="region" cssClass="error"/>
            <br><br>

        <label class="adoptionquestion" for="maritalStatus">결혼을 하셨습니까?</label>
            <form:radiobutton path="maritalStatus" value="1" cssClass="userans"/> 결혼함&nbsp;
            <form:radiobutton path="maritalStatus" value="0" cssClass="userans"/> 결혼하지 않음
            <form:errors path="maritalStatus" cssClass="error"/>

            <!-- 직업 -->
            <label class="adoptionquestion" for="job">직업</label>
            <form:input path="job" id="job" cssClass="userans"/>
            <form:errors path="job" cssClass="error"/>
            <br><br>

            <!-- 과거 반려동물 경험 여부 -->
            <label class="adoptionquestion" for="q1">과거 반려동물을 키운 경험이 있습니까?</label>
            <form:radiobutton path="q1" value="1" cssClass="userans"/> 있음&nbsp;
            <form:radiobutton path="q1" value="0" cssClass="userans"/> 없음
            <form:errors path="q1" cssClass="error"/>
            <br><br>

            <!-- 과거 반려동물 경험 서술 -->
            <label class="adoptionquestion" for="q1Memo">과거 반려동물 경험 서술</label>
            <form:textarea path="q1Memo" id="q1Memo" cssClass="userans"/>
            <form:errors path="q1Memo" cssClass="error"/>
            <br><br>

            <!-- 현재 반려동물 여부 -->
            <label class="adoptionquestion" for="q2">현재 반려동물 여부</label>
            <form:radiobutton path="q2" value="1" cssClass="userans"/> 있음&nbsp;
            <form:radiobutton path="q2" value="0" cssClass="userans"/> 없음
            <form:errors path="q2" cssClass="error"/>
            <br><br>

            <!-- 가족 인원 수(성인) -->
            <label class="adoptionquestion" for="q3Adult">가족 인원 수(성인)</label>
            <form:input path="q3Adult" id="familyadult" type="number" min="1" max="20" cssClass="userans"/>
            <form:errors path="q3Adult" cssClass="error"/>
            명<br><br>

            <!-- 가족 인원 수(미성년자) -->
            <label class="adoptionquestion" for="q3Minor">가족 인원 수(미성년자)</label>
            <form:input path="q3Minor" id="familykid" type="number" min="0" max="20" cssClass="userans"/>
            <form:errors path="q3Minor" cssClass="error"/>
            명<br><br>

            <!-- 현재 살고있는 주택의 형태 -->
            <label class="adoptionquestion" for="q4">현재 살고있는 주택의 형태는 무엇입니까?</label>
            <form:radiobutton path="q4" value="1" cssClass="userans"/> 아파트&nbsp;&nbsp;
            <form:radiobutton path="q4" value="2" cssClass="userans"/> 단독주택&nbsp;&nbsp;
            <form:radiobutton path="q4" value="3" cssClass="userans"/> 빌라/다세대&nbsp;&nbsp;
            <form:radiobutton path="q4" value="4" cssClass="userans"/> 원룸
            <form:errors path="q4" cssClass="error"/>
            <br><br>

            <!-- 입양에 대한 가족들의 입장 -->
            <label class="adoptionquestion" for="q5">입양에 대한 가족들의 입장</label>
            <form:radiobutton path="q5" value="0" cssClass="userans"/> 본인제외 모두반대&nbsp;&nbsp;
            <form:radiobutton path="q5" value="1" cssClass="userans"/> 부분 찬성&nbsp;&nbsp;
            <form:radiobutton path="q5" value="2" cssClass="userans"/> 모두 찬성
            <form:errors path="q5" cssClass="error"/>
            <br><br>

            <!-- 입양을 원하는 이유 -->
            <label class="adoptionquestion" for="q6Memo">입양을 원하는 이유</label>
            <form:textarea path="q6Memo" id="q6Memo" cssClass="userans"/>
            <form:errors path="q6Memo" cssClass="error"/>
            <br><br>

            <!-- 새로운 아기 출생시 입양 동물 계속 키울 수 있는지 -->
            <label class="adoptionquestion" for="q7">만약 댁에서 새로운 아기가 출생할 경우 입양된 동물을 계속 키우실 수 있겠습니까?</label>
            <form:radiobutton path="q7" value="1" cssClass="userans"/> 예&nbsp;
            <form:radiobutton path="q7" value="0" cssClass="userans"/> 아니오
            <form:errors path="q7" cssClass="error"/>
            <br><br>

            <!-- 가족 부재시 동물 관리 계획 -->
            <label class="adoptionquestion" for="q8">귀하와 가족의 부재시(여행,명절,휴가 등) 반려동물을 어떻게 관리하실 예정이신가요?</label>
            <form:textarea path="q8" id="q8" cssClass="userans"/>
            <form:errors path="q8" cssClass="error"/>
            <br><br>

            <!-- 중성화수술 의견 -->
            <label class="adoptionquestion" for="q9">반려동물 중성화수술에 대한 의견을 남겨주세요</label>
            <form:textarea path="q9" id="q9" cssClass="userans"/>
            <form:errors path="q9" cssClass="error"/>
            <br><br>

            <!-- 가정 방문 동의 여부 -->
            <label class="adoptionquestion" for="q10">저희가 귀하의 가정을 사전약속 하에 방문하는 것에 대해서는 어떻게 생각하시나요?</label>
            <form:textarea path="q10" id="q10" cssClass="userans"/>
            <form:errors path="q10" cssClass="error"/>
            <br><br>

            <!-- 10년 이상 키울 수 있는지 -->
            <label class="adoptionquestion" for="q11">반려동물을 10년 이상 키우실 수 있습니까?</label>
            <form:radiobutton path="q11" value="1" cssClass="userans"/> 예&nbsp;
            <form:radiobutton path="q11" value="0" cssClass="userans"/> 아니오
            <form:errors path="q11" cssClass="error"/>
            <br><br>

            <!-- 입양비/불임수술 동의 -->
            <label class="adoptionquestion" for="q12">반려동물을 입양하시려면, 입양비(구조 동물의 구조와 치료, 구제비로 사용)를 납부하셔야 하며 불임 수술 시행에도 동의하셔야 합니다. 동의하십니까?</label>
            <form:radiobutton path="q12" value="1" cssClass="userans"/> 예&nbsp;
            <form:radiobutton path="q12" value="0" cssClass="userans"/> 아니오
            <form:errors path="q12" cssClass="error"/>
            <br><br>

            <!-- 추가 의견 -->
            <label class="adoptionquestion" for="q13">그 외에 입양 신청에 관해 덧붙이고자 하시는 말씀이 있으시면 적어주시기 바랍니다.</label>
            <form:textarea path="q13" id="q13" cssClass="userans"/>
            <form:errors path="q13" cssClass="error"/>
            <br><br>


        <button class="resultBtn" type="submit">제출</button>
    </div>
    </form:form>
</div>

        <div class="container-fluid copyright py-4">
            <div class="container">
                <div class="row g-4 align-items-center">
                    <div class="col-md-6 text-center text-md-start mb-md-0">
                        <span class="text-body"><a href="#" class="border-bottom text-white"><i class="fas fa-copyright text-light me-2"></i>Happynimal</a>, All right reserved.</span>
                    </div>
                    <div class="col-md-6 text-center text-md-end text-body">
                        Designed By <a class="border-bottom text-white" href="https://htmlcodex.com">HTML Codex</a> Distributed By <a class="border-bottom text-white" href="https://themewagon.com">ThemeWagon</a>
                    </div>
                </div>
            </div>
        </div>



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
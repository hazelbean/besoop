<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" 	uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="ui"  uri="http://egovframework.gov/ctl/ui" %>
<%@ taglib prefix="fn" 	uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%
 /**
  * @ Class Name 	: MapoMain.jsp
  * @ Description 	: MapoMain 화면
  * @ Modification Information
  * @
  * @  수정일             	 수정자              수정내용
  * @ -----------  --------    ---------------------------
  * @ 2021.08.23 	서지혜              최초 생성
  *
  *
  *  
  */
%>

<!DOCTYPE html>
<html lang="ko">

<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>마포구청 업무 사이트</title>

    <!-- Custom fonts for this template-->
    <link 	rel="stylesheet" type="text/css" href="<c:url value="/css/bootstrapthema/vendor/fontawesome-free/css/all.min.css"/>">
  	<link 	href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i" rel="stylesheet">

    <!-- Custom styles for this template-->
    <link rel="stylesheet" href="<c:url value="/css/bootstrapthema/css/sb-admin-2.css"/>">

	<!-- 공통 CSS 호출 -->
	<link rel="stylesheet" href="<c:url value="/css/mapo/custom.css"/>">
	
	<!-- favicon -->
   	<link rel="shortcut icon" type="image/x-icon" href="<c:url value="/css/mapo/favicon.ico"/>">

</head>

<body id="page-top">
	
	<!-- 로그인 여부 체크 -->
 	<c:if test="${loginVO != null}">
	<%-- 	${loginVO.name}(${loginVO.id})<spring:message code="comCmm.unitContent.2"/> <a href="${pageContext.request.contextPath }/uat/uia/actionLogout.do"><spring:message code="comCmm.unitContent.3"/></a>
 --%>
		<!-- <script type="text/javaScript" language="javascript">
			parent.frames["_top"].location.reload();
		</script>  -->
		
		<!-- Page Wrapper -->
		<div id="wrapper">
			<!-- Sidebar -->
			<c:import url="MapoMainLeft.jsp" />

			<!-- Content Wrapper -->
			<div id="content-wrapper" class="d-flex flex-column">
				<div id="content">

					<!-- Topbar -->
					<c:import url="MapoMainTop.jsp" />
	
					<!-- Main Content -->
					<c:import url="MapoMainContent.jsp" />

					<!-- Footer -->
					<c:import url="MapoMainFooter.jsp" />

				</div>
			</div>
		</div>

		<!-- Modal & Script-->
		<%@ include file="modal/common.jsp"%>
		
		<!-- Page level plugins -->
		<%-- <script src="<c:url value="/css/bootstrapthema/vendor/chart.js/Chart.min.js"/>"></script>
	
		<!-- Page level custom scripts -->
		<script src="<c:url value="/css/bootstrapthema/js/demo/chart-area-demo.js"/>"></script>
		<script src="<c:url value="/css/bootstrapthema/js/demo/chart-pie-demo.js"/>"></script> --%>
		
		
		
 	</c:if> 
 	<c:if test="${loginVO == null }">
		<jsp:forward page="/uat/uia/MapoLoginUsr.do"/>
	</c:if> 
	
</body>

</html>
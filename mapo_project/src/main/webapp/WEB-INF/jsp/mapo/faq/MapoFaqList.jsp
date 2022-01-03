<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%
	/**
* @ Class Name 	: MapoFaqList.jsp
* @ Description 	: MapoFaqList 화면
* @ Modification Information
* @
* @  수정일             	 수정자              수정내용
* @ -----------  --------    ---------------------------
* @ 2021.09.01 	서지혜              최초 생성
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
<link rel="stylesheet" type="text/css" href="<c:url value="/css/bootstrapthema/vendor/fontawesome-free/css/all.min.css"/>">
<link href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i" rel="stylesheet">

<!-- Custom styles for this template-->
<link rel="stylesheet" href="<c:url value="/css/bootstrapthema/css/sb-admin-2.css"/>">

<!-- 공통 CSS 호출 -->
<link rel="stylesheet" href="<c:url value="/css/mapo/custom.css"/>">

<!-- Font-Awesome 5 호출 -->
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.8.2/css/all.min.css" />

<!-- favicon -->
<link rel="shortcut icon" type="image/x-icon" href="<c:url value="/css/mapo/favicon.ico"/>">

</head>


<body id="page-top">

	<!-- javascript warning tag  -->
	<noscript class="noScriptTitle">
		<spring:message code="common.noScriptTitle.msg" />
	</noscript>

	<!-- Page Wrapper -->
	<div id="wrapper">

		<!-- Sidebar -->
		<c:import url="../MapoMainLeft.jsp" />

		<!-- Content Wrapper -->
		<div id="content-wrapper" class="d-flex flex-column">
			<div id="content">

				<!-- Topbar -->
				<c:import url="../MapoMainTop.jsp" />

				<!-- Main Content -->
				<div class="container col-auto">
					<div class="row">
						<div class="col-sm-6">
							<p class="pageTitle">| FAQ</p>
						</div>
						<c:if test="${loginVO.groupId == 'GROUP_00000000000000'}">
							<div class="col-sm-6 text-right mt-2 mb-2">
								<a href="<c:url value='/mapo/insertFaqView.do' />" class="btn btn-primary text-right mr-1" title="<spring:message code="button.create" /> <spring:message code="input.button" />">신규등록</a>
							</div>
						</c:if>
					</div>


					<form name="faqForm" action="<c:url value='/mapo/selectFaqList.do'/>" method="post">
						<div class="card">
							<div class="card-header">
								<div class="form-group row " style="margin-bottom: 0px;">
								<!-- <span class="ml-4 mr-1 mt-2 align-self-center">  col-sm-1 -->
									<span class="col-sm-1 align-self-center text-right"><strong>질문제목</strong> <%-- <select name="searchCnd" class="form-control" title="<spring:message code="title.searchCondition" /> <spring:message code="input.cSelect" />">
									<option value="0"  <c:if test="${searchVO.searchCnd == '0'}">selected="selected"</c:if> ><spring:message code="comUssOlhFaq.faqVO.qestnSj" /></option><!-- 질문제목 -->
								</select> --%> </span>
									<!-- 검색키워드 및 조회버튼 -->
									<span class="col-sm-4"> <input class="form-control" name="searchWrd" type="text" size="35" title="<spring:message code="title.search" /> <spring:message code="input.input" />" value='<c:out value="${searchVO.searchWrd}"/>' maxlength="155" placeholder="검색어를 입력하세요."></span>
									<span class="col-sm-4"> <input type="submit" class="btn btn-primary" value="<spring:message code="button.inquire" />" title="조회" /></span>
								</div>
							</div>

							<!-- 리스트 출력 부분  -->
							<div class="card-body">

								<div class="table-responsive">
									<!-- 목록영역 -->
									<table class="table table-hover mt-3" summary="<spring:message code="common.summary.list" arguments="${pageTitle}" />">

										<colgroup>
											<col style="width: 15%;">
											<col style="width: 45%;">
											<col style="width: 20%;">
											<col style="width: 20%;">
										</colgroup>

										<thead>
											<tr>
												<!-- 번호 -->
												<th class="text-center"><spring:message code="table.num" /></th>
												<!-- 질문제목 -->
												<th class="board_th_link"><spring:message code="comUssOlhFaq.faqVO.qestnSj" /></th>
												<!-- 조회수 -->
												<th class="text-center"><spring:message code="comUssOlhFaq.faqVO.inqireCo" /></th>
												<!-- 등록일자 -->
												<th class="text-center"><spring:message code="table.regdate" /></th>
											</tr>
										</thead>

										<tbody>
											<c:if test="${fn:length(resultList) == 0}">
												<tr class="text-center">
													<td colspan="4"><spring:message code="common.nodata.msg" /></td>
												</tr>
											</c:if>
											<c:forEach items="${resultList}" var="resultInfo" varStatus="status">
												<tr class="text-center">
													<td><c:out value="${(searchVO.pageIndex-1) * searchVO.pageSize + status.count}" /></td>
													<!-- 질문 제목 -->
													<td class="text-left"><a href="<c:url value='/mapo/selectFaqDetail.do?faqId=${resultInfo.faqId}'/>"> <c:out value='${fn:substring(resultInfo.qestnSj, 0, 40)}' />
													</a></td>
													<!-- 조회수 -->
													<td><c:out value='${resultInfo.inqireCo}' /></td>
													<!-- 등록일자 -->
													<td><c:out value='${resultInfo.frstRegisterPnttm}' /></td>
												</tr>
											</c:forEach>
										</tbody>
									</table>
								</div>

							</div>

							<div class="card-footer">
								<!-- paging navigation -->
								<div class="pagination" style="height: 4vh;">
									<!-- style="height:4vh;"  -->
									<ul class="pagination justify-content-center" style="width: 100%;">
										<ui:pagination paginationInfo="${paginationInfo}" type="image" jsFunction="linkPage" />
									</ul>
								</div>
							</div>
						</div>

						<input name="faqId" type="hidden" value="<c:out value='${searchVO.faqId}'/>"> <input name="pageIndex" type="hidden" value="<c:out value='${searchVO.pageIndex}'/>">
					</form>
				</div>
			</div>
		</div>
	</div>

	<!-- Modal & Script-->
	<%@ include file="../modal/common.jsp"%>

	<script type="text/javascript">
		$(document).ready(function() {

			// 왼쪽 메뉴 아이콘 활성화
			$("#menuFaq").addClass("active");

		});

		/*********************************************************
		 * 페이징 처리 함수
		 ******************************************************** */
		function linkPage(pageNo) {
			location.href = "<c:url value='/mapo/selectFaqList.do'/>?pageIndex="
					+ pageNo + "&searchWrd=${searchWrd}";
		}
	</script>

</body>
</html>
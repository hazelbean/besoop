<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%
	/**
* @ Class Name 	: WorkListOrg.jsp
* @ Description 	: WorkListOrg 화면
* @ Modification Information
* @
* @  수정일             	 수정자              수정내용
* @ -----------  --------    ---------------------------
* @ 2021.08.25 	이도경              최초 생성
* @ 2021.10.07 	이도경              레이아웃 수정
* @ 
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
<%-- <link rel="stylesheet" href="<c:url value="/css/bootstrapthema/css/sb-admin-2.min.css"/>"> --%>

<!-- 공통 CSS 호출 -->
<link rel="stylesheet" href="<c:url value="/css/mapo/custom.css"/>">

<!-- Font-Awesome 5 호출 -->
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.8.2/css/all.min.css" />

<!-- favicon -->
<link rel="shortcut icon" type="image/x-icon" href="<c:url value="/css/mapo/favicon.ico"/>">
</head>

<body id="page-top">

	<!-- Page Wrapper -->
	<div id="wrapper">

		<!-- Sidebar -->
		<c:import url="../MapoMainLeft.jsp" />

		<!-- Content Wrapper -->
		<div id="content-wrapper" class="d-flex flex-column">
			<div id="content">

				<!-- Topbar -->
				<c:import url="../MapoMainTop.jsp" />

				<!-- 메인 컨테이너  -->
				<div class="container col-auto">
					<p class="pageTitle">| 업무확인</p>

					<!-- start 폼 -->
					<form name="searchForm" action="<c:url value='workListOrg.do'/>" method="post">
						<!-- start 카드 -->
						<div class="card">
							<!-- start 카드 헤더 : 검색 -->
							<div class="card-header">
								<!-- start 검색 1행-->
								<div class="form-group row">
									<!-- 검색 : 업무진행 -->
									<label for="step" class="col-sm-1 col-form-label text-right"><strong>업무진행</strong></label>
									<div class="col-sm-2">
										<select name="approval" id="approval" class="form-control" aria-label="Default select example">
											<option value="">전체</option>
											<c:forEach var="resultReq" items="${resultReq}" varStatus="status">
												<option value="${resultReq.code}" ${resultReq.code == approval ? 'selected="selected"' : ''}>${resultReq.codeNm}</option>
											</c:forEach>
										</select>
									</div>

									<!-- 검색 : 마감기간(시작일) -->
									<label for="title" class="col-sm-1 col-form-label text-right"><strong>마감기간 </strong></label>
									<div class="col-sm-4 form-inline">
										<div class="form-group">
											<div class="input-group date mr-2" data-target-input="nearest">
												<input type="text" class="form-control datetimepicker-input" data-target="#startDt" id="startDt" name="startDt" />
												<div class="input-group-append" data-target="#startDt" data-toggle="datetimepicker">
													<div class="input-group-text">
														<i class="fa fa-calendar"></i>
													</div>
												</div>
											</div>
											~
											<!-- 검색 : 마감기간(최종일) -->
											<div class="input-group date ml-2" data-target-input="nearest">
												<input type="text" class="form-control datetimepicker-input" data-target="#endDt" id="endDt" name="endDt" />
												<div class="input-group-append" data-target="#endDt" data-toggle="datetimepicker">
													<div class="input-group-text">
														<i class="fa fa-calendar"></i>
													</div>
												</div>
											</div>
										</div>
									</div>

									<!-- 검색 : 업무담당자 -->
									<%-- <label for="manager" class="col-md-1 col-form-label text-right"><strong>담당자</strong></label>
				<div class="col-md-2">
					<select name="manager" id="manager" class="form-control">
						<option value="">전체</option>
						<c:forEach var="resultManager" items="${resultManager}" varStatus="status">
							<option value="${resultManager.codeNm}" ${resultManager.codeNm == manager ? 'selected="selected"' : ''}>${resultManager.codeNm}</option>
						</c:forEach>
					</select>
				</div>		 --%>
								</div>
								<!-- end 검색 1행 -->

								<!-- start 검색 2행 -->
								<div class="form-group row" style="margin-bottom: 0px;">
									<!-- 검색 : 업무구분 -->
									<label for="taskIdx" class="col-sm-1 col-form-label text-right"><strong>업무구분</strong></label>
									<div class="col-sm-2">
										<select name="taskIdx" id="taskIdx" class="form-control" onchang="">
											<option value="">전체</option>
											<c:forEach var="resultTas" items="${resultTas}" varStatus="status">
												<option value="${resultTas.code}" ${resultTas.code == taskIdx ? 'selected="selected"' : ''}>${resultTas.codeNm}</option>
											</c:forEach>
										</select>
									</div>

									<!-- 검색 : 제목 -->
									<label for="taskNm" class="col-sm-1 col-form-label text-right"><strong>제목+내용</strong></label>
									<div class="col-sm-4">
										<input type="text" class="form-control" name="taskNm" id="taskNm" maxlength=255 value="${taskNm }" placeholder="검색어를 입력하세요.">
									</div>
									<button id="btnSearch" type="submit" class="btn btn-primary">검색</button>
								</div>
								<!-- end 검색 2행 -->
							</div>
							<!-- end 검색 -->


							<!-- start 카드 바디 : 업무 목록 -->
							<div class="card-body">

								<!-- 업무 토탈 -->
								<div class="text-right mb-2 mt-2">
									<span class="ml-2"><i class="far fa-copy"></i>&nbsp;<strong>${total}</strong>개의 업무가 검색되었습니다.&nbsp;</span>
								</div>

								<!-- 테이블 -->
								<div class="table-responsive">
									<table class="table table-hover">
										<colgroup>
											<col style="width: 8%;">
											<col style="width: 8%;">
											<col style="width: 10%;">
											<col style="width: 12%;">
											<!-- 업무제목  -->
											<col style="width: 30%;">
											<col style="width: 10%;">
											<col style="width: 8%;">
											<col style="width: 16%;">
										</colgroup>
										
										<thead>
											<tr>
												<th class="text-center">업무ID</th>
												<th class="text-center">긴급여부</th>
												<th class="text-center">진행상태</th>
												<th>업무구분</th>
												<th>업무제목</th>
												<th class="text-center">담당자(ID)</th>
												<th class="text-center">첨부파일</th>
												<th class="text-center">마감일시</th>
											</tr>
										</thead>

										<tbody>
											<c:set var="total" value="${total }" />
											<c:forEach var="result" items="${resultWorkList }" varStatus="status">
												<tr>
													<!-- 순번 -->
													<%-- <td><c:set var="cnt" value="${status.index }" />${total - cnt}</td> --%>
													<!-- 업무ID -->
													<td class="text-center">${result.taskId }</td>
													<!-- 긴급여부 -->
													<td class="text-center">${result.urgent }</td>
													<!-- 진행상태 -->
													<td class="text-center">${result.reqNm }</td>
													<!-- 업무구분 -->
													<td align="left">${result.tasNm }</td>
													<!-- 업무제목 -->
													<td align="left"><c:choose>
															<c:when test="${result.approval == 'REQ030' or result.approval == 'REQ050'}">
																<a href="workDetailOrg.do?taskId=${result.taskId}&mode=view">${result.taskNm }</a>
															</c:when>
															<c:when test="${result.approval == 'REQ010' or result.approval == 'REQ020' or result.approval == 'REQ040'}">
																<a href="workDetailOrg.do?taskId=${result.taskId}&mode=mod"">${result.taskNm }</a>
															</c:when>
														</c:choose></td>
													<!-- 담당자 -->
													<td class="text-center">${result.userNm}(${result.manager })</td>
													<!-- 첨부파일 유무-->
													<td class="text-center">${result.atchYn }</td>
													<!-- 마감일시 -->
													<td class="text-center">${result.closeDt }&nbsp;${result.closeTm }</td>
												</tr>
											</c:forEach>
										</tbody>
									</table>
								</div>
							</div>
							<!-- end 카드 바디 : 업무 목록 -->

							<!-- start 페이징 -->
							<div class="card-footer">
								<!-- paging navigation -->
								<div class="pagination" style="height: 4vh;">
									<ul class="pagination justify-content-center" style="width: 100%;">
										<ui:pagination paginationInfo="${paginationInfo}" type="image" jsFunction="linkPage" />
									</ul>
								</div>
							</div>
							<!-- end 페이징 -->
						</div>
						<!-- end 카드 -->
						<input id="myOrgId" name="myOrgId" type="hidden" value="${loginVO.psitnstCode}" />
					</form>
					<!-- end 폼 -->
				</div>
				<!-- end 메인 컨테이너 -->
			</div>
			<!-- end content -->
		</div>
		<!-- end content-wrapper -->
	</div>
	<!-- end wrapper -->

	<!-- Modal & Script-->
	<%@ include file="../modal/common.jsp"%>

	<!-- script 호출 -->
	<script src="<c:url value="/js/mapo/checkWork.js"/>"></script>
	<script>
		$(document).ready(function() {

			/* 왼쪽 메뉴 아이콘 활성화 */
			$("#menuWorkListOrg").addClass("active");

			var myOrgId = $("#myOrgId").val();

			/* 마감일자 설정 */
			var startDay = getStartDay();
			var endDay = getEndDay();

			$("#startDt").val(startDay);
			$("#endDt").val(endDay);

		});
		
		/* 페이징 */
		function linkPage(pageNo) {
			console.log("pageNo ---> " + pageNo)
			location.href = "<c:url value='/mapo/workListOrg.do'/>?pageIndex="
					+ pageNo
					+ "&startDt=${startDt}&endDt=${endDt}&taskNm=${taskNm}&taskIdx=${taskIdx}&manager=${manager}&approval=${approval}";
			/* 					"&startDt=${startDt}&endDt=${endDt}&taskNm=${taskNm}&taskIdx=${taskIdx}&manager=${manager}&approval=${approval}&orgId=${myOrgId}"; */
		};
	</script>

</body>
</html>
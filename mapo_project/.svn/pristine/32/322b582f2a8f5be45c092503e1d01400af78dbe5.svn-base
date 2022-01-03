<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%
pageContext.setAttribute("crcn", "\r\n"); // Space, Enter
pageContext.setAttribute("br", "<br/>"); // br 태그
%>
<%
/**
* @ Class Name 	: WorkDetailOrg.jsp
* @ Description 	: WorkDetailOrg 화면
* @ Modification Information
* @
* @  수정일             	 수정자              수정내용
* @ -----------  --------    ---------------------------
* @ 2021.10.06 	이도경              최초 생성
* @ 2021.10.06 	이도경              레이아웃 & 기능 구현
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

				<!-- Main Content -->
				<div class="container col-auto">
					<div class="row">
						<div class="col-sm-6">
							<p class="pageTitle">| 업무확인 상세</p>
						</div>
						<div class="col-sm-6 text-right mb-1">
							<span style="vertical-align: sub;">&nbsp;<i class="far fa-building"></i>&nbsp;${loginVO.psitnstCodeNm}&nbsp;&nbsp;
							</span>
						</div>
					</div>

					<div id="accordion">
						<div class="card">
							<div class="card-header" id="card-header">
								<div class="row">
									<div class="col-sm-8 text-left">
										<a class="card-link" data-toggle="collapse" href="#collapseOne"> <i class="far fa-file-alt"></i> <span id="workNm" name="workNm" class="text-primary">&nbsp;<strong>업무 ID : ${result.taskId} </strong>
										</span>
										</a>
									</div>
									<div class="col-sm-4 text-right">
										<a class="card-link" data-toggle="collapse" href="#collapseOne"> <i class="fas fa-chevron-down"></i>
										</a>
									</div>
								</div>
							</div>

							<div id="collapseOne" class="collapse show" data-parent="#accordion">
								<div class="card-body">
									<div class="table-responsive">
										<div class="fixed-table-container">
											<table class="table table-borderless">

												<colgroup>
													<col style="width:;">
													<col style="width:;">
												</colgroup>

												<tbody>
													<!-- 업무ID -->
													<%-- <tr>
								<th class="col-sm-2 line-bottom">업무ID</th>
								<td class="col-sm-10 line-bottom">${result.taskId}</td>
							</tr> --%>

													<!-- 업무제목 -->
													<tr>
														<th class="col-sm-1 line-bottom text-right">업무제목</th>
														<td class="col-sm-11 line-bottom"><strong>${result.taskNm}</strong></td>
													</tr>

													<!-- 마감기한 -->
													<tr>
														<th class="col-sm-1 line-bottom text-right">마감기한</th>
														<td class="col-sm-11 line-bottom">${result.closeDt}&nbsp;${result.closeTm}</td>
													</tr>

													<!-- 업무내용 -->
													<tr>
														<th class="col-sm-1 line-bottom text-right">업무내용</th>
														<td class="col-sm-11 line-bottom">${result.taskContents}</td>
													</tr>

													<!-- 업무구분 -->
													<tr>
														<th class="col-sm-1 line-bottom text-right">업무구분</th>
														<td class="col-sm-11 line-bottom">${result.tasNm}</td>
													</tr>

													<!-- 담당자 -->
													<tr>
														<th class="col-sm-1 line-bottom text-right">담당자</th>
														<td class="col-sm-11 line-bottom">${result.manager }</td>
													</tr>

													<!-- 첨부파일 -->
													<c:if test="${not empty result.atchFileId}">
														<tr>
															<th class="col-sm-1 line-bottom text-right">첨부파일</th>
															<td class="col-sm-11 line-bottom"><c:import url="/cmm/fms/selectFileInfs.do" charEncoding="utf-8">
																	<c:param name="param_atchFileId" value="${result.atchFileId}" />
																</c:import></td>
														</tr>
													</c:if>

												</tbody>
											</table>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
					<br>

					<!-- 업무 항목 -->
					<%-- 	<form id="form1" name="form1" action="<c:url value='insertItemValue.do'/>" method="post"> --%>
					<%-- <form id="form1" name="form1" method="post"> --%>


					<div class="card">
						<div class="card-header">
							<!-- form 	 -->
							<div class="row">
								<div class="col-sm-6 align-self-center">
									<i class="fas fa-edit text-primary"></i> &nbsp;<span id="workNm" name="workNm" class="text-primary"><strong>항목</strong></span>
								</div>
								<div class="col-sm-6 text-right">

									<span id="workNm" name="workNm" class="text-primary"><strong>※&nbsp;${req.codeNm }된&nbsp;업무는 수정하실 수 없습니다.&nbsp;</strong></span>

									<button class="btn btn-primary" type="button" onclick="return itemValueSave()" disabled>저장</button>
									<button class="btn btn-secondary" type="button" onclick="return approval()" disabled>승인요청</button>
									<!-- <button class="btn btn-success" type="button" onclick="return approval()" disabled>승인요청</button> -->
								</div>
								<!-- END: button -->

							</div>
							<!-- END: row -->
						</div>
						<!-- END: card-header -->

						<div class="card-body">

							<div class="table-responsive">
								<div class="fixed-table-container">
									<table class="table table-borderless">

										<%-- <colgroup>
							<col style="width:;">
						</colgroup> --%>

										<thead>
											<!-- 업무제목 -->
											<tr>
												<th class="col-sm-1 line-bottom text-center">항목</th>
												<th class="col-sm-4 line-bottom">항목명</th>
												<th class="col-sm-4 line-bottom">입력</th>
												<th class="col-sm-3 line-bottom">도움말</th>
											</tr>
										</thead>

										<tbody>
											<c:forEach items="${list}" var="result2" varStatus="status">
												<tr>

													<!-- 업무 아이템 id -->
													<td class="col-sm-1 line-bottom text-center">${result2.itemId}</td>
													<input id="itemId" name="itemId" type="hidden" value='${result2.itemId}'>

													<!-- 업무항목 LIST : 항목명 -->
													<td class="col-sm-4 line-bottom"><strong>${result2.itemNm }</strong></td>


													<!-- 업무항목 LIST : 항목값 입력 -->
													<td class="col-sm-4 line-bottom"><c:choose>
															<c:when test="${result2.textYn == 'N' and !empty result2.itemValue}">
																<%-- 										<c:when test="${result2.textYn == 'N' and result2.itemValue != null}"> --%>
																<input type="number" class="form-control" name="itemValue" id="itemValue" maxlength=255 value="${result2.itemValue}" onKeyup="this.value=this.value.replace(/[^0-9]/g,'');" " disabled></input>
															</c:when>
															<c:when test="${result2.textYn == 'N' and empty result2.itemValue}">
																<%-- 										<c:when test="${result2.textYn == 'N' and result2.itemValue == null}"> --%>
																<input type="number" class="form-control" name="itemValue" id="itemValue" maxlength=255 placeholder="" onKeyup="this.value=this.value.replace(/[^0-9]/g,'');" " disabled></input>
															</c:when>
															<c:when test="${result2.textYn == 'Y' and !empty result2.itemValue}">
																<input type="text" class="form-control" name="itemValue" id="itemValue" maxlength=255 value="${result2.itemValue}" disabled></input>
															</c:when>
															<c:when test="${result2.textYn == 'Y' and empty result2.itemValue}">
																<input type="text" class="form-control" name="itemValue" id="itemValue" maxlength=255 value="" placeholder="" disabled></input>
															</c:when>
														</c:choose></td>

													<!-- 업무항목 LIST : 도움말 -->
													<td class="col-sm-3 line-bottom" align="left">${result2.itemDetail }</td>
												</tr>
											</c:forEach>
										</tbody>

									</table>
								</div>

								<input id="tempId" name="tempId" type="hidden" value='${result.taskId}' /> <input id="myOrgId" name="myOrgId" type="hidden" value='${loginVO.psitnstCode}' /> <input id="orgId" name="orgId" type="hidden" value='${loginVO.psitnstCode}' /> <input id="updateId" name="updateId" type="hidden" value='${loginVO.id}' />
								<%-- </form> --%>
							</div>
						</div>
					</div>

					<br>

				</div>
			</div>
		</div>
	</div>
	<!--  Wrapper -->

	<!-- Modal & Script-->
	<%@ include file="../modal/common.jsp"%>

	<!-- script 호출 -->
	<script type="text/javascript">
		$(document).ready(function() {
			var taskId = $("#taskId").val();
			var myOrgId = $("#myOrgId").val();
			console.log("++++++++++ myOrgId ++++++++++ : " + myOrgId);

		});
	</script>
	
</body>
</html>
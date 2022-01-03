<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%
 /**
  * @ Class Name 	: WorkDetail.jsp
  * @ Description 	: WorkDetail 화면
  * @ Modification Information
  * @
  * @  수정일             	 수정자              수정내용
  * @ -----------  --------    ---------------------------
  * @ 2021.09.08 	이도경              최초 생성
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
<link rel="stylesheet" href="<c:url value="/css/bootstrapthema/css/sb-admin-2.min.css"/>">

<!-- 공통 CSS 호출 -->
<link rel="stylesheet" href="<c:url value="/css/mapo/custom.css"/>">

<!-- Font-Awesome 5 호출 -->
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.8.2/css/all.min.css" />

<!-- favicon -->
<link rel="shortcut icon" type="image/x-icon" href="<c:url value="/css/mapo/favicon.ico"/>">

</head>

<style>
.row {
	margin: 10px;
}
</style>

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
					<p class="pageTitle">| 업무상세 ${result.itemNm }</p>

					<br>

					<div class="card">

						<%-- <div class="card-header">
					<!-- 업무제목 -->
						<h4>${result.taskId }.　${result.taskNm}</h4>
						</div> --%>

						<div class="card-body">

							<div class="table-responsive">
								<div class="fixed-table-container">
									<table class="table table-borderless">

										<colgroup>
											<col style="width:;">
											<col style="width:;">
										</colgroup>

										<tbody>
											<!-- 업무제목 -->
											<tr>
												<th class="col-sm-2 line-bottom">업무제목</th>
												<th class="col-sm-10 line-bottom">${result.taskNm}</th>
											</tr>

											<!-- 마감기한 -->
											<tr>
												<th class="col-sm-2 line-bottom">마감기한</th>
												<td class="col-sm-10 line-bottom">${result.closeDt}　${result.closeTm}</td>
											</tr>

											<!-- 업무내용 -->
											<tr>
												<th class="col-sm-2 line-bottom">업무내용</th>
												<td class="col-sm-10 line-bottom">${result.taskContents}</td>
											</tr>

											<!-- 업무구분 -->
											<tr>
												<th class="col-sm-2 line-bottom">업무구분</th>
												<td class="col-sm-10 line-bottom">${result.tasNm}</td>
											</tr>

											<!-- 담당자 -->
											<tr>
												<th class="col-sm-2 line-bottom">담당자</th>
												<td class="col-sm-10 line-bottom">${result.manager }</td>
											</tr>

											<!-- 첨부파일 -->
											<tr>
												<th class="col-sm-2 line-bottom">첨부파일</th>
												<td class="col-sm-10 line-bottom"></td>
											</tr>

										</tbody>
									</table>
								</div>
							</div>
						</div>
					</div>

					<br>

					<!-- 업무 항목 -->
					<div class="card">

						<div class="card-header">
							<!-- form 	 -->
							<div class="row">
								<div class="col-sm-6 align-self-center">
									<strong>항목 입력</strong>
								</div>
								<div class="col-sm-6 text-right">
									<!-- <button class="btn btn-primary" type="button">초기화</button> -->
									<button class="btn btn-primary" type="submit" id="fn_submit">저장</button>
									<button class="btn btn-success" type="button">승인요청</button>
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
											<col style="width:;">
										</colgroup> --%>

										<thead>
											<!-- 업무제목 -->
											<tr align="center">
												<th class="col-sm-1 line-bottom">번호</th>
												<th class="col-sm-3 line-bottom">항목제목</th>
												<th class="col-sm-4 line-bottom">입력</th>
												<th class="col-sm-4 line-bottom">도움말</th>

											</tr>
										</thead>

										<tbody>
											<c:forEach items="${list}" var="result" varStatus="status">
												<tr align="center">
													<!-- 항목 LIST : 번호 -->
													<td class="col-sm-1 line-bottom">${status.count }</td>
													<!-- 항목 LIST : 항목제목 -->
													<td class="col-sm-3 line-bottom" align="right"><strong>${result.itemNm }</strong></td>
													<!-- 항목 LIST : 입력 -->
													<td class="col-sm-4 line-bottom"><c:if test="${result.textYn == 'N'}">
															<input type="number" class="form-control" name="itemValue" id="itemValue" maxlength=255 value="" placeholder="숫자만 입력하세요." onKeyup="this.value=this.value.replace(/[^0-9]/g,'');""></input>
														</c:if> <c:if test="${result.textYn == 'Y'}">
															<input type="text" class="form-control" name="itemValue" id="itemValue" maxlength=255 value="" placeholder="문자를 입력하세요."></input>
														</c:if></td>
													<!-- 항목 LIST : 도움말 -->
													<td class="col-sm-4 line-bottom" align="left">${result.itemDetail }</td>
											</c:forEach>


										</tbody>

									</table>
								</div>
								</form>
							</div>
						</div>
					</div>
					<br>

					<!-- 					<script>
					
					function onlyNumber(event){
					    event = event || window.event;
					    var keyID = (event.which) ? event.which : event.keyCode;
					    if ( (keyID >= 48 && keyID <= 57) || (keyID >= 96 && keyID <= 105) || keyID == 8 || keyID == 46 || keyID == 37 || keyID == 39 ) 
					        return;
					    else
					        return false;
					}
					 
					function removeChar(event) {
					    event = event || window.event;
					    var keyID = (event.which) ? event.which : event.keyCode;
					    if ( keyID == 8 || keyID == 46 || keyID == 37 || keyID == 39 ) 
					        return;
					    else
					        event.target.value = event.target.value.replace(/[^0-9]/g, "");
					}

					</script> -->


					<div class="card-footer">
						<!-- 하단 버튼 -->
						<!--  End Card -->

						<br>

					</div>
				</div>
			</div>
		</div>
	</div>

	<!-- Modal & Script-->
	<%@ include file="../modal/common.jsp"%>
	<script>

	</script>

	<!-- script 호출 -->
</body>

</html>
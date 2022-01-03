<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	/**
* @ Class Name 	: MapoMainContent.jsp
* @ Description 	: MapoMainContent 화면
* @ Modification Information
* @
* @  수정일             	 수정자              수정내용
* @ -----------  --------    ---------------------------
* @ 2021.08.23 	서지혜	  	최초 생성
* @ 2021.10.08 	이도경             	레이아웃 수정
* @ 2021.10.15 	이도경             	게시판 미리보기 기능 추가
* 
*/
%>


<!-- Begin Page Content -->
<!-- <div class="container-fluid"> -->

<!-- container -->
<!-- <div class="container"> -->

<!-- 메인 컨테이너  -->
<div class="container col-auto">
	<!-- 업무 검색 -->
	<!-- <p class="pageTitle">| 마포구청 노인장애인과 업무 사이트</p> -->
	<!-- 로고 센터 -->
	<%-- img src="<c:url value='/images/mapo/com/be_logo.svg'/>" alt="login title image" title="login title image" style="display: block; margin: 0 auto; "/> --%>

	<!-- 로고 -->
	<%-- <img src="<c:url value='/images/mapo/com/be_logo.svg'/>" alt="login title image" title="login title image" style="margin-bottom: 4px; width: 80px; heigt: auto;" /> --%>

	<!-- <div class="card"> -->

	<!-- <div class="card shadow h-100 py-2"> -->
	<!-- <div class="card border-left-primary shadow h-100 py-2" > -->

	<!-- <div class="card-body" style="height: 45vh;"> -->

	<!-- <div class="row no-gutters align-items-left">
					<img src="<c:url value='/images/mapo/com/be_logo.svg'/>" alt="login title image" title="login title image" class="ml-1" style="width: 6%; height: 5%;">
				</div> -->
	<!-- carousel : 메인 이미지-->
	<!-- <div id="carouselExampleIndicators" class="carousel slide" data-ride="carousel" style="height:45vh;"> -->
	<div id="carouselExampleIndicators" class="carousel slide" data-ride="carousel">
		<ol class="carousel-indicators">
			<li data-target="#carouselExampleIndicators" data-slide-to="0" style="background-color: powderblue;" class="active"></li>
			<li data-target="#carouselExampleIndicators" data-slide-to="1" style="background-color: powderblue;"></li>
			<li data-target="#carouselExampleIndicators" data-slide-to="2" style="background-color: powderblue;"></li>
		</ol>

		<div class="carousel-inner">
			<!-- <div class="carousel-inner" style="height:45vh;"> -->
			<div class="carousel-item active">
				<img src="../images/mapo/com/be_main_blue.png" class="d-block w-100" alt="...">
			</div>
			<div class="carousel-item">
				<img src="../images/mapo/com/be_main_yellow.png" class="d-block w-100" alt="...">
			</div>
			<div class="carousel-item">
				<img src="../images/mapo/com/be_main_green.png" class="d-block w-100" alt="...">
			</div>
		</div>

		<a class="carousel-control-prev" href="#carouselExampleIndicators" role="button" data-slide="prev"> <span class="carousel-control-prev-icon" aria-hidden="true"></span> <span class="sr-only">Previous</span>
		</a> <a class="carousel-control-next" href="#carouselExampleIndicators" role="button" data-slide="next"> <span class="carousel-control-next-icon" aria-hidden="true"></span> <span class="sr-only">Next</span>
		</a>
	</div>
	<!-- </div> -->
	<!-- </div> -->
	<!-- </div> -->

	<br>

	<!-- 업무 미리보기 : 마포구청 -->
	<c:if test="${loginVO.groupId == 'GROUP_00000000000000'}">
		<div class="form-group row">
			<div class="col-xl-6 col-md-6 mb-4">
				<div class="card border-left-primary shadow h-100 py-2">
					<div class="card-body ">
						<div class="row no-gutters align-items-center">
							<div class="col mr-2">
								<a href="AddWorkDetail.do?taskId=${result.taskId}&mode=view">${result.taskNm }</a>
								
								<!-- 업무 미리보기 : 업무생성확인-->
								<div class="row">
									<div class="col-sm-8 text-left" style="margin-bottom:10px">
										<a class="card-link" href="workList.do">&nbsp;<i class="fas fa-tasks fa-1x text-gray-500"></i> <span id="workList" name="workList" class="font-weight-bold text-primary text-uppercase mb-1">&nbsp;&nbsp;<strong>업무생성확인</strong>
										</span>
										</a>
									</div>
								</div>

								<div class="table-responsive">
									<table class="table table-hover">
										<colgroup>
											<col style="width: 20%;">
											<col style="width: 50%;">
											<col style="width: 30%;">
										</colgroup>
										<thead>
											<tr class="text-left">
												<th class="text-center">업무ID</th>
												<th class="text-left">업무제목</th>
												<th class="text-center">진행상태</th>
											</tr>
										</thead>

										<tbody>
											<c:set var="total" value="${total }" />
											<c:forEach var="result" items="${workList }" varStatus="status" begin="0" end="4" step="1">
												<tr align="left">
													<!-- 업무ID -->
													<td class="text-center">${result.taskId }</td>
													<!-- 업무제목 -->
													<td class="text-left"><a href="AddWorkDetail.do?taskId=${result.taskId}&mode=view">${result.taskNm }</a></td>
													<!-- 진행상태 -->
													<td class="text-center">${result.steNm }</td>
												</tr>
											</c:forEach>
										</tbody>
									</table>
								</div>

								<!-- 더보기 start -->
								<div class="row">
									<div class="col-sm-12 text-right">
										<a class="card-link" href="workList.do">
											<div class="h6 mb-0 font-weight-bold text-gray-800">
												<strong>더보기</strong>
											</div>
										</a>
									</div>
								</div>
								<!-- 더보기 end -->

							</div>
						</div>
					</div>
				</div>
			</div>

			<!-- 업무 미리보기 : 업무배포결과-->
			<div class="col-xl-6 col-md-6 mb-4">
				<div class="card border-left-success shadow h-100 py-2">
					<div class="card-body ">
						<div class="row no-gutters align-items-center">
							<div class="col mr-2">

								<!-- 업무배포결과 미리보기 -->
								<div class="row">
									<div class="col-sm-8 text-left" style="margin-bottom:10px">
										<a class="card-link" href="workResult.do">&nbsp;<i class="fas fa-poll-h text-gray-500"></i> <span id="workResult" name="workResult" class="font-weight-bold text-primary text-uppercase mb-1">&nbsp;&nbsp;<strong>업무배포결과</strong>
										</span>
										</a>
									</div>
								</div>

								<div class="table-responsive">
									<table class="table table-hover">
										<colgroup>
											<col style="width: 20%;">
											<col style="width: 50%;">
											<col style="width: 30%;">
										</colgroup>
										<thead>
											<tr>
												<th class="text-center">업무ID</th>
												<th class="text-left">업무제목</th>
												<th class="text-center">마감기한</th>
											</tr>
										</thead>

										<tbody>
											<c:set var="total" value="${total }" />
											<c:forEach var="result" items="${resultList }" varStatus="status" begin="0" end="4" step="1">

												<tr class="text-left">
													<!-- 업무ID -->
													<td class="text-center">${result.taskId }</td>
													<!-- 업무제목 -->
													<td class="text-left"><a href="workResultDetail.do?taskId=${result.taskId}&mode=view">${result.taskNm }</a></td>
													<!-- 진행상태 -->
													<td class="text-center">${result.closeDt }</td>
												</tr>
											</c:forEach>
										</tbody>
									</table>
								</div>

								<!-- 더보기 start -->
								<div class="row">
									<div class="col-sm-12 text-right">
										<a class="card-link" href="workResult.do">
											<div class="h6 mb-0 font-weight-bold text-gray-800">
												<strong>더보기</strong>
											</div>
										</a>
									</div>
								</div>
								<!-- 더보기 end -->

							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</c:if>
	<!-- END: row -->

	<!-- 업무 미리보기 : 복지시설-->

	<c:if test="${loginVO.groupId == 'GROUP_00000000000001'}">
		<div class="form-group row">
			<div class="col-xl-6 col-md-6 mb-4">
				<div class="card border-left-primary shadow h-100 py-2">
					<div class="card-body ">
						<div class="row no-gutters align-items-center">
							<div class="col mr-2">
								<a href="AddWorkDetail.do?taskId=${result.taskId}&mode=view">${result.taskNm }</a>
								
								<!-- 업무 미리보기 : 업무생성확인-->
								<div class="row">
									<div class="col-sm-8 text-left" style="margin-bottom:10px">
										<a class="card-link" href="workListOrg.do">&nbsp;<i class="far fa-copy text-gray-600"></i><span id="workListOrg.do" name="workListOrg.do" class="font-weight-bold text-primary text-uppercase mb-1">&nbsp;&nbsp;<strong>업무확인</strong>
										</span>
										</a>
									</div>
								</div>

								<div class="table-responsive">
									<table class="table table-hover">
										<colgroup>
											<col style="width: 20%;">
											<col style="width: 50%;">
											<col style="width: 30%;">
										</colgroup>
										<thead>
											<tr class="text-left">
												<th class="text-center">업무ID</th>
												<th class="text-left">업무제목</th>
												<th class="text-center">진행상태</th>
											</tr>
										</thead>

										<tbody>
											<c:set var="total" value="${total }" />
											<c:forEach var="result" items="${workListOrg }" varStatus="status" begin="0" end="4" step="1">
												<tr align="left">
													<!-- 업무ID -->
													<td class="text-center">${result.taskId}</td>
													<!-- 업무제목 -->
													<td align="left"><c:choose>
															<c:when test="${result.approval == 'REQ030' or result.approval == 'REQ050'}">
																<a href="workDetailOrg.do?taskId=${result.taskId}&mode=view">${result.taskNm }</a>
															</c:when>
															<c:when test="${result.approval == 'REQ010' or result.approval == 'REQ020' or result.approval == 'REQ040'}">
																<a href="workDetailOrg.do?taskId=${result.taskId}&mode=mod"">${result.taskNm }</a>
															</c:when>
														</c:choose></td>
													<!-- 진행상태 -->
													<td class="text-center">${result.reqNm}</td>
												</tr>
											</c:forEach>
										</tbody>
									</table>
								</div>

								<!-- 더보기 start -->
								<div class="row">
									<div class="col-sm-12 text-right">
										<a class="card-link" href="workListOrg.do">
											<div class="h6 mb-0 font-weight-bold text-gray-800">
												<strong>더보기</strong>
											</div>
										</a>
									</div>
								</div>
								<!-- 더보기 end -->

							</div>
						</div>
					</div>
				</div>
			</div>

			<!-- 업무 미리보기 : FAQ-->
			<div class="col-xl-6 col-md-6 mb-4">
				<div class="card border-left-warning shadow h-100 py-2">
					<div class="card-body ">
						<div class="row no-gutters align-items-center">
							<div class="col mr-2">

								<!-- FAQ 미리보기 -->
								<div class="row">
									<div class="col-sm-8 text-left" style="margin-bottom:10px">
										<a class="card-link" href="selectFaqList.do">&nbsp;<i class="fas fa-info-circle text-gray-500"></i><span id="faqList" name="faqList" class="font-weight-bold text-primary text-uppercase mb-1">&nbsp;&nbsp;FAQ </span>
										</a>
									</div>
								</div>								

								<div class="table-responsive">
									<table class="table table-hover">
										<colgroup>
											<col style="width: 20%;">
											<col style="width: 50%;">
											<col style="width: 30%;">
										</colgroup>
										<thead>
											<tr>
												<th class="text-center">번호</th>
												<th class="text-left">질문제목</th>
												<th class="text-center">등록일</th>
											</tr>
										</thead>

										<tbody>
											<c:set var="total" value="${total }" />
											<c:forEach var="result" items="${faqList }" varStatus="status" begin="0" end="4" step="1">

												<tr class="text-left">
													<!-- 번호 -->
													<%-- <td class="text-left">${result.faqId }</td> --%>
													<td class="text-center"><c:out value="${(searchVO.pageIndex-1) * searchVO.pageSize + status.count}" /></td>

													<!-- 질문제목 -->
													<%-- <td class="text-left"><a href="workResultDetail.do?taskId=${result.taskId}&mode=view">${result.taskNm }</a></td> --%>
													<td class="text-left"><a href="<c:url value='selectFaqDetail.do?faqId=${result.faqId}'/>">${result.qestnSj }</a></td>
													<!-- 등록일 -->
													<td class="text-center">${result.frstRegisterPnttm}</td>
													<!-- 최종수정일 -->
													<%-- <td class="text-center">${result.lastUpdusrPnttm}</td> --%>
												</tr>
											</c:forEach>
										</tbody>
									</table>
								</div>

								<!-- 더보기 start -->
								<div class="row">
									<div class="col-sm-12 text-right">
										<a class="card-link" href="selectFaqList.do">
											<div class="h6 mb-0 font-weight-bold text-gray-800">
												<strong>더보기</strong>
											</div>
										</a>
									</div>
								</div>
								<!-- 더보기 end -->

							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</c:if>
	<!-- END: row -->



</div>
<!-- /.container-fluid -->
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%
	/**
* @ Class Name 	: OrgList.jsp
* @ Description 	: OrgList 화면
* @ Modification Information
* @
* @  수정일             	 수정자              수정내용
* @ -----------  --------    ---------------------------
* @ 2021.09.03 	서지혜              최초 생성
* @ 2021.09.13		이은영		레이아웃 & 기능 개발
* @ 2021.10.20		이도경		레이아웃 수정
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
<link rel="stylesheet" href="<c:url value="/css/bootstrapthema/css/sb-admin-2.min.css"/>">

<!-- 공통 CSS 호출 -->
<link rel="stylesheet" href="<c:url value="/css/mapo/custom.css"/>">

<!-- Font-Awesome 5 호출 -->
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.8.2/css/all.css" />

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
							<p class="pageTitle">| 복지시설 관리</p>
						</div>
						<div class="col-sm-6 text-right mt-2">
							<a href="<c:url value='/mapo/orgInsertView.do' />" class="btn btn-primary text-right" title="" style="margin-bottom:10px"/>신규등록</a>

						</div>
					</div>

					<form name="orgListForm" id="orgListForm" class="orgListForm" action="<c:url value='/mapo/orgList.do'/>" method="post">
						<div class="card">
							<div class="card-header">

								<!-- 검색 : 시설 선택 -->
								<div class="form-group row">
									<label for="org1" class="col-sm-1 col-form-label text-right"><strong>시설분류</strong></label>
									<div class="col-sm-2">
										<!-- 1차 분류 선택 -->
										<select name="org1" id="org1" class="form-control">
											<!--  onchange="setOrg('org1', this.value)" -->
											<option value="">선택</option>
											<c:forEach var="orgResult1" items="${resultDepth1}" varStatus="status">
												<option value="${orgResult1.clCode}"${orgResult1.clCode == org1 ? 'selected="selected"' : ''}">${orgResult1.clCodeNm}</option>
											</c:forEach>
										</select>
									</div>
									<div class="col-sm-2">
										<select name="org2" id="org2" class="form-control">
											<option  value="">
												<c:choose>
													<c:when test="${empty org2Nm}">
														선택
													</c:when>
													<c:otherwise>
														${org2Nm }
													</c:otherwise>
												</c:choose>
											</option>
										</select>
									</div>
									<div class="col-sm-2">
										<select name="org3" id="org3" class="form-control">
											<option value="">
												<c:choose>
													<c:when test="${empty org3Nm}">
														선택
													</c:when>
													<c:otherwise>
														${org3Nm }
													</c:otherwise>
												</c:choose>
											</option>
										</select>
									</div>
									<div class="col-sm-2">
										<select name="org4" id="org4" class="form-control">
											<option value="">
												<c:choose>
													<c:when test="${empty org4Nm}">
														선택
													</c:when>
													<c:otherwise>
														${org4Nm }
													</c:otherwise>
												</c:choose>
											</option>
										</select>
									</div>
								</div>
								
								<!-- 검색 : 시설 조회 버튼 -->
								<div class="form-group row" style="margin-bottom: 0px;">
									<label for="taskNm" class="col-sm-1 col-form-label text-right"><strong>시설명</strong></label>
									<div class="col-sm-4">
										<input type="text" class="form-control" name="searchOrg" id="searchOrg" maxlength=255 value="${searchOrg}" placeholder="검색어를 입력하세요.">
									</div>
									<button id="btnSearch" type="submit" class="btn btn-primary" style="margin-left: 8px;">검색</button>
								</div>
							</div>
							<!-- card-header -->

							<div class="card-body" style = "padding-top:0px; padding-bottom:0px;">
								<!-- 업무 total -->
								<div class="text-right mb-2 mt-2">
									<span class="ml-2"><i class="far fa-building"></i>&nbsp;<strong>${orgTotal}</strong>개의 복지시설이 검색되었습니다.&nbsp;</span>
								</div>
								<div class="table-responsive">
									<!-- 목록영역 -->
									<table class="table table-hover mt-1">

										<colgroup>
											<col style="width: 10%;">
											<col style="width: 30%;">
											<col style="width: 20%;">
											<col style="width: 20%;">
											<col style="width: 20%;">
										</colgroup>
										<thead>
											<tr>
												<th class="text-center">시설ID</th>
												<th>시설명</th>
												<th>시설 대분류</th>
												<th>시설 중분류</th>
												<th>시설 소분류</th>
											</tr>
										</thead>

										<tbody>
											<c:set var="total" value="${orgTotal}" />
											<c:forEach var="result" items="${resultOrgList }" varStatus="status">
												<tr>
													<%-- <td><c:set var="cnt" value="${status.index }" />${orgTotal - cnt}</td> --%>
													<td align="center">${result.orgId }</a></td>
													<%-- 	<td>
														<input type="checkbox" name="checkField"  class="chk" value="<c:out value='${result.orgId }'/>" />
														<input type="hidden" name="delUserid"  class="delUserid" />
													</td> --%>
													<td align="left"><a href="<c:url value='/mapo/orgDetail.do?orgId=${result.orgId} ' />">${result.orgNm }</a></td>
													<td>${result.clCodeNm }</td>
													<td>${result.codeIdNm }</td>
													<td>${result.codeNm }</td>

													<%-- <td>${result.insertDt }</td> --%>
												</tr>
											</c:forEach>
										</tbody>
									</table>
								</div>
							</div>
							<!-- 페이징 처리 -->
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

						<br>

					</form>
				</div>
				<!-- END Main Content -->
			</div>
			<!-- END Content Wrapper-->
		</div>
	</div>

	<!-- Modal & Script-->
	<%@ include file="../modal/common.jsp"%>

	<script type="text/javascript">
		$(document).ready(function() {

			// 왼쪽 메뉴 아이콘 활성화
			$("#menuOrg").addClass("active");
		});

		/*********************************************
		 * 전체 선택 (모두 체크)
		 *********************************************/
		function fncCheckAll() {
			var checkField = document.orgListForm.checkField;
			if (document.orgListForm.checkAll.checked) {
				if (checkField) {
					if (checkField.length > 1) {
						for (var i = 0; i < checkField.length; i++) {
							checkField[i].checked = true;
						}
					} else {
						checkField.checked = true;
					}
				}
			} else {
				if (checkField) {
					if (checkField.length > 1) {
						for (var j = 0; j < checkField.length; j++) {
							checkField[j].checked = false;
						}
					} else {
						checkField.checked = false;
					}
				}
			}
		}

		/*********************************************
		 * 선택 삭제
		 *********************************************/
		function deleteBtn() {
			if (!confirm("삭제하시겠습니까?")) {
				return false;
			}

			var userid = "";
			var idCheck = document.getElementsByName("checkField");
			var chked = false;
			var indexid = false;

			for (i = 0; i < idCheck.length; i++) {
				if (idCheck[i].checked) {
					if (indexid) {
						userid = userid + '-';
					}
					userid = userid + idCheck[i].value; //147-123-122-121-120-....체크된 값 꺼내오기
					indexid = true;
				}
			}
			if (!indexid) {
				alert("삭제할 ID를 체크해 주세요");
				return;
			}
			var delOrgID = document.orgListForm.delUserid.value;
			//체크된 사용자 아이디를 '-'로 묶은 userid를 위의 value로 저장
			delOrgID = userid;

			console.log("체크된 delUserID---->" + delOrgID);

			var agree = confirm("삭제 하시겠습니까?");
			if (agree) {
				document.orgListForm.submit();

				$.ajax({
					type : "POST",
					data : {
						"delOrgID" : delOrgID
					}, //json설정
					url : "orgDelete.do",
					dataType : "text", //리턴 타입
					success : function(result) { //Controller에서 매개변수로 값이 넘어옴
						console.log(result);
						if (result == "1") {
							alert("정상적으로 삭제되었습니다.");
							location = "boardList.do";
						} else if (result == "-1") {
							alert("암호가 일치하지 않습니다.")
						} else {
							alert("삭제 실패\n관리자에게 연락해주세요.")

						}
					},
					error : function() { // 장애발생
						alert("오류발생");
					}
				});

			}

		}

		/* 기관 : 대분류 선택 */
		$("#org1").change(function() {

			$("#org2, #org3, #org4").find('option').each(function() {
				$(this).remove();
			});

			$("#org2, #org3, #org4").append("<option value=''>선택</option>");

			var selectVal = $(this).val();
			console.log("org1 value ----> " + selectVal);

			getOrgList("org1", selectVal);
		});

		/* 기관 : 중분류 선택 */
		$("#org2").change(function() {

			$("#org3, #org4").find('option').each(function() {
				$(this).remove();
			});

			$("#org3, #org4").append("<option value=''>선택</option>");

			var selectVal = $(this).val();
			console.log("org2 value ----> " + selectVal);

			getOrgList("org2", selectVal);
		});

		/* 기관 : 소분류 선택 */
		$("#org3").change(function() {

			$("#org4").find('option').each(function() {
				$(this).remove();
			});

			$("#org4").append("<option value=''>선택</option>");

			var selectVal = $(this).val();
			console.log("org3 value ----> " + selectVal);

			getOrgList("org3", selectVal);
		});

		/*************************************
		 * 기관 선택 후 리스트 조회 및 설정
		 *************************************/
		function getOrgList(mode, selectVal) {

			var url = "<c:url value='/mapo/selectOrg.do'/>?mode=" + mode;

			if (selectVal != "") {

				$.ajax({
							type : "POST",
							data : {
								"code" : selectVal
							},
							url : url,
							dataType : "json", // 리턴타입
							success : function(data) { // controller 

								console.log("data.result.length : "+ data.result.length);
								console.log("org2 select value : "+ $('#org2 option:selected').val()); //a020
								console.log("org3 select value : "+ $('#org3 option:selected').val()); //a020
								console.log("org4 select value : "+ $('#org4 option:selected').val()); //a020
								
								var org2 = $('#org2 option:selected').val();

								if (data.result.length > 0) {
									for (var i = 0; i < data.result.length; i++) {
										if (mode == "org1") {

											$("#org2")
													.append(
															"<option value='" + data.result[i]['codeId'] + "'>"
																	+ data.result[i]['codeIdNm']
																	+ "</option>");

										} else if (mode == "org2") {
											$("#org3")
													.append(
															"<option value='" + data.result[i]['code'] + "'>"
																	+ data.result[i]['codeNm']
																	+ "</option>");

										} else if (mode == "org3") {
											$("#org4")
													.append(
															"<option value='" + data.result[i]['orgId'] + "'>"
																	+ data.result[i]['orgNm']
																	+ "</option>");
										}
									}

								} else {

									if (mode == "org1") {

										$("#org2").find('option').remove();
										$("#org2").append(
												"<option value=''>선택</option>");

									} else if (mode == "org2") {

										$("#org3").find('option').remove();
										$("#org3").append(
												"<option value=''>선택</option>");

									} else if (mode == "org3") {

										$("#org4").find('option').remove();
										$("#org4").append(
												"<option value=''>선택</option>");
									}
								}
							}
						});
			}
		}
		
	
		

		/*********************************************
		 * 시설  검색
		 *********************************************/

		/* function btnSearch(){
			 $("#org2").find('option').each(function(){
					console.log("--- org1 value ----" + $(this).val())
					if($(this).val() != null){
						$(this).attr("selected","selected");
					}
				});
			 $("#org3").find('option').each(function(){
					console.log("--- org1 value ----" + $(this).val())
					if($(this).val() != null){
						$(this).prop("selected","selected");
					}
				});
			 $("#org4").find('option').each(function(){
					console.log("--- org1 value ----" + $(this).val())
					if($(this).val() != null){
						$(this).attr("selected","selected");
					}
				});
		 } */
		function linkPage(pageNo) {
			console.log("pageNo ---> " + pageNo)

			var searchOrg = $('#searchOrg').val();
			var selectLc = $('#selectLc option:selected').val();
			var selectMc = $('#selectMc option:selected').val();
			var selectSc = $('#selectSc option:selected').val();
			var selectOrgName = $('#selectOrgName option:selected').val();
			
			var org1 = $('#org1 option:selected').val();
			var org2 = $('#org2 option:selected').val();
			var org3 = $('#org3 option:selected').val();
			var org4 = $('#org4 option:selected').val();

			var url = "<c:url value='/mapo/orgList.do'/>?pageIndex="
					+ pageNo
					+ "&searchOrg=${searchOrg}&org1=${org1}&org2=${org2}&org3=${org3}&org4=${org4}";
			location.href = url;
		}; 
	</script>
</body>
</html>
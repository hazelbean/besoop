<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="validator" uri="http://www.springmodules.org/tags/commons-validator"%>
<%
/**
 * @ Class Name 	: MapoUserSelectUpdt.jsp
 * @ Description 	: MapoUserSelectUpdt 화면
 * @ Modification Information
 * @
 * @  수정일             	 수정자              수정내용
 * @ -----------  --------    ---------------------------
 * @ 2021.09.17 	서지혜              최초 생성
 * @ 2021.10.07 	이도경              소속 및 권한 선택 기능 오류 수정
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
							<p class="pageTitle">| 사용자 정보 수정</p>
						</div>
					</div>

					<!-- content start -->
					<form:form commandName="userManageVO" action="../mapo/MapoUserSelectUpdt.do" name="userManageVO" method="post" onSubmit="fnUpdate(document.forms[0]); return false;">
					<%-- <form:form commandName="userManageVO" action="${pageContext.request.contextPath}/uss/umt/EgovUserSelectUpdt.do" name="userManageVO" method="post" onSubmit="fnUpdate(document.forms[0]); return false;"> --%>

						<div class="card">
							<div class="card-body">
								<div class="table-responsive">

									<!-- 상세정보 사용자 삭제시 prameter 전달용 input -->
									<input name="checkedIdForDel" type="hidden" />
									<!-- 검색조건 유지 -->
									<input type="hidden" name="searchCondition" value="<c:out value='${userSearchVO.searchCondition}'/>" /> <input type="hidden" name="searchKeyword" value="<c:out value='${userSearchVO.searchKeyword}'/>" /> <input type="hidden" name="sbscrbSttus" value="<c:out value='${userSearchVO.sbscrbSttus}'/>" /> <input type="hidden" name="pageIndex" value="<c:out value='${userSearchVO.pageIndex}'/>" />
									<!-- 우편번호검색 -->
									<input type="hidden" name="zip_url" value="<c:url value='/sym/ccm/zip/EgovCcmZipSearchPopup.do'/>" />
									<!-- 사용자유형정보 : password 수정화면으로 이동시 타겟 유형정보 확인용, 만약검색조건으로 유형이 포함될경우 혼란을 피하기위해 userTy명칭을 쓰지 않음-->
									<input type="hidden" name="userTyForPassword" value="<c:out value='${userManageVO.userTy}'/>" />
									<!-- for validation -->
									<input type="hidden" name="password" id="password" value="ex~Test#$12" /> <input type="hidden" name="selectedId" id="selectedId" value="" /> <input type="hidden" name="userLc" id="userLc" value="${userManageVO.groupId }" /> <input type="hidden" name="userMc" id="userMc" value="${userManageVO.pstinstMidCode }" /> <input type="hidden" name="userSc" id="userSc" value="${userManageVO.insttCode } " />

									<table class="table table-borderless" summary="<spring:message code="common.summary.list" arguments="${pageTitle}" />">

										<colgroup>
											<col style="width:;">
											<col style="width:;">
										</colgroup>

										<tbody>
											<!-- 입력/선택 -->
											<c:set var="inputTxt">
												<spring:message code="input.input" />
											</c:set>
											<c:set var="inputSelect">
												<spring:message code="input.cSelect" />
											</c:set>
											<c:set var="inputSelect">
												<spring:message code="input.select" />
											</c:set>

											<!-- 아이디 -->
											<c:set var="title">
												<spring:message code="comUssUmt.deptUserManageRegist.id" />
											</c:set>
											<tr>
												<th class="col-sm-2 line-bottom text-right"><span class="pilsu">* </span><label for="emplyrId">아이디</label></th>
												<td class="col-sm-10 line-bottom">
													<div class="row">
														<form:input path="emplyrId" class="form-control w-25 mr-1" id="emplyrId" size="20" maxlength="20" readonly="true" title="${title} ${inputTxt}" />
													</div> <form:errors path="emplyrId" cssClass="error" /> <form:hidden path="uniqId" />
												</td>
											</tr>
											<!-- 성명 -->
											<c:set var="title">
												<spring:message code="comUssUmt.deptUserManageRegist.name" />
											</c:set>
											<tr>
												<th class="col-sm-2 line-bottom text-right"><span class="pilsu">* </span><label for="emplyrNm">성명</label></th>
												<td class="col-sm-10 line-bottom">
													<div class="row">
														<form:input path="emplyrNm" class="form-control w-25 mr-1" title="${title} ${inputTxt}" size="50" maxlength="60" />
													</div>
													<div>
														<form:errors path="emplyrNm" cssClass="error" />
													</div>
												</td>
											</tr>

											<!-- 소속그룹 -->
											<c:set var="title">
												<spring:message code="comUssUmt.deptUserManageRegist.groupId" />
											</c:set>
											<tr>
												<th class="col-sm-2 line-bottom text-right"><span class="pilsu">* </span><label for="groupId">소속그룹</label></th>
												<td class="col-sm-10 line-bottom">
													<div class="row">
														<form:select path="groupId" class="form-control w-25 mr-1" id="groupId" title="${title} ${inputSelect}">
															<form:option value="" label="${inputSelect}" />
															<form:options items="${groupId_result}" itemValue="code" itemLabel="codeNm" />
														</form:select>

													</div>
													<div>
														<form:errors path="groupId" cssClass="error" />
													</div>
												</td>
											</tr>

											<!-- 소속과(분류) pstinstMidCode :  PSTINST_MID_CODE 테스트 -->
											<c:set var="title">
												<spring:message code="comUssUmt.deptUserManageRegist.groupId" />
											</c:set>
											<tr>
												<th class="col-sm-2 line-bottom text-right"><span class="pilsu">* </span><label for="pstinstMidCode">소속과(분류)</label></th>
												<td class="col-sm-10 line-bottom">
													<div class="row">
														<form:select path="pstinstMidCode" class="form-control w-25" id="pstinstMidCode" title="${title} ${inputSelect}">
															<form:option value="" label="${inputSelect}" />
															<form:options items="${pstinstMidCode_result}" itemValue="code" itemLabel="codeNm" />
														</form:select>
													</div>
													<div>
														<form:errors path="pstinstMidCode" class="error-text text-primary" />
													</div>
												</td>
											</tr>

											<!-- (마지막) 소속팀(기관) 코드 insttCode : PSTINST_CODE -->
											<c:set var="title">
												<spring:message code="comUssUmt.deptUserManageRegist.groupId" />
											</c:set>
											<tr>
												<th class="col-sm-2 line-bottom text-right"><span class="pilsu">* </span><label for="insttCode">소속팀(기관)</label></th>
												<td class="col-sm-10 line-bottom">
													<div class="row">
														<form:select path="insttCode" class="form-control w-25 mr-1" id="insttCode" title="${title} ${inputSelect}">
															<form:option value="" label="${inputSelect}" />
															<form:options items="${insttCode_result}" itemValue="code" itemLabel="codeNm" />
														</form:select>
													</div>
													<div>
														<form:errors path="insttCode" cssClass="error" />
													</div>
												</td>
											</tr>
											<!-- 권한 :  AUTHOR_CODE  -->
											<c:set var="title">
												<spring:message code="comUssUmt.deptUserManageRegist.groupId" />
											</c:set>
											<tr>
												<th class="col-sm-2 line-bottom text-right"><span class="pilsu">* </span><label for="authorCode">사용권한</label></th>
												<td class="col-sm-10 line-bottom">
													<div class="row">
														<form:select path="authorCode" class="form-control w-25" id="authorCode" title="${title} ${inputSelect}">
															<form:option value="" label="${inputSelect}" />
															<form:options items="${authorCode_result}" itemValue="code" itemLabel="codeNm" />
														</form:select>
													</div>
													<div>
														<form:errors path="authorCode" class="error-text text-danger" />
													</div>
												</td>
											</tr>

											<!-- 직위 -->
											<c:set var="title">
												<spring:message code="comUssUmt.deptUserManageRegist.ofcps" />
											</c:set>
											<tr>
												<th class="col-sm-2 line-bottom text-right"><label for="">${title}</label></th>
												<td class="col-sm-10 line-bottom">
													<div class="row">
														<form:input path="ofcpsNm" class="form-control w-25 mr-1" id="ofcpsNm" title="${title} ${inputTxt}" size="20" maxlength="50" />
													</div>
													<div>
														<form:errors path="ofcpsNm" cssClass="error" />
													</div>
												</td>
											</tr>

											<!-- 유선전화 -->
											<c:set var="title">
												<spring:message code="comUssUmt.deptUserManageRegist.tel" />
											</c:set>
											<tr>
												<th class="col-sm-2 line-bottom text-right"><label for="areaNo">유선전화</label></th>
												<td class="col-sm-10 line-bottom">
													<div class="row">
														<form:input path="areaNo" id="areaNo" class="form-control" title="${title} ${inputSelect}" size="5" maxlength="4" style="width:60px;" />
														-
														<form:input path="homemiddleTelno" id="homemiddleTelno" class="form-control" size="5" maxlength="4" style="width:70px;" />
														-
														<form:input path="homeendTelno" id="homeendTelno" class="form-control" size="5" maxlength="4" style="width:70px;" />
													</div>
													<div>
														<form:errors path="areaNo" cssClass="error" />
													</div>
													<div>
														<form:errors path="homemiddleTelno" cssClass="error" />
													</div>
													<div>
														<form:errors path="homeendTelno" cssClass="error" />
													</div>
												</td>
											</tr>

											<!-- 핸드폰번호 -->
											<c:set var="title">
												<spring:message code="comUssUmt.deptUserManageRegist.phone" />
											</c:set>
											<tr>
												<th class="col-sm-2 line-bottom text-right"><label for="moblphonNo">${title}</label></th>
												<td class="col-sm-10 line-bottom">
													<div class="row">
														<form:input path="moblphonNo" class="form-control w-25" id="moblphonNo" title="${title} ${inputTxt}" size="20" maxlength="15" />
													</div>
													<div>
														<form:errors path="moblphonNo" cssClass="error" />
													</div>
												</td>
											</tr>
											<!-- 이메일주소 -->
											<c:set var="title">
												<spring:message code="comUssUmt.deptUserManageRegist.email" />
											</c:set>
											<tr>
												<th class="col-sm-2 line-bottom text-right"><label for="emailAdres">${title}</label></th>
												<td class="col-sm-10 line-bottom">
													<div class="row">
														<form:input path="emailAdres" class="form-control w-50" id="mberEmailAdres" title="${title} ${inputTxt}" size="30" maxlength="50" />
													</div>
													<div>
														<form:errors path="emailAdres" cssClass="error" />
													</div>
												</td>
											</tr>

											<!-------------------- 이하 숨김 --------------------------->
											<!-- 로그인인증제한여부 -->
											<c:set var="title">
												<spring:message code="comUssUmt.common.lockAt" />
											</c:set>
											<tr style="display: none">
												<th class="col-sm-2 line-bottom"><label for="lockAt">${title}</label></th>
												<td class="col-sm-10 line-bottom"><c:if test="${userManageVO.lockAt eq 'Y'}">예</c:if> <c:if test="${userManageVO.lockAt == null || userManageVO.lockAt eq '' || userManageVO.lockAt eq 'N'}">아니오</c:if></td>
											</tr>

											<!-- 조직아이디 -->
											<c:set var="title">
												<spring:message code="comUssUmt.deptUserManageRegist.orgnztId" />
											</c:set>
											<tr style="display: none">
												<th class="col-sm-2 line-bottom"><label for="orgnztId">${title}</label></th>
												<td class="col-sm-10 line-bottom"><form:select path="orgnztId" class="form-control w-25 mr-1" id="orgnztId" title="${title} ${inputSelect}">
														<form:option value="" label="${inputSelect}" />
														<form:options items="${orgnztId_result}" itemValue="code" itemLabel="codeNm" />
													</form:select>
													<div>
														<form:errors path="orgnztId" cssClass="error" />
													</div></td>
											</tr>

											<!-- 가입상태 -->
											<c:set var="title">
												<spring:message code="comUssUmt.deptUserManageRegist.status" />
											</c:set>
											<tr style="display: none">
												<th class="col-sm-2 line-bottom"><label for="emplyrSttusCode">${title}</label> <span class="pilsu">*</span></th>
												<td class="col-sm-10 line-bottom"><form:select path="emplyrSttusCode" class="form-control w-25 mr-1" id="emplyrSttusCode" title="${title} ${inputSelect}">
														<form:option value="" label="${inputSelect}" />
														<form:options items="${emplyrSttusCode_result}" itemValue="code" itemLabel="codeNm" />
													</form:select>
													<div>
														<form:errors path="emplyrSttusCode" cssClass="error" />
													</div></td>
											</tr>

											<!-- 비밀번호힌트 -->
											<c:set var="title">
												<spring:message code="comUssUmt.deptUserManageRegist.passHit" />
											</c:set>
											<tr style="display: none">
												<th class="col-sm-2 line-bottom"><label for="passwordHint">${title}</label> <span class="pilsu">*</span></th>
												<td class="col-sm-10 line-bottom"><form:select path="passwordHint" class="form-control w-25 mr-1" id="passwordHint" title="${title} ${inputSelect}">
														<form:option value="" label="${inputSelect}" />
														<form:options items="${passwordHint_result}" itemValue="code" itemLabel="codeNm" />
													</form:select>
													<div>
														<form:errors path="passwordHint" cssClass="error" />
													</div></td>
											</tr>
											<!-- 비밀번호정답 -->
											<c:set var="title">
												<spring:message code="comUssUmt.deptUserManageRegist.passOk" />
											</c:set>
											<tr style="display: none">
												<th class="col-sm-2 line-bottom"><label for="passwordCnsr">${title}</label> <span class="pilsu">*</span></th>
												<td class="col-sm-10 line-bottom"><form:input path="passwordCnsr" class="form-control w-25 mr-1" id="passwordCnsr" title="${title} ${inputTxt}" size="50" maxlength="100" />
													<div>
														<form:errors path="passwordCnsr" cssClass="error" />
													</div></td>
											</tr>
											<!-- 사번 -->
											<c:set var="title">
												<spring:message code="comUssUmt.deptUserManageRegist.emplNum" />
											</c:set>
											<tr style="display: none">
												<th class="col-sm-2 line-bottom"><label for="emplNo">${title}</label></th>
												<td class="col-sm-10 line-bottom"><form:input path="emplNo" class="form-control w-25 mr-1" id="emplNo" title="${title} ${inputTxt}" size="20" maxlength="20" />
													<div>
														<form:errors path="emplNo" cssClass="error" />
													</div></td>
											</tr>

											<!-- 성별구분코드 -->
											<c:set var="title">
												<spring:message code="comUssUmt.deptUserManageRegist.saxTypeCode" />
											</c:set>
											<tr style="display: none">
												<th class="col-sm-2 line-bottom"><label for="sexdstnCode">${title}</label></th>
												<td class="col-sm-10 line-bottom"><form:select path="sexdstnCode" class="form-control w-25 mr-1" id="sexdstnCode" title="${title} ${inputSelect}">
														<form:option value="" label="${inputSelect}" />
														<form:options items="${sexdstnCode_result}" itemValue="code" itemLabel="codeNm" />
													</form:select></td>
											</tr>
											<!-- 생일 -->
											<c:set var="title">
												<spring:message code="comUssUmt.deptUserManageRegist.brth" />
											</c:set>
											<tr style="display: none">
												<th class="col-sm-2 line-bottom"><label for="brth">${title}</label></th>
												<td class="col-sm-10 line-bottom"><form:input path="brth" class="form-control w-25 mr-1" id="brth" title="${title} ${inputTxt}" size="20" maxlength="8" />
													<div>
														<form:errors path="brth" cssClass="error" />
													</div></td>
											</tr>
											<!-- 우편번호 -->
											<c:set var="title">
												<spring:message code="comUssUmt.deptUserManageRegist.post" />
											</c:set>
											<tr style="display: none">
												<th class="col-sm-2 line-bottom"><label for="zip">${title}</label> <span class="pilsu">*</span></th>
												<td class="col-sm-10 line-bottom"><input name="zip" id="zip" class="form-control w-25 mr-1" title="${title} ${inputTxt}" type="text" size="20" value="<c:out value='${userManageVO.zip}'/>" maxlength="8" style="width: 60px;" /> <!-- form:hidden path="zip" id="zip" --> <!-- <button class="btn_s2" onClick="fn_egov_ZipSearch(document.mberManageVO, document.mberManageVO.zip, document.mberManageVO.zip_view, document.mberManageVO.adres);return false;" title="<spring:message code="button.delete" /> <spring:message code="input.button" />">우번번호검색</button>  -->
													<div>
														<form:errors path="zip" cssClass="error" />
													</div></td>
											</tr>
											<!-- 주소 -->
											<c:set var="title">
												<spring:message code="comUssUmt.deptUserManageRegist.addr" />
											</c:set>
											<tr style="display: none">
												<th class="col-sm-2 line-bottom"><label for="">${title}</label> <span class="pilsu">*</span></th>
												<td class="col-sm-10 line-bottom"><form:input path="homeadres" class="form-control w-25 mr-1" id="homeadres" title="${title} ${inputTxt}" cssClass="txaIpUmt" size="70" maxlength="100" />
													<div>
														<form:errors path="homeadres" cssClass="error" />
													</div></td>
											</tr>
											<!-- 상세주소 -->
											<c:set var="title">
												<spring:message code="comUssUmt.deptUserManageRegist.addrDetail" />
											</c:set>
											<tr style="display: none">
												<th class="col-sm-2 line-bottom"><label for="detailAdres">${title}</label></th>
												<td class="col-sm-10 line-bottom"><form:input path="detailAdres" class="form-control w-25 mr-1" id="detailAdres" title="${title} ${inputTxt}" cssClass="txaIpUmt" size="70" maxlength="100" />
													<div>
														<form:errors path="detailAdres" cssClass="error" />
													</div></td>
											</tr>
											<!-- 사무실전화번호 -->
											<c:set var="title">
												<spring:message code="comUssUmt.deptUserManageRegist.areaNo" />
											</c:set>
											<tr style="display: none">
												<th class="col-sm-2 line-bottom"><label for="offmTelno">${title}</label></th>
												<td class="col-sm-10 line-bottom"><form:input path="offmTelno" id="offmTelno" title="${title} ${inputTxt}" cssClass="txaIpUmt" size="20" maxlength="15" />
													<div>
														<form:errors path="offmTelno" cssClass="error" />
													</div></td>
											</tr>
											<!-- 팩스번호 -->
											<c:set var="title">
												<spring:message code="comUssUmt.deptUserManageRegist.offmTelno" />
											</c:set>
											<tr style="display: none">
												<th class="col-sm-2 line-bottom"><label for="fxnum">${title}</label></th>
												<td class="col-sm-10 line-bottom"><form:input path="fxnum" id="fxnum" title="${title} ${inputTxt}" cssClass="txaIpUmt" size="20" maxlength="15" />
													<div>
														<form:errors path="fxnum" cssClass="error" />
													</div></td>
											</tr>
											<form:hidden path="subDn" />
										</tbody>
									</table>
								</div>
							</div>

							<!-- 하단 버튼 -->
							<div class="card-footer">
								<div class="row">
									<div class="col-sm-6 text-left">
										<!-- 목록 -->
										<span><a href="<c:url value='/mapo/MapoUserManage.do' />" class="btn btn-outline-primary" title="<spring:message code="button.list" /> <spring:message code="input.button" />">목록</a></span>
										<!-- 비밀번호 변경 -->
										<button class="btn btn-info" onClick="fnPasswordMove(); return false;" title="<spring:message code="comUssUmt.userManageModifyBtn.passwordChange" /> <spring:message code="input.button" />"><spring:message code="comUssUmt.userManageModifyBtn.passwordChange" /></button>
										<%-- <button class="btn btn-warning" onClick="fnLockIncorrect(); return false;" title="<spring:message code="comUssUmt.common.lockAtBtn" /> <spring:message code="input.button" />"><spring:message code="comUssUmt.common.lockAtBtn" /></button> --%>
									</div>
									<div class="col-sm-6 text-right">
										<%-- <span><a href="<c:url value='/mapo/MapoUserManage.do' />" class="btn btn-info" title="<spring:message code="button.save"/>" onclick="return btSave();">저장</a></span> --%>
										<input type="submit" class="btn btn-primary" value="<spring:message code="button.save" />" title="저장" />
										<button class="btn btn-secondary" onClick="fnDeleteUser('<c:out value='${mberManageVO.userTy}'/>:<c:out value='${mberManageVO.uniqId}'/>'); return false;" title="<spring:message code="button.delete" /> <spring:message code="input.button" />">삭제</button>
									</div>
									<%-- 	<button class="btn btn-outline-primary" onClick="document.userManageVO.reset(); return false;" title="<spring:message code="button.reset" /> <spring:message code="input.button" />"><spring:message code="button.reset" /></button> --%>
								</div>
							</div>
						</div>
					</form:form>
					<!-- content end -->
				</div>

<script type="text/javascript" src="<c:url value="/validator.do"/>"></script>
<validator:javascript formName="userManageVO" staticJavascript="false" xhtml="true" cdata="false" />
<script type="text/javascript" src="<c:url value='/js/egovframework/com/sym/ccm/zip/EgovZipPopup.js' />"></script>

<script type="text/javaScript" language="javascript" defer="defer">
$(document).ready(function() {
	
	// 왼쪽 메뉴 아이콘 활성화
	$("#menuUser").addClass("active");
	
});

/* 저장 버튼 클릭 이벤트 */
/* function btSave(){
	if (!confirm("저장 하시겠습니까?")) {
	return false;
	}
} */
	
$("#groupId").change(function(){
	
	// 소속과(분류), 소소팀(기관), 권한 초기화
	$("#pstinstMidCode, #insttCode, #authorCode").find('option').each(function(){
		$(this).remove();
	});
	
	$("#pstinstMidCode, #insttCode, #authorCode").append("<option value=''>선택하세요</option>");
	
	var value = $(this).val();
	 
	// 가입승인 상태 디폴트 설정
	$("#emplyrSttusCode").val("P").prop("selected", true);
	
	getData("groupId", value);
});

/*  소속과(분류) 선택 */
$("#pstinstMidCode").change(function(){

	// 소소팀(기관), 권한 초기화
	$("#insttCode, #authorCode").find('option').each(function(){
		$(this).remove();
	});
	
	$("#insttCode, #authorCode").append("<option value=''>선택하세요</option>");
	
	var value = $(this).val();
	
	getData("pstinstMidCode", value);
});

/*  소속팀(기관) 선택 */
$("#insttCode").change(function(){

	// 권한 초기화
	$("#authorCode").find('option').each(function(){
		$(this).remove();
	});
	
	$("#authorCode").append("<option value=''>선택하세요</option>");
	
	var value = $("#groupId").val();
	//var value = $(this).val();
	getData("insttCode", value);
});

function getData(mode, value) {
	
	
	var url = "<c:url value='/mapo/selectJoinInfo.do'/>?mode="+ mode;
	
	if( value != "" ) {
		
 		$.ajax({
	        type: "POST",
	        data: { "code" : value },
	        url: url,
	        dataType: "json",       // 리턴타입
	        success: function(data) {   // controller 
	         
	        
	          if( data.result.length > 0 ) {
	        
		            for ( var i=0; i < data.result.length; i++ ) {
		              
		               // 소속그룹 선택 시
		              if ( mode == "groupId" ) {
		            	  $("#pstinstMidCode").append("<option value='" + data.result[i]['code'] + "'>" + data.result[i]['codeNm'] + "</option>");
		            	  
		              // 소속과(분류) 선택 시
		              } else if ( mode == "pstinstMidCode" ) {
		                	$("#insttCode").append("<option value='" + data.result[i]['code'] + "'>" + data.result[i]['codeNm'] + "</option>");
		                
		              // 소속팀(기관) 선택 시
		              } else if ( mode == "insttCode" ) {
		               	 $("#authorCode").append("<option value='" + data.result[i]['code'] + "'>" + data.result[i]['codeNm'] + "</option>");               
		            
		              }

	            	}
		            
	          } else {
	            
	            if ( mode == "groupId" ) {
	              
	              $("#pstinstMidCode").find('option').remove();
	              $("#pstinstMidCode").append("<option value=''>선택</option>");
	              
	            } else if ( mode == "pstinstMidCode" ) {
	              
	              $("#insttCode").find('option').remove();
	              $("#insttCode").append("<option value=''>선택</option>");
	              
	            } else if ( mode == "insttCode" ) {	              
	              $("#authorCode").find('option').remove();
	              $("#authorCode").append("<option value=''>선택</option>");
		              
		        }
	          }
	        }
	     });	
	}
}

function fnListPage(){
    document.userManageVO.action = "<c:url value='/uss/umt/EgovUserManage.do'/>";
    document.userManageVO.submit();
}
function fnDeleteUser(checkedIds) {
	if(confirm("<spring:message code="common.delete.msg" />")){
	    document.userManageVO.checkedIdForDel.value=checkedIds;
	    document.userManageVO.action = "<c:url value='/uss/umt/EgovUserDelete.do'/>";
	    document.userManageVO.submit();
	}
}
function fnPasswordMove(){
	document.userManageVO.action = "<c:url value='/mapo/MapoUserPasswordUpdtView.do'/>";
    document.userManageVO.submit();
}


function fnLockIncorrect(){
	if(confirm("<spring:message code="comUssUmt.common.lockAtConfirm" />")){
	    document.userManageVO.action = "<c:url value='/uss/umt/EgovUserLockIncorrect.do'/>";
	    document.userManageVO.selectedId.value=document.userManageVO.uniqId.value;
	    document.userManageVO.submit();
	}
}

function fnUpdate(form){
	if(confirm("<spring:message code="common.save.msg" />")){
	    if(validateUserManageVO(form)){
	    	form.submit();
	        return true;
	    }else{
	    	return false;
	    }
	}
}
function fn_egov_inqire_cert() {
	var url = "<c:url value='/uat/uia/EgovGpkiRegist.do' />";
	var popupwidth = '500';
	var popupheight = '400';
	var title = '인증서';

	Top = (window.screen.height - popupheight) / 3;
	Left = (window.screen.width - popupwidth) / 2;
	if (Top < 0) Top = 0;
	if (Left < 0) Left = 0;
	Future = "fullscreen=no,toolbar=no,location=no,directories=no,status=no,menubar=no,	scrollbars=no,resizable=no,left=" + Left + ",top=" + Top + ",width=" + popupwidth + ",height=" + popupheight;
	PopUpWindow = window.open(url, title, Future)
	PopUpWindow.focus();
}

function fn_egov_dn_info_setting(dn) {
	var frm = document.userManageVO;

	frm.subDn.value = dn;
}
</script>

</body>
</html>

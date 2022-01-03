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
* @Class Name : MapoUserPasswordUpdt.jsp
* @Description : 암호 수정 화면
* @Modification Information
* @
* @  수정일             		 수정자            수정내용
* @ -----------  --------    ---------------------------
* @ 2021.10.18 		이도경             최초 생성
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

<body>
<body id="page-top">

	<!-- javascript warning tag  -->
	<%-- <noscript class="noScriptTitle">
		<spring:message code="common.noScriptTitle.msg" />
	</noscript> --%>

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
							<p class="pageTitle">| 비밀번호 변경</p>
						</div>
					</div>

					<!-- content start -->
					<form name="passwordChgVO" method="post" action="<c:url value="${'/mapo/MapoUserPasswordUpdt.do'}"/>" onsubmit="fnUpdate(document.forms[0]); return false;">

						<div class="card">
							<div class="card-body">
								<div class="table-responsive">

									<!-- 상세정보 사용자 삭제시 prameter 전달용 input -->
									<input name="checkedIdForDel" type="hidden" />
									<!-- 검색조건 유지 -->
									<input type="hidden" name="searchCondition" value="<c:out value='${userSearchVO.searchCondition}'/>" /> <input type="hidden" name="searchKeyword" value="<c:out value='${userSearchVO.searchKeyword}'/>" /> <input type="hidden" name="sbscrbSttus" value="<c:out value='${userSearchVO.sbscrbSttus}'/>" /> <input type="hidden" name="pageIndex" value="<c:out value='${userSearchVO.pageIndex}'/>" />
									<!-- 우편번호검색 -->
									<input type="hidden" name="url" value="<c:url value='/sym/ccm/zip/EgovCcmZipSearchPopup.do'/>" />


									<!-- 테이블 -->
									<table class="table table-borderless" summary="<spring:message code="common.summary.list" arguments="${pageTitle}" />">

										<colgroup>
											<col style="width:;">
											<col style="width:;">
										</colgroup>

										<tbody>
											<!-- 일반회원아이디 -->
											<c:set var="inputTxt">
												<spring:message code="input.input" />
											</c:set>
											<tr>
												<th class="col-sm-2 line-bottom text-right">아이디</th>
												<td class="col-sm-10 line-bottom left"><input class="form-control w-25 mr-1" name="emplyrId" id="emplyrId" title="사용자아이디" type="text" size="20" value="<c:out value='${userManageVO.emplyrId}'/>" maxlength="20" readonly /> <input name="uniqId" id="uniqId" title="uniqId" type="hidden" size="20" value="<c:out value='${userManageVO.uniqId}'/>" /> <input name="userTy" id="userTy" title="userTy" type="hidden" size="20" value="<c:out value='${userManageVO.userTy}'/>" /></td>
											</tr>

											<!-- 기존 비밀번호 -->
											<tr>
												<th class="col-sm-2 line-bottom text-right"><span class="pilsu">* </span>기존 비밀번호</th>
												<td class="col-sm-10 line-bottom left"><input class="form-control w-25 mr-1" name="oldPassword" id="oldPassword" type="password" size="20" value="" maxlength="100"></td>
											</tr>

											<!-- 비밀번호 -->
											<c:set var="title">
												<spring:message code="comUssUmt.userManagePasswordUpdt.pass" />
											</c:set>
											<tr>
												<th class="col-sm-2 line-bottom text-right"><span class="pilsu">* </span>${title}</th>
												<td class="col-sm-10 line-bottom left">
													<div>
														<input class="form-control w-25 mr-1" name="newPassword" id="newPassword" type="password" size="20" value="" maxlength="100">
													</div>
													<div>
														<div>
															<spring:message code="info.password.rule.password1" />
														</div>
														<div>
															<spring:message code="info.password.rule.pwdcheckcomb3" />
														</div>
														<div>
															<spring:message code="info.password.rule.pwdcheckseries" />
														</div>
													</div>
												</td>
											</tr>

											<!-- 비밀번호확인 -->
											<tr>
												<th class="col-sm-2 line-bottom text-right"><span class="pilsu">* </span>비밀번호 확인</th>
												<td class="col-sm-10 line-bottom left"><input class="form-control w-25 mr-1" name="newPassword2" id="newPassword2" type="password" size="20" value="" maxlength="100"></td>
											</tr>
										</tbody>
									</table>
								</div>
							</div>

							<!-- 목록 -->
							<%-- <span class="btn_s"><a href="<c:url value='/uss/umt/EgovUserManage.do' />" title="<spring:message code="button.list" />
												<spring:message code="input.button" />"><spring:message code="button.list" /></a></span> --%>

							<!-- 하단 버튼 -->
							<div class="card-footer">
								<div class="row">
									<div class="col-sm-6 text-left">
										<!-- 버튼 : 목록 -->
										<span><a href="<c:url value='/mapo/MapoUserManage.do' />" class="btn btn-outline-primary" title="<spring:message code="button.list" /> <spring:message code="input.button" />">목록</a></span>
										
										<!-- 버튼 : 초기화 -->
										<input type="submit" class="btn btn-info" value="초기화" title="초기화 버튼" onClick = "return pwReset()" />
									</div>

									<div class="col-sm-6 text-right">
										<!-- 버튼 : 수정 -->
										<input type="submit" class="btn btn-primary" value="<spring:message code="button.update" />" title="수정 버튼" <spring:message code="input.button" />" />

										<!-- 버튼 : 취소 -->
										<button class="btn btn-secondary" onClick="document.passwordChgVO.reset();return false;" title="<spring:message code="button.reset" /> <spring:message code="input.button" />">
											<spring:message code="button.reset" />
										</button>
									</div>

								</div>

							</div>
							<div style="clear: both;"></div>
						</div>
					</form>
				</div>
			</div>
		</div>
	</div>

	<!-- 스크립트 -->
	<script type="text/javascript" src="<c:url value="/mapo/validator.do"/>"></script>
	<validator:javascript formName="passwordChgVO" staticJavascript="false" xhtml="true" cdata="false" />
	<script type="text/javaScript" language="javascript" defer="defer">
	$(document).ready(function() {
		
		// 왼쪽 메뉴 아이콘 활성화
		$("#menuUser").addClass("active");
		
	});
	
	/* 비밀번호 초기화  */
	 function pwReset(){
		 
		 if(!confirm("비밀번호를 mapo@mapo2021로 초기화하시겠습니까?")) {
			  return false;
		} 
		
		var emplyrId = $("#emplyrId").val();
		var uniqId = $("#uniqId").val();
		
		location.href = "MapoUserPasswordUpdtReset.do?emplyrId="+emplyrId+"&uniqId="+uniqId; 
		
		return false;
	} 
	 <c:if test="${!empty resultResetMsg}">alert("<spring:message code="${resultResetMsg}" />"); </c:if>
	 
		function fnListPage(){
		    document.passwordChgVO.action = "<c:url value='/mapo/MapoUserManage.do'/>";
		    document.passwordChgVO.submit();
		}
		function fnUpdate(form){
		    if(validatePasswordChgVO(form)){
		        if(form.newPassword.value != form.newPassword2.value){
		            alert("<spring:message code="fail.user.passwordUpdate2" />");
		            return false;
		        }
		        document.passwordChgVO.submit();
		        return  true;
		    }else{
		    	return false;
		    }
		}
		<c:if test="${!empty resultMsg}">alert("<spring:message code="${resultMsg}" />"); </c:if>
		
	</script>

</body>
</html>

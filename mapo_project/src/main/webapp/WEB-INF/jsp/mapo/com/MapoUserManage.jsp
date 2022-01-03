<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%
	/**
 * @ Class Name 	: MapoUserManage.jsp
 * @ Description 	: MapoUserManage 화면
 * @ Modification Information
 * @
 * @  수정일             	 수정자              수정내용
 * @ -----------  --------    ---------------------------
 * @ 2021.09.08 	서지혜              최초 생성
 * @ 2021.09.29 	이도경              레이아웃 수정 및 기능 추가
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
	<noscript class="noScriptTitle text-center">
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
							<p class="pageTitle">| 사용자 관리</p>
						</div>
						<div class="col-sm-6 text-right mt-2">
							<!-- 신규등록 버튼	 -->
							<a href="<c:url value='/mapo/MapoUserInsertView.do'/>" class="btn btn-primary mb-2" title="<spring:message code="button.create" /> <spring:message code="input.button" />">신규등록</a>

							<!-- 삭제 버튼	 -->
							<input type="button" class="btn btn-secondary mb-2 mr-1" onClick="fnDeleteUser(); return false;" value="<spring:message code="title.delete" />" title="<spring:message code="title.delete" /> <spring:message code="input.button" />" />
						</div>
					</div>

					<form name="listForm" action="<c:url value='/mapo/MapoUserManage.do'/>" method="post">
						<div class="card">
							<div class="card-header">
								<div class="form-group row" style="margin-bottom: 0px;">
									
									<!-- 검색영역 -->
									<span class="col-sm-1 text-right">
									<!-- <span class="ml-4 mr-1 mt-2 align-self-center">   --> 
									<!-- 조건 --> 
									<select name="searchCondition" id="searchCondition" class="form-control" title="<spring:message code="comUssUmt.userManageSsearch.searchConditioTitle" />">
											<!--  -->
											<option value="0" <c:if test="${mberVO.searchCondition == '0'}">selected="selected"</c:if>><spring:message code="comUssUmt.userManageSsearch.searchConditionId" /></option>
											<!-- ID  -->
											<option value="1" <c:if test="${empty mberVO.searchCondition || mberVO.searchCondition == '1'}">selected="selected"</c:if>><spring:message code="comUssUmt.userManageSsearch.searchConditionName" /></option>
											<!-- Name -->
									</select>
									</span>

									<!-- 검색키워드 및 조회버튼 -->
									<span class="col-sm-4"> <!-- 검색키워드 --> <input class="form-control" name="searchKeyword" type="text" size="35" title="<spring:message code="title.search" />
									<spring:message code="input.input" />" value='<c:out value="${userSearchVO.searchKeyword}"/>' maxlength="155" placeholder="검색어를 입력하세요.">
									</span>

									<!-- 조회 버튼 -->
									<span class="col-sm-4"> <input type="submit" class="btn btn-primary" value="<spring:message code="button.inquire" />" title="<spring:message code="title.inquire" /> <spring:message code="input.button" />" />
									</span>
								</div>
							</div>
							<!-- END card-header -->

							<!-- 리스트 출력 부분  -->
							<div class="card-body">
								<!-- 총 사용자수 -->
								<div class="text-right mb-2 mt-2">
									<span class="ml-2"><i class="fas fa-user"></i> &nbsp;총 사용자 &nbsp;&nbsp;<strong class="mr-2"><c:out value="${paginationInfo.totalRecordCount}" /> 명</strong></span>
								</div>
								<div class="table-responsive">


									<table class="table table-hover mt-1" summary="<spring:message code="common.summary.list" arguments="${pageTitle}" />">
										<colgroup>
											<col style="width: 4%;">
											<!-- 체크박스 -->
											<col style="width: 11%;">
											<!-- 사용자ID -->
											<col style="width: 10%;">
											<!-- 소속그룹 -->
											<col style="width: 16%;">
											<!-- 소속과(분류) -->
											<col style="width: 24%;">
											<!-- 소속팀(기관) -->
											<col style="width: 10%;">
											<!-- 이름 -->
											<col style="width: 12%;">
											<!-- 유선전화 -->
											<col style="width: 13%;">
											<!-- 휴대전화 -->
										</colgroup>
										<thead>
											<!-- <tr align="center"> -->
											<tr>
												<!-- 전체선택 -->
												<th><input type="checkbox" name="checkAll" class="check2" onclick="javascript:fncCheckAll()" title="<spring:message code="input.selectAll.title" />"></th>
												<th class="board_th_link">사용자ID</th>
												<th>소속그룹</th>
												<th>소속과(분류)</th>
												<th>소속팀(기관)</th>
												<th class="text-center">이름</th>
												<th>유선전화</th>
												<th>휴대전화</th>
												<!-- <th>등록일</th> -->

											</tr>
										</thead>
										<tbody class="ov">
											<c:if test="${fn:length(resultList) == 0}">
												<tr>
													<td colspan="8"><spring:message code="common.nodata.msg" /></td>
												</tr>
											</c:if>
											<c:forEach var="result" items="${resultList}" varStatus="status">
												<tr>
													<!-- 체크박스 -->
													<td><input type="checkbox" name="checkField" class="check2" title="선택" /> <input name="checkId" type="hidden" value="<c:out value='${result.userTy}'/>:<c:out value='${result.uniqId}'/>" /></td>
													<!-- 사용자ID -->
													<td><a href="<c:url value='/mapo/MapoUserSelectUpdtView.do'/>?selectedId=<c:out value="${result.uniqId}"/>"> <c:out value="${result.userId}" />
													</a> <%-- <a href="<c:url value='/uss/umt/EgovMberSelectUpdtView.do'/>?selectedId=<c:out value="${result.uniqId}"/>" onclick="javascript:fnSelectUser('<c:out value="${result.userTy}"/>:<c:out value="${result.uniqId}"/>'); return false;"> --%> <%-- <a href="<c:url value='/mapo/MapoUserSelectUpdtView.do'/>?selectedId=<c:out value="${result.uniqId}"/>" onclick="javascript:fnSelectUser('<c:out value="${result.userTy}"/>:<c:out value="${result.uniqId}"/>'); return false;">	
									<c:out value="${result.userId}" />
								</a>  --%></td>
													<!-- 소속그룹 -->
													<td>${result.groupNm}</td>
													<!-- 소속과(분류) -->
													<td>${result.codeIdNm}</td>
													<!-- 소속팀(기관) -->
													<td>${result.codeNm}</td>
													<!-- 이름 -->
													<td class="text-center">${result.userNm}</td>
													<!-- 유선전화 -->
													<td><c:if test="${!empty result.areaNo}">
													${result.areaNo}-${result.middleTelno}-${result.endTelno}</c:if></td>
													<!-- 휴대전화 -->
													<td>${result.moblphonNo}</td>
													<!-- 등록일 -->
													<%-- <td><c:out value="${fn:substring(result.sbscrbDe,0,10)}" /></td> --%>
													<%-- <td>
								<c:forEach var="emplyrSttusCode_result" items="${emplyrSttusCode_result}" varStatus="status">
									<c:if test="${result.sttus == emplyrSttusCode_result.code}">
										<c:out value="${emplyrSttusCode_result.codeNm}" />
									</c:if>
								</c:forEach>
							</td> --%>
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
				</div>

				<input name="selectedId" type="hidden" /> <input name="checkedIdForDel" type="hidden" /> <input name="pageIndex" type="hidden" value="<c:out value='${userSearchVO.pageIndex}'/>" />
				</form>


				<!-- Modal & Script-->
				<%@ include file="../modal/common.jsp"%>


				<script type="text/javaScript" language="javascript" defer="defer">
$(document).ready(function() {
	
	// 왼쪽 메뉴 아이콘 활성화
	$("#menuUser").addClass("active");
	
});

function fncCheckAll() {
    var checkField = document.listForm.checkField;
    if(document.listForm.checkAll.checked) {
        if(checkField) {
            if(checkField.length > 1) {
                for(var i=0; i < checkField.length; i++) {
                    checkField[i].checked = true;
                }
            } else {
                checkField.checked = true;
            }
        }
    } else {
        if(checkField) {
            if(checkField.length > 1) {
                for(var j=0; j < checkField.length; j++) {
                    checkField[j].checked = false;
                }
            } else {
                checkField.checked = false;
            }
        }
    }
}

function fnDeleteUser() {
    var checkField = document.listForm.checkField;
    var id = document.listForm.checkId;
    var checkedIds = "";
    var checkedCount = 0;
    if(checkField) {
        if(checkField.length > 1) {
            for(var i=0; i < checkField.length; i++) {
                if(checkField[i].checked) {
                    checkedIds += ((checkedCount==0? "" : ",") + id[i].value);
                    checkedCount++;
                }
            }
        } else {
            if(checkField.checked) {
                checkedIds = id.value;
            }
        }
    }
    if(checkedIds.length > 0) {
        if(confirm("<spring:message code="common.delete.msg" />")){
        	document.listForm.checkedIdForDel.value=checkedIds;
            document.listForm.action = "<c:url value='MapoUserDelete.do'/>";
            document.listForm.submit();
        }
    }
}
<!--
function fnSelectUser(id) {
    document.listForm.selectedId.value = id;
    array = id.split(":");
    if(array[0] == "") {
    } else {
        userTy = array[0];
        userId = array[1];
    }
   	document.listForm.selectedId.value = userId;
    document.listForm.action = "<c:url value='/uss/umt/EgovUserSelectUpdtView.do'/>";
    document.listForm.submit();

}
function fnAddUserView() {
    document.listForm.action = "<c:url value='/uss/umt/EgovUserInsertView.do'/>";
    document.listForm.submit();
}
function fnLinkPage(pageNo){
    document.listForm.pageIndex.value = pageNo;
    document.listForm.action = "<c:url value='/uss/umt/EgovUserManage.do'/>";
    document.listForm.submit();
}
function fnSearch(){
	document.listForm.pageIndex.value = 1;
	document.listForm.action = "<c:url value='/uss/umt/EgovUserManage.do'/>";
    document.listForm.submit();
}
function fnViewCheck(){
    if(insert_msg.style.visibility == 'hidden'){
    	insert_msg.style.visibility = 'visible';
    }else{
    	insert_msg.style.visibility = 'hidden';
    }
}
<c:if test="${!empty resultMsg}">alert("<spring:message code="${resultMsg}" />");</c:if>
-->
</script>
</body>

</html>

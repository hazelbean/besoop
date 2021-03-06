<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="validator" uri="http://www.springmodules.org/tags/commons-validator" %>
<%pageContext.setAttribute("crlf", "\r\n"); %>
<%
 /**
  * @ Class Name 	: MapoFaqDetail.jsp
  * @ Description 	: MapoFaqDetail 화면
  * @ Modification Information
  * @
  * @  수정일             	 수정자              수정내용
  * @ -----------  --------    ---------------------------
  * @ 2021.09.01 	서지혜              최초 생성
  * @ 2021.10.27 	이도경              레이아웃 수정
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
<link rel="stylesheet" href="<c:url value="/css/bootstrapthema/css/sb-admin-2.min.css"/>">

<!-- 공통 CSS 호출 -->
<link rel="stylesheet" href="<c:url value="/css/mapo/custom.css"/>">

<!-- Font-Awesome 5 호출 -->
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.8.2/css/all.min.css"/>

<!-- favicon -->
<link rel="shortcut icon" type="image/x-icon" href="<c:url value="/css/mapo/favicon.ico"/>">

</head>

<body id="page-top">

<!-- javascript warning tag  -->
<noscript class="noScriptTitle"><spring:message code="common.noScriptTitle.msg" /></noscript>


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
						<p class="pageTitle">| FAQ 상세</p>
					</div>
				</div>

				<form name="faqForm" action="<c:url value='/mapo/updateFaqView.do'/>" method="post">
				<div class="card">
										
					<div class="card-body">
											
						<!-- 상세조회 테이블 -->
						<div class="table-responsive">
							<table class="table table-borderless" summary="<spring:message code="common.summary.inqire" arguments="${pageTitle}" />">
							
							<colgroup>
								<col style="width: ;">
								<col style="width: ;">
							</colgroup>
							<tbody>
								<!-- 질문제목 -->
								<tr>
									<th class="col-sm-2 line-bottom text-right"><spring:message code="comUssOlhFaq.faqVO.qestnSj" /></th>
									<td class="col-sm-10 line-bottom"><c:out value="${result.qestnSj}"/></td>
								</tr>
								<!-- 조회수 -->
								<tr>
									<th class="col-sm-2 line-bottom text-right"><spring:message code="comUssOlhFaq.faqVO.inqireCo" /></th>
									<td class="col-sm-10 line-bottom"><c:out value="${result.inqireCo}"/></td>
								</tr>
								<!-- 질문 내용 -->
								<tr>
									<th class="col-sm-2 line-bottom text-right"><spring:message code="comUssOlhFaq.faqVO.qestnCn" /></th>
									<td class="col-sm-10 line-bottom">										
										<textarea class="form-control" rows="5" style="resize: none" disabled>${result.qestnCn}</textarea>
									</td>
								</tr>
								<!-- 답변 내용 -->
								<tr>
									<th class="col-sm-2 line-bottom text-right"><spring:message code="comUssOlhFaq.faqVO.answerCn" /></th>
									<td class="col-sm-10 line-bottom">
										<textarea class="form-control" id="answer" rows="15" style="resize:none;" disabled>${result.answerCn}</textarea>
									</td>
								</tr>
								<!-- 등록일자 -->
								<tr>
									<th class="col-sm-2 line-bottom text-right"><spring:message code="table.regdate" /></th>
									<td class="col-sm-10 line-bottom"><c:out value="${result.frstRegisterPnttm}"/></td>
								</tr>
								<!-- 첨부파일  -->
								<c:if test="${not empty result.atchFileId}">
								<tr>
									<th class="col-sm-2 line-bottom text-right"><spring:message code="comUssOlhFaq.faqVO.atchFile" /></th>
									<td class="col-sm-10 line-bottom">
										<c:import url="/cmm/fms/selectFileInfs.do" charEncoding="utf-8">
										<c:param name="param_atchFileId" value="${result.atchFileId}" />
									</c:import>
									</td>
								</tr>
							  	</c:if>
								
							</tbody>
						</table>				
					</div>
				</div>				
					<div class="card-footer">
						<!-- 하단 버튼 -->												
							
							<div class="row">
								<div class="col-sm-6 text-left">
									<!-- 목록 버튼 -->						
									<a href="<c:url value='/mapo/selectFaqList.do' />" class="btn btn-outline-primary" title="<spring:message code="title.list" /> <spring:message code="input.button" />">목록</a>
								</div>
								
								<c:if test="${loginVO.groupId == 'GROUP_00000000000000'}">					
								<div class="col-sm-6 text-right">
									<!-- 수정 버튼 -->
									<input type="submit" class="btn btn-info" value="<spring:message code="button.update" />" title="<spring:message code="title.update" /> <spring:message code="input.button" />" />
															
									<!-- 삭제 버튼 -->
									<a href="<c:url value='/mapo/deleteFaq.do' />" class="btn btn-secondary" onClick="fn_egov_delete_faq('<c:out value="${result.faqId}"/>'); return false;"  title="<spring:message code="button.delete" /> <spring:message code="input.button" />">삭제</a>								
							</div>
							</c:if>
						</div>
					</div>
					
					<input name="faqId" type="hidden" value="<c:out value="${result.faqId}" />">
					<input name="cmd" type="hidden" value="">										
				</form>
			</div>
		</div>
	</div>
</div>

<script type="text/javascript">
$(document).ready(function() {

	// 왼쪽 메뉴 아이콘 활성화
	$("#menuFaq").addClass("active");

});

/* ********************************************************
 * 삭제처리
 ******************************************************** */
 function fn_egov_delete_faq(faqId){
	if(confirm("<spring:message code="common.delete.msg" />")){	
		// Delete하기 위한 키값을 셋팅
		document.faqForm.faqId.value = faqId;	
		document.faqForm.action = "<c:url value='/mapo/deleteFaq.do'/>";
		document.faqForm.submit();	
	}	
}
	
</script>
</body>
</html>

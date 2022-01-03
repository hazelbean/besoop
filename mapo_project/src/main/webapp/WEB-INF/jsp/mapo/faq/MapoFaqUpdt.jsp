<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="validator" uri="http://www.springmodules.org/tags/commons-validator"%>
<%
 /**
  * @ Class Name 	: MapoFaqUpdt.jsp
  * @ Description 	: MapoFaqUpdt 화면
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
<link   rel="stylesheet" type="text/css" href="<c:url value="/css/bootstrapthema/vendor/fontawesome-free/css/all.min.css"/>">
<link   href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i" rel="stylesheet">

<!-- Custom styles for this template-->
<link rel="stylesheet" href="<c:url value="/css/bootstrapthema/css/sb-admin-2.min.css"/>">

<!-- 공통 CSS 호출 -->
<link rel="stylesheet" href="<c:url value="/css/mapo/custom.css"/>">

<!-- Font-Awesome 5 호출 -->
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.8.2/css/all.min.css"/>

<!-- favicon -->
<link rel="shortcut icon" type="image/x-icon" href="<c:url value="/css/mapo/favicon.ico"/>">

<script type="text/javascript" src="<c:url value='/js/egovframework/com/cmm/fms/EgovMultiFiles.js'/>" ></script>
<script type="text/javascript" src="<c:url value="/validator.do"/>"></script>
<validator:javascript formName="faqVO" staticJavascript="false"	xhtml="true" cdata="false" />

</head>

<body id="page-top" onLoad="fn_egov_init();">

<!-- javascript warning tag  -->
<noscript class="noScriptTitle">	<spring:message code="common.noScriptTitle.msg" />	</noscript>



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
            <p class="pageTitle">| FAQ 수정</p>
          </div>
        </div>


		<!-- 상단타이틀 -->
		<form:form commandName="faqVO" action="${pageContext.request.contextPath}/mapo/updateFaq.do" method="post" onSubmit="fn_egov_updt_faq(document.forms[0]); return false;" enctype="multipart/form-data">
		<div class="card">
                    
          <div class="card-body">
		
			<!-- 수정폼 -->
			<div class="table-responsive">
			<table class="table table-borderless" summary="<spring:message code="common.summary.update" arguments="${pageTitle}" />">
			
				<colgroup>
					<col style="width:;">
					<col style="width:;">
				</colgroup>
				<tbody>
					<!-- 입력 -->
					<c:set var="inputTxt"><spring:message code="input.input" /></c:set>
					<!-- 질문 제목   -->
					<c:set var="title"><spring:message code="comUssOlhFaq.faqVO.qestnSj"/> </c:set>
					<tr>
						<th class="col-sm-2 line-bottom text-right"><span class="pilsu">* </span><label for="qestnSj">${title}</label></th>
						<td class="col-sm-10 line-bottom">
						    <form:input path="qestnSj" title="${title} ${inputTxt}" maxlength="70" class="form-control" />
			   				<div><form:errors path="qestnSj" cssClass="error" /></div>     
						</td>
					</tr>
			
					<!-- 질문 내용  -->
					<c:set var="title"><spring:message code="comUssOlhFaq.faqVO.qestnCn"/> </c:set>
					<tr>
						<th class="col-sm-2 line-bottom text-right"><span class="pilsu">* </span><label for="qestnCn">${title }</label></th>
						<td class="col-sm-10 line-bottom" colspan="3">
							<form:textarea path="qestnCn" title="${title} ${inputTxt}" rows="5" class="form-control" style="resize:none" />   
							<div><form:errors path="qestnCn" cssClass="error" /></div>  
						</td>
					</tr>
			
					<!-- 답변 내용  -->
					<c:set var="title"><spring:message code="comUssOlhFaq.faqVO.answerCn"/> </c:set>
					<tr>
						<th class="col-sm-2 line-bottom text-right"><span class="pilsu">* </span><label for="answerCn">${title }</label></th>
						<td class="col-sm-10 line-bottom" colspan="3">
							<form:textarea path="answerCn" title="${title} ${inputTxt}" rows="15" class="form-control" style="resize:none" />   
							<div><form:errors path="answerCn" cssClass="error" /></div>  
						</td>
					</tr>
			
					<!-- 첨부파일 -->
					<c:set var="title"><spring:message code="comUssOlhFaq.faqVO.atchFile"/></c:set>
					<tr>
						<th class="col-sm-2 line-bottom text-right"><label for="file_1">${title}</label> </th>
						<td class="col-sm-10 line-bottom">
						<!-- 첨부목록을 보여주기 위한 -->
						<c:if test="${not empty faqVO.atchFileId}">
							<c:import charEncoding="utf-8" url="/cmm/fms/selectFileInfsForUpdate.do" >
								<c:param name="param_atchFileId" value="${faqVO.atchFileId}" />
							</c:import>		
						</c:if>
						
					    <!-- attached file Start -->
						 <div class="custom-file col-sm-9">
							<!-- <input type="file" multiple name="file_1" id="egovComFileUploader"> -->
							<input name="file_1" id="egovComFileUploader" type="file" class="custom-file-input" multiple/>
                 			<label class="custom-file-label" for="egovComFileUploader" value=""> 첨부할 파일을 선택하세요</label>
							<div id="egovComFileList"></div>
						</div>
						<!-- attached file End -->
						
						</td>
					</tr>
			
				</tbody>
			</table>
			</div>
		</div>
		</div>
		
		<div class="card-footer">
        	<div class="row">
				<!-- 하단 버튼 -->
				<div class="col-sm-6 text-left">    			
				<!-- 목록 버튼 --> 
				<a href="<c:url value='/mapo/selectFaqList.do'  />" class="btn btn-outline-primary" title="<spring:message code="button.list" /> <spring:message code="input.button" />"><spring:message code="button.list" /></a>
				</div>	
				<div class="col-sm-6 text-right">			
				<!-- 수정 버튼 -->  
				<input type="submit" class="btn btn-info" value="<spring:message code="button.update" />" title="<spring:message code="button.update" /> <spring:message code="input.button" />" />
				</div>
			</div>
		</div>
			<input name="pageIndex" type="hidden" value="<c:out value='${searchVO.pageIndex}'/>" />
			<input name="faqId" type="hidden" value="${faqVO.faqId}">
		</form:form>
		</div>
	</div>
</div>

<script type="text/javascript">
$(document).ready(function() {
	
	// 왼쪽 메뉴 아이콘 활성화
	$("#menuFaq").addClass("active");
	
});

/* ********************************************************
 * 초기화
 ******************************************************** */
function fn_egov_init() {
	
	//------------------------------------------
	//------------------------- 첨부파일 수정 Start
	//-------------------------------------------
	var maxFileNum = 3
	var multi_selector = new MultiSelector( document.getElementById( 'egovComFileList' ), maxFileNum);
	multi_selector.addElement( document.getElementById( 'egovComFileUploader' ) );
	//------------------------- 첨부파일 수정 End
	
	// 첫 입력란에 포커스..
	document.getElementById("faqVO").qestnSj.focus();
}
/* ********************************************************
 * 저장처리화면
 ******************************************************** */
function fn_egov_updt_faq(form) {
	
	var resultExtension = EgovMultiFilesChecker.checkExtensions("egovComFileUploader", "<c:out value='${fileUploadExtensions}'/>"); // 결과가 false인경우 허용되지 않음
	if (!resultExtension) return true;
	var resultSize = EgovMultiFilesChecker.checkFileSize("egovComFileUploader", <c:out value='${fileUploadMaxSize}'/>); // 파일당 1M까지 허용 (1K=1024), 결과가 false인경우 허용되지 않음
	if (!resultSize) return true;
	
	if (!validateFaqVO(form)) {
		return false;
	} else {
		if (confirm("<spring:message code="common.update.msg" />")) {
			form.submit();
		}
	}
}
/* ********************************************************
 * 목록 으로 가기
 ******************************************************** */
function fn_egov_inqire_faqlist() {
	faqVO.action = "<c:url value='/uss/olh/faq/selectFaqList.do'/>";
	faqVO.submit();
}

/* ********************************************************
* 첨부파일
******************************************************** */
$("#egovComFileUploader").on('change', function(){  
  $(this).next('.custom-file-label').html(event.target.files[0].name);
});
</script>

</body>
</html>

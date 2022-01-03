<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" 	uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="ui"  uri="http://egovframework.gov/ctl/ui" %>
<%@ taglib prefix="fn" 	uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%
 /**
  * @ Class Name 	: TestMgmt.jsp
  * @ Description 	: TestMgmt 화면
  * @ Modification Information
  * @
  * @  수정일             	 수정자              수정내용
  * @ -----------  --------    ---------------------------
  * @ 2021.08.10 	서지혜              최초 생성
  *
  *
  *  
  */
%>

<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

<title>테스트 등록/수정</title>

<!-- 부트스트랩 CSS 호출 -->
<link rel="stylesheet" href="<c:url value="/css/bootstrap/css/bootstrap.min.css"/>">

<!-- 공통 CSS 호출 -->
<link rel="stylesheet" href="<c:url value="/css/mapo/custom.css"/>">

<!-- 부트스트랩 Script 호출 -->
<script src="<c:url value="/js/mapo/jquery-3.6.0.min.js"/>"></script>
<script src="<c:url value="/css/bootstrap/js/bootstrap.min.js"/>"></script>
<script src="<c:url value="/js/mapo/js/bootstrap-datepicker.js"/>"></script>
<script src="<c:url value="/js/mapo/js/bootstrap-datepicker.ko.js"/>"></script>


<script type="text/javascript">
$(document).ready(function() {
	$("#idx").attr("readonly", true);
	$("#wirterNm").attr("readonly", true);
	$("#indate").attr("readonly", true);
	

	
	// 첨부파일
	$("#egovComFileUploader").on('change', function(){	
		$(this).next('.custom-file-label').html(event.target.files[0].name);

	});
	

});




function goTestList() {
	location.href = "<c:url value='/mapo/sample/TestList.do'/>";
}

/* 글 등록 */
function testAdd() {
	
	if($("#title").val() == '') {
		alert("제목을 입력하세요");
		$("#title").focus();
		
		return;
	}
	
	if($("#contents").val() == '') {
		alert("내용을 입력하세요");
		$("#contents").focus();
		
		return;
	}
	
	
	if(!confirm("등록하시겠습니까?")) {
		return;
	}
	
	document.form1.action = "<c:url value='/mapo/sample/TestMgmt.do'/>?mode=add";
	
	document.form1.submit();
}


/* 글 수정 */
function testMod() {
	
	if($("#title").val() == '') {
		alert("제목을 입력하세요");
		$("#title").focus();
		
		return;
	}
	
	if($("#contents").val() == '') {
		alert("내용을 입력하세요");
		$("#contents").focus();
		
		return;
	}
	
	
	if(!confirm("등록하시겠습니까?")) {
		return;
	}
	
	document.form1.action = "<c:url value='/mapo/sample/TestMgmt.do'/>?mode=mod";
	
	document.form1.submit();
}
	
</script>
</head>

<body>
	<div class="container col-auto">
		<br>
		<p class="pageTitle">| 테스트 등록/수정</p>

		<div class="card">
			<div class="card-header">
				<label for="" >안녕하세요</label>			
			</div>
			
		
			<div class="card-body">	
				<!-- form 이벤트	 -->
				<form id="form1" name="form1" method="post" enctype="Multipart/form-data" action="">		
					<div class="form-group row">
						<label for="idx" class="col-sm-2 col-form-label">게시물아이디 : </label>
						<div class="col-sm-10">
							<input type="text" class="form-control" id="idx" name="idx" placeholder="자동발급" value="${testVO.idx }">
						</div>
					</div>
					<div class="form-group row">
						<label for="title" class="col-sm-2 col-form-label">제목 : </label>
						<div class="col-sm-10">
							<input type="text" class="form-control" id="title" name="title" placeholder="제목을 입력하세요" maxlength="100"  value="${testVO.title }">
						</div>
					</div>
					<div class="form-group row">
						<label for="writer" class="col-sm-2 col-form-label">등록자/등록일 : </label>
						<div class="col-sm-10 form-inline">
							<input type="hidden" class="form-control" id="writer" name="writer" placeholder="등록자를 입력하세요" maxlength="15" value="${testVO.writer }">					
							<input type="text" class="form-control" id="wirterNm" name="writerNm" placeholder="등록자를 입력하세요" maxlength="15" value="${testVO.writerNm }">
							<input type="text" class="form-control" id="indate" name="indate" placeholder="등록일을 입력하세요" maxlength="10" value="${testVO.indate }">
						</div>
					</div>
					<div class="form-group row">
						<label for="writer" class="col-sm-2 col-form-label">내용 : </label>
						<div class="col-sm-10">
							<textarea id="contents" name="contents" class="form-control" rows="5" style="resize:none" maxlength="1000" >${testVO.contents }</textarea>
						</div>
					</div>
					<div class="form-group row">
						<!-- 첨부파일 -->
						<label for="writer" class="col-sm-2 col-form-label">첨부파일 : </label>
						<div class="col-sm-10">				
							<div class="input-group mb-3">						  
							  <div class="custom-file">							
							  <!--   <input type="file" class="custom-file-input" id="fileName" name="fileName" aria-describedby="inputGroupFileAddon01">
							    <label class="custom-file-label" for="inputGroupFile01">첨부할 파일을 선택하세요</label> -->
							    <input name="file_1" id="egovComFileUploader" class="custom-file-input" type="file" multiple/><!-- 첨부파일명 입력 -->
								<label class="custom-file-label" for="egovComFileUploader">첨부할 파일을 선택하세요</label>
								<div id="egovComFileList"></div>
							  </div>
							</div>
						</div>
					</div>
				</form>
				<br>
			
			</div>
			<div class="card-footer">
				<c:if test = "${empty testVO.idx}">
					<button type="button" class="btn btn-outline-secondary" onclick="testAdd()">등록</button>
				</c:if>
				<c:if test = "${!empty testVO.idx}">
					<button type="button" class="btn btn-outline-secondary" onclick="testMod()">수정</button>
				</c:if>				
				<button type="button" class="btn btn-outline-secondary" onclick="goTestList()">취소</button>
			</div>
		</div>
	</div>
</body>
</html>
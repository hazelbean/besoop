<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" 	uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="ui"  uri="http://egovframework.gov/ctl/ui" %>
<%@ taglib prefix="fn" 	uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%
	pageContext.setAttribute("crcn", "\r\n");  	// Space, Enter
	pageContext.setAttribute("br", "<br/>");	// br 태그
%>
<%
 /**
  * @ Class Name 	: TestView.jsp
  * @ Description 	: TestView 화면
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

<script>

function goTestList() {
	location.href = "<c:url value='/mapo/sample/TestList.do'/>";
}

function testReply() {
	
	if($("#writer").val() == '') {
		alert("작성자를 입력하세요");
		$("#writer").focus();
		
		return;
	}
	
	if($("#reply").val() == '') {
		alert("댓글을 입력하세요");
		$("#reply").focus();
		
		return;
	}

	
	if(!confirm("댓글을 작성하시겠습니까?")) {
		return;
	}
	

	//document.form2.action = "<c:url value='/mapo/sample/TestReply.do'/>?idx=${testVO.idx}";
	//document.form2.submit();
	
	
	/* 댓글 ajax 처리 */
	var formData = $("#form2").serialize();
	
	var url = "<c:url value='/mapo/sample/TestReply.do'/>?idx=${testVO.idx}";
	
	console.log(url);
	
	$.ajax({
		type: "POST",
		data: formData,
		url: url,
		dataType: "text",				// 리턴타입
		success: function(data) {		// controller -> "ok", "fail"
			if(data == "ok") {
				alert("저장완료");
				location="<c:url value='/mapo/sample/TestView.do'/>?idx=${testVO.idx}";
			} else {
				alert("저장실패");
			}
		},
		error: function() {
			alert("오류발생");
			
		}	
	});
}


function testMod() {
	location.href = "<c:url value='/mapo/sample/TestMgmt.do'/>?idx=${testVO.idx}";
}


function testDel() {
	
	if( ${fn:length(resultList)} > 0 ) {
		alert("댓글이 있는 글은 삭제할 수 없습니다");
		return;
	}
	
	if(!confirm("삭제하시겠습니까?")) {
		return;
	}
	
	console.log(${testVO.idx});
	
	
	document.form1.action = "<c:url value='/mapo/sample/TestMgmt.do'/>?mode=del&idx=${testVO.idx}";

	document.form1.submit();

}

/* 첨부파일 다운로드 */
/* function getfile(filename){
	location.href = "<c:url value='/mapo/sample/fileGet.do'/>?filename="+filename;
} */
	
</script>


</head>

<body>
	<div class="container col-auto">
		<br>
		<p class="pageTitle">| 테스트 상세화면</p>

		<div class="card">
			<div class="card-header">
				<label for="" >${loginVO.name } 님 로그인 하셨습니다</label>			
			</div>			
		
			<div class="card-body">		
				<form id="form1" name="form1" method="post"  action="">				
					<div class="form-group row">
						<label for="idx" class="col-sm-2 col-form-label">게시물아이디 : </label>
						<div class="col-sm-10 col-form-label">
							${testVO.idx }
						</div>
					</div>
					<div class="form-group row">
						<label for="title" class="col-sm-2 col-form-label">제목 : </label>
						<div class="col-sm-10 col-form-label">
							${testVO.title }
						</div>
					</div>
					<div class="form-group row">
						<label for="writer" class="col-sm-2 col-form-label">등록자/등록일 : </label>
						<div class="col-sm-10 form-inline col-form-label">
							${testVO.writerNm } / ${testVO.indate } 
						</div>
					</div>
					<div class="form-group row">
						<!-- 내용 줄 바꿈(개행) 처리 -->
						<label for="writer" class="col-sm-2 col-form-label">내용 : </label>
						<div class="col-sm-10 col-form-label">
							${fn:replace(testVO.contents, crcn, br) }
						</div>
					</div>
					<div class="form-group row">
						<!-- 첨부파일 보이기 -->
						<%-- <label for="writer" class="col-sm-2 col-form-label">파일: </label>
						<div class="col-sm-10 col-form-label">
							<a href="javascript:getfile('${testVO.filename}');"><c:out value="${testVO.filename}" escapeXml="false"/></a>
						</div> --%>
						<!-- 첨부파일 보이기 -->
						<label for="writer" class="col-sm-2 col-form-label">파일1: </label>
						<div class="col-sm-10 col-form-label">
							<c:import url="/cmm/fms/selectFileInfs.do" charEncoding="utf-8">
							<c:param name="param_atchFileId" value="${testVO.atchFileId}" /><%--  ${result.atchFileId}  FILE_000000000000001--%>
							</c:import>
						</div>
						
					</div>
				</form>
				<br>
			
			</div>
			<div class="card-footer">
				<!-- 로그인한 유저와 작성자가 동일한 경우에만 수정/삭제 버튼 보이게 수정 -->
				<%-- <c:if test="${(testVO.writer !='' || testVO.writer ne null) && (loginVO.id eq testVO.writer)}"> --%>
				<c:if test="${!empty testVO.writer && (loginVO.id eq testVO.writer)}">
					<button type="button" class="btn btn-outline-info" onclick="testMod()">수정</button>
					<button type="button" class="btn btn-outline-danger" onclick="testDel();">삭제</button>
			 	</c:if> 
				<button type="button" class="btn btn-outline-secondary" onclick="goTestList();">목록</button>
			</div>
		</div>
		
		<hr>
		
		<!-- 댓글 -->	
			<div class="card">
				<!-- 댓글 리스트 출력 : 작성자/작성일/내용 -->
				<c:forEach var="result" items="${resultList}" varStatus="status">
					<div class="card-header">${result.writerNm } / ${result.indate } 
						<br> 
						${fn:replace(result.reply, crcn, br) }
					</div>
				</c:forEach>					
			</div>	
		
		<br>
		<div class="card">
			<div class="card-header">
			<form id="form2" name="form2" method="post"  action="">		
					<div class="form-group row">
						<label for="writer" class="col-sm-2 col-form-label">작성자/작성일 : </label>
						<div class="col-sm-10 form-inline">
							<input type="hidden" class="form-control" id="writer" name="writer" placeholder="작성자를 입력하세요" maxlength="15" value="${loginVO.id }">
							<input type="text" class="form-control" id="writerNm" name="writerNm" placeholder="작성자를 입력하세요" maxlength="15" value="${loginVO.name }">
							<%-- <input type="text" class="form-control" id="indate" name="indate" placeholder="작성일을 입력하세요" maxlength="10" readonly value="${strToday }"> --%>
						</div>
					</div>
					<div class="form-group row">
						<label for="writer" class="col-sm-2 col-form-label">댓글 : </label>
						<div class="col-sm-10">
							<textarea id="reply" name="reply" class="form-control" rows="2" style="resize:none" maxlength="300"></textarea>
						</div>
					</div>
					<button type="button" class="btn btn-outline-secondary" onclick="testReply()">작성</button>
					* 댓글은 수정/삭제 불가합니다
			</form>
			</div>
		</div>
		
		<br>
	</div>

</body>
</html>
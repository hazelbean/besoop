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
  * @ Class Name 	: TestList.jsp
  * @ Description 	: TestList 화면
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

<title>테스트 페이지</title>

<!-- 부트스트랩 CSS 호출 -->
<link rel="stylesheet" href="<c:url value="/css/bootstrap/css/bootstrap.min.css"/>">

<!-- 공통 CSS 호출 -->
<link rel="stylesheet" href="<c:url value="/css/mapo/custom.css"/>">

<!-- 부트스트랩 Script 호출 -->
<script src="<c:url value="/js/mapo/jquery-3.6.0.min.js"/>"></script>
<script src="<c:url value="/css/bootstrap/js/bootstrap.min.js"/>"></script>

<!-- Font-Awesome 5 호출 -->
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.8.2/css/all.min.css"/>
  
<script>
$( document ).ready(function() {

});
	

/* 등록/수정 화면으로 이동 */
function goTestMgmt() {
	location.href = "<c:url value='/mapo/sample/TestMgmt.do'/>";
}

/* 리스트 화면으로 이동 */
function goTestView(idx) {
	location.href="<c:url value='/mapo/sample/TestView.do'/>?idx="+idx;
}

/* ID 체인지 이벤트 */
function setPwd(user_id){
	
	if ( user_id == "admin" ) {
		$("#password").val("1234");
		
	} else if ( user_id == "guest" ) {
		$("#password").val("guest");
		
	} else if ( user_id == "guest2" ) {
		$("#password").val("guest2");
	}
}

/* Validation 체크 */
function check() {
	
	if ( $("#user_id").val() == "" ) {
		alert("아이디를 입력하세요");
		return false;
	}
	
	if ( $("#password").val() == "" ) {
		alert("비밀번호를 입력하세요");
		return false;
	}
}
	
function out() {
	location.href="<c:url value='/mapo/sample/logout.do'/>";
}

/* 페이지 처리 함수 */
function linkPage(pageNo){
   /*  document.listForm.searchCondition.value = "1";
    document.listForm.pageIndex.value = pageNo; */
   /*  document.listForm.action = "<c:url value='/uat/uap/selectLoginPolicyList.do'/>"; */
   	location.href="<c:url value='/mapo/sample/TestList.do'/>?pageIndex="+pageNo;
    /* document.listForm.submit(); */
}

</script>

</head>

<body>
	<div class="container col-auto">
		<br>
		<p class="pageTitle">| 테스트 리스트 화면</p>
		<div class="card">
			<div class="card-header">
				<c:if test="${loginVO.name == null}">
				<form class="form-inline" method="post" action="<c:url value='/mapo/sample/TestLogin.do'/>">				
					<div class="form-group">
						<label for="user_id" class="col-auto">ID</label>
						<select name="user_id" id="user_id" class="form-control col-auto" onchange="setPwd(this.value)">
							<option value="">선택하세요</option>
							<option value="admin">관리자</option>
							<option value="guest">사용자</option>
							<option value="guest2">사용자2</option>
						</select>
					</div>
					<div class="form-group">
						<label for="password" class="col-auto">Password</label>
						<input type="password" class="form-control col-auto" id="password" name="password">
						<button type="submit" class="btn btn-outline-primary"  style="margin-left:8px;" onclick="return check()">로그인</button>
					</div>	
				</form>
			</c:if>	
			
			<c:if test="${loginVO.name != null }">
				${loginVO.name} 님 환영합니다.
				<button type="button" class="btn btn-outline-info" onclick="out();">로그아웃</button>
			</c:if>
			</div>
			
			<!-- 테이블 -->
			<div class="card-body">
				<!-- 검색 조건 & 검색 버튼-->
				<form class="form-inline" method="post" action="<c:url value='/mapo/sample/TestList.do'/>">
					<div class="form-group">
						<label for="searchkeyword" class="col-auto">제목(내용) : </label>
						<input type="text" class="form-control" id="searchkeyword" name="searchkeyword">
					</div>									
						<button type="submit" class="btn btn-outline-info" style="margin-left:8px;">검색</button>			
				</form>
				<br>
				
				<div class="table-responsive">
					<table class="table table-hover">
						<thead>
							<tr>
								<th scope="col">번호</th>
								<th scope="col">제목</th>
								<th scope="col">조회수</th>
								<th scope="col">댓글수</th>
								<th scope="col">파일</th>
								<th scope="col">등록자</th>
								<th scope="col">등록일</th>
							</tr>
						</thead>
						<tbody>
							<!-- 게시글 리스트 -->
							<c:forEach var="result" items="${resultList}" varStatus="status">	
								<tr>													
										<td><a href="javascript:goTestView('${result.idx}')">${result.idx}</a></td>
										<td><a href="javascript:goTestView('${result.idx}')">${result.title}</a></td>
										<td>${result.count}</td>
										<td>${result.reply}</td>
										<td>
											<c:if test="${result.filename ne null}">
												<i class="far fa-file-alt"></i>
											</c:if>		 									
										</td>
										<td>${result.writerNm}</td>
										<td>${result.indate}</td>							
								</tr>
							</c:forEach>
						</tbody>
					</table>
				</div>
			</div>
			<!-- 페이징 처리 -->
			<%-- <c:if test="${!empty loginPolicyVO.pageIndex }"> --%>
			<div class="pagination">		
				 <ul class="pagination">
					<ui:pagination paginationInfo="${paginationInfo}" type="image" jsFunction="linkPage"/>
				</ul>			
			</div>
			<%-- </c:if> --%>

			<div class="card-footer">
				<c:if test="${!empty loginVO.name}">
					<button type="button" class="btn btn-primary" onclick="goTestMgmt()">등록</button>
				</c:if>
			</div>
		</div>

			
	</div>
</body>
</html>
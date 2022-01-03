<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" 	uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="ui"  uri="http://egovframework.gov/ctl/ui" %>
<%@ taglib prefix="fn" 	uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<!-- 부트스트랩 -->
<link rel="stylesheet" href="/css/bootstrap/bootstrap/css/bootstrap.min.css">
<script src="/js/mapo/jquery-3.6.0.min.js"></script>
<script src="/css/bootstrap/bootstrap/js/bootstrap.min.js"></script>

<title>샘플 리스트 테스트</title>
</head>
<body>
	<div class="container">
		<div class="row">
			<table class="table table-striped" style="text-align:center; border:1px solid #dddddd">
				<thead>
					<tr>
						<th style="background-color:#eeeeee; text-align:center;">번호</th>
						<th style="background-color:#eeeeee; text-align:center;">제목</th>
						<th style="background-color:#eeeeee; text-align:center;">작성자</th>
						<th style="background-color:#eeeeee; text-align:center;">작성일</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach var="resultInfo" items="${result}" varStatus="status">
						<tr>
							<form name="subForm" action="<c:url value='mapo/sample/SampleList.do'/>" method="post">
								<input name="nttId" type="hidden" value="<c:out value="${resultInfo.nttId}"/>">
								<input name="nttId" type="hidden" value="<c:out value="${resultInfo.bbsId}"/>">		
								<td><c:out value='${resultInfo.nttId}'/></td>			
								<td><c:out value='${resultInfo.nttSj}'/></td>			
								<td><c:out value='${resultInfo.frstRegisterId}'/></td>			
								<td><c:out value='${resultInfo.frstRegisterPnttm}'/></td>			
							</form>
						</tr>
					</c:forEach>
				</tbody>
			</table>
			
			<div class="btn btn-primary pull-right">
				<span><a href="<c:url value='/mapo/sample/SampleRegister.do?bbsId=${searchVO.bbsId}'/>">글쓰기</a></span>
			</div>			
		</div>
	</div>
</body>
</html>
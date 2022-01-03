<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" 	uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="ui"  uri="http://egovframework.gov/ctl/ui" %>
<%@ taglib prefix="fn" 	uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>


<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>샘플 등록 화면</title>
</head>
<body>
	<div class="container">
		<div class="row">
			<form:form commandName="articleVO" action="${pageContext.request.contextPath}/mapo/sample/SampleRegister.do" method="post" enctype="multipart/form-data">
			
				<table class="table table-striped" style="text-align:center; border:1px solid #dddddd">
					<thead>
						<tr>
							<th colspan="2" style="background-color:#eeeeee; text-align:center;">게시판 글쓰기 양식</th>
						</tr>
					</thead>
					<tbody>
						<tr>
							<td><form:input path="nttSj" class="form-control" placeholder="글 제목" name="nttsj" maxlength="50" /></td>
						</tr>
						<tr>
							<td><form:textarea path="nttCn" class="form-control" placeholder="글 내용" name="nttCn" maxlength="2048" style="height:350px;"/></td>
						</tr>
					</tbody>
				</table>
				<span><input type="submit" class="btn btn-primary pull-right" value="글쓰기"/></span>
				<input type="hidden" name="bbsId" value="<c:out value='${articleVO.bbsId}'/>">
			</form:form>
		</div>
	</div>

</body>
</html>
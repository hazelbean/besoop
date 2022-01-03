<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" 	uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="ui"  uri="http://egovframework.gov/ctl/ui" %>
<%@ taglib prefix="fn" 	uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%
 /**
  * @ Class Name 	: code404.jsp
  * @ Description 	: code404 화면
  * @ Modification Information
  * @
  * @  수정일             	 수정자              수정내용
  * @ -----------  --------    ---------------------------
  * @ 2021.09.13 	서지혜              최초 생성
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
  	<link 	href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i" rel="stylesheet">

    <!-- Custom styles for this template-->
	<link href="<c:url value='/css/egovframework/com/sb-admin-2.min.css' />" rel="stylesheet" type="text/css" />

	

<script language="javascript">
function fncGoAfterErrorPage(){
    history.back(-2);
}
</script>
</head>


<body id="page-top">
	<!-- Page Wrapper -->
<div id="wrapper">

	<!-- Content Wrapper -->
	<div id="content-wrapper" class="d-flex flex-column" style="height:100vh;">
		<div id="content" style="margin-top:12%;">		<!--  height: 100%; display: flex; align-items: center; -->		
			<!-- 404 Error Text -->
             <div class="text-center col-sm-12">
                 <div class="error mx-auto" data-text="500">500</div>
                 <p class="lead text-gray-800 mb-5">HTTP 500 Error</p>
                 <p class="text-gray-500 mb-0">It looks like you found a glitch in the matrix...</p>
                 <p class="text-gray-500 mb-1">HTTP 500 Internal Server error.</p>
                 <a href="javascript:fncGoAfterErrorPage();">&larr; Back to Page</a>
             </div>				
		</div>
	</div>
</div>
</body>

</html>
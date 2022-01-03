<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"  %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="validator" uri="http://www.springmodules.org/tags/commons-validator" %>
<%
 /**
  * @ Class Name 	: MapoUserInsert.jsp
  * @ Description 	: MapoUserInsert 화면
  * @ Modification Information
  * @
  * @  수정일             	 수정자              수정내용
  * @ -----------  --------    ---------------------------
  * @ 2021.09.08 	서지혜              최초 생성
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
<link rel="stylesheet" href="<c:url value="/css/bootstrapthema/css/sb-admin-2.css"/>">

<!-- 공통 CSS 호출 -->
<link rel="stylesheet" href="<c:url value="/css/mapo/custom.css"/>">

<!-- favicon -->
<link rel="shortcut icon" type="image/x-icon" href="<c:url value="/css/mapo/favicon.ico"/>">

</head>

<body id="page-top">

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
            <p class="pageTitle">| 사용자 등록</p>
          </div>
        </div>

	<form:form commandName="userManageVO" action="${pageContext.request.contextPath}/mapo/MapoUserInsert.do" name="userManageVO" method="post" onSubmit="fnInsert(document.forms[0]); return false;"> 

	 <div class="card">  
         <div class="card-body">
         <div class="table-responsive">
		
		<!-- 등록폼 -->
		<table class="table table-borderless" summary="<spring:message code="common.summary.list" arguments="${pageTitle}" />">
		
		<colgroup>
			<col style="width: ;"><col style="width: ;">
		</colgroup>
		
		<tbody>
			<!-- 입력/선택 -->
			<c:set var="inputTxt"><spring:message code="input.input" /></c:set>
			<c:set var="inputSelect"><spring:message code="input.cSelect" /></c:set>
			<c:set var="inputSelect"><spring:message code="input.select"/></c:set>
			
			<!-- 사용자 아이디 -->
			<c:set var="title"><spring:message code="comUssUmt.deptUserManageRegist.id"/></c:set>
			<tr>
				<th class="col-sm-2 line-bottom text-right"><span class="pilsu">* </span><label for="emplyrId">아이디</label></th>
				<td class="col-sm-10 line-bottom">
					<div class="row">
						<form:input path="emplyrId" class="form-control w-25 mr-1" id="emplyrId" title="${title} ${inputTxt}" readonly="true" maxlength="20"/>
						
						<!-- 중복 아이디 검색 (중복확인) -->
						<%-- <button id="btnEmplyrId" class="btn btn-info btn-sm" data-toggle="modal" data-target="#idChkModal"  title="<spring:message code="button.delete" /> <spring:message code="input.button" />">중복 아이디 검색</button>	 --%>				
						<button type="button" id="btnEmplyrId" class="btn btn-info btn-sm" data-toggle="modal" data-target="#idChkModal"  title="<spring:message code="button.delete" /> <spring:message code="input.button" />">중복 아이디 검색</button>
					</div>
						<div><form:errors path="emplyrId" class="error-text text-primary"/></div>
				</td>
			</tr>
			
			<!-- 사용자 이름 -->
			<c:set var="title"><spring:message code="comUssUmt.deptUserManageRegist.name"/></c:set>
			<tr>
				<th class="col-sm-2 line-bottom text-right"><span class="pilsu">* </span><label for="emplyrNm">성명</label></th>
				<td class="col-sm-10 line-bottom">
					<div class="row">
						<form:input path="emplyrNm" class="form-control w-25" title="${title} ${inputTxt}" size="50" maxlength="60" />				
					</div>
					<div><form:errors path="emplyrNm" class="error-text text-primary" /></div> 
				</td>
			</tr>
			<!-- 비밀번호 -->
			<c:set var="title"><spring:message code="comUssUmt.deptUserManageRegist.pass"/></c:set>
			<tr>
				<th class="col-sm-2 line-bottom text-right"><span class="pilsu">* </span><label for="password">${title}</label></th>
				<td class="col-sm-10 line-bottom">
				<div class="row">				
				<%-- 	<form:password name="password" path="password" class="form-control w-25" title="${title} ${inputTxt}"  maxlength="20" />	 --%>
					<input name="password" id="password" path="password" class="form-control w-25" title="${title} ${inputTxt}" type="password" size="50" maxlength="20" />					
				</div>
				<div class="row">
					<form:errors path="password" class="error-text text-danger" />
				</div> 
					<div>
						<div><spring:message code="info.password.rule.password1" 	/> 
					 	<div><spring:message code="info.password.rule.pwdcheckcomb3" /></div> 
						<div><spring:message code="info.password.rule.pwdcheckseries" /></div>  
					</div>			
				</td>
			</tr>
			<!-- 비밀번호확인 -->
			<c:set var="title"><spring:message code="comUssUmt.deptUserManageRegist.passConfirm"/></c:set>
			<tr>
				<th class="col-sm-2 line-bottom text-right"><span class="pilsu">* </span><label for="password2">${title}</label></th>
				<td class="col-sm-10 line-bottom">
				<div class="row">
					<input name="password2" id="password2" class="form-control w-25" title="${title} ${inputTxt}" type="password" size="50" maxlength="20" />
				</div>
				</td>
			</tr>
			
			<!-- 소속그룹  orgnztId :  GROUP_ID   -->		
			<c:set var="title"><spring:message code="comUssUmt.deptUserManageRegist.groupId"/></c:set>
			<tr>
				<th class="col-sm-2 line-bottom text-right"><span class="pilsu">* </span><label for="groupId">소속그룹</label></th>
				<td class="col-sm-10 line-bottom">
	            <div class="row">       
	                    <form:select path="groupId" class="form-control w-25" id="groupId" title="${title} ${inputSelect}">
	                        <form:option value="" label="${inputSelect}"/>
	                        <form:options items="${groupId_result}" itemValue="code" itemLabel="codeNm"/>
	                    </form:select>
	            </div>        
	                    <div><form:errors path="groupId" class="error-text text-primary"/></div>
				</td>
			</tr>
			
			<!-- 소속과(분류) pstinstMidCode :  PSTINST_MID_CODE 테스트 -->		
			<c:set var="title"><spring:message code="comUssUmt.deptUserManageRegist.groupId"/></c:set>
			<tr>
				<th class="col-sm-2 line-bottom text-right"><span class="pilsu">* </span><label for="pstinstMidCode">소속과(분류)</label></th>
				<td class="col-sm-10 line-bottom">
	            <div class="row">       
	                    <form:select path="pstinstMidCode" class="form-control w-25" id="pstinstMidCode" title="${title} ${inputSelect}">
	                        <form:option value="" label="${inputSelect}"/>
	                        <form:options items="${pstinstMidCode_result}" itemValue="code" itemLabel="codeNm"/>
	                    </form:select>
	            </div>        
	                    <div><form:errors path="pstinstMidCode" class="error-text text-primary"/></div>
				</td>
			</tr>

			<!-- (마지막) 소속팀(기관) 코드 insttCode : PSTINST_CODE  -->
			<c:set var="title"><spring:message code="comUssUmt.deptUserManageRegist.insttCode"/></c:set>
			<tr>
				<th class="col-sm-2 line-bottom text-right"><span class="pilsu">* </span><label for="insttCode">소속팀(기관)</label></th>
				<td class="col-sm-10 line-bottom">
				<div class="row">
	                    <form:select path="insttCode" id="insttCode" class="form-control w-25" title="${title} ${inputSelect}">
	                       <form:option value="" label="${inputSelect}"/>
	                       <form:options items="${insttCode_result}" itemValue="code" itemLabel="codeNm"/>
	                    </form:select>
	            </div>
	                    <div><form:errors path="insttCode" class="error-text text-primary"/></div>	            
				</td>
			</tr>
			<!-- 권한 :  AUTHOR_CODE  -->		
			<c:set var="title"><spring:message code="comUssUmt.deptUserManageRegist.groupId"/></c:set>
			<tr>
				<th class="col-sm-2 line-bottom text-right"><span class="pilsu">* </span><label for="authorCode">사용권한</label></th>
				<td class="col-sm-10 line-bottom">
	            <div class="row">       
	                    <form:select path="authorCode" class="form-control w-25" id="authorCode" title="${title} ${inputSelect}">
	                        <form:option value="" label="${inputSelect}"/>
	                        <form:options items="${authorCode_result}" itemValue="code" itemLabel="codeNm"/>
	                    </form:select>
	            </div>        
	                    <div><form:errors path="authorCode" class="error-text text-danger"/></div>
				</td>
			</tr>
		
			
			
			<!-- 직위 -->
			<c:set var="title"><spring:message code="comUssUmt.deptUserManageRegist.ofcps"/></c:set>
			<tr>
				<th class="col-sm-2 line-bottom text-right"><label for="ofcpsNm">${title}</label></th>
				<td class="col-sm-10 line-bottom">
				<div class="row">
	                    <form:input path="ofcpsNm" id="ofcpsNm" class="form-control w-25" title="${title} ${inputTxt}" size="20" maxlength="50" />
	            </div>
	                    <div><form:errors path="ofcpsNm" class="error-text" /></div>
				</td>
			</tr>		
			
			<!-- 유선전화 -->
			<c:set var="title"><spring:message code="comUssUmt.deptUserManageRegist.tel"/></c:set>
			<tr>
				<th class="col-sm-2 line-bottom text-right"><label for="areaNo">유선전화</label><!--  <span class="pilsu">*</span> --></th>
				<td class="col-sm-10 line-bottom">
				<div class="row">
	                    <form:input path="areaNo" id="areaNo" class="form-control" title="${title} ${inputSelect}" size="5" maxlength="4" style="width:60px;"/>
	                    - <form:input path="homemiddleTelno" id="homemiddleTelno" class="form-control" size="5" maxlength="4" style="width:70px;"/>
	                    - <form:input path="homeendTelno" id="homeendTelno"  class="form-control" size="5" maxlength="4" style="width:70px;"/>
				</div>
			       <div><form:errors path="areaNo" class="error-text" /></div>
                   <div><form:errors path="homemiddleTelno" class="error-text" /></div>
                   <div><form:errors path="homeendTelno" class="error-text" /></div>
				</td>
			</tr>
			
		
		
			<!-- 핸드폰번호 -->
			<c:set var="title"><spring:message code="comUssUmt.deptUserManageRegist.phone"/></c:set>
			<tr>
				<th class="col-sm-2 line-bottom text-right"><label for="moblphonNo">${title}</label> <!-- <span class="pilsu">*</span> --></th>
				<td class="col-sm-10 line-bottom">
				<div class="row">
	                    <form:input path="moblphonNo" class="form-control w-25" id="moblphonNo" title="${title} ${inputTxt}"  size="20" maxlength="15" />
	             </div>
	                    <div><form:errors path="moblphonNo" class="error-text" /></div>
				</td>
			</tr>
			
			<!-- 이메일주소 -->
			<c:set var="title"><spring:message code="comUssUmt.deptUserManageRegist.email"/></c:set>
			<tr>
				<th class="col-sm-2 line-bottom text-right"><label for="emailAdres">${title}</label> <!-- <span class="pilsu">*</span> --></th>
				<td class="col-sm-10 line-bottom">
	            <div class="row"> 
	                    <form:input path="emailAdres" class="form-control w-50" id="mberEmailAdres" title="${title} ${inputTxt}" size="30" maxlength="50" />
	            </div>
	                    <div><form:errors path="emailAdres" class="error-text" /></div>
				</td>
			</tr>
			
		
			<!-------------------- 이하 숨김 --------------------------->
			<!-- 가입상태 코드 -->
			<c:set var="title"><spring:message code="comUssUmt.deptUserManageRegist.status"/></c:set>
			<tr style="display:none">
				<th class="col-sm-2 line-bottom"><label for="emplyrSttusCode">가입상태</label> <span class="pilsu">*</span></th>
				<td class="col-sm-10 line-bottom">
	            <div class="row"> 
	                    <form:select path="emplyrSttusCode" class="form-control w-25" id="emplyrSttusCode" title="${title} ${inputSelect}">
	                        <form:option value="" label="${inputSelect}"/>
	                        <form:options items="${emplyrSttusCode_result}" itemValue="code" itemLabel="codeNm"/>
	                    </form:select>
	            </div>
	                    <div><form:errors path="emplyrSttusCode" class="error-text"/></div>
				</td>
			</tr>
			
			<!-- 기본 조직 아이디  -->
			<c:set var="title"><spring:message code="comUssUmt.deptUserManageRegist.orgnztId"/></c:set>
			<tr style="display:none">
				<th class="col-sm-2 line-bottom"><label for="orgnztId">조직</label> <span class="pilsu">*</span></th>
				<td class="col-sm-10 line-bottom">
				<div class="row">
	                  <form:select path="orgnztId" id="orgnztId" class="form-control w-25" title="${title} ${inputSelect}">
	                       <form:option value="" label="${inputSelect}"/>
	                       <form:options items="${orgnztId_result}" itemValue="code" itemLabel="codeNm"/>
	                    </form:select>
	            </div>
	                    <div><form:errors path="orgnztId" class="error-text"/></div>
				</td>
			</tr>
			
			
			
			<!-- 사번  -->
			<c:set var="title"><spring:message code="comUssUmt.deptUserManageRegist.emplNum"/></c:set>
			<tr style="display:none">
				<th class="col-sm-2 line-bottom"><label for="emplNo">${title}</label></th>
				<td class="col-sm-10 line-bottom">
				<div class="row">
	                    <form:input path="emplNo" id="emplNo" class="form-control w-25" title="${title} ${inputTxt}" size="20" maxlength="20" />
	           </div>
	                    <div><form:errors path="emplNo" class="error-text" /></div>
				</td>
			</tr>			
			<!-- 성별구분코드 -->
			<c:set var="title"><spring:message code="comUssUmt.deptUserManageRegist.saxTypeCode"/></c:set>
			<tr style="display:none">
				<th class="col-sm-2 line-bottom"><label for="sexdstnCode">${title}</label></th>
				<td class="col-sm-10 line-bottom">
				<div class="row">
					<form:select path="sexdstnCode" id="sexdstnCode" class="form-control w-25" title="${title} ${inputSelect}">
						<form:option value="" label="${inputSelect}"/>
						<form:options items="${sexdstnCode_result}" itemValue="code" itemLabel="codeNm"/>
					</form:select>
				</div>	
					 <div><form:errors path="sexdstnCode" class="error-text" /></div>
				</td>
			</tr>
			<!-- 생일 -->
			<c:set var="title"><spring:message code="comUssUmt.deptUserManageRegist.brth"/></c:set>
			<tr style="display:none">
				<th class="col-sm-2 line-bottom"><label for="brth">${title}</label></th>
				<td class="col-sm-10 line-bottom">
				<div class="row">
					<form:input path="brth" id="brth" class="form-control w-25" title="${title} ${inputTxt}" size="20" maxlength="8" />
	            </div>
	                <div><form:errors path="brth" class="error-text" /></div>	                
				</td>
			</tr>
			<!-- 우번번호 -->
			<c:set var="title"><spring:message code="comUssUmt.deptUserManageRegist.post"/></c:set>
			<tr style="display:none">
				<th class="col-sm-2 line-bottom"><label for="zip">${title}</label> <span class="pilsu">*</span></th>
				<td class="col-sm-10 line-bottom">
				<div class="row">
	                    <input name="zip" id="zip" class="form-control w-25" title="${title} ${inputTxt}" type="text" value="" maxlength="8" style="width:60px;" />
 	            </div>
	                    <div><form:errors path="zip" class="error-text" /></div>
				</td>
			</tr>
			<!-- 주소 -->
			<c:set var="title"><spring:message code="comUssUmt.deptUserManageRegist.addr"/></c:set>
			<tr style="display:none">
				<th class="col-sm-2 line-bottom"><label for="homeadres">${title}</label> <span class="pilsu">*</span></th>
				<td class="col-sm-10 line-bottom">
				<div class="row">
	                    <form:input path="homeadres" class="form-control w-75" id="homeadres" title="${title} ${inputTxt}" size="70" maxlength="100" />                    
	            </div>
	            <div><form:errors path="homeadres" class="error-text" /></div>
				</td>
			</tr>
			<!-- 상세주소 -->
			<c:set var="title"><spring:message code="comUssUmt.deptUserManageRegist.addrDetail"/></c:set>
			<tr style="display:none">
				<th class="col-sm-2 line-bottom"><label for="detailAdres">${title}</label></th>
				<td class="col-sm-10 line-bottom">
	            <div class="row">
	                    <form:input path="detailAdres" class="form-control w-75" id="detailAdres" title="${title} ${inputTxt}" size="70" maxlength="100" />
	            </div>
	                    <div><form:errors path="detailAdres" class="error-text" /></div>
				</td>
			</tr>
			<!-- 사무실 전화번호 (예전 FAX 번호) -->
			<c:set var="title"><spring:message code="comUssUmt.deptUserManageRegist.offmTelno"/></c:set>
			<tr style="display:none">
				<th class="col-sm-2 line-bottom"><label for="fxnum">${title}</label></th>
				<td class="col-sm-10 line-bottom">
				<div class="row">
	                    <form:input path="fxnum" id="fxnum" class="form-control w-25" title="${title} ${inputTxt}" size="20"  maxlength="15" />
	                    <div><form:errors path="fxnum" class="error-text" /></div>
	            </div>
				</td>
			</tr>
			
			<!-- 핸드폰 전화번호 -->
			<c:set var="title"><spring:message code="comUssUmt.deptUserManageRegist.areaNo"/></c:set>
			<tr style="display:none">
				<th class="col-sm-2 line-bottom"><label for="offmTelno">${title}</label></th>
				<td class="col-sm-10 line-bottom">
				<div class="row">
	                    <form:input path="offmTelno" class="form-control w-25" id="offmTelno" title="${title} ${inputTxt}"  size="20"  maxlength="15" />                  
	            </div>   
	              <div><form:errors path="offmTelno" class="error-text" /></div>     
				</td>
			</tr>
			
			<!-- 비밀번호힌트 -->
			<c:set var="title"><spring:message code="comUssUmt.deptUserManageRegist.passHit"/></c:set>
			<tr style="display:none">
				<th class="col-sm-2 line-bottom"><label for="passwordHint">${title}</label> <span class="pilsu">*</span></th>
				<td class="col-sm-10 line-bottom">
				<div class="row">
					<form:select path="passwordHint" class="form-control w-50" id="passwordHint" title="${title} ${inputSelect}">
						<form:option value="" label="${inputSelect}"/>
						<form:options items="${passwordHint_result}" itemValue="code" itemLabel="codeNm"/>
					</form:select>	
				</div>
				<div><form:errors path="passwordHint" class="error-text"/></div>
				</td>
			</tr>
			<!-- 비밀번호정답 -->
			<c:set var="title"><spring:message code="comUssUmt.deptUserManageRegist.passOk"/></c:set>
			<tr style="display:none">
				<th class="col-sm-2 line-bottom"><label for="passwordCnsr">${title}</label> <span class="pilsu">*</span></th>
				<td class="col-sm-10 line-bottom">
				<div class="row">
					<form:input path="passwordCnsr" id="passwordCnsr" class="form-control w-50" title="${title} ${inputTxt}"  size="50" maxlength="100" />				
				</div>
				<div><form:errors path="passwordCnsr" class="error-text"/></div>
				</td>
			</tr>
			
			<!-------------------- 숨김 종료 --------------------------->
			
			 <form:hidden path="subDn" />
		</tbody>
		</table>
	</div>
	</div>
	
	<div class="card-footer">
        <div class="row">
		<!-- 하단 버튼 --> 
		<div class="col-sm-6 text-left">
			<a href="<c:url value='/mapo/MapoUserManage.do' />" class="btn btn-outline-primary" title="<spring:message code="button.list" />  <spring:message code="input.button" />"><spring:message code="button.list" /></a>
		</div>
		<div class="col-sm-6 text-right">
            <!-- 등록 버튼 --> 
        	<input type="submit" class="btn btn-info" value="<spring:message code="button.create" />" title="<spring:message code="button.create" /> <spring:message code="input.button" />" />      	
        </div>    
		</div>
	</div><!-- END card-footer  -->
</div>
<br><br>

	<!-- 검색조건 유지 -->
	<input type="hidden" name="searchCondition" value="<c:out value='${userSearchVO.searchCondition}'/>"/>
	<input type="hidden" name="searchKeyword" value="<c:out value='${userSearchVO.searchKeyword}'/>"/>
	<input type="hidden" name="sbscrbSttus" value="<c:out value='${userSearchVO.sbscrbSttus}'/>"/>
	<input type="hidden" name="pageIndex" value="<c:out value='${userSearchVO.pageIndex}'/>"/>
	<!-- 우편번호검색 -->
	<input type="hidden" name="zip_url" value="<c:url value='/sym/ccm/zip/EgovCcmZipSearchPopup.do'/>" />
	</form:form>

<!-- Egov Modal include  -->
<%-- <c:import url="/EgovModal.do" charEncoding="utf-8">
	<c:param name="scriptYn" value="Y" />
	<c:param name="modalName" value="egovModal" />
</c:import> --%>


<!-- Modal & 공통 Script-->
<%@ include file="../modal/common.jsp"%>

<!-- 아이디 중복체크 Modal -->
<div class="modal fade" id="idChkModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
	<div class="modal-dialog" role="document" style="margin-top:150px;">
		<div class="modal-content">
			<div class="modal-header">
				<h5 class="modal-title" id="exampleModalLabel">아이디 중복 확인</h5>
				<button class="close" type="button" data-dismiss="modal" aria-label="Close">
					<span aria-hidden="true">×</span>
				</button>
			</div>
			<div class="modal-body">
				<div class="form-inline">
					<div class="form-group">				
	            		<p class="ml-1 mr-2 mt-3 text-center">사용할 아이디</p>		         	
						<input type="text" id="checkIdModal" name="checkIdModal" class="form-control mr-2"> 					
						<a class="btn btn-info" href="#" id='btnModalSelect' onclick='fn_id_check()'>조회</a>	
					</div>	
					<div id='divModalResult' class="ml-1" style='margin:10px 0 0 0'><i class="far fa-question-circle"></i> <spring:message code="comUssUmt.userManageRegistModal.initStatus" /></div>				
				</div>
			</div>
			<div class="modal-footer">
				<a class="btn btn-primary" href="#" id='btnModalOk' onclick='fn_id_checkOk()'>확인</a>
				<button class="btn btn-secondary" type="button" data-dismiss="modal" id="modalClose">닫기</button>				
			</div>
		</div>
	</div>
</div>	
	
	
	
<script type="text/javascript" src="<c:url value="/validator.do"/>"></script>
<validator:javascript formName="userManageVO" staticJavascript="false" xhtml="true" cdata="false"/>
	
<script type="text/javaScript" language="javascript" defer="defer">

/*********************************************************
 * 초기화   
 ******************************************************** */
 // 테스트 : comthemplyrinfochangedtls COMTNEMPLYRINFO
 
 $(document).ready(function () {

	// 왼쪽 메뉴 아이콘 활성화
	$("#menuUser").addClass("active");

	
	 /* 모달창 드래그 이벤트 */
	$('.modal-dialog').draggable({ 
		 handle: ".modal-header" 
	});	
 });
	
/*  소속그룹 선택 */
$("#groupId").change(function(){
	
	// 소속과(분류), 소소팀(기관), 권한 초기화
	$("#pstinstMidCode, #insttCode, #authorCode").find('option').each(function(){
		$(this).remove();
	});
	
	$("#pstinstMidCode, #insttCode, #authorCode").append("<option value=''>선택하세요</option>");
	
	var value = $(this).val();
	 
	// 가입승인 상태 디폴트 설정
	$("#emplyrSttusCode").val("P").prop("selected", true);
	
	getData("groupId", value);
});


/*  소속과(분류) 선택 */
$("#pstinstMidCode").change(function(){

	// 소소팀(기관), 권한 초기화
	$("#insttCode, #authorCode").find('option').each(function(){
		$(this).remove();
	});
	
	$("#insttCode, #authorCode").append("<option value=''>선택하세요</option>");
	
	var value = $(this).val();
	
	getData("pstinstMidCode", value);
});
 
 
/*  소속팀(기관) 선택 */
$("#insttCode").change(function(){

	// 권한 초기화
	$("#authorCode").find('option').each(function(){
		$(this).remove();
	});
	
	$("#authorCode").append("<option value=''>선택하세요</option>");
	
	// 그룹ID 
	var value = $("#groupId").val();
	
	getData("insttCode", value);
});
 
 
 
function getData(mode, value) {

	var url = "<c:url value='/mapo/selectJoinInfo.do'/>?mode="+ mode;
	
	if( value != "" ) {
		
  		$.ajax({
	        type: "POST",
	        data: { "code" : value },
	        url: url,
	        dataType: "json",       // 리턴타입
	        success: function(data) {   // controller 
	          
	        
	        
	          if( data.result.length > 0 ) {
	        	  
	        
		            for ( var i=0; i < data.result.length; i++ ) {
		              
		               // 소속그룹 선택 시
		              if ( mode == "groupId" ) {
		            	  $("#pstinstMidCode").append("<option value='" + data.result[i]['code'] + "'>" + data.result[i]['codeNm'] + "</option>");
		            	  
		              // 소속과(분류) 선택 시
		              } else if ( mode == "pstinstMidCode" ) {
		                	$("#insttCode").append("<option value='" + data.result[i]['code'] + "'>" + data.result[i]['codeNm'] + "</option>");
		                
		              // 소속팀(기관) 선택 시
		              } else if ( mode == "insttCode" ) {
		               	 $("#authorCode").append("<option value='" + data.result[i]['code'] + "'>" + data.result[i]['codeNm'] + "</option>");               
		            
		              }

	            	}
		            
	          } else {
	            
	            if ( mode == "groupId" ) {
	              
	              $("#pstinstMidCode").find('option').remove();
	              $("#pstinstMidCode").append("<option value=''>선택</option>");
	              
	            } else if ( mode == "pstinstMidCode" ) {
	              
	              $("#insttCode").find('option').remove();
	              $("#insttCode").append("<option value=''>선택</option>");
	              
	            } else if ( mode == "insttCode" ) {
		              
	              $("#authorCode").find('option').remove();
	              $("#authorCode").append("<option value=''>선택</option>");
		              
		        }
	          }
	        }
	     });	
	}
}
 
/*********************************************************
 * 초기화
 ******************************************************** */ 
function fn_egov_init(){

	//모달 셋팅
	fn_modal_setting();

}
/*********************************************************
 * 모달셋팅
 ******************************************************** */
function fn_modal_setting(){
	//버튼에 모달 연결
	$("#btnEmplyrId").egovModal( "egovModal" );
	
	//타이틀 설졍
	$("#egovModal").setEgovModalTitle("<spring:message code="comUssUmt.userManageRegistModal.title" />"); //아이디 중복 확인
	var content = "";
	content = content + "<div class='modal-alignL' style='margin:5px 0 0 0'>"+"<spring:message code="comUssUmt.userManageRegistModal.userIsId" /> :"+"</div>"; //사용할아이디
	content = content + "<div class='modal-alignL'>"+"<input type='text' id='checkIdModal' name='checkIdModal' value='' size='20' maxlength='20' />"+"</div>";	
	content += "<div style='clear:both;'></div>";
	content += "<div id='divModalResult' style='margin:10px 0 0 0'><spring:message code="comUssUmt.userManageRegistModal.initStatus" /></div>"; //결과 : 중복확인을 실행하십시오.
	//모달 body 설정
	$("#egovModal").setEgovModalBody(content);

	var footer = "";
	//footer += "<div class='modal-btn'><button class='btn_s2' id='btnModalOk' onclick='fn_id_checkOk()'>확인</button></div>";
	//footer += "<div class='modal-btn'><button class='btn_s2' id='btnModalSelect' onclick='fn_id_check()'>조회</button></div>";
	footer += "<span class='btn_style1 blue' id='btnModalOk' onclick='fn_id_checkOk()'><a href='#'>확인</a></span>&nbsp;";
	footer += "<span class='btn_style1 blue' id='btnModalSelect' onclick='fn_id_check()'><a href='#'>조회</a></span>&nbsp;";
	//모달 footer 설정
	$("#egovModal").setEgovModalfooter(footer);
	
	//엔터이벤트처리
	$("input[name=checkIdModal]").keydown(function (key) {
		if(key.keyCode == 13){
			fn_id_check();	
		}
	});
	
	footer = null;
	content = null;
} 
/*********************************************************
 * 아이디 체크 AJAX
 ******************************************************** */
function fn_id_check(){	
	
	var id = $("#checkIdModal").val();
	
	if ( id == null || id == "" ) {
		alert("아이디를 입력하세요");
		
		return false;
	}
	
	
	$.ajax({
		type:"POST",
		url:"<c:url value='/uss/umt/EgovIdDplctCnfirmAjax.do' />",
		data:{
			"checkId": $("#checkIdModal").val()			
		},
		dataType:'json',
		timeout:(1000*30),
		success:function(returnData, status){
			if(status == "success") {
				if(returnData.usedCnt > 0 ){
					//사용할수 없는 아이디입니다.
					$("#divModalResult").html("<font color='red'><i class='far fa-question-circle'></i> <spring:message code="comUssUmt.userManageRegistModal.result" /> : [ "+returnData.checkId+" ]<spring:message code="comUssUmt.userManageRegistModal.useMsg" /></font>");
				}else{
					//사용가능한 아이디입니다.
					$("#divModalResult").html("<font color='#4e73df'><i class='far fa-question-circle'></i> <spring:message code="comUssUmt.userManageRegistModal.result" /> : [ "+returnData.checkId+" ]<spring:message code="comUssUmt.userManageRegistModal.notUseMsg" /></font>");
				}
			}else{ alert("ERROR!");return;} 
		}
		});
}

/*********************************************************
 * 아이디 체크 확인
 ******************************************************** */
function fn_id_checkOk(){
	
	var id = $("#checkIdModal").val();
	
	if ( id == null || id == "" ) {
		alert("아이디를 입력하세요");
		
		return false;
	}
	
	
	$.ajax({
		type:"POST",
		url:"<c:url value='/uss/umt/EgovIdDplctCnfirmAjax.do' />",
		data:{
			"checkId": $("#checkIdModal").val()			
		},
		dataType:'json',
		timeout:(1000*30),
		success:function(returnData, status){
			if(status == "success") {
				if(returnData.usedCnt > 0 ){
					alert("<spring:message code="comUssUmt.userManageRegistModal.noIdMsg" />"); //사용이 불가능한 아이디 입니다.
					return;
				}else{
					
					$("input[name=emplyrId]").val(returnData.checkId);
					//$("#egovModal").setEgovModalClose();
					$("#modalClose").click();
				}
			}else{ alert("ERROR!");return;} 
		}
		});
}

function fnIdCheck1(){
    var retVal;
    var url = "<c:url value='/uss/umt/EgovIdDplctCnfirmView.do'/>";
    var varParam = new Object();
    varParam.checkId = document.userManageVO.emplyrId.value;
    var openParam = "dialogWidth:303px;dialogHeight:250px;scroll:no;status:no;center:yes;resizable:yes;";
    retVal = window.showModalDialog(url, varParam, openParam);
    if(retVal) {
        document.userManageVO.emplyrId.value = retVal;
    }
}

function showModalDialogCallback(retVal) {
	if(retVal) {
	    document.userManageVO.emplyrId.value = retVal;
	}
}

function fnListPage(){
    document.userManageVO.action = "<c:url value='/mapo/MapoUserManage.do'/>";
    document.userManageVO.submit();
}

function fnInsert(form){
	
	// 비밀번호 확인 로직 추가
 	var pass1 = $("#password").val();
	var pass2 = $("#password2").val();
	
	if( pass1 != pass2 ) {
		alert("입력한 비밀번호가 일치하지 않습니다. 확인해주세요.");
		
		return false;
	}
	
	if(confirm("<spring:message code="common.regist.msg" />")){
	    if(validateUserManageVO(form)){
	    	if(form.password.value != form.password2.value){
	            alert("<spring:message code="fail.user.passwordUpdate2" />");
	            return false;
	        }
	    	form.submit();
	        return true;
	    }
	} 
}

function fn_egov_inqire_cert() {
	var url = "<c:url value='/uat/uia/EgovGpkiRegist.do' />";
	var popupwidth = '500';
	var popupheight = '400';
	var title = '인증서';

	Top = (window.screen.height - popupheight) / 3;
	Left = (window.screen.width - popupwidth) / 2;
	if (Top < 0) Top = 0;
	if (Left < 0) Left = 0;
	Future = "fullscreen=no,toolbar=no,location=no,directories=no,status=no,menubar=no,	scrollbars=no,resizable=no,left=" + Left + ",top=" + Top + ",width=" + popupwidth + ",height=" + popupheight;
	PopUpWindow = window.open(url, title, Future)
	PopUpWindow.focus();
}

function fn_egov_dn_info_setting(dn) {
	var frm = document.userManageVO;

	frm.subDn.value = dn;
}

</script>

</body>
</html>

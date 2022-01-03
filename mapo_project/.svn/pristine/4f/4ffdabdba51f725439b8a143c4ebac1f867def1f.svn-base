<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%
	pageContext.setAttribute("crcn", "\r\n");  	// Space, Enter
	pageContext.setAttribute("br", "<br/>");	// br 태그
%>
<%
 /**
  * @ Class Name 	: AddWorkView.jsp
  * @ Description 	: AddWorkView 화면
  * @ Modification Information
  * @
  * @  수정일             	 수정자              수정내용
  * @ -----------  --------    ---------------------------
  * @ 2021.09.27 	서지혜              최초 생성
  * @ 2021.09.29       서지혜              기능 추가 	
  * @ 2021.10.18	이은영			기능 수정     
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
			<p class="pageTitle">| 업무생성확인 상세</p>
		</div>				
		<div class="col-sm-6 text-right mb-1">		
				<button class="btn btn-info mb-2 mr-1" type="button" onclick="return goWorkList()">목록</button>
				
				<!-- 업무생성 상태일 때만 버튼 보이기 -->
				<c:if test="${workVO.step eq 'STE010'}">
				 	<button type="submit" class="btn btn-primary mb-2" onclick="return goWorkDetail()">수정하기</button> 
				 	<button type="submit" class="btn btn-secondary mb-2" onclick="return workDelete()">삭제</button>
				 	<%-- <c:if test="${itemCnt ne 0 && orgCnt ne 0}"> --%>
				 	<c:if test="${itemCnt ne 0 || orgCnt ne 0}">
						<button class="btn btn-success mb-2 ml-1" type="button" onclick="return workDist()">업무배포</button>
					</c:if>
				</c:if>	
			
		</div>
	</div>

	<!-- 업무 Form -->
	<form id="form1" name="form1" method="post" enctype="multipart/form-data" > 
	<%-- <form id="form1" name="form1" method="post" action=""> --%>
	
	<div id="accordion">
	<div class="card">
		<div class="card-header" id="card-header">
		<div class="row">	
			<div class="col-sm-8 text-left">			
				<a class="card-link" data-toggle="collapse" href="#collapseOne">
		       		<%-- <img src="<c:url value='/images/mapo/com/chart.png'/>" alt="logo image" class="chart_image mr-1 mb-1">			
					<p class="text-primary" style="display:inline;" id="workTitle"><!-- 불러온 데이터 : 2021년 4월 코로나 방역물품 조사 --></p> 
					<span id="workNm" name="workNm" class="text-primary"><strong>[ ${workVO.stepNm } ] ID : ${workVO.taskId}  </strong> </span>	 --%>
					
					<i class="far fa-file-alt"></i>
					<span id="workNm" name="workNm" class="text-primary">&nbsp;<strong> ${workVO.stepNm } : ${workVO.taskId}  </strong> </span>	
		      	</a>
	      	</div>
	      	<div class="col-sm-4 text-right">	
		      	<a class="card-link" data-toggle="collapse" href="#collapseOne">
		      		 <i class="fas fa-chevron-down"></i>	
		      	</a>
	      	</div>
      	</div>	
      	</div>
      	
       <div id="collapseOne" class="collapse show" data-parent="#accordion">
      	<div class="card-body">
      	<%-- <div class="table-responsive">
      	<table class="table table-borderless" summary="<spring:message code="common.summary.update" arguments="${pageTitle}" />"> --%>
			<div class="form-group row">
				<label for="taskNm" class="col-sm-1 col-form-label text-right align-self-center ml-5">
					<span class="pilsu">*</span> 제목
				</label>		
				<div class="col-sm-7 mt-2">
					<input type="text" class="form-control" id="taskNm" name="taskNm" placeholder="제목을 입력하세요" value="${workVO.taskNm}" disabled> 
				</div>
				
				<div class="col-sm-3">
					<div class = "row">
						<div class="mt-2">
							<%-- <c:if test="${workVO.urgent eq 'N'}">
								<button type="button" class="btn btn-outline-primary mr-2" id="urgentN" class="urgentN" disabled>긴급공지</button>
							</c:if> --%>
							<c:if test="${workVO.urgent eq 'Y'}">
								<button type="button" class="btn btn-danger mr-2" id="urgentY" class="urgentY" disabled>긴급공지</button>
							</c:if>
							
							<input type="hidden" id="urgent" name="urgent" value="N">
						</div>
						<!-- <div class="mt-2">
							<button type="button" class="btn btn-outline-primary" id="autoCreate" class="autoCreate">자동생성</button>
						</div> -->
					</div>
				</div>
			</div>
			<div class="form-group row">
				<label for="taskContents" class="col-sm-1 col-form-label text-right ml-5">
					상세내용
				</label>
				<div class="col-sm-9">
					<textarea id="taskContents" name="taskContents" class="form-control" rows="3" style="resize: none" maxlength="1000" disabled>${workVO.taskContents}</textarea>
				</div>
			</div>
			<div class="form-group row">
				<label for="taskIdx" class="col-sm-1 col-form-label text-right ml-5">
					<span class="pilsu">*</span> 업무구분
				</label>
				<div class="col-sm-3">
					<select name="taskIdx" id="taskIdx" class="form-control" disabled>
						<option value="">선택하세요</option>
						<c:forEach var="result" items="${resultGubun}" varStatus="status">
							<option value="${result.code}" id="taskIdx" name="taskIdx"
								<c:if test="${result.code eq workVO.taskIdx}">selected="selected"</c:if>
							>${result.codeNm}
							</option>
						</c:forEach>
					</select>
				</div>
			</div>
			<div class="form-group row">
				<label for="closeDt" class="col-sm-1 col-form-label text-right ml-5">
					마감일
				</label>
				<div class="col-md-3 form-inline">
					<div class="form-group">
						<div class="input-group date" id="datetimepicker4" data-target-input="nearest">
							<input type="text" class="form-control datetimepicker-input" data-target="#datetimepicker4" id="closeDt" name="closeDt" value="${workVO.closeDt}" disabled/>
							<div class="input-group-append" data-target="#datetimepicker4" data-toggle="datetimepicker">
								<div class="input-group-text">
									<i class="fa fa-calendar"></i>
								</div>
							</div>
						</div>
						<div class="input-group date" id="datetimepicker3" data-target-input="nearest" style="margin-left: 10px;">
							<input type="text" class="form-control datetimepicker-input" data-target="#datetimepicker3" id="closeTm" name="closeTm" value="${workVO.closeTm}" disabled/>
							<div class="input-group-append" data-target="#datetimepicker3" data-toggle="datetimepicker">
								<div class="input-group-text">
									<i class="far fa-clock"></i>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
			<div class="form-group row">
				<label for="manager" class="col-sm-1 col-form-label text-right ml-5">
					업무 담당자 
				</label>
				<div class="col-sm-2">
					<select name="manager" id="manager" class="form-control" disabled>
						<option value="">선택안함</option>
						<c:forEach var="result" items="${resultManager}" varStatus="status">
							<option value="${result.code}" id="manager" name="manager"
								<c:if test="${result.code eq workVO.manager}">selected="selected"</c:if>
							>${result.codeNm}</option>
						</c:forEach>
					</select>
				</div>
			</div>
			
			
				<div class="form-group row">
					<label for="egovComFileUploader" class="col-sm-1 col-form-label text-right ml-5">
						첨부파일
					</label>
				
					<div class="col-sm-5">
						<c:if test="${not empty workVO.atchFileId}">
						<tbody>
						<tr>
							<td class="col-sm-10 line-bottom">
								<!-- 첨부목록을 보여주기 위한 select, Delete-->
									<c:import url="/cmm/fms/selectFileInfs.do" charEncoding="utf-8">
									<c:param name="param_atchFileId" value="${workVO.atchFileId}" />
								</c:import>
							</td>
						</tr>
						</tbody>
						</c:if>	
					</div>	
				</div>	
			
			<%-- <c:if test="${not empty workVO.atchFileId}">
				<div class="form-group row">
					<label for="egovComFileUploader" class="col-sm-1 col-form-label text-right ml-5">
						첨부파일
					</label>
				
					<div class="col-sm-10">
						<div class="input-group">
							<div class="custom-file col-sm-7">
								<c:import url="/cmm/fms/selectFileInfs.do" charEncoding="utf-8">
									<c:param name="param_atchFileId" value="${workVO.atchFileId}" />
								</c:import>
							</div>						
						</div>
					</div>			
				</div>	
			</c:if> --%>
			<!-- </table>
			</div> END table-responsive -->
			</div><!--  END card-body -->
		</div> <!-- END CARD-HEADER -->
	</div>	<!-- END CARD  -->
	</div>	<!-- END accordion -->
	
	<!-- 업무ID/ 등록자/ 수정자 ID 설정 -->
	<input id="tempId" name="tempId" type="hidden" value='${workVO.taskId}'/> 
	<input id="insertId" name="insertId" type="hidden" value="${loginVO.id}"/>
	<input id="updateId" name="updateId" type="hidden" value="${loginVO.id}"/>

			
 </form> 
	
<!-----  업무생성 : 상단폼 END  -------------------------->

<br>

<!-----  항목입력 :  START ----------------------------->
<div class="row" id="item">
	<div class="col-sm-7">
		<div class="card">
			<div class="card-header" style="height:55px;">				
				<i class="fas fa-edit text-primary"></i> &nbsp;<span class="text-primary"><strong>항목입력</strong></span>
				<!-- <h6 class="m-0 font-weight-bold text-primary mt-1">항목입력</h6> -->		
			</div>
				
			<!-- 항목 입력 -->
			<c:if test="${itemCnt eq 0}">
				<div class="form-row mt-3">
					<!-- <label for="inputItem" class="col-form-label text-right ml-4" id="inputItem" style="width:110px;">항목입력</label> -->
					<!-- 항목명 입력 텍스트 박스 -->
					<div class="col-sm-8 ml-4">					
						추가한 항목이 없습니다.
					</div>
					<!-- <div class="col-sm-2">
						<button type="button" class="btn btn-outline-primary" onClick="return addItem();" disabled>
							항목추가
						</button>
					</div> -->
				</div> 
			</c:if>
			
			<!-- (체크박스) 전체 선택 / 선택삭제  -->			
		<!-- 	<div class="col-sm-4 ml-4 h-auto mt-4" >
				<div class="form-group form-check align-self-bottom">
				    <input type="checkbox" class="form-check-input mt-2" id="th_checkall" onClick="checkItemAll();">
				    <label class="form-check-label align-self-bottom mr-1" for="invalidCheck">전체선택</label>
				    <button type="button" class="btn btn-secondary btn-sm ml-2" onClick="delRow();">선택삭제</button>
				</div>
			</div> -->
			
			<!-- item 테이블 (항목) -->
			<div class="table-responsive">
				<form id="form2" name="form2" method="post" style="padding-top: 15px;">
					<table class="itemTable" id ="itemTable">
						<tbody id="contentHere">
						 	<!-- <tr class="tableRow" id="tableRow"> </tr>   -->
							<c:forEach var="itemVO" items="${itemVO}" varStatus="status">
								<tr>
									<td class='col-sm-1 text-left'>
										<input class='form-check-input' type='checkbox' style='margin-left: 25px;' name='checkRow' disabled>
										<br>
									</td>
									<td class='col-sm-3 text-left'>
										<label class='form-check-label' id='itemNm' for='autoSizingCheck'>${itemVO.itemNm}</label>
										<input class='form-check-input' type='hidden' id='itemNm' name='itemNm' for='itemNm' value='itemNm'>
									</td>
									<td class='col-sm-4.9 text-center' style='border-top: none; padding: 10px;'>
										<input type='text' class='form-control' id='itemDetail' name='itemDetail' placeholder='도움말을 입력하세요' value='${itemVO.itemDetail}' disabled>
									</td>
									<td class='col-sm-0.5 text-center' style='border-top: none;'>
										<img src='/mapo_project/images/mapo/com/chart.png' alt='logo image' style='margin: 0px 0px 10px 10px;'>
									</td>
									<td class='col-sm-2 text-right' style='border-top: none;'>
										<select id='inputYn' class='form-control' name='inputYn' disabled>
											<option value='Y' <c:if test="${'Y' eq itemVO.inputYn}">selected="selected"</c:if>>입력가능</option>
											<option value='N' <c:if test="${'N' eq itemVO.inputYn}">selected="selected"</c:if>>입력불가능</option>
										</select>
									</td>
									<td class='col-sm-1.6 text-left' style='border-top: none;'>
										<select id='textYn' class='form-control' name='textYn' style='width: 90px;' disabled>
											<option value='N' <c:if test="${'N' eq itemVO.textYn}">selected="selected"</c:if>>숫자</option>
											<option value='Y' <c:if test="${'Y' eq itemVO.textYn}">selected="selected"</c:if>>문자</option>
										</select>
									</td>
								</tr>
							</c:forEach>
						</tbody>
					</table>
			 	</form> 
			</div>
		</div>  <!-- END CARD -->
	</div>		<!-- END 항목종료 -->


	<!----- 시설 선택 START ----------------------------->
	<div class="col-sm-5">
		<div class="card">
			<div class="card-header" style="height:55px;">
				<div class="row">
					<div class="col-sm-6 align-self-center mt-1">
					<i class="fas fa-check-square text-primary"></i>&nbsp;
					<span class="text-primary"><strong>시설선택 <c:if test="${0 ne orgCnt}"> [ ${orgCnt} ]</c:if></strong></span>
					<%-- <h6 class="m-0 font-weight-bold text-primary">시설선택 ( ${orgCnt} )</h6> --%>
					</div>
					<div class="col-sm-6 text-right">	
						<c:if test="${orgCnt ne 0}">														
							<button class="btn btn-info btn-sm" id="expandAll" type= "button">펼치기</button>
							<button class="btn btn-info btn-sm" id="collapseAll" type= "button">접기</button>	
						</c:if>
						
						<!-- <button class="btn btn-primary btn-sm" id="checkAll" type= "button">전체 선택</button>
						<button class="btn btn-primary btn-sm" id="uncheckAll" type= "button">전체 해제</button>		 -->			
					</div>
				</div>
			</div>
			
			<!-- 트리뷰  START -->
			<form id="form3" name="form3" method="post" action="">
			<div class="card-body">	
				<c:if test="${orgCnt eq 0}">
					<div id="treeview_container" class="mt-2" style="height:30px;">
						선택한 시설이 없습니다.
					</div>
				</c:if>
				
				<c:if test="${orgCnt ne 0}">			
				<div id="treeview_container" class="hummingbird-treeview" style="height:65vh; overflow-y:scroll; overflow-x:auto;">
					
					
						<ul id="treeview" class="hummingbird-base" style="margin-left:-35px;margin-top:10px;">
	
						<!-- 대분류 --------------------->
							<c:forEach var="result1" items="${resultDepth1}" varStatus="status1">
								<li data-id="${status1.count}"><i class="fa fa-plus"></i>&nbsp;
									<label>
										<input id="${result1.clCode}" data-id="${result1.clCode}" type="checkbox" 
											<c:forEach var="orgList" items="${orgList}">
												<c:if test="${result1.clCode eq orgList.clCode}">checked</c:if>
											</c:forEach>	
										disabled /> ${result1.clCodeNm}							
									</label>
									<ul>
										<!-- 중분류  --------------------->
										<c:forEach var="result2" items="${resultDepth2}" varStatus="status2">
											<c:if test="${result1.clCode == result2.clCode}">
												<li data-id="${status2.count}"><i class="fa fa-plus"></i> 
													<label class="text-primary" style="font-size: 17px;">
														<input id="${result2.codeId}" data-id="${result2.codeId}" type="checkbox" 
															<c:forEach var="orgList" items="${orgList}">
																<c:if test="${result2.codeId eq orgList.orgMc}">checked</c:if>
															</c:forEach>	
														disabled /> ${result2.codeIdNm}
													</label>
													<ul>
	
														<!-- 소분류 --------------------->
														<c:forEach var="result3" items="${resultDepth3}" varStatus="status3">
															<c:if test="${result2.codeId == result3.codeId}">
																<li data-id="${status3.count}"><i class="fa fa-plus"></i> 
																	<label class="font-weight-bold" style="font-size: 17px;">
																		<input class="hummingbird-middle-node" id="${result3.code}" data-id="${result3.code}" type="checkbox" 
																			<c:forEach var="orgList" items="${orgList}">
																				<c:if test="${result3.code eq orgList.orgSc}">checked</c:if>
																			</c:forEach>																	
																		disabled /> ${result3.codeNm}
																	</label>
																	<ul>
	
																		<!-- 복지시설 코드 -->
																		<c:forEach var="result4" items="${resultDepth4}" varStatus="status4">
																			<c:if test="${result3.code == result4.orgSc}">
																				<li>
																					<label style="font-size: 16px;">
																						<input name="chk4" class="hummingbird-end-node" id="${result4.orgId}" data-id="${result4.orgId}" type="checkbox" 
																							<c:forEach var="orgList" items="${orgList}">
																								<c:if test="${result4.orgId eq orgList.orgId}">checked</c:if>
																							</c:forEach>	
																						disabled /> ${result4.orgNm}
																					</label>
																				</li>
																			</c:if>
																		</c:forEach>
																	</ul>
																</li>
															</c:if>
														</c:forEach> <!-- 소분류 END -->
													</ul>
												</li>
											</c:if>
										</c:forEach> <!-- 중분류 END -->									
									</ul>
								</li>
							</c:forEach> <!-- 대분류 END -->
						</ul>					
					</div> <!--  트리뷰   끝 -->
				</c:if>	
			</div>
							
		</form>
	</div> <!-- 시설 CARD END-->
	</div> <!-- col END-->
</div><!-- row 항목입력 & 시설선택 종료 END -->	

<br>
		
</div> <!--  container -->
</div> <!--  content -->

</div> <!--  content-wrapper -->
</div> <!--  Wrapper -->

<!-- Modal & 공통 Script-->
<%@ include file="../modal/common.jsp"%>

<!-- 불러오기 Script -->
<%@ include file="../modal/workLoad.jsp"%> 



<!-- script 호출 -->
<script type="text/javascript" src="<c:url value='/js/egovframework/com/cmm/fms/EgovMultiFiles.js'/>" ></script>
<script src="<c:url value="/js/mapo/addTables.js"/>"></script>


<script type="text/javascript">
$(document).ready(function() {
	
	// 왼쪽 메뉴 아이콘 활성화
	$("#menuWorkList").addClass("active");
	

	
	// 첨부파일
	$("#egovComFileUploader").on('change', function(){	
		$(this).next('.custom-file-label').html(event.target.files[0].name);
	});
	
	
	$('#datetimepicker4').datetimepicker({ 
		format: 'YYYY-MM-DD', 
		useCurrent: true 
	});
	
	$('#datetimepicker3').datetimepicker({ 
		format: 'HH:mm', 
		useCurrent: true 
	});	

	// 불러온 데이터일 경우 텍스트 추가
	$("#workTitle").text("");
	  
	/* 긴급공지 */
	/* $("#urgentY").hide(); */
  
	$("#urgentN").click(function(){
		$("#urgentY").show();
		$(this).hide();
	 
	 	var valueY =  'Y'; //값 넣기
		 $("#urgent").val(valueY); 
	});

  
	$("#urgentY").click(function(){
	 $("#urgentN").show();
	 $(this).hide();
	 
	 var valueN = 'N'
	 $("#urgent").val(valueN);
	});

	
  	/* 시설 선택 */
	$("#treeview").hummingbird();
	
  	// 전체선택 버튼
	$("#checkAll").click(function() { 
		$("#treeview").hummingbird("checkAll");
		$(this).hide();
		$("#uncheckAll").show();
	});
	
  	// 전체해제 버튼
	$("#uncheckAll").hide();
	$("#uncheckAll").click(function() { 
		$("#treeview").hummingbird("uncheckAll");
		$(this).hide();
		$("#checkAll").show();
	});
	
	// 펼치기 버튼
	$("#expandAll").click(function() {
		$("#treeview").hummingbird("expandAll");
		$(this).hide();
		$("#collapseAll").show();
	});
	
	// 접기 버튼
	$("#collapseAll").hide();
	$("#collapseAll").click(function() {  
		$("#treeview").hummingbird("collapseAll");
		$(this).hide();
		$("#expandAll").show();
	});
	
	
	/* 불러 오기 마감일 */
	$('#deadLinePickerStart').datetimepicker({ 
		format: 'YYYY-MM-DD', 
		useCurrent: true 
	});
	
	$('#deadLinePickerEnd').datetimepicker({ 
		format: 'YYYY-MM-DD', 
		useCurrent: true 
	});
	
	
	// 시설선택 펼치기
	$("#expandAll").click();
	
	
	
	// 마감일 오늘 일자로 설정
/* 	var now = getToday();		// 현재일자
	var time = getTime();		// 현재시간
	var close = getClose();		// 마감시간 (18:00)
	var endDay = getEndDay();		// 마감일자 (당월 말일)
	

	$("#closeDt").val(endDay);
	$("#closeTm").val(close);
	
	
	$("#deadLinePickerEnd").val(now); */

	
});



/*********************************************
 * [ 항목체크 ] 저장할 항목이 있는지 확인
 *********************************************/
 function chkItem() {
 	
 	var result = false;
 	
 	var itemNm = [];
 	$("input[name='itemNm']").each(function(i){
 		 var value = $(this).attr('value');
 	 	itemNm.push(value);
 	});
 	
 	console.log("itemNm.length : " + itemNm.length);
 	
 	if(itemNm.length > 0) {
 		result = true;
 	}
 	
 	return result;
 }
 

 /*********************************************
  * [ 복지지설 체크 ] 저장할 복지시설이 있는지 확인
  *********************************************/
  function chkOrg() {
  	
  	var result = false;
  	
  	var checkVal = [];
	 
	$("input:checkbox[name='chk4']:checked").each(function(i,iVal){
		var value = $(this).attr('id');
		checkVal.push(value);
	});
  	
  	console.log("checkVal.length : " + checkVal.length);
  	
  	if(checkVal.length > 0) {
  		result = true;
  	}
  	
  	return result;
  }
 
 

/*********************************************
 * 1. 입력폼 저장
 *********************************************/
 function workFormSave() {
	// form 에서 직접 저장
	//$("#form1").attr("action", "<c:url value='/mapo/insertWork2.do'/>").submit();
	
	// 업무명, 업무구분 필수 체크
	var taskNm = $.trim($("#taskNm").val());
	var taskIdx = $("#taskIdx option:selected").val();
	
	if( taskNm == "" ) {	  
	  alert("제목을 입력해주세요");
	  $("#taskNm").focus();	  
	  return false;
	}
	  
	
  	if( taskIdx == "" ) {    
    	alert("업무구분을 선택해주세요");   
    	return false;
  	} 
    
	/* var resultExtension = EgovMultiFilesChecker.checkExtensions("egovComFileUploader", "<c:out value='${fileUploadExtensions}'/>"); // 결과가 false인경우 허용되지 않음
	if (!resultExtension) return true;
	
	var resultSize = EgovMultiFilesChecker.checkFileSize("egovComFileUploader", <c:out value='${fileUploadMaxSize}'/>); // 파일당 1M까지 허용 (1K=1024), 결과가 false인경우 허용되지 않음
	if (!resultSize) return true; */
	
	
	if(!confirm("업무를 저장하시겠습니까?")) {
	  return false;
	} 
	
	
	var getId = $("#tempId").val();
	var mode = "";
	
	// insert
	 if(getId == "") {
		mode = "insert";
	} else {
		mode = "update"
	} 
	
	
	var url =  "<c:url value='/mapo/insertWork.do'/>?mode="+mode;
	
	var formData = new FormData($('#form1')[0]); 
	 
	console.log("workFormSave START ---->");
	    
	$.ajax({
		type: "POST",
		data: formData,
		url: url,
		dataType: "text",				// 리턴타입
		enctype: 'multipart/form-data', // 필수 
		processData: false, 			// 필수 
		contentType: false, 			// 필수
		success: function(data) {		// controller -> "ok", "fail"
			
			console.log("workSave3---->" + data);
		
			var temp = data.split("/");
			   
			var msg = temp[0];
			var workId = temp[1];
				
			console.log(msg);
			console.log(workId);
			
			if(msg == "OK") {
				//alert("저장완료");
				console.log("업무폼 저장완료 -------------------->");
				
				// taskId 설정		
				$("#tempId").val(workId);
				
				var temp = "[ 업무ID : " + workId + " ]";				
				//$("#workNm").val(temp); 
				$("#workNm").text(temp); 
			

				console.log("workFormSave workId ----> " + workId);
				console.log("workFormSave workNm ----> " + workNm);
				
				itemSave(workId);				
				
				
			} else {
				alert("업무폼 저장실패");
			}
		},
		error: function() {
			alert("오류발생");
			
		}	
	});
		
	/* ajax 새로고침 방지 */
	return false;
}

 
/*********************************************
 * 2. 항목/ 복지시설 저장
 *********************************************/
function itemSave(workId) {
	
	console.log("itemSave START ---> workId ----> " + workId);
 
	var insertId = $("#insertId").val();
	console.log("itemSave insertId ----> " + insertId);


	var itemNm = [];
	$("input[name='itemNm']").each(function(i){
		 var value = $(this).attr('value');
	 	itemNm.push(value);
	});
	
	var itemDetail = [];
	$("input[name='itemDetail']").each(function(i){
	 	var value = $(this).val();
	 	itemDetail.push(value);
	});
	
	var inputYn = [];
	$("select[name='inputYn']").each(function(i){
	 	var value = $(this).val();
	 	inputYn.push(value);
	});
	
	var textYn = [];
	$("select[name='textYn']").each(function(i){
	 	var value = $(this).val();
	 	textYn.push(value);
	});
	
	

	/* 시설 선택 저장 */
	var checkVal = [];
	 
	$("input:checkbox[name='chk4']:checked").each(function(i, iVal){
		var value = $(this).attr('id');
		checkVal.push(value);
	});
	
	
	// 저장할 개수 카운트
	var itemCnt = itemNm.length;
	var orgCnt = checkVal.length;
	
	console.log("itemCnt ----> " + itemCnt);
	console.log("orgCnt -----> " + orgCnt);
	
	// 항목 X, 복지시설 X : 폼만 저장하고 끝
	if(itemCnt == 0 && orgCnt == 0) {
		alert("업무생성 폼 저장완료");
		return false;
	}
  
	$.ajax({
		type:"POST",
		data: {
			 "taskId" 	: workId,
			 "insertId" : insertId,

			 "itemNm"	: itemNm,
			 "itemDetail": itemDetail,
			 "inputYn": inputYn,
			 "textYn": textYn,
			 
			 "orgIdList": checkVal 
		},
		traditional: true,
		url:"addItemSave.do",
		dataType:"text",
		success:function(data){			
	 		console.log(data);
	 
			 if (data == "OK") {
				 console.log("항목 저장 완료 ---->");
			
				 alert("저장되었습니다");
				 
				//업무폼 저장 성공 시 item 저장
				// orgSave(workId);
					
			 } else {
				 alert("저장 실패");
		 	}
		},
		error:function(){
		 	alert("오류발생")
		}
	});
	 
	/* ajax 새로고침 방지 */
	return false;
}



/* 업무목록 화면으로 이동 */
function goWorkList() {
	location.href ="workList.do";
}


/********************************************************
 * 업무배포
 *******************************************************/
function workDist() {
	
	var workId = $("#tempId").val();
	var insertId = $("#insertId").val();
	
	/* if ( workId == "" ) {
		alert("배포할 업무가 생성되지 않았거나 '저장'되지 않은 상태입니다.\n확인 후 다시 진행해 주세요.");
		return false;
	} */
	
	// 업무명, 업무구분 필수 체크
	var taskNm = $.trim($("#taskNm").val());
	var taskIdx = $("#taskIdx option:selected").val();
	
	if( taskNm == "" ) {	  
	  alert("배포할 업무의 제목을 입력해주세요");
	  $("#taskNm").focus();	  
	  return false;
	}
	  
  	if( taskIdx == "" ) {    
    	alert("배포할 업무의 업무구분을 선택해주세요");   
    	return false;
  	} 
	
	var result1 = chkItem();
	var result2 = chkOrg();
	
	if (!chkItem) {
		alert("배포할 항목이 없습니다. 항목을 추가해 주세요.");
		return false;
	}
	
	if (!chkOrg) {
		alert("배포할 시설이 없습니다. 시설을 선택해 주세요.")
		return false;
	}
	

	if(!confirm("업무를 배포하시겠습니까?\n\n※ 배포된 업무는 수정/삭제할 수 없습니다.")) {
		//location.href = "<c:url value='/mapo/workDist.do'/>?taskId="+ workId +"&taskNm=${taskNm}&insertId=${insertId}";
		return false;
	}
	
	
	
	console.log("workId ----> " + workId);
	console.log("insertId ----> " + insertId);
	
	 $.ajax({
		 type: "POST",
		 data: {
			 	"taskId" : workId,
			 	"insertId" : insertId
			 },//보내고자 하는 data 변수 설정
		 url: "workDist.do",
		 dataType:"text",
		 success: function(data){
			 
			 if(data == "OK"){
				 alert("업무배포가 완료되었습니다");
				 location ="workResult.do"
			 }else{
				 
				 alert("업무배포 실패");
			 }
		 },
		 error: function(){
			 console.log("오류 발생");
		 }
		 
		/* ajax 새로고침 방지 */
		//return false;
	});	
}





/********************************************************
 * 업무 수정 화면으로 이동
 *******************************************************/
function goWorkDetail() {
	var workId = $("#tempId").val();
	console.log("value item : " + workId )
	
	location.href = "AddWorkDetail.do?taskId=" + workId + "&mode=mod";
}


/********************************************************
 * 삭제 이벤트
 *******************************************************/
function workDelete() {
	
	if(!confirm("업무를 삭제하시겠습니까?")) {
		return false;
	}
	
	var workId = $("#tempId").val();
	
	console.log("workId  --->" + workId);
	
	 $.ajax({
			url : "workDelete.do",
			type : "POST",
			traditional : true,
			data: {
			 	"taskId" : workId
			 },//보내고자 하는 data 변수 설정
			dataType : "text",
			success : function(data) {
				console.log("data --> " + data);
				if (data == "OK") {
					alert("업무 삭제가 완료되었습니다");
					 location.href ="workList.do";
				} else {
					 alert("업무삭제 실패");
				}
			},
			error : function() {
				alert("오류발생")
			}
		});
}


</script>
</body>
</html>


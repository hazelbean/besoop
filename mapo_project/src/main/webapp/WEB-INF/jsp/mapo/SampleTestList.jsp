<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%
 /**
  * @ Class Name 	: SampleTestList.jsp
  * @ Description 	: SampleTestList 화면
  * @ Modification Information
  * @
  * @  수정일             	 수정자              수정내용
  * @ -----------  --------    ---------------------------
  * @ 2021.08.20 	서지혜              최초 생성
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
<link rel="stylesheet" type="text/css" href="<c:url value="/css/bootstrapthema/vendor/fontawesome-free/css/all.min.css"/>">
<link href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i" rel="stylesheet">

<!-- Custom styles for this template-->
<link rel="stylesheet" href="<c:url value="/css/bootstrapthema/css/sb-admin-2.min.css"/>">


<!-- 공통 CSS 호출 -->
<link rel="stylesheet" href="<c:url value="/css/mapo/custom.css"/>">

<!-- Font-Awesome 5 호출 -->
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.8.2/css/all.min.css" />


</head>

<body id="page-top">

	<!-- Page Wrapper -->
	<div id="wrapper">

		<!-- Sidebar -->
		<c:import url="MapoMainLeft.jsp" />

		<!-- Content Wrapper -->
		<div id="content-wrapper" class="d-flex flex-column">
			<div id="content">

				<!-- Topbar -->
				<%-- 	<c:import url="MapoMainTop.jsp" /> --%>
				<%@include file="MapoMainTop.jsp"%>



				<!-- Main Content -->
				<div class="container col-auto">

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
										<button type="submit" class="btn btn-outline-primary" style="margin-left: 8px;" onclick="return check()">로그인</button>
									</div>
								</form>
							</c:if>

							<c:if test="${loginVO.name != null }">
								${loginVO.name} 님 환영합니다.
								<button type="button" class="btn btn-outline-info" onclick="out();">로그아웃</button>
							</c:if>

							<!-- 기관선택 (단일) -->
							<div class="form-group row mt-5">								
								<label for="org1" class="col-sm-2">기관선택 (단일)</label>
								<div class="col-sm-2">
									<!-- 1차 분류 선택 -->
									<select name="org1" id="org1" class="form-control"> <!--  onchange="setOrg('org1', this.value)" -->
									<option value="">선택</option>
									<c:forEach var="orgResult1" items="${resultDepth1}" varStatus="status">
										<option value="${orgResult1.clCode}">${orgResult1.clCodeNm}</option>
									</c:forEach>
								</select>
								</div>
								<div class="col-sm-2">
								<select name="org2" id="org2"  class="form-control">
									<option value="">선택</option>								
								</select>
								</div>
								<div class="col-sm-2">
								<select name="org3" id="org3"  class="form-control">
									<option value="">선택</option>									
								</select>
								</div>
								<div class="col-sm-2">
								<select name="org4" id="org4" class="form-control">
									<option value="">선택</option>									
								</select>
								</div>
							</div>
							
							<!-- 기관선택 (복수) : 체크박스 사용 -->
							<div class="form-group row mt-5">								
								<label for="orgChk1" class="col-sm-2">기관선택 (복수)</label>								
								
								<div class="col-sm-2">
															
									<!-- 대분류 선택 -->
									<button class="btn btn-primary dropdown-toggle" id="btnOrg1" type="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">대분류 선택&nbsp;&nbsp;</button>

									<ul class="dropdown-menu" id="ulChk1">
										<li><a href="#" class="dropdown-item" data-value="allChk1" tabIndex="-1"><input type="checkbox" id="allChk1" />&nbsp;&nbsp;전체선택</a></li>
										
										<!-- 구분선 -->
										<div class="dropdown-divider"></div>	
														
										<!-- 기관 대분류 선택  -->			
										<c:forEach var="orgResult1" items="${resultDepth1}" varStatus="status">	
											<c:if test="${status.last}"> 
												<input name="orgCount" id="orgCount" type="hidden" value="${status.count}"/>	
										 	 </c:if> 
																																	
											 <li><a href="#" class="dropdown-item" data-value="${orgResult1.clCode}" tabIndex="-1"><input type="checkbox" id="${orgResult1.clCode}" name="${orgResult1.clCodeNm}" />&nbsp;&nbsp;${orgResult1.clCodeNm}</a></li>																			
										</c:forEach>
									</ul>
								</div>
								
								
								<div class="col-sm-2">
															
									<!-- 중분류 선택 -->
									<button class="btn btn-primary dropdown-toggle" id="btnOrg2" type="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">중분류 선택&nbsp;&nbsp;</button>

									<ul class="dropdown-menu" id="ulChk2">
										<!-- <li><a href="#" class="dropdown-item" data-value="allChk2" tabIndex="-1"><input type="checkbox" id="allChk1" />&nbsp;&nbsp;선택</a></li> -->
									</ul>
								</div>
								
								<div class="col-sm-2">
															
									<!-- 소분류 선택 -->
									<button class="btn btn-primary dropdown-toggle" id="btnOrg3" type="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">소분류 선택&nbsp;&nbsp;</button>

									<ul class="dropdown-menu" id="ulChk3">
										<!-- <li><a href="#" class="dropdown-item" data-value="allChk2" tabIndex="-1"><input type="checkbox" id="allChk1" />&nbsp;&nbsp;선택</a></li> -->
									</ul>
								</div>
								
								<div class="col-sm-2">
															
									<!-- 기관 선택 -->
									<button class="btn btn-primary dropdown-toggle" id="btnOrg4" type="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">기관 선택&nbsp;&nbsp;</button>

									<ul class="dropdown-menu" id="ulChk4">
										<!-- <li><a href="#" class="dropdown-item" data-value="allChk2" tabIndex="-1"><input type="checkbox" id="allChk1" />&nbsp;&nbsp;선택</a></li> -->
									</ul>
								</div>
								
							</div>
							
							
							<!-- 업무구분 (복수) : 체크박스 사용 -->
							<div class="form-group row mt-5">								
								<label for="orgChk1" class="col-sm-2">업무구분 (복수)</label>								
								
								<div class="col-sm-2">
															
									<!-- 업무구분 선택 -->
									<button class="btn btn-primary dropdown-toggle" id="btnWork" type="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">업무구분 선택&nbsp;&nbsp;</button>

									<ul class="dropdown-menu" id="ulWork">
										<li>
											<a href="#" class="dropdown-item" data-value="workAll" tabIndex="-1" >
											<input type="checkbox" id="workAll_0" /><span id="label_0">&nbsp;&nbsp;전체선택</span></a>
										</li>
										
										<!-- 구분선 -->
										<div class="dropdown-divider"></div>	
														
										<!-- 업무구분 선택  -->			
										<c:forEach var="resultGubun" items="${resultGubun}" varStatus="status">
											<!-- 총 개수 조회 -->			
											<c:if test="${status.last}"> 
												<input name="workCnt" id="workCnt" type="hidden" value="${status.count}"/>	
										 	 </c:if> 
										 	 																		
											 <li><a href="#" class="dropdown-item" data-value="workAll_${status.count}" tabIndex="-1">
											 	<input type="checkbox" id="workAll_${status.count}" name="${resultGubun.codeId}" class="work_btn"/>
											 	<span id="label_${status.count}" data-value="workAll_${status.count}"  class="work_label">&nbsp;&nbsp;${resultGubun.codeIdNm}</span></a></li>																			
										</c:forEach>
									</ul>
								</div>
								
								<div class="col-sm-2">
										<button type="submit" class="btn btn-outline-primary" style="margin-left: 8px;" onclick="return getValue()">체크 값 취득</button>
								</div>						
							</div>
						</div>
					
					</div>
						
						<!-- 테이블 -->
						<div class="card-body">
							<!-- 검색조건 -->
							<form class="form-inline" action="/list.do">
								<div class="form-group">
									<label for="searchName" class="col-auto">제목(내용) : </label>
									<input type="text" class="form-control" id="searchName">
								</div>
								<button type="submit" class="btn btn-outline-info" style="margin-left: 8px;">검색</button>
							</form>
							<br>

							<div class="table-responsive">
								<table class="table table-hover">
									<thead>
										<tr>
											<th scope="col">번호</th>
											<th scope="col">제목</th>
											<th scope="col">조회수</th>
											<th scope="col">등록자</th>
											<th scope="col">등록일</th>
										</tr>
									</thead>
									<tbody>
										<tr>
											<c:forEach var="result" items="${resultList}" varStatus="status">
												<td>
													<a href="javascript:goTestView()">${result.idx}</a>
												</td>
												<td>
													<a href="javascript:goTestView()">${result.title}</a>
												</td>
												<td>${result.count}</td>
												<td>${result.writerNm}</td>
												<td>${result.indate}</td>
											</c:forEach>
										</tr>

									</tbody>
								</table>
							</div>
						</div>
						<div class="card-footer">
							<c:if test="${!empty sessionScope.userId}">
								<button type="button" class="btn btn-primary" onclick="goTestMgmt()">등록</button>
							</c:if>
						</div>
					</div>
				</div>
				<!-- End of Content Wrapper -->
				<br>

				<!-- 트리뷰 테스트 데이터 입력 -->
				<br> <br>
				<div class="container col-auto">
					<h1>산하기관 트리 테스트</h1>
					<div class="card">
						<div class="card-header">
							<div class="row">
								<div class="col-sm-6 align-self-center">시설선택</div>
								<div class="col-sm-6  text-right">
									<button class="btn btn-primary btn-sm" id="checkAll">전체 선택</button>
									<button class="btn btn-primary btn-sm" id="uncheckAll">전체 해제</button>
									<button class="btn btn-info btn-sm" id="expandAll">펼치기</button>
									<button class="btn btn-info btn-sm" id="collapseAll">접기</button>

								</div>
							</div>
						</div>
						<div class="card-body">
							<!-- 트리뷰  테스트 -->
							<!-- <h2>jQuery hummingbird-treeview Demo</h2> -->
							<div id="treeview_container" class="hummingbird-treeview" style="height: 500px; overflow-y: scroll;">
								<ul id="treeview" class="hummingbird-base">

									<!-- 대분류 -->
									<c:forEach var="result1" items="${resultDepth1}" varStatus="status1">
										<li data-id="${status1.count}"><i class="fa fa-plus"></i> <label>
												<input id="${result1.clCode}" data-id="${result1.clCode}" type="checkbox" />
												${result1.clCodeNm}
											</label>
											<ul>
												<!-- 중분류  -->
												<c:forEach var="result2" items="${resultDepth2}" varStatus="status2">
													<c:if test="${result1.clCode == result2.clCode}">

														<li data-id="${status2.count}"><i class="fa fa-plus"></i> <label class="text-primary" style="font-size: 17px;">
																<input id="${result2.codeId}" data-id="${result2.codeId}" type="checkbox" />
																${result2.codeIdNm}
															</label>
															<ul>

																<!-- 소분류 -->
																<c:forEach var="result3" items="${resultDepth3}" varStatus="status3">
																	<c:if test="${result2.codeId == result3.codeId}">
																		<li data-id="${status3.count}"><i class="fa fa-plus"></i> <label class="font-weight-bold" style="font-size: 17px;">
																				<input class="hummingbird-middle-node" id="${result3.code}" data-id="${result3.code}" type="checkbox" />
																				${result3.codeNm}
																			</label>
																			<ul>

																				<!-- 기관코드 -->
																				<c:forEach var="result4" items="${resultDepth4}" varStatus="status4">
																					<c:if test="${result3.code == result4.orgSc}">
																						<li><label style="font-size: 16px;">
																								<input class="hummingbird-end-node" id="${result4.orgId}" data-id="${result4.orgId}" type="checkbox" />
																								${result4.orgNm}
																							</label></li>
																					</c:if>
																				</c:forEach>
																			</ul></li>
																	</c:if>
																</c:forEach>

															</ul></li>

													</c:if>
												</c:forEach>
											</ul></li>
									</c:forEach>


									<!-- 대분류 -->
									<!--  <li data-id="0">
										<i class="fa fa-plus"></i> <label> <input id="xnode-0" data-id="custom-0" type="checkbox" /> node-0</label>
										<ul>
											1. 중분류 
											<li data-id="1">
												<i class="fa fa-plus"></i> <label> <input id="xnode-0-1" data-id="custom-0-1" type="checkbox" /> node-0-1</label>
												<ul>
													<li data-id="2">
													<i class="fa fa-plus"></i><label> <input class="hummingbird-middle-node" id="xnode-0-1-1" data-id="custom-0-1-1" type="checkbox" /> node-0-1-1</label>																								
														<ul>																												
															<li><label> <input class="hummingbird-end-node" id="xnode-0-1-1-1" data-id="xnode-0-1-1-1" type="checkbox" /> node-0-1-1-1</label></li>
															<li><label> <input class="hummingbird-end-node" id="xnode-0-1-1-2" data-id="xnode-0-1-1-2" type="checkbox" /> node-0-1-1-2</label></li> 
														</ul>
													</li>	
												<li><label> <input class="hummingbird-end-node" id="xnode-0-1-1" data-id="custom-0-1-1" type="checkbox" /> node-0-1-1</label></li>
													<li><label> <input class="hummingbird-end-node" id="xnode-0-1-2" data-id="custom-0-1-2" type="checkbox" /> node-0-1-2</label></li>
												</ul>
											</li>
								
										</ul>
									</li>  -->


								</ul>
							</div>
							<!-- <button class="btn btn-primary btn-sm" id="checkAll">전체 선택</button>
							<button class="btn btn-primary btn-sm" id="uncheckAll">전체 해제</button>
							<button class="btn btn-info btn-sm" id="expandAll">펼치기</button>
							<button class="btn btn-info btn-sm" id="collapseAll">접기</button> -->
						</div>
					</div>
					<br> <br>
				</div>

				<!-- 트리뷰 테스트 html -->
				<!-- <br><br>
			<div class="container col-auto">
			<h1>트리뷰 테스트 1</h1>
				<div class="card">
					<div class="card-header">시설선택</div>
					<div class="card-body">
						<h5 class="card-title">jQuery hummingbird-treeview Demo</h5>
						<p class="card-text">With supporting text below as a natural lead-in to additional content.</p>
							
							트리뷰  테스트
							<h2>jQuery hummingbird-treeview Demo</h2>
							<div id="treeview_container" class="hummingbird-treeview" style="height: 230px; overflow-y: scroll;">
								<ul id="treeview" class="hummingbird-base">
								
									대분류
									<li data-id="0">
										<i class="fa fa-plus"></i> <label> <input id="xnode-0" data-id="custom-0" type="checkbox" /> node-0</label>
										<ul>
											1. 중분류 
											<li data-id="1">
												<i class="fa fa-plus"></i> <label> <input id="xnode-0-1" data-id="custom-0-1" type="checkbox" /> node-0-1</label>
												<ul>
													<li data-id="2">
													<i class="fa fa-plus"></i><label> <input class="hummingbird-middle-node" id="xnode-0-1-1" data-id="custom-0-1-1" type="checkbox" /> node-0-1-1</label>																								
														<ul>																												
															<li><label> <input class="hummingbird-end-node" id="xnode-0-1-1-1" data-id="xnode-0-1-1-1" type="checkbox" /> node-0-1-1-1</label></li>
															<li><label> <input class="hummingbird-end-node" id="xnode-0-1-1-2" data-id="xnode-0-1-1-2" type="checkbox" /> node-0-1-1-2</label></li> 
														</ul>
													</li>	
												<li><label> <input class="hummingbird-end-node" id="xnode-0-1-1" data-id="custom-0-1-1" type="checkbox" /> node-0-1-1</label></li>
													<li><label> <input class="hummingbird-end-node" id="xnode-0-1-2" data-id="custom-0-1-2" type="checkbox" /> node-0-1-2</label></li>
												</ul>
											</li>
											
											2. 중분류 
											<li data-id="1">
												<i class="fa fa-plus"></i> <label> <input id="xnode-0-2" data-id="custom-0-2" type="checkbox" /> node-0-2</label>
												<ul>
													<li><label> <input class="hummingbird-end-node" id="xnode-0-2-1" data-id="custom-0-2-1" type="checkbox" /> node-0-2-1</label></li>
													<li><label> <input class="hummingbird-end-node" id="xnode-0-2-2" data-id="custom-0-2-2" type="checkbox" /> node-0-2-2</label></li>
												</ul>
											</li>
											
											3. 중분류 
											<li data-id="1">
												<i class="fa fa-plus"></i> <label> <input id="xnode-0-3" data-id="custom-0-3" type="checkbox" /> node-0-3</label>
												<ul>
													
													<li><label> <input class="hummingbird-end-node" id="xnode-0-3-1" data-id="custom-0-3-1" type="checkbox" /> node-0-3-1</label></li>
													<li><label> <input class="hummingbird-end-node" id="xnode-0-3-2" data-id="custom-0-3-2" type="checkbox" /> node-0-3-2</label></li>
													
												</ul>
											</li>
										</ul>
									</li>
								</ul>
							</div>
							<button class="btn btn-primary" id="checkAll">Check All</button>
							<button class="btn btn-primary" id="uncheckAll">Uncheck All</button>
							<button class="btn btn-danger" id="checkNode">Check Node 0-2-2</button>

					</div>
				</div>
				<br><br>
			</div> -->



			</div>
		</div>
	</div>

	<!-- Modal & Script-->
	<%@ include file="modal/common.jsp"%>

	<script>
	
	$("#treeview").hummingbird();
	
	$("#checkAll").click(function() {
		$("#treeview").hummingbird("checkAll");
	});
	
	$("#uncheckAll").click(function() {
		$("#treeview").hummingbird("uncheckAll");
	});
	
	$("#collapseAll").click(function() {
		$("#treeview").hummingbird("collapseAll");
	});
	
	$("#expandAll").click(function() {
		$("#treeview").hummingbird("expandAll");
	});
	
	
	/* 업무구분 값 체그된 항목 가져오기 */
	function getValue(){
		
		// 체크박스의 총 개수 취득
		var chekObj = document.getElementsByClassName("work_btn");
		var lenth = chekObj.length;
		
		var checked = 0;
		var checkboxId;
		var checkboxName;
		
		var checkArr = [];
		
		
		console.log("chekObj : " + chekObj);
		console.log("lenth : " + lenth);

		  for (var i = 0; i < lenth; i++) {
			  
			  //checkboxTest = chekObj[i].getAttribute("id");			  
			  //console.log(checkboxTest);
			  
		    if (chekObj[i].checked === true) {		    	
		    
			      checked += 1;
			      checkboxId = chekObj[i].getAttribute("id");
			      checkboxName = chekObj[i].getAttribute("name");
			       
			      console.log("true -------------> " + checkboxId);
			      console.log("true -------------> " + checkboxName);
			      
			      checkArr.push(checkboxName);
		    }
		    
		  }
		
		  console.log("checked : " + checked);
		  console.log("checkArr : " + checkArr);
		  
		  var url = "<c:url value='/mapo/checkWork.do'/>";
	
	      $.ajax({
				type: "POST",
				data: { "code" : checkArr },
				url: url,
				dataType: "json",				// 리턴타입
				traditional : true,				// 배열값 자바로 전송
				success: function(data) {		// controller 
					
					console.log("data.result.length : " + data.result.length);
				
					/* if( data.result.length > 0 ) {
						
						for ( var i=0; i < data.result.length; i++ ) {
							
							$("#ulChk2").append(
									"<li><a href='#' class='dropdown-item' data-value='" + data.result[i]['codeId'] + "' tabIndex='-1'><input type='checkbox' id='" + data.result[i]['codeId'] + "'>&nbsp;&nbsp;" + data.result[i]['codeIdNm'] + "</a></li>");
						}
						
					} else {
						$("#org2").find('option').remove();
						$("#org2").append("<option value=''>선택</option>");
					} */
				}
			});
	}
	
	
	/* 업무구분 라벨 : 개별 선택 클릭 */
	var options = [];
	
	$( '.work_label' ).on( 'click', function( event ) {

		var $target = $( event.currentTarget ),
	       val = $target.attr( 'data-value' ),
	       $inp = $target.find( 'input' ),
	       idx;
		
		var count = $("#workCnt").val();
		
		console.log("val : " + val);
		console.log("count : " + count);
		

	   if ( ( idx = options.indexOf( val ) ) > -1 ) {
	      options.splice( idx, 1 );
	     // setTimeout( function() { $inp.prop( 'checked', false ) }, 0);
	      
	      $("input:checkbox[id='" + val + "']").prop("checked", false);	
	      
	   } else {
	      options.push( val );
	      //setTimeout( function() { $inp.prop( 'checked', true ) }, 0);
	      
	      $("input:checkbox[id='" + val + "']").prop("checked", true);	
	   }
	   
	   $( event.target ).blur();
	      
	   console.log( options );
	   return false;
	   
	});
	
	
	
	/* 업무구분 라벨 : 전체선택 클릭 */
	$("#label_0").click(function(){

		//check($(this).attr('id'));

		$("#workAll_0").click();
		
		// return false 해야 라벨 클릭해도 창 안닫힘
		 return false;
	});
	
	/* 업무구분 체크박스 클릭 */
	$("#workAll_0").click(function(){
		
		var count = $("#workCnt").val();	
		var isChecked = $('#workAll_0').prop('checked');
	//	var isChecked = $('input:checkbox[name="workAll_0"]').prop('checked');
		
		console.log("isChecked : " + isChecked);
		console.log("count : " + count);

		if(isChecked) {
			for ( var i=0; i < count + 1; i++ ) {								
				$("input:checkbox[id='workAll_" + i + "']").prop("checked", true);											
			}

		} else if(isChecked == false) {
			for ( var i=0; i < count + 1; i++ ) {
				$("input:checkbox[id='workAll_" + i + "']").prop("checked", false);
			}
		}

	});
	
	
	
	/* 기관선택 (복수) */
	/* var options = [];

	$( '.dropdown-menu a' ).on( 'click', function( event ) {

	   var $target = $( event.currentTarget ),
	       val = $target.attr( 'data-value' ),
	       $inp = $target.find( 'input' ),
	       idx;
	
	   var count = $("#orgCount").val();	   
	   console.log("count : " + count);
	   
	   if ( ( idx = options.indexOf( val ) ) > -1 ) {	
		   
	      options.splice( idx, 1 );
	      setTimeout( function() { $inp.prop( 'checked', false ) }, 0);
	      
	      
	      
	      
	      $("#ulChk2, #ulChk3, #ulChk4").find('li').remove();		
	      
	   } else {
		   
		   console.log( "val : " + val);

		   
		  if( val == "allChk1" ) {
			  
			 for ( var i=0; i < count; i++ ) {
				 console.log( "i : " + i);
				 options.push( val );
				 setTimeout( function() { $inp.prop( 'checked', true ) }, i);
			  }
			  
		  } else {
			  			  		  
			  options.push( val );
		      setTimeout( function() { $inp.prop( 'checked', true ) }, 0);
		      
		      var mode = "org1";
		      var url = "<c:url value='/mapo/selectOrg.do'/>?mode=" + mode;
		      
		      // 선택 시 중분류 조회 
		      $.ajax({
					type: "POST",
					data: {"code" : val},
					url: url,
					dataType: "json",				// 리턴타입
					success: function(data) {		// controller 
						
						console.log("data.result.length : " + data.result.length);
					
						if( data.result.length > 0 ) {
							
							// $("#ulChk2").append("<div class='dropdown-divider'></div>"); 
							
							for ( var i=0; i < data.result.length; i++ ) {
								
								$("#ulChk2").append(
										"<li><a href='#' class='dropdown-item' data-value='" + data.result[i]['codeId'] + "' tabIndex='-1'><input type='checkbox' id='" + data.result[i]['codeId'] + "'>&nbsp;&nbsp;" + data.result[i]['codeIdNm'] + "</a></li>");
							}
						} else {
							$("#org2").find('option').remove();
							$("#org2").append("<option value=''>선택</option>");
						}
					}
				});
		  }
	   }
	   
	   $( event.target ).blur();
	      
	   console.log( options );
	   
	   return false;
	});
	 */
	
	/* 기관 (복수) : 대분류 선택 */
/* 	$("#btnOrg1").click(function(){
		
		$("#ulChk2, #ulChk3, #ulChk4").find('li').remove();
		
		
	});
	 */
	
	
	
	
	/* 기관 : 대분류 선택 */
	$("#org1").change(function(){
		
		$("#org2, #org3, #org4").find('option').each(function(){
			$(this).remove();
		});
		
		$("#org2, #org3, #org4").append("<option value=''>선택</option>");
		
		var selectVal = $(this).val();
		
		getOrgList("org1", selectVal);		
	});
	
	
	
	
	/* 기관 : 중분류 선택 */
	$("#org2").change(function(){
			
		$("#org3, #org4").find('option').each(function(){
			$(this).remove();
		});
		
		$("#org3, #org4").append("<option value=''>선택</option>");
		
		var selectVal = $(this).val();
		
		getOrgList("org2", selectVal);
	});
	
	
	
	/* 기관 : 소분류 선택 */
	$("#org3").change(function(){
			
		$("#org4").find('option').each(function(){
			$(this).remove();
		});
		
		$("#org4").append("<option value=''>선택</option>");
		
		var selectVal = $(this).val();
		
		getOrgList("org3", selectVal);
		
	});


	
	/*************************************
	* 기관 선택 후 리스트 조회 및 설정
	*************************************/
	function getOrgList(mode, selectVal) {
		
		var url = "<c:url value='/mapo/selectOrg.do'/>?mode=" + mode;
				
		if ( selectVal != "" ) {
			
			$.ajax({
				type: "POST",
				data: {"code" : selectVal},
				url: url,
				dataType: "json",				// 리턴타입
				success: function(data) {		// controller 
					
					console.log("data.result.length : " + data.result.length);
				
					if( data.result.length > 0 ) {
						for ( var i=0; i < data.result.length; i++ ) {
							
							if ( mode == "org1" ) {
								$("#org2").append("<option value='" + data.result[i]['codeId'] + "'>" + data.result[i]['codeIdNm'] + "</option>");
							
							} else if ( mode == "org2" ) {
								$("#org3").append("<option value='" + data.result[i]['code'] + "'>" + data.result[i]['codeNm'] + "</option>");
								
							} else if ( mode == "org3" ) {
								$("#org4").append("<option value='" + data.result[i]['orgId'] + "'>" + data.result[i]['orgNm'] + "</option>");
							}
							
							
						}
						
					} else {
						
						if ( mode == "org1" ) {
							
							$("#org2").find('option').remove();
							$("#org2").append("<option value=''>선택</option>");
							
						} else if ( mode == "org2" ) {
							
							$("#org3").find('option').remove();
							$("#org3").append("<option value=''>선택</option>");
							
						} else if ( mode == "org3" ) {
							
							$("#org4").find('option').remove();
							$("#org4").append("<option value=''>선택</option>");
						}
					}
				}
			});
		}
	}
	
	
	// 기관선택
	/* function setOrg(org_sel, org_id) {
		
		var selValue = org_sel;
		var data = org_id;
		var url = "<c:url value='/mapo/selectOrg.do'/>?mode="+selValue;
					
		console.log("org_id : " + org_id);
		console.log("url : " + url);
		console.log("selValue : " + selValue);
		
		// 대분류 선택
		if( selDepth == "org1" ) {
			//url = "<c:url value='/mapo/selectOrg.do'/>";
		}
		
		
		$.ajax({
			type: "POST",
			data: {"code" : org_id},
			url: url,
			dataType: "text",				// 리턴타입
			success: function(data) {		// controller -> "ok", "fail"
				if(data == "ok") {
					console.log("조회완료");
					location="<c:url value='/mapo/sample/SampleList.do'/>";
				} else {
					console.log("조회실패");
				}
			},
			error: function() {
				alert("오류발생");
				
			}	
		});
	} */
	
	
	/* $("#checkNode").click(function() {
		$("#treeview").hummingbird("checkNode", {
			attr : "id",
			name : "node-0-2-2",
			expandParents : false
		});
	}); */
	
</script>



	<!-- 
	<script>
	$( document ).ready(function() {
		
		
		/*   input[type="checkbox"]:checked~ul {
		        display:none;
		    } */
		
	});
	

	 $("#one3").click(function(){
		alert("test");
	}); 
		
	
	/* 등록/수정 화면으로 이동 */
	function goTestMgmt() {
		location.href = "<c:url value='/mapo/sample/TestMgmt.do'/>";
	}
	
	/* 리스트 화면으로 이동 */
	function goTestView() {
		location.href="<c:url value='/mapo/sample/TestView.do'/>";
	}
	
	/* ID 체인지 이벤트 */
	function setPwd(user_id){
		
		if ( user_id == "admin" ) {
			$("#password").val("manager");
			
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
</script> -->
</body>
</html>
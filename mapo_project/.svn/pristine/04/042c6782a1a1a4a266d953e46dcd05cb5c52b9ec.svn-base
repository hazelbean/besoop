<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
/**
 * @ Class Name 	: MapoMainLeft.jsp
 * @ Description 	: MapoMainLeft 화면
 * @ Modification Information
 * @
 * @  수정일             	 수정자              수정내용
 * @ -----------  --------    ---------------------------
 * @ 2021.08.23 	서지혜              최초 생성
 * @ 2021.10.12 	이도경              권한에 따른 메뉴 변경
 *
 */
%>

<!-- Sidebar -->
<ul class="navbar-nav bg-gradient-primary sidebar sidebar-dark accordion" id="accordionSidebar">

	<!-- Sidebar - Brand -->
	<a class="sidebar-brand d-flex align-items-center justify-content-center" href="<c:url value="main.do"/>">
		<div class="sidebar-brand-icon">
			<!--   rotate-n-15 -->
			<i class="fas fa-chalkboard-teacher"></i>

		</div>
		<div class="sidebar-brand-text mx-3">
			<p class="mainText">업무시스템</p>
		</div>
	</a>

	<!-- Divider -->
	<hr class="sidebar-divider my-0">

	<!-- Nav Item - Dashboard -->
	<li class="nav-item active"><a class="nav-link" href="<c:url value="main.do"/>"> <i class="fas fa-home"></i> <span>HOME</span></a></li>

	<!-- 'HOME-업무' 구분선 -->
	<hr class="sidebar-divider">

	<!-- '업무' 소제목 -->
	<div class="sidebar-heading">WORK</div>

	<!-- MENU : 마포구청 '업무' 메뉴 -->
	<c:if test="${loginVO.groupId == 'GROUP_00000000000000'}">
		<div>
			<!-- WORK : 업무생성 -->
			<li id="menuWork" class="nav-item"><a class="nav-link" href="<c:url value="addWork.do"/>"> <i class="fas fa-file-import"></i> <span>업무생성</span></a></li>
			<!-- WORK : 업무생성확인 -->
			<li id="menuWorkList" class="nav-item"><a class="nav-link" href="<c:url value="workList.do"/>"> <i class="fas fa-tasks"></i> <span>업무생성확인</span></a></li>
			<!-- WORK : 업무배포결과 -->
			<li id="menuWorkResult" class="nav-item"><a class="nav-link" href="<c:url value="workResult.do"/>"> <i class="fas fa-poll-h"></i> <span>업무배포결과 </span></a></li>

			<!-- WORK : 업무확인(복지시설) *시스템 관리자만 확인 가능 *숨김 예정 -->
			<%-- <c:if test="${loginVO.authorCode == 'ZA100' }">
				<li id="menuWorkListOrg" class="nav-item"><a class="nav-link" href="<c:url value="workListOrg.do"/>"> <i class="far fa-copy"></i> <span>업무확인 (복지시설)</span></a></li>
			</c:if> --%>
		</div>
	</c:if>

	<!-- MENU : 복지시설 '업무' 메뉴 -->
	<c:if test="${loginVO.groupId == 'GROUP_00000000000001'}">
		<div>
			<!-- WORK : 업무확인 -->
			<li id="menuWorkListOrg" class="nav-item"><a class="nav-link" href="<c:url value="workListOrg.do"/>"> <i class="far fa-copy"></i> <span>업무확인</span></a></li>
		</div>
	</c:if>

	<!-- '업무-게시판' 구분선 -->
	<hr class="sidebar-divider">
	
	<!-- '게시판' 소제목 -->
	<div class="sidebar-heading">BOARD</div>

	<!-- MENU : 마포구청&복지시설 '게시판' 메뉴 -->
	<c:if test="${loginVO.groupId != null}">
		<!-- BOARD : FAQ -->
		<div>
			<li id="menuFaq" class="nav-item"><a class="nav-link" href="<c:url value="selectFaqList.do"/>"> <i class="fas fa-info-circle"></i> <span>FAQ</span></a></li>
			<!-- <li class="nav-item"><a class="nav-link" href="tables.html"> <i class="fas fa-archive"></i> <span>자료실</span></a></li> -->
		</div>
	</c:if>
	<!-- '게시판-관리' 구분선 -->
	<hr class="sidebar-divider">

	<!-- MENU : 마포구청 '관리' 메뉴 -->
	<c:if test="${loginVO.groupId == 'GROUP_00000000000000' and loginVO.authorCode == 'ZA100' or loginVO.authorCode == 'MA200'}">
		<div>
			<!-- '관리' 소제목 -->
			<div class="sidebar-heading">ADMIN</div>
			<li id="menuUser" class="nav-item"><a class="nav-link" href="<c:url value="MapoUserManage.do"/>"> <i class="fas fa-user-cog"></i> <span>사용자 관리</span></a></li>
			<li id="menuOrg" class="nav-item"><a class="nav-link" href="<c:url value="orgList.do"/>"> <i class="far fa-building"></i> <span>복지시설 관리</span></a></li>
		</div>

		<!-- '관리' 구분선 -->
		<hr class="sidebar-divider d-none d-md-block">
	</c:if>

	<!-- Sidebar Toggler (Sidebar) -->
	<div class="text-center d-none d-md-inline">
		<button class="rounded-circle border-0" id="sidebarToggle"></button>
	</div>
</ul>

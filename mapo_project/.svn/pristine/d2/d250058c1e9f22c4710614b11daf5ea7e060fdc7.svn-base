<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" 	uri="http://java.sun.com/jsp/jstl/core" %>
<%
 /**
  * @ Class Name 	: MapoMainLeft.jsp
  * @ Description 	: MapoMainLeft 화면
  * @ Modification Information
  * @
  * @  수정일             	 수정자              수정내용
  * @ -----------  --------    ---------------------------
  * @ 2021.08.23 	서지혜              최초 생성
  *
  *
  *  
  */
%>

<!-- Sidebar -->
<ul class="navbar-nav bg-gradient-primary sidebar sidebar-dark accordion" id="accordionSidebar">

	<!-- Sidebar - Brand -->
	<a class="sidebar-brand d-flex align-items-center justify-content-center" href="<c:url value="main.do"/>">
		<div class="sidebar-brand-icon"> <!--   rotate-n-15 -->
			<!--  <i class="fas fa-laugh-wink"></i> -->
			<!-- <i class="fas fa-user-check"></i> -->
			<!-- <i class="fas fa-chalkboard-teacher"></i> -->
			<!--  <i class="far fa-chart-bar"></i> -->
			<!-- <i class="far fa-window-restore"></i> -->
			 <i class="fas fa-chalkboard-teacher"></i> 
			<%-- <img src="<c:url value='/images/mapo/com/be_logo2.png'/>" style="margin: 0px 0 0px 0px" alt="logo image" title="logo image"> --%>
			
		</div>
		<div class="sidebar-brand-text mx-3">
			<p class="mainText">업무시스템</p> 
			<!-- <p class="mainText">Be:숲</p> <sup>Be:숲</sup>-->
			<%-- <img src="<c:url value='/images/mapo/com/be_logo.png'/>" style="margin: 0px 0 0px 0px" alt="logo image" title="logo image">  --%>
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

	<!-- '업무' 메뉴 -->
	<li id="menuWork" 		class="nav-item"><a class="nav-link" href="<c:url value="addWork.do"/>"> <i class="fas fa-file-import"></i> <span>업무생성</span></a></li>
	
	<li id="menuWorkList" 	class="nav-item"><a class="nav-link" href="<c:url value="workList.do"/>"> <i class="fas fa-tasks"></i> <span>업무확인 (마포구청)</span></a></li>
	
	<%-- <li id="menuWorkList" 	class="nav-item"><a class="nav-link" href="<c:url value="workResult2.do"/>"> <i class="fas fa-poll-h"></i> <span> 배포결과2 </span></a></li> --%>
	<li class="nav-item"><a class="nav-link" href="<c:url value="workListOrg.do"/>"> <i class="far fa-copy"></i> <span>업무확인 (복지시설)</span></a></li>
	
	<li id="menuWorkList" 	class="nav-item"><a class="nav-link" href="<c:url value="workResult.do"/>"> <i class="fas fa-poll-h"></i> <span> 배포결과 </span></a></li>
	<%-- <li class="nav-item"><a class="nav-link" href="<c:url value="addWork.do"/>"> <i class="fas fa-magic"></i> <span>업무자동생성</span></a></li> --%>
	<%-- <li class="nav-item"><a class="nav-link" href="<c:url value="testList.do"/>"> <i class="fas fa-vial"></i> <span>TEST</span></a></li> --%>
	
	<!-- <li class="nav-item"><a class="nav-link collapsed" href="#" data-toggle="collapse" data-target="#collapseTwo" aria-expanded="true" aria-controls="collapseTwo"> <i class="fas fa-fw fa-cog"></i> <span>Components</span>
	</a>
		<div id="collapseTwo" class="collapse" aria-labelledby="headingTwo" data-parent="#accordionSidebar">
			<div class="bg-white py-2 collapse-inner rounded">
				<h6 class="collapse-header">Custom Components:</h6>
				<a class="collapse-item" href="buttons.html">Buttons</a> <a class="collapse-item" href="cards.html">Cards</a>
			</div>
		</div></li> -->

	<!-- Nav Item - Utilities Collapse Menu -->
	<!-- <li class="nav-item"><a class="nav-link collapsed" href="#" data-toggle="collapse" data-target="#collapseUtilities" aria-expanded="true" aria-controls="collapseUtilities"> <i class="fas fa-fw fa-wrench"></i> <span>Utilities</span>
	</a>
		<div id="collapseUtilities" class="collapse" aria-labelledby="headingUtilities" data-parent="#accordionSidebar">
			<div class="bg-white py-2 collapse-inner rounded">
				<h6 class="collapse-header">Custom Utilities:</h6>
				<a class="collapse-item" href="utilities-color.html">Colors</a> <a class="collapse-item" href="utilities-border.html">Borders</a> <a class="collapse-item" href="utilities-animation.html">Animations</a> <a class="collapse-item"
					href="utilities-other.html">Other</a>
			</div>
		</div></li> -->
	
	<!-- '업무-게시판' 구분선 -->
	<hr class="sidebar-divider">
	
	<!-- '게시판' 소제목 -->
	<div class="sidebar-heading">BOARD</div>

	<!-- Nav Item - Charts -->
	<!-- <li class="nav-item"><a class="nav-link" href="charts.html"> <i class="fas fa-fw fa-chart-area"></i> <span>Charts</span></a></li> -->

	<!-- 게시판 메뉴 -->
	<li id="menuFaq" class="nav-item"><a class="nav-link" href="<c:url value="selectFaqList.do"/>"> <i class="fas fa-info-circle"></i> <span>FAQ</span></a></li>
	<!-- <li class="nav-item"><a class="nav-link" href="tables.html"> <i class="fas fa-archive"></i> <span>자료실</span></a></li> -->
	
	
	<!-- '게시판-관리' 구분선 -->
	<hr class="sidebar-divider">
	
	<!-- '관리' 소제목 -->
	<div class="sidebar-heading">ADMIN</div>
	<li id="menuUser" class="nav-item"><a class="nav-link" href="<c:url value="MapoUserManage.do"/>"> <i class="fas fa-user-cog"></i>  <span>사용자 관리</span></a></li>
	<li id="menuOrg" class="nav-item"><a class="nav-link" href="<c:url value="orgList.do"/>"> <i class="far fa-building"></i> <span>복지시설 관리</span></a></li>
	
	
	
	
		<!-- Nav Item - Pages Collapse Menu -->
	<!-- <li class="nav-item"><a class="nav-link collapsed" href="#" data-toggle="collapse" data-target="#collapsePages" aria-expanded="true" aria-controls="collapsePages"> <i class="fas fa-fw fa-folder"></i> <span>Pages</span>
	</a>
		<div id="collapsePages" class="collapse" aria-labelledby="headingPages" data-parent="#accordionSidebar">
			<div class="bg-white py-2 collapse-inner rounded">
				<h6 class="collapse-header">Login Screens:</h6>
				<a class="collapse-item" href="login.html">Login</a> <a class="collapse-item" href="register.html">Register</a> <a class="collapse-item" href="forgot-password.html">Forgot Password</a>
				<div class="collapse-divider"></div>
				<h6 class="collapse-header">Other Pages:</h6>
				<a class="collapse-item" href="404.html">404 Page</a> <a class="collapse-item" href="blank.html">Blank Page</a>
			</div>
		</div></li> -->

	<!-- Divider -->
	<hr class="sidebar-divider d-none d-md-block">

	<!-- Sidebar Toggler (Sidebar) -->
	<div class="text-center d-none d-md-inline">
		<button class="rounded-circle border-0" id="sidebarToggle"></button>
	</div>
</ul>

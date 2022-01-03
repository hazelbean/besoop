<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" 	uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="ui"  uri="http://egovframework.gov/ctl/ui" %>
<%@ taglib prefix="fn" 	uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%
 /**
  * @ Class Name 	: MapoMainTop.jsp
  * @ Description 	: MapoMainTop 화면
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

<nav class="navbar navbar-expand navbar-light bg-white topbar mb-3 static-top shadow">

	<!-- Sidebar Toggle (Topbar) -->
	<button id="sidebarToggleTop" class="btn btn-link d-md-none rounded-circle mr-3">
		<i class="fa fa-bars"></i>
	</button>

	<!-- Topbar Search -->
	<%-- <form class="d-none d-sm-inline-block form-inline mr-auto ml-md-3 my-2 my-md-0 mw-100 navbar-search">
		<div class="input-group">
			<input type="text" class="form-control bg-light border-0 small" placeholder="Search for..." aria-label="Search" aria-describedby="basic-addon2">
			<div class="input-group-append">
				<button class="btn btn-primary" type="button">
					<i class="fas fa-search fa-sm"></i>
				</button>
			</div>
		</div>
	</form>  --%>
	
	<!-- 로고 -->	
	<%-- <img src="<c:url value='/images/mapo/com/be_logo.svg'/>" alt="login title image" title="login title image" style="margin-bottom: 5px; width: 80px; heigt: auto;" /> --%>
	
	<!-- 세션 -->	
	<form class="d-none d-sm-inline-block form-inline mr-auto ml-md-3 my-2 my-md-0 mw-200">
	<div class="input-group" >
		 <span id="sessionInfo align-self-center">
	    	<c:if test="${loginVO != null}">
					<i class="fas fa-history fa-sm"></i><span style="font-size:14px;"> 세션만료 남은시간 - <span id="leftTimeInfo" class="mr-3">00:00:00</span></span><!-- 세션만료 남은시간 -->		    	
		    		<a id="clickInfo" class="btn btn btn-outline-secondary btn-sm" style="border-color:#C6C9DB;" href="#"  onclick="reqTimeAjax();return false;"><span style="font-size:12px;"><i class="fas fa-cogs fa-sm fa-fw mr-2 text-gray-400"></i>시간연장</span></a><!-- 시간연장 -->
		    		<a class="btn btn btn-outline-secondary btn-sm" style="border-color:#C6C9DB;" href="#"  onclick="logout();return false;"><i class="fas fa-sign-out-alt fa-sm fa-fw mr-2 text-gray-400"></i><span style="font-size:12px;">로그아웃</a><!-- 로그아웃 -->		  		    
		    </c:if>
	    </span>
	</div> 
	</form>

	<!-- Topbar Navbar -->
	<ul class="navbar-nav ml-auto">
		<!-- Nav Item - Search Dropdown (Visible Only XS) -->
		<li class="nav-item dropdown no-arrow d-sm-none"><a class="nav-link dropdown-toggle" href="#" id="searchDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false"> <i class="fas fa-search fa-fw"></i>
		</a> <!-- Dropdown - Messages -->
			<div class="dropdown-menu dropdown-menu-right p-3 shadow animated--grow-in" aria-labelledby="searchDropdown">
				<form class="form-inline mr-auto w-100 navbar-search">
					<div class="input-group">
						<input type="text" class="form-control bg-light border-0 small" placeholder="Search for..." aria-label="Search" aria-describedby="basic-addon2">
						<div class="input-group-append">
							<button class="btn btn-primary" type="button">
								<i class="fas fa-search fa-sm"></i>
							</button>
						</div>
					</div>
				</form>
			</div></li>

		<!-- Nav Item - Alerts -->
		<!-- <li class="nav-item dropdown no-arrow mx-1"><a class="nav-link dropdown-toggle" href="#" id="alertsDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false"> <i class="fas fa-bell fa-fw"></i> Counter - Alerts
				<span class="badge badge-danger badge-counter">3+</span>
		</a> Dropdown - Alerts
			<div class="dropdown-list dropdown-menu dropdown-menu-right shadow animated--grow-in" aria-labelledby="alertsDropdown">
				<h6 class="dropdown-header">Alerts Center</h6>
				<a class="dropdown-item d-flex align-items-center" href="#">
					<div class="mr-3">
						<div class="icon-circle bg-primary">
							<i class="fas fa-file-alt text-white"></i>
						</div>
					</div>
					<div>
						<div class="small text-gray-500">December 12, 2019</div>
						<span class="font-weight-bold">A new monthly report is ready to download!</span>
					</div>
				</a> <a class="dropdown-item d-flex align-items-center" href="#">
					<div class="mr-3">
						<div class="icon-circle bg-success">
							<i class="fas fa-donate text-white"></i>
						</div>
					</div>
					<div>
						<div class="small text-gray-500">December 7, 2019</div>
						$290.29 has been deposited into your account!
					</div>
				</a> <a class="dropdown-item d-flex align-items-center" href="#">
					<div class="mr-3">
						<div class="icon-circle bg-warning">
							<i class="fas fa-exclamation-triangle text-white"></i>
						</div>
					</div>
					<div>
						<div class="small text-gray-500">December 2, 2019</div>
						Spending Alert: We've noticed unusually high spending for your account.
					</div>
				</a> <a class="dropdown-item text-center small text-gray-500" href="#">Show All Alerts</a>
			</div></li> -->

		<!-- Nav Item - Messages -->
		<%-- <li class="nav-item dropdown no-arrow mx-1"><a class="nav-link dropdown-toggle" href="#" id="messagesDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false"> <i class="fas fa-envelope fa-fw"></i>
				<!-- Counter - Messages --> <span class="badge badge-danger badge-counter">7</span>
		</a> <!-- Dropdown - Messages -->
			<div class="dropdown-list dropdown-menu dropdown-menu-right shadow animated--grow-in" aria-labelledby="messagesDropdown">
				<h6 class="dropdown-header">Message Center</h6>
				<a class="dropdown-item d-flex align-items-center" href="#">
					<div class="dropdown-list-image mr-3">
						<img class="rounded-circle" src="<c:url value="/css/bootstrapthema/img/undraw_profile_1.svg"/>" alt="...">
						<div class="status-indicator bg-success"></div>
					</div>
					<div class="font-weight-bold">
						<div class="text-truncate">Hi there! I am wondering if you can help me with a problem I've been having.</div>
						<div class="small text-gray-500">Emily Fowler · 58m</div>
					</div>
				</a> <a class="dropdown-item d-flex align-items-center" href="#">
					<div class="dropdown-list-image mr-3">
						<img class="rounded-circle" src="<c:url value="/css/bootstrapthema/img/undraw_profile_2.svg"/>" alt="...">
						<div class="status-indicator"></div>
					</div>
					<div>
						<div class="text-truncate">I have the photos that you ordered last month, how would you like them sent to you?</div>
						<div class="small text-gray-500">Jae Chun · 1d</div>
					</div>
				</a> <a class="dropdown-item d-flex align-items-center" href="#">
					<div class="dropdown-list-image mr-3">
						<img class="rounded-circle" src="<c:url value="/css/bootstrapthema/img/undraw_profile_3.svg"/>" alt="...">
						<div class="status-indicator bg-warning"></div>
					</div>
					<div>
						<div class="text-truncate">Last month's report looks great, I am very happy with the progress so far, keep up the good work!</div>
						<div class="small text-gray-500">Morgan Alvarez · 2d</div>
					</div>
				</a> <a class="dropdown-item d-flex align-items-center" href="#">
					<div class="dropdown-list-image mr-3">
						<img class="rounded-circle" src="https://source.unsplash.com/Mv9hjnEUHR4/60x60" alt="...">
						<div class="status-indicator bg-success"></div>
					</div>
					<div>
						<div class="text-truncate">Am I a good boy? The reason I ask is because someone told me that people say this to all dogs, even if they aren't good...</div>
						<div class="small text-gray-500">Chicken the Dog · 2w</div>
					</div>
				</a> <a class="dropdown-item text-center small text-gray-500" href="#">Read More Messages</a>
			</div></li> 

		<div class="topbar-divider d-none d-sm-block"></div>
		--%>

		<!-- Nav Item - User Information (사용자명) -->
		<li class="nav-item dropdown no-arrow">
	<!-- <a class="nav-link dropdown-toggle" href="#" id="userDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">  -->
		<span class="nav-link dropdown-toggle" id="userDropdown" > 
		<span class="mr-2 d-none d-lg-inline text-gray-600 small">
			<c:if test="${loginVO.name != null}">
				${loginVO.name} ${loginVO.ofcpsNm}
			</c:if>		
		</span> <img class="img-profile rounded-circle" src="<c:url value="/css/bootstrapthema/img/undraw_profile.svg"/>">
		</span>
		
		<!-- </a> --> <!-- Dropdown - User Information -->
			<!-- <div class="dropdown-menu dropdown-menu-right shadow animated--grow-in" aria-labelledby="userDropdown">
				<a class="dropdown-item" href="#"> <i class="fas fa-user fa-sm fa-fw mr-2 text-gray-400"></i> Profile
				</a> <a class="dropdown-item" href="#"> <i class="fas fa-cogs fa-sm fa-fw mr-2 text-gray-400"></i> Settings
				</a> <a class="dropdown-item" href="#"> <i class="fas fa-list fa-sm fa-fw mr-2 text-gray-400"></i> Activity Log
				</a>
				<div class="dropdown-divider"></div>
				<a class="dropdown-item" href="#" data-toggle="modal" data-target="#logoutModal"> <i class="fas fa-sign-out-alt fa-sm fa-fw mr-2 text-gray-400"></i> Logout
				</a>
			</div> -->
		</li>
	</ul>
</nav>

<!-- 세선처리 스크립트 -->
<script type="text/javascript" src="<c:url value='/js/egovframework/com/cmm/jquery.js'/>" ></script>
<script type="text/javaScript" language="javascript" defer="defer">

 window.onload = function() {
	init();
	
}
 

 
	function getCookie(cname) {
 	  var name = cname + "=";
 	  var decodedCookie = decodeURIComponent(document.cookie);
 	  var ca = decodedCookie.split(';');
 	  for(var i = 0; i <ca.length; i++) {
 	    var c = ca[i];
 	    while (c.charAt(0) == ' ') {
 	      c = c.substring(1);
 	    }
 	    if (c.indexOf(name) == 0) {
 	      return c.substring(name.length, c.length);
 	    }
 	  }
 	  return "";
 	}
  
  	function pad(n, width) {
  	  n = n + '';
  	  return n.length >= width ? n : new Array(width - n.length + 1).join('0') + n;
  	}
  
	var objLeftTime;
	var objClickInfo;
	var latestTime;
	var expireTime;
	var timeInterval = 1000; // 1초 간격 호출
	var firstLocalTime = 0;
	var elapsedLocalTime = 0;
	var stateExpiredTime = false;
	var logoutUrl = "<c:url value='/uat/uia/actionMapoLogout.do'/>";
	var timer;

	function init() {
		objLeftTime = document.getElementById("leftTimeInfo");
		
		if (objLeftTime == null) {
			//console.log("'leftTimeInfo' ID is not exist!");
			return;
		}
		objClickInfo = document.getElementById("clickInfo");
		console.log(objLeftTime.textContent);
		
		//console.log("START  = latestTime : "+latestTime);
		//console.log("START = expireSessionTime : = "+expireTime);
	
		

		latestTime = getCookie("egovLatestServerTime");
		expireTime = getCookie("egovExpireSessionTime");
		
		test = latestTime;
		
		//console.log("latestServerTime = "+latestTime);
		//console.log("expireSessionTime = "+expireTime);
		
		elapsedTime = 0;
		firstLocalTime = (new Date()).getTime();
		showRemaining();
		
		timer = setInterval(showRemaining, timeInterval); // 1초 간격 호출
	}

	function showRemaining() {
		elapsedLocalTime = (new Date()).getTime() - firstLocalTime;
		
		var timeRemaining = expireTime - latestTime - elapsedLocalTime;
		if ( timeRemaining < timeInterval ) {
			clearInterval(timer);
			objLeftTime.innerHTML = "00:00:00";
			objClickInfo.text = '<spring:message code="comCmm.top.expiredSessionTime"/>'; //시간만료
			stateExpiredTime = true;
			alert('<spring:message code="comCmm.top.expireSessionTimeInfo"/>');//로그인 세션시간이 만료 되었습니다.
			// reload content main page
			$("#sessionInfo").hide();

			//parent.frames["_content"].location.href = logoutUrl;
			
			location.href = logoutUrl;
			
			//parent.frames["_content"].location.reload();

			return;
		}
		var timeHour = Math.floor(timeRemaining/1000/60 / 60); 
		var timeMin = Math.floor((timeRemaining/1000/60) % 60);
		var timeSec = Math.floor((timeRemaining/1000) % 60);
		//objLeftTime.textContent = pad(timeHour,2) +":"+ pad(timeMin,2) +":"+ pad(timeSec,2);
		//objLeftTime.outerText = pad(timeHour,2) +":"+ pad(timeMin,2) +":"+ pad(timeSec,2);
		objLeftTime.innerHTML = pad(timeHour,2) +":"+ pad(timeMin,2) +":"+ pad(timeSec,2);
		//console.log("call showRemaining() = "+objLeftTime.innerHTML);
	}
  
	function reqTimeAjax() {
	  	
	  	if (stateExpiredTime==true) {
	  		alert('<spring:message code="comCmm.top.cantIncSessionTime"/>');//시간을 연장할수 없습니다.
	  		return;
	  	}
	  	
		$.ajax({
		    url:'${pageContext.request.contextPath}/uat/uia/refreshSessionTimeout.do', //request 보낼 서버의 경로
		    type:'get', // 메소드(get, post, put 등)
		    data:{}, //보낼 데이터
		    success: function(data) {
		        //서버로부터 정상적으로 응답이 왔을 때 실행
	        	latestTime = getCookie("egovLatestServerTime");
	        	expireTime = getCookie("egovExpireSessionTime");
	        	console.log("latestServerTime = "+latestTime);
	        	console.log("expireSessionTime = "+expireTime);
	        	init();
		        //alert("정상수신 , data = "+data);
		    },
		    error: function(err) {
		    	alert("err : "+err);
		        //서버로부터 응답이 정상적으로 처리되지 못햇을 때 실행
		    	//alert("오류발생 , error="+err.state());
		    }
		});
		return false;
	}
	
	function logout() {
		$("#sessionInfo").hide();
		location.href = logoutUrl;
	}
	
</script>



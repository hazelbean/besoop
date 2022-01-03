<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>


<!-- Work Modal ----------------------------------------------------------------------------------------------------------------->
<div class="modal modal-center fade" id="workLoad" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
	<div class="modal-dialog modal-xl modal-center" role="document" style="width: 100%; height:90%; margin:0; padding: 0;"> <!-- max-width -->
		<div class="modal-content" style="height:auto;min-height:90%;">

			<div class="modal-header">
				<h6 class="modal-title text-left">불러오기</h6>
				<button type="button" class="close" data-dismiss="modal" aria-label="Close">
					<span aria-hidden="true">&times;</span>
				</button>
			</div>

			<div class="modal-body">

				<!-- form 이벤트	 -->
				<!-- <form name="searchForm" method="post" action=""> -->
				
					<div class="form-group row">
						<label for="title" class="col-sm-2 ml-5 mr-2 col-form-label text-right">진행상태 / 마감일자 </label>
						<div class="col-auto form-inline">
							<div class="form-group">
								<select name="taskIdx" id="taskIdx" class="form-control mr-2" aria-label="Default select example" style="width: 210px;">
									<option value="">선택하세요</option>
									<c:forEach var="result" items="${resultSte}" varStatus="status">
										<option value="${result.code}" id="mTaskIdx" name="taskIdx">${result.codeNm}</option>
									</c:forEach>
								</select>
								
								<div class="input-group date" id="deadLinePickerStart" data-target-input="nearest">
									<input type="text" class="form-control datetimepicker-input" data-target="#datetimepicker4" style="width: 160px;" />
									<div class="input-group-append" data-target="#deadLinePickerStart" data-toggle="datetimepicker">
										<div class="input-group-text">
											<i class="fa fa-calendar"></i>
										</div>
									</div>
								</div>

								<div style="margin: 0px 5px 0px 5px">~</div>

								<div class="input-group date" id="deadLinePickerEnd" data-target-input="nearest">
									<input type="text" class="form-control datetimepicker-input" data-target="#datetimepicker4" style="width: 160px;" />
									<div class="input-group-append" data-target="#deadLinePickerEnd" data-toggle="datetimepicker">
										<div class="input-group-text">
											<i class="fa fa-calendar"></i>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
				

					<div class="form-group row">
						<label for="writer" class="col-sm-2 ml-5 mr-2 col-form-label text-right">업무구분 / 업무제목 </label>
						<div class="col-auto form-inline">
							<div class="form-group">
								<select name="taskIdx" id="taskIdx" class="form-control mr-2" aria-label="Default select example" style="width: 210px;">
									<option value="">선택하세요</option>
									<c:forEach var="result" items="${resultGubun}" varStatus="status">
										<option value="${result.code}" id="taskIdx" name="taskIdx">${result.codeNm}</option>
									</c:forEach>
								</select>
							
								<input type="text" class="form-control " placeholder="검색어를 입력하세요" style="width: 420px;"/>
								<button id="btnSearch" class="btn btn-secondary" style="margin-left: 8px;width:70px;">검색</button>
							</div>
						</div>
					</div>
			
					<!-- Scrollable modal -->
					<div class="card" style="width:auto; height: 480px; overflow-y: auto;">
						<div class="overflow-auto">
							<table class="table table-hover">
								<thead>
									<tr class="text-center">
										<th scope="col">선택</th>
										<th scope="col">업무ID</th>
										<th scope="col">진행상태</th>
										<th scope="col" class='text-left'>업무구분</th>
										<th scope="col">업무제목</th>
										<th scope="col">담당자</th>
										<th scope="col">마감일</th>
									<!-- 	<th scope="col">마감시간</th> -->
									</tr>
								</thead>
								<tbody id="modalTbody">
								<%-- 	<c:forEach var="result" items="${result}" varStatus="status">
										<tr>
											<td class="col-auto text-center">${result.taskId}</td>
											<td class="col-auto text-center">${result.steNm}</td>
											<td class="col-auto text-center">${result.tasNm}</td>
											<td class="col-auto text-left">${result.taskNm}</td>
											<td class="col-auto text-left">${result.manager}</td>
											<td class="col-auto text-left">${result.closeDt}</td>
											<td class="col-auto text-left">${result.closeTm}</td>
										</tr>
									</c:forEach> --%>
								</tbody>
							</table>
							
						</div>
					</div>
				<!-- </form> -->
					<div class="form-check" id="check1" style="margin-top: 15px;">
						&nbsp;&nbsp;<input class="form-check-input" type="checkbox" value="" id="inputValue" required>
						<label class="form-check-label mr-3" for="inputValue">필수입력 사항 & 복지시설 입력 값 불러오기</label>
					</div>
					<div class="form-check" id="check2" style="margin-top: 15px;">
						&nbsp;&nbsp;<input class="form-check-input" type="checkbox" value="" id="allInputValue" required>
						<label class="form-check-label mr-3" for="allInputValue">필수입력 사항 불러오기</label>
					</div>
				

				<!-- 하단 버튼 class="modal-footer" -->	
				<hr>
				<div class="mt-2 mb-2" >  <!-- style="background:powderblue;" -->
					<div class="row">
						<div class="col-sm-6 text-left">  <!-- style="background:orange;"	 -->               		 
							<!-- 적용하기 버튼 -->  									
								<button type="button" class="btn btn-outline-secondary ml-1">적용하기</button>							
						</div>	
						<div class="col-sm-6 text-right" >	 <!--  style="background:red;" -->
							<!-- 닫기 버튼 --> 					
								<!-- <button type="button" class="btn btn-secondary">닫기</button>		 -->
								<button type="button" class=" btn btn-secondary" data-dismiss="modal" aria-label="Close">
									닫기
								</button>								
						</div>		
					</div>				
				</div>	<!-- 하단버튼 -->

			</div>	<!-- modal-body -->
		</div>		<!--  modal-content -->
	</div>
</div>
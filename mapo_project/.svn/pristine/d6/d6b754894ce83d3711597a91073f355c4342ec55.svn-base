/**
 * 업무생성 페이지의 공통 Function
 */


$(document).ready(function() {
	
	var maxFileNum = 3;
	var multi_selector = new MultiSelector( document.getElementById( 'egovComFileList' ), maxFileNum );
	multi_selector.addElement( document.getElementById( 'egovComFileUploader' ) );
	//------------------------- 첨부파일 등록 End
	
	
	// 첨부파일
	$("#egovComFileUploader").on('change', function(){	
		$(this).next('.custom-file-label').html(event.target.files[0].name);
	});
	/* $( "#datepicker" ).datepicker(); */

	$('#datetimepicker4').datetimepicker({ 
		format: 'YYYY-MM-DD', 
	/* format: 'L', */ 
		useCurrent: true 
	});

	$('#datetimepicker3').datetimepicker({ 
		format: 'HH:mm', 
		/*format: 'LT', */
		useCurrent: true 
	});	
	
	/* 토글 커스텀 가능 */
	  $('#toggle-two').bootstrapToggle({
      on: ' ',
      off: ' '
    });
	  
	  /* 긴급공지 */
	  $("#urgentY").hide();
	  
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
		
		$("#checkAll").click(function() { /* 전체 선택 */
			$("#treeview").hummingbird("checkAll");
			$(this).hide();
			$("#uncheckAll").show();
		});
		
		$("#uncheckAll").hide();
		$("#uncheckAll").click(function() { /* 전체 해제 */
			$("#treeview").hummingbird("uncheckAll");
			$(this).hide();
			$("#checkAll").show();
		});
		
		$("#expandAll").click(function() { /* 펼치기 */
			$("#treeview").hummingbird("expandAll");
			$(this).hide();
			$("#collapseAll").show();
		});
		
		$("#collapseAll").hide();
		$("#collapseAll").click(function() {  /* 접기 */
			$("#treeview").hummingbird("collapseAll");
			$(this).hide();
			$("#expandAll").show();
		});
		
		/* 불러 오기 마감일 */
		$('#deadLinePickerStart').datetimepicker({ 
			format: 'YYYY-MM-DD', 
		/* format: 'L', */ 
			useCurrent: true 
		});
		$('#deadLinePickerEnd').datetimepicker({ 
			format: 'YYYY-MM-DD', 
		/* format: 'L', */ 
			useCurrent: true 
		});
	
		
	
});




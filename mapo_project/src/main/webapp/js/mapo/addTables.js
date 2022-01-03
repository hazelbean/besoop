/**
 * 업무 생성 페이지의 Table 항목 추가
 */


/*
$(document).ready(function() {
	$("#tableRow").hide();
	
	var maxAppend = 0;
	
	$("#addItemBtn").click(function(){
		var itemNm = $("#textItem").val();			//항목명 ITEM_NM
		if ( itemNm == null || itemNm == "" ) {
			alert("항목명을 입력하세요");
			return false;
		}
		
		if(maxAppend >= 3){
			alert("항목은 10개까지만 입력 가능합니다.")
			return;
		}
		$("#itemTable>tbody:last").append(
			"<tr>" +
			"<td class='col-sm-1 text-left'>" +
			"<input class='form-check-input' type='checkbox' style='margin-left: 25px;' name='checkRow' required>" +
			"<br></td>"
			+"<td class='col-sm-3 text-left'>" +
					"<label class='form-check-label' id='itemNm' for='autoSizingCheck'>"+itemNm+"</label>" +
					"<input class='form-check-input' type='hidden' id='itemNm' name = 'itemNm' for='itemNm' value='" +itemNm+ "'> " +
					"</td>"
			+"<td class='col-sm-4.9 text-center' style='border-top: none; padding:10px;'>" +
					"<input type='text' class='form-control'  id='itemDetail' name = 'itemDetail' placeholder='도움말을 입력하세요' value=''> " +
					"</td>"
			+"<td class='col-sm-0.5 text-center' style='border-top: none;'>" +
					"<img src='/mapo_project/images/mapo/com/chart.png'" +
					"alt='logo image'" +
					"style='margin:0px 0px 10px 10px;'>"+
					"</td>"
			+"<td class='col-sm-2 text-right' style='border-top: none;'>" +
					"<select id='inputYn' class='form-control' name = 'inputYn' >" +
					"<option value='Y'>입력가능</option>" +
					"<option value='N'>입력불가능</option>" +
					"</select>" + "</td>" 
			+"<td class='col-sm-1.6 text-left' style='border-top: none;'>" +
					"<select id='textYn' class='form-control' name = 'textYn' style='width: 90px;'>" +
					"<option value='N'>숫자</option>" +
					"<option value='Y'>문자</option>" +
					"</select>" +
					"</td>"+
			"</tr>"
		)
		maxAppend++;
		console.log("maxAppend one: " + maxAppend);
	});
	
});

 전체 선택  
function checkItemAll(){
	if($("#th_checkall").is(':checked')){
		$("input[name=checkRow]").prop("checked",true);
	}else{
		$("input[name=checkRow]").prop("checked",false);
	}
}


 선택 삭제 
function delRow(){
	var tableData = document.getElementById('itemTable');
	
	for(var i=1; i<tableData.rows.length; i++){
		 var chkbox = tableData.rows[i].cells[0].childNodes[0].checked ;
		 
		 if(chkbox){
			 tableData.deleteRow(i);
			 i--;
		 }
	}
}

*/
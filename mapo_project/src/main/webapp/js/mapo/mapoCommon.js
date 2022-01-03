/**
 * 마포 공통 Function
 */

/**
 * 오늘일자 
 * @returns
 */
function getToday() {
	
	var date = new Date();
	
	var year = date.getFullYear();
	var month = ("0" + (date.getMonth() + 1)).slice(-2);
	var day = ("0" + date.getDate()).slice(-2);

	var curDate = year + "-" + month +  "-" + day;
	
	return curDate;
}

/**
 * 당월 1일
 * @returns
 */
function getStartDay(){
	
	var date = new Date();
	
	var year = date.getFullYear();
	var month = ("0" + (date.getMonth() + 1)).slice(-2);
	
	var startDay = year + "-" + month +  "-" + "01";
	
	return startDay;
}


/**
 * 당월 마지막 일자
 * @returns
 */
function getEndDay() {
	
	var date = new Date();
	
	var year = date.getFullYear();
	var month = ("0" + (date.getMonth() + 1)).slice(-2);
	
	// 당월의 마지막 일자 계산
	var tempDate =  new Date(year, month, 0);
	
	var tempYear = tempDate.getFullYear();
	var tempMonth = ("0" + (tempDate.getMonth() + 1)).slice(-2);
	var tempDay = ("0" + tempDate.getDate()).slice(-2);
	
	var endDay = tempYear + "-" + tempMonth +  "-" + tempDay;
	
	return endDay;
}




/**
 * 현재시간
 * @returns
 */
function getTime() {
	
	var date = new Date();
	
	var time = ("0" + date.getHours()).slice(-2);
	var min =  ("0" + date.getMinutes()).slice(-2);
	
	var curTime = time + ":" + min;
/*	
	console.log("time : " + time);
	console.log("min :" + min);
	console.log("curTime : " + curTime);
	*/
	return curTime;
}



/**
 * 업무마감시간
 * @returns
 */
function getClose() {
	
	var time = "18:00";
	
	return time;
}





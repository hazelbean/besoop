package mapo.work.web;

import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import egovframework.com.cmm.LoginVO;
import egovframework.com.cmm.service.EgovFileMngService;
import egovframework.com.cmm.service.EgovFileMngUtil;
import egovframework.com.cmm.service.FileVO;
import egovframework.com.cmm.util.EgovUserDetailsHelper;
import egovframework.rte.fdl.property.EgovPropertyService;
import egovframework.rte.ptl.mvc.tags.ui.pagination.PaginationInfo;
import mapo.work.service.WorkService;
import mapo.work.service.WorkVO;

@Controller
public class WorkController {

	private final Logger LOGGER = LoggerFactory.getLogger(this.getClass());

	// Service
	@Resource(name = "workService")
	private WorkService workService;

	// 첨부파일 관련
	@Resource(name = "EgovFileMngService")
	private EgovFileMngService fileMngService;

	@Resource(name = "EgovFileMngUtil")
	private EgovFileMngUtil fileUtil;

	/** EgovPropertyService */
	@Resource(name = "propertiesService")
	protected EgovPropertyService propertiesService;

	/**
	 * 업무생성 화면 이동
	 * 
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("mapo/addWork.do")
	public String AddWork(@ModelAttribute("WorkVO") WorkVO workVO, ModelMap model) throws Exception {

		/* 업무구분 조회 */
		workVO.setCodeId("TAS"); // 조회할 코드 셋팅

		LOGGER.debug("workVO.getClCode()  =====> ", workVO.getClCode());

		List<?> list = workService.selectWorkGubun(workVO);
		model.addAttribute("resultGubun", list);

		/* 업무당당자 조회 */
		//workVO.setCodeId("MAN");
		//List<?> managerList = workService.selectWorkGubun(workVO);
		List<?> managerList = workService.selectWorkManager(workVO);
		model.addAttribute("resultManager", managerList);

		/* 업무진행상태 조회 */
		workVO.setCodeId("STE");
		List<?> steList = workService.selectWorkGubun(workVO);
		model.addAttribute("resultSte", steList);

		/* 시설선택 화면 (트리구조) */
		List<?> list1 = workService.selectDepth1(workVO);
		List<?> list2 = workService.selectDepth2(workVO);
		List<?> list3 = workService.selectDepth3(workVO);
		List<?> list4 = workService.selectDepth4(workVO);

		model.addAttribute("resultDepth1", list1);
		model.addAttribute("resultDepth2", list2);
		model.addAttribute("resultDepth3", list3);
		model.addAttribute("resultDepth4", list4);

		return "mapo/work/AddWork";
	}

	/**
	 * 업무생성 화면 저장(임시 저장)
	 * 
	 * @param gthtaskVO
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/mapo/insertWork.do", method = RequestMethod.POST)
	@ResponseBody
	public String insertWork(final MultipartHttpServletRequest multiRequest, // 첨부파일을 위한...
			@ModelAttribute("WorkVO") WorkVO workVO, @RequestParam("mode") String mode) throws Exception {

		System.out.println("실행 insertWork -------------> ");
		System.out.println("mode -------------> " + mode);

		// 첨부파일 관련 첨부파일ID 생성
		List<FileVO> _result = null;
		String _atchFileId = "";

		final List<MultipartFile> files = multiRequest.getFiles("file_1");

		System.out.println("files -------------> " + files.size());

		if (!files.isEmpty()) {
			_result = fileUtil.parseFileInf(files, "WORK_", 0, "", "");
			_atchFileId = fileMngService.insertFileInfs(_result); //파일이 생성되고나면 생성된 첨부파일 ID를 리턴한다.
		}

		// 리턴받은 첨부파일ID를 셋팅한다..
		workVO.setAtchFileId(_atchFileId); // 첨부파일 ID

		System.out.println("_atchFileId --> " + _atchFileId);
		System.out.println("vo.getAtchFileId --> " + workVO.getAtchFileId());
		System.out.println("insertId --->" + workVO.getInsertId());

		String msg = "";

		/* 저장 로직 */
		if ("insert".equals(mode)) {

			// 1. 업무 테이블에서 등록할 ID 값 취득
			int taskId = workService.selectTaskId();
			System.out.println("taskId -----------> " + taskId);

			workVO.setTaskId(taskId);

			// 2. 업무생성 단계 코드 입력 (생성: STE010)
			workVO.setStep("STE010");

			// 3. 업무생성
			int result = workService.insertWork(workVO);

			// 저장성공 시 taskId 화면으로 전달
			if (result == 1) {
				msg = "OK" + "/" + taskId;

			} else {
				msg = "FAIL" + "/" + result;

			}

			System.out.println("업무생성 result---> " + result);

		} /* 수정 로직 */
//		else if ("update".equals(mode)) {
//
//			// 업무ID 설정
//			int taskId = Integer.parseInt(workVO.getTempId());
//			workVO.setTaskId(taskId);
//
//			System.out.println("update taskId -------------> " + taskId);
//
//			int result = workService.updateTask(workVO);
//
//			// 저장성공 시 taskId 화면으로 전달
//			if (result == 1) {
//				msg = "OK";
//
//			} else {
//				msg = "FAIL";
//
//			}
//		}

		return msg;
	}
	
	

	/**
	 * 업무생성 항목 등록
	 * 
	 * @param workVO
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("mapo/addItemSave.do")
	@ResponseBody
	public String insertItemSave(@RequestParam(value = "taskId") int taskId, 
								 @RequestParam(value = "insertId") String insertId, 
								 @RequestParam(value = "itemNm") List<String> itemNm, 
								 @RequestParam(value = "itemDetail") List<String> itemDetail, 
								 @RequestParam(value = "inputYn") List<String> inputYn,
								 @RequestParam(value = "textYn") List<String> textYn, 
							
								 @ModelAttribute("WorkVO") WorkVO workVO) throws Exception {
	
		/*for(int i=0; i<itemNm.size(); i++) {
			System.out.println(itemNm.get(i));
		}*/
		

		System.out.println("itemNm.size() ------------->" + itemNm.size());	
		System.out.println("taskId ------------->" + taskId);
	
		int result_item = 0;
		
	
		// 항목 저장 (insert/update)
		if (itemNm.size() > 0) {
	
			for (int i = 0; i < itemNm.size(); i++) {
	
				WorkVO wo = new WorkVO();
	
				wo.setTaskId(taskId);
				wo.setInsertId(insertId);
				wo.setItemNm(itemNm.get(i));
				wo.setItemDetail(itemDetail.get(i));
				wo.setInputYn(inputYn.get(i));
				wo.setTextYn(textYn.get(i));
	
				result_item += workService.insertItem2(wo);
			}
		}
	
		System.out.println("항목추가 result_item -----------------> " + result_item);
		
		String msg = "";
	
		if (result_item == -1) {
			msg = "FAIL";
	
		} else {
			msg = "OK";
		}
	
		return msg;
	}
	
	
	/**
	 * 업무생성 시설 등록
	 * 
	 * @param workVO
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("mapo/addOrgSave.do")
	@ResponseBody
	public String insertOrgSave( @RequestParam(value = "taskId") int taskId, 
								 @RequestParam(value = "insertId") String insertId, 								
								 @RequestParam(value = "itemId") String itemId, 								
								 @RequestParam(value = "orgIdList") List<String> orgIdList, 
								 @ModelAttribute("WorkVO") WorkVO workVO) throws Exception {
	
		/*for(int i=0; i<itemNm.size(); i++) {
			System.out.println(itemNm.get(i));
		}*/

		System.out.println("taskId ------------->" + taskId);
		System.out.println("taskId ------------->" + taskId);
	

		int result_org = 0;
	
	
		// 시설 추가
		if (orgIdList.size() > 0) {
			System.out.println("시설 추가 ------------------->");
		
			// 기존 데이터가 있을 경우 Delete 
			workVO.setTaskId(taskId);
		
			int count = workService.selectOrgCnt(workVO);
			System.out.println("org count-----------------> " + count);
		
			if (count > 0) {
				workService.deleteFacilityList(workVO);
			}
		
			for (int i = 0; i < orgIdList.size(); i++) {
				WorkVO vo = new WorkVO();
		
				System.out.println("orgIdList.get( " + i + " )-----------------> " + orgIdList.get(i).toString());
		
				vo.setTaskId(taskId);
				vo.setInsertId(insertId);
				vo.setOrgId(orgIdList.get(i).toString());
		
				result_org = workService.insertOrgList(vo);
			}
		}
		
		System.out.println("insertOrgSave insert문 결과 확인 완료!!!  : " +  result_org);
		
		
		String msg = "";
	
		if (result_org == -1) {
			msg = "FAIL";
	
		} else {
			msg = "OK";
		}
	
		return msg;
	}
	
	
	/**
	 * 업무생성 항목/시설 등록
	 * 
	 * @param workVO
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("mapo/addAllSave.do")
	@ResponseBody
	public String addAllSave(@RequestParam(value = "taskId") int taskId, 
								 @RequestParam(value = "insertId") String insertId, 
								 @RequestParam(value = "itemNm") List<String> itemNm, 
								 @RequestParam(value = "itemDetail") List<String> itemDetail, 
								 @RequestParam(value = "inputYn") List<String> inputYn,
								 @RequestParam(value = "textYn") List<String> textYn, 
								 @RequestParam(value = "orgIdList") List<String> orgIdList, 
								 @ModelAttribute("WorkVO") WorkVO workVO) throws Exception {
	
		/*for(int i=0; i<itemNm.size(); i++) {
			System.out.println(itemNm.get(i));
		}*/
		

		System.out.println("itemNm.size() ------------->" + itemNm.size());	
		System.out.println("taskId ------------->" + taskId);
	
		int result_item = 0;
		int result_org = 0;
	
		// 항목 저장 (insert/update)
		if (itemNm.size() > 0) {
			workService.deleteWorkItem(workVO);
			for (int i = 0; i < itemNm.size(); i++) {
	
				WorkVO wo = new WorkVO();
	
				wo.setTaskId(taskId);
				wo.setInsertId(insertId);
				wo.setItemNm(itemNm.get(i));
				wo.setItemDetail(itemDetail.get(i));
				wo.setInputYn(inputYn.get(i));
				wo.setTextYn(textYn.get(i));
	
				result_item += workService.insertItem2(wo);
			}
		}
	
		System.out.println("항목추가 result_item -----------------> " + result_item); //4
	
		// 시설 추가
		if (orgIdList.size() > 0) {
			System.out.println("시설 추가 ------------------->");
		
			// 기존 데이터가 있을 경우 Delete 
			workVO.setTaskId(taskId);
		
			int count = workService.selectOrgCnt(workVO);
			System.out.println("org count-----------------> " + count);
		
			if (count > 0) {
				workService.deleteFacilityList(workVO);
			}
		
			for (int i = 0; i < orgIdList.size(); i++) {
				WorkVO vo = new WorkVO();
		
				System.out.println("orgIdList.get( " + i + " )-----------------> " + orgIdList.get(i).toString());
		
				vo.setTaskId(taskId);
				vo.setInsertId(insertId);
				vo.setOrgId(orgIdList.get(i).toString());
		
				result_org = workService.insertOrgList(vo);
			}
		}
		
		System.out.println("insert문 결과 확인 완료!!!  : " + result_item + " / " + result_org);
		
		
		
		String msg = "";
	
		if (result_item == -1 || result_org == -1) {
			msg = "FAIL";
	
		} else {
			msg = "OK";
		}
	
		return msg;
	}
	
	
	
	/**
	 * 업무 배포
	 * 
	 * @param workVO
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("mapo/workDist.do")
	@ResponseBody
	public String workDist(@ModelAttribute("WorkVO") WorkVO workVO, @RequestParam(value = "insertId") String insertId, ModelMap model) throws Exception {

		System.out.println("workDist taskId -----> " + workVO.getTaskId());
		System.out.println("workDist insertId -----> " + workVO.getInsertId());

		// 1. 업무배포 : 기관 배포 테이블에 저장
		int result1 = workService.insertTaskDist(workVO);

		// 2. 업무배포 : 기관별 항목 저장 (기관에서 항목  입력 받을 수 있음)
		int result2 = workService.insertTaskCheck(workVO);

		// 3. 업무배포 : 진행단계 배포로 수정
		workVO.setStep("STE030"); // 업무배포 코드
		int result3 = workService.updateTaskStep(workVO);

		System.out.println("workDist result1 -----> " + result1);
		System.out.println("workDist result2 -----> " + result2);
		System.out.println("workDist result3 -----> " + result3);

		String msg = "";

		// 저장성공 시 taskId 화면으로 전달
		if (result3 == 1) {
			msg = "OK";

		} else {
			msg = "FAIL";

		}

		return msg;
	}

	/**
	 * 마포구청용 업무 리스트 조회
	 * 
	 * @param workVO
	 * @param model
	 * @throws Exception
	 */
	@RequestMapping(value = "/mapo/mapoWorkList.do", method = RequestMethod.POST)
	@ResponseBody
	public ModelAndView mapoWorkList(@ModelAttribute("WorkVO") WorkVO workVO, ModelMap model) throws Exception {

		System.out.println("mapoWorkList  ------------------------------->");

		/* Ajax List 리턴을 위해서는 ModelAndView 로 설정해야 함 */
		ModelAndView modelAndView = new ModelAndView();

		List<?> list = workService.selectWorkList(workVO);

		modelAndView.setViewName("jsonView");
		modelAndView.addObject("result", list);

		return modelAndView;

	}

	/*****************************
	 * 이하 업무확인 화면
	 ***********************************************************/

	/**
	 * 업무확인 목록(마포구청)
	 * 
	 * @param workVO
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("mapo/workList.do")
	public String selectWorkList(@ModelAttribute("WorkVO") WorkVO workVO, ModelMap model) throws Exception {

		/*
		 * 업무 검색
		 */
		/* 진행상태 리스트 */
		workVO.setCodeId("STE");
		List<?> stepList = workService.selectWorkGubun(workVO);
		model.addAttribute("resultStep", stepList);
		System.out.println(stepList);

		/* 업무구분 리스트 */
		workVO.setCodeId("TAS");
		List<?> gubunList = workService.selectWorkGubun(workVO);
		model.addAttribute("resultGubun", gubunList);

		/* 담당자 리스트 */
		List<?> managerList = workService.selectWorkManager(workVO);
		model.addAttribute("resultManager", managerList);

		/* 검색 키워드 */
		model.addAttribute("startDt", workVO.getStartDt());
		model.addAttribute("endDt", workVO.getEndDt());
		model.addAttribute("step", workVO.getStep());
		model.addAttribute("taskIdx", workVO.getTaskIdx());
		model.addAttribute("manager", workVO.getManager());
		model.addAttribute("taskNm", workVO.getTaskNm());
		model.addAttribute("taskContents", workVO.getTaskContents());

		/*
		 * 페이징
		 */
		/** EgovPropertyService.sample */
		workVO.setPageUnit(propertiesService.getInt("pageUnit"));
		workVO.setPageSize(propertiesService.getInt("pageSize"));

		/** pageing */
		PaginationInfo paginationInfo = new PaginationInfo();
		paginationInfo.setCurrentPageNo(workVO.getPageIndex());
		paginationInfo.setRecordCountPerPage(workVO.getPageUnit());
		paginationInfo.setPageSize(workVO.getPageSize());

		workVO.setFirstIndex(paginationInfo.getFirstRecordIndex());
		workVO.setLastIndex(paginationInfo.getLastRecordIndex());
		workVO.setRecordCountPerPage(paginationInfo.getRecordCountPerPage());

		System.out.println("searchkeyword ---> " + workVO.getSearchkeyword());
		
		int total = workService.selectWorkTotal(workVO);
		paginationInfo.setTotalRecordCount(total);
		model.addAttribute("paginationInfo", paginationInfo);

		/*
		 * 업무확인 리스트
		 */
		List<?> worklist = workService.selectWorkList(workVO);
		model.addAttribute("resultWorkList", worklist);
		model.addAttribute("total", total);

		return "mapo/work/WorkList";
	}

    /**
     * 업무확인 목록(복지기관)
     * 
     * @param workVO
     * @param model
     * @return
     * @throws Exception
     */
    @RequestMapping("mapo/workListOrg.do")

    public String selectWorkListOrg( @ModelAttribute("WorkVO") WorkVO workVO, ModelMap model) throws Exception {
    	
        /* 로그인한 사용자의 기관ID를 불러온다. */
        LoginVO loginVO = (LoginVO) EgovUserDetailsHelper.getAuthenticatedUser();
		
		if ( loginVO != null ) {
			workVO.setMyOrgId(loginVO.getPsitnstCode());
			System.out.println("++++++++++ 로그인 기관ID ++++++++++ " + workVO.getMyOrgId());	
		}

    	/*
         * 업무 검색
         */
        /* 검색 셀랙트박스에 승인상태 리스트를 불러온다. */
        workVO.setCodeId("REQ");
        List<?> reqList = workService.selectWorkGubun(workVO);
        model.addAttribute("resultReq", reqList);
        System.out.println(reqList);

        /* 검색 셀랙트박스에 업무구분 리스트를 불러온다. */
        workVO.setCodeId("TAS");
        List<?> tasList = workService.selectWorkGubun(workVO);
        model.addAttribute("resultTas", tasList);

        /* 검색 셀랙트박스에 담당자 리스트를 불러온다. */
        workVO.setCodeId("MAN");
        List<?> managerList = workService.selectWorkGubun(workVO);
        model.addAttribute("resultManager", managerList);
        
        /* 검색 키워드를 저장한다. */
        model.addAttribute("startDt", workVO.getStartDt());
        model.addAttribute("endDt", workVO.getEndDt());
        model.addAttribute("approval", workVO.getApproval());
        model.addAttribute("taskIdx", workVO.getTaskIdx());
        model.addAttribute("manager", workVO.getManager());
        model.addAttribute("taskNm", workVO.getTaskNm());
        model.addAttribute("taskContents", workVO.getTaskContents());
        model.addAttribute("myOrgId", workVO.getMyOrgId());

        /*
         * 페이징
         */
        /** EgovPropertyService.sample */
        workVO.setPageUnit(propertiesService.getInt("pageUnit"));
        workVO.setPageSize(propertiesService.getInt("pageSize"));

        /** pageing */
        PaginationInfo paginationInfo = new PaginationInfo();
        paginationInfo.setCurrentPageNo(workVO.getPageIndex());
        paginationInfo.setRecordCountPerPage(workVO.getPageUnit());
        paginationInfo.setPageSize(workVO.getPageSize());

        workVO.setFirstIndex(paginationInfo.getFirstRecordIndex());
        workVO.setLastIndex(paginationInfo.getLastRecordIndex());
        workVO.setRecordCountPerPage(paginationInfo.getRecordCountPerPage());

        int total = workService.selectWorkTotalOrg(workVO);
        paginationInfo.setTotalRecordCount(total);
        model.addAttribute("paginationInfo", paginationInfo);
        
        /*
         * 리스트
         */	
		List<?> list = workService.selectWorkListOrg(workVO);
        model.addAttribute("resultWorkList", list);
        model.addAttribute("total", total);
        
        return "mapo/work/WorkListOrg";

		//return msg;
	}

	/**
	 * 업무확인상세(마포구청)
	 * 
	 * @pa        workVO.setFirstIndex(paginationInfo.getFirstRecordIndex());
        workVO.setLastIndex(paginationInfo.getLastRecordIndex());
        workVO.setRecordCountPerPage(paginationInfo.getRecordCountPerPage());
/
	@RequestMapping("mapo/workDetail.do")
	public String workDetail(@ModelAttribute("WorkVO") WorkVO workVO, ModelMap model) throws Exception {

		/*        int total = workService.selectWorkTotal(workVO);
        paginationInfo.setTotalRecordCount(total);
        model.addAttribute("paginationInfo", paginationInfo);
        
 " + worklist);
		System.out.println("업무 상세 list.size(): " + worklist.size());

		model.addAttribute("result", workVO);
		model.addAttribute("worklist", worklist);

		return "mapo/work/WorkDetail";

	}

	/**
	 * 업무확인상세(복지기관)
	 * 
	 * @param vo
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("mapo/workDetailOrg.do")
	public String selectWorkDetailOrg(
			@RequestParam("mode") String mode,
			@ModelAttribute("WorkVO") WorkVO workVO, ModelMap model) throws Exception {
        
		/* 로그인한 사용자의 기관ID를 불러온다. */
        LoginVO loginVO = (LoginVO) EgovUserDetailsHelper.getAuthenticatedUser();
		
		if ( loginVO != null ) {
			workVO.setMyOrgId(loginVO.getPsitnstCode());
			System.out.println("++++++++++ workDetailOrg 로그인 기관ID ++++++++++ " + workVO.getMyOrgId());	
		}

		/*
		 * 상세 보기
		 */
		/* 업무 */
		WorkVO vo =  workService.selectWorkDetail(workVO);
		System.out.println("승인1"+vo);

		WorkVO vo2 =  workService.selectApproval(workVO);
		System.out.println("승인2"+vo2);
		
		workVO.setFrstReadId(loginVO.getId());
		workService.updateCount(workVO);

		
		/* 업무 항목 */
		List<?> list = workService.selectItemListOrg(workVO);

		//System.out.println("업무 상세 result: " + workVO);
		//System.out.println("업무 상세 list: " + list);
		//System.out.println("업무 상세 list.size(): " + list.size());

		model.addAttribute("result", vo);
		model.addAttribute("req", vo2);
		
		
		model.addAttribute("list", list);

		//return "mapo/work/WorkDetailOrg";
		String url = "";
		
		System.out.println("mode -----> " + mode);
		
		if (mode.equals("view")) {
			url = "mapo/work/WorkDetailOrgView";
			
		} else if (mode.equals("mod")) {
			url = "mapo/work/WorkDetailOrg";
		}
	
		return url;
	}


	/**
	 * 업무확인상세(복지기관) : 항목 값 저장
	 * 
	 * @param WorkVO
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("mapo/insertItemValue.do")
	@ResponseBody
	public String insertItemValue(
			@RequestParam(value = "taskId") int taskId, 
			@RequestParam(value = "orgId") String orgId, 
			@RequestParam(value = "itemIdList") List<Integer> itemIdList, 
			@RequestParam(value = "itemValue") List<String> itemValue, 
			@RequestParam(value = "updateId") String updateId,
			@ModelAttribute("WorkVO") WorkVO workVO, ModelMap model) throws Exception {

		/*
		 * 항목 값 저장
		 */
		System.out.println("++++++++++ 항목값 taskId ++++++++++" + taskId);
		System.out.println("++++++++++ 항목값 orgId ++++++++++" + orgId);
		System.out.println("++++++++++ 항목값 itemIdList ++++++++++" + itemIdList.size());
		System.out.println("++++++++++ 항목값 itemValue ++++++++++" + itemValue.size());
		System.out.println("++++++++++ 항목값 updateId ++++++++++" + updateId);

		int result = 0;

		if (itemValue.size() > 0) {

			for (int i = 0; i < itemValue.size(); i++) {

				WorkVO vo = new WorkVO();

				vo.setTaskId(taskId);
				vo.setOrgId(orgId);
				vo.setItemId(itemIdList.get(i));
				vo.setItemValue(itemValue.get(i));
				vo.setUpdateId(updateId);

				//result++;			
				result += workService.insertItemValue(vo);

				System.out.println("++++++++++ result ++++++++++ " + result);
			}
		}

		System.out.println("++++++++++ tot result ++++++++++" + result);

		String msg = "";

		if (result > 0) {
			msg = "OK";

		} else {
			msg = "FAIL";
		}

		return msg;
	}
	
	/**
	 * 업무 승인요청(복지기관)
	 * 
	 * @param workVO
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("mapo/updateApproval.do")
	@ResponseBody
	public String updateApproval(
			@RequestParam(value = "taskId") int taskId,
			@RequestParam(value = "orgId") String orgId,
			@RequestParam(value = "updateId") String updateId,
			@ModelAttribute("WorkVO") WorkVO workVO,
			ModelMap model) throws Exception {

		System.out.println("승인요청 taskId -----> " + workVO.getTaskId());
		System.out.println("승인요청 orgId -----> " + workVO.getOrgId());
		System.out.println("승인요청 updateId -----> " + workVO.getUpdateId());

		int result = workService.updateApproval(workVO);

		String msg = "";

		if (result == 1) {
			
			msg = "OK";

		} else {
			msg = "FAIL";

		}
		System.out.println("메세지 왜 페일?: "+ msg);
		System.out.println("result?: "+ result);
		return msg;
	}

	/**
	 * 기관 선택
	 * 
	 * @param vo
	 * @param model
	 * @return
	 * @throws Exception
	 */

	@RequestMapping(value = "/mapo/searchOrg.do", method = RequestMethod.POST)
	@ResponseBody
	public ModelAndView selectOrg(@ModelAttribute("WorkVO") WorkVO workVO, ModelMap model, @RequestParam("mode") String mode) throws Exception {

		System.out.println("mode -----> " + mode);
		System.out.println("getCode -----> " + workVO.getCode());

		/* Ajax List 리턴을 위해서는 ModelAndView 로 설정해야 함 */
		ModelAndView modelAndView = new ModelAndView();

		List<?> list = new ArrayList<>();

		/* 대분류 선택 */
		if ("selectLc".equals(mode)) {

			list = workService.selectDepth2(workVO);

			/* 중분류 선택 */
		} else if ("selectMc".equals(mode)) {

			list = workService.selectDepth3(workVO);

			/* 소분류 선택 */
		} else if ("selectSc".equals(mode)) {

			list = workService.selectDepth4(workVO);
		}

		System.out.println("list.size : " + list.size());

		modelAndView.setViewName("jsonView");
		modelAndView.addObject("result", list);

		return modelAndView;
	}

}

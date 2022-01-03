package mapo.work.web;

import java.util.List;

import javax.annotation.Resource;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import egovframework.com.cmm.service.EgovFileMngService;
import egovframework.com.cmm.service.EgovFileMngUtil;
import egovframework.rte.fdl.property.EgovPropertyService;
import mapo.work.service.WorkService;
import mapo.work.service.WorkVO;

@Controller
public class WorkDetailController {

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
	 * 마포구청 업무확인 화면 (view, mode) 이동
	 * 
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/mapo/AddWorkDetail.do")
	public String AddWorkView(@ModelAttribute("WorkVO") WorkVO workVO, ModelMap model,
			@RequestParam("taskId") int taskId,
			@RequestParam("mode") String mode) throws Exception {

		System.out.println("AddWorkDetail taskId ----> " + taskId);

		/* 업무구분 조회 */
		workVO.setCodeId("TAS"); // 조회할 코드 셋팅

		LOGGER.debug("workVO.getClCode()  =====> ", workVO.getClCode());

		List<?> list = workService.selectWorkGubun(workVO);
		model.addAttribute("resultGubun", list);

		/* 업무당당자 조회 */
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

		/* 업무 폼 조회 */
		workVO.setTaskId(taskId);
		WorkVO vo = workService.selectWorkDetail(workVO);
		model.addAttribute("workVO", vo);
		System.out.println("workVO atchFile confirm : " + vo);

		/* 항목 조회 */
		int itemCnt = workService.selectWorkItemCnt(workVO);
		model.addAttribute("itemCnt", itemCnt);

		
		if (itemCnt > 0) {
			System.out.println("itemVO list itemCnt ---> " + itemCnt);

			List<?> item = workService.selectItemList(workVO);
			model.addAttribute("itemVO", item);
			System.out.println("itemVO list Count Size ---> " + item.size());
//			for(int i =0 ; i<item.size(); i++) {
//				item.get(0).
//			}
			System.out.println("itemVO list Count ---> " + item);
		}
		

		/*복지시설 조회*/
		int orgCnt = workService.selectOrgCnt(workVO);
		model.addAttribute("orgCnt", orgCnt);

		if (orgCnt > 0) {
			List<?> orgList = workService.selectWorkOrgList(workVO);
			model.addAttribute("orgList", orgList);
		}

		//System.out.println("org  -----> " + orgList.size());
		//System.out.println("org  -----> " + orgList.get(0));

		String url = "";
		
		System.out.println("mode -----> " + mode);
		
		if (mode.equals("view")) {
			url = "mapo/work/AddWorkView";
			
		} else if (mode.equals("mod")) {//수정하기
			url = "mapo/work/AddWorkDetail";
		}

		return url;
	}


	/**
	 * 업무 삭제
	 * 
	 * @param workVO
	 * @param model
	 * @param taskId
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/mapo/workDelete.do")
	@ResponseBody
	public String workDelete(@ModelAttribute("WorkVO") WorkVO workVO, ModelMap model, @RequestParam("taskId") int taskId) throws Exception {

		System.out.println("taskId  ---> " + taskId);

		workVO.setTaskId(taskId);

		// 복지시설 데이터가 있을 경우 삭제
		int result_org = 0;
		int orgCnt = workService.selectOrgCnt(workVO);

		if (orgCnt > 0) {
			result_org = workService.deleteFacilityList(workVO);
		}

		// 아이템 항목이 있을 경우 삭제
		int result_item = 0;
		int itemCnt = workService.selectWorkItemCnt(workVO);

		if (itemCnt > 0) {
			result_item = workService.deleteWorkItem(workVO);
		}

		// 업무폼 데이터 삭제
		int result_work = workService.deleteWorkForm(workVO);

		System.out.println("result_org ---> " + result_org);
		System.out.println("result_item ---> " + result_item);
		System.out.println("result_work ---> " + result_work);

		String msg = "";

		if(result_work > 0) {
			msg = "OK";
		}else {
			msg ="fail";
		}
		return msg;
	}
}

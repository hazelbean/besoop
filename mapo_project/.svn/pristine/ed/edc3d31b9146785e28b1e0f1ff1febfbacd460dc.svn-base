package mapo.org.web;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.management.j2ee.Management;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import egovframework.rte.fdl.property.EgovPropertyService;
import egovframework.rte.ptl.mvc.tags.ui.pagination.PaginationInfo;
import mapo.org.service.OrgService;
import mapo.org.service.OrgVO;
import mapo.work.service.WorkService;
import mapo.work.service.WorkVO;

@Controller
public class OrgController {

	// Service
	@Resource(name = "workService")
	private WorkService workService;

	@Resource(name = "orgService")
	private OrgService orgService;

	/** EgovPropertyService */
	@Resource(name = "propertiesService")
	protected EgovPropertyService propertiesService;

	/**
	 * 복지시설 관리 화면 이동
	 * 
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/mapo/orgList.do")
	public String OrgList(@ModelAttribute("WorkVO") WorkVO workVO, ModelMap model) throws Exception {
		
		/* 시설 대,중,소분류 */
		List<?> list1 = workService.selectDepth1(workVO);
		List<?> list2 = workService.selectDepth2(workVO);
		List<?> list3 = workService.selectDepth3(workVO);
		List<?> list4 = workService.selectDepth4(workVO);
		
		
		model.addAttribute("resultDepth1", list1);
		model.addAttribute("resultDepth2", list2);
		model.addAttribute("resultDepth3", list3);
		model.addAttribute("resultDepth4", list4);

		
		/* 시설 대분류 */
		List<?> lcList = workService.selectDepth1(workVO);
		model.addAttribute("resultLc", lcList);
		
		/* 시설 중분류 */
		List<?> McList = workService.selectDepth2(workVO);
		model.addAttribute("resultMc", McList);
		
		/* 시설 소분류 */
		List<?> ScList = workService.selectDepth3(workVO);
		model.addAttribute("resultSc", ScList);
		
		/* 복지시설 */
		List<?> orgName = workService.selectDepth4(workVO);
		model.addAttribute("resultOrgName", orgName);
		
		/* 검색 키워드 */
		model.addAttribute("searchOrg",workVO.getSearchOrg());
		model.addAttribute("selectLc",workVO.getSelectLc());
		model.addAttribute("selectMc",workVO.getSelectMc());
		model.addAttribute("selectSc",workVO.getSelectSc());
		model.addAttribute("selectOrgName",workVO.getSelectOrgName());
		
		/* 복지지설 관리 시설분류 selected된 시설이름 조회  */
		model.addAttribute("org1",workVO.getOrg1());
		model.addAttribute("org2",workVO.getOrg2());
		model.addAttribute("org3",workVO.getOrg3());
		model.addAttribute("org4",workVO.getOrg4());
		
		/* 복지지설 관리 페이지에서 시설분류 selected된 시설이름 조회 */
		String org1Nm = orgService.selectOrg1Nm(workVO.getOrg1());
		model.addAttribute("org1Nm",org1Nm);
		String org2Nm = orgService.selectOrg2Nm(workVO.getOrg2());
		model.addAttribute("org2Nm",org2Nm);
		String org3Nm = orgService.selectOrg3Nm(workVO.getOrg3());
		model.addAttribute("org3Nm",org3Nm);
		String org4Nm = orgService.selectOrg4Nm(workVO.getOrg4());
		model.addAttribute("org4Nm",org4Nm);
		

		/* 페이징 처리 */
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

		int total = orgService.selectOrgListTotcnt(workVO);
		paginationInfo.setTotalRecordCount(total);
		model.addAttribute("paginationInfo", paginationInfo);

		/*
		 * 시설 확인 리스트
		 */
		List<?> orglist = orgService.selectOrgList(workVO);
		
		model.addAttribute("resultOrgList", orglist); // 시설 확인
		model.addAttribute("orgTotal", total);	// 총 갯수
		
		return "mapo/org/OrgList";
	}
	

	/**
	 * 시설 선택
	 * @param vo
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value="/mapo/selectOrg.do", method = RequestMethod.POST)
	@ResponseBody
	public ModelAndView selectOrg1(@ModelAttribute("WorkVO") WorkVO workVO, ModelMap model, @RequestParam("mode") String mode) throws Exception {
	
		System.out.println("mode -----> " + mode);
		System.out.println("getCode -----> " + workVO.getCode());
		
		/* Ajax List 리턴을 위해서는 ModelAndView 로 설정해야 함 */
		ModelAndView modelAndView = new ModelAndView();
		
		
		List<?> list = new ArrayList<>();
		
		/* 대분류 선택 */
		if( "org1".equals(mode) ) {
			
			list = workService.selectDepth2(workVO);
			
		/* 중분류 선택 */
		} else if ( "org2".equals(mode) ) {
			
			list = workService.selectDepth3(workVO);
			
		/* 소분류 선택	*/
		} else if ( "org3".equals(mode)) {
			
			list = workService.selectDepth4(workVO);
		}
		
		System.out.println("list.size : " + list.size());
		
		modelAndView.setViewName("jsonView");
		modelAndView.addObject("result", list);

		return modelAndView;
	}
	
	
	/**
	 * 시설 입력
	 * @param workVO
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/mapo/orgInsertView.do")
	public String insertOrgView(@ModelAttribute("WorkVO") WorkVO workVO, ModelMap model) throws Exception {
		
		/* 시설 대분류 */
		List<?> lcList = workService.selectDepth1(workVO);
		model.addAttribute("resultLc", lcList);
		
		/* 시설 중분류 */
		List<?> McList = workService.selectDepth2(workVO);
		model.addAttribute("resultMc", McList);
		
		/* 시설 소분류 */
		List<?> ScList = workService.selectDepth3(workVO);
		model.addAttribute("resultSc", ScList);
		
		/* 시설 대,중,소분류 */
		List<?> list1 = workService.selectDepth1(workVO);
		List<?> list2 = workService.selectDepth2(workVO);
		List<?> list3 = workService.selectDepth3(workVO);
		List<?> list4 = workService.selectDepth4(workVO);
		
		model.addAttribute("resultDepth1", list1);
		model.addAttribute("resultDepth2", list2);
		model.addAttribute("resultDepth3", list3);
		model.addAttribute("resultDepth4", list4);
		
		return "mapo/org/OrgInsert";
	}
	
	/**
	 * 시설 저장
	 * @param orgVO
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("mapo/orgInsertSave.do")
	public String insertOrg(@ModelAttribute("OrgVO") OrgVO orgVO) throws Exception {
		int result = orgService.insertOrg(orgVO);
		return "redirect:/mapo/orgList.do";
	}

	/**
	 * 시설 상세
	 * @param orgVO
	 * @param workVO
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/mapo/orgDetail.do")
	public String updateOrgView(@ModelAttribute("OrgVO") OrgVO orgVO, WorkVO workVO, ModelMap model) throws Exception {
			
		WorkVO wo = new WorkVO();
		/* 시설 대,중,소분류 */
		
		/* 시설 대,중,소분류 */
		List<?> list1 = workService.selectDepth1(workVO);
		List<?> list2 = workService.selectDepth2(workVO);
		List<?> list3 = workService.selectDepth3(workVO);
		List<?> list4 = workService.selectDepth4(workVO);
		
		
		model.addAttribute("resultDepth1", list1);
		model.addAttribute("resultDepth2", list2);
		model.addAttribute("resultDepth3", list3);
		model.addAttribute("resultDepth4", list4);
		
		List<?> lcList = workService.selectDepth1(wo);
		model.addAttribute("resultLc", lcList);
		List<?> McList = workService.selectDepth2(wo);
		model.addAttribute("resultMc", McList);
		List<?> ScList = workService.selectDepth3(wo);
		model.addAttribute("resultSc", ScList);
		
		orgVO = (OrgVO) orgService.selectOrgDetail(orgVO);
		model.addAttribute("result",orgVO);
		return "mapo/org/OrgDetail";
	}
	
	/**
	 * 시설 수정
	 * @param orgVO
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/mapo/orgUpdate.do")
	@ResponseBody
	public String updateOrg(@ModelAttribute("OrgVO") OrgVO orgVO) throws Exception {
		int result = orgService.updateOrg(orgVO);	
		
		return result+"";
	}
	
	/**
	 * 시설 삭제 (수정페이지에서)
	 * @param orgId
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/mapo/orgDelete.do")
	@ResponseBody
	public String orgDelete(@RequestParam(value = "orgId")  int orgId) throws Exception {
		int result = orgService.deleteOrg(orgId);
		return result+"";
	}
}

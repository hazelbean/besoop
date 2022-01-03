package mapo.com.sample.web;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import egovframework.com.cmm.LoginVO;
import egovframework.com.cmm.util.EgovUserDetailsHelper;
import egovframework.rte.fdl.cmmn.exception.FdlException;
import egovframework.rte.fdl.security.userdetails.EgovUserDetails;
import mapo.com.sample.service.SampleService;
import mapo.com.sample.service.SampleVO;
import mapo.work.service.WorkService;
import mapo.work.service.WorkVO;

@Controller
public class SampleController {
	
	@Resource(name="SampleService")
	private SampleService sampleService;
	
	@Resource(name="workService")
	private WorkService workService;
	

	/**
	 * 게시판 리스트 호출 및 조회
	 * @param vo
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("mapo/sample/SampleList.do")
	public String SampleList(@ModelAttribute("searchVO") SampleVO vo, @ModelAttribute("WorkVO") WorkVO workVO, 
			ModelMap model) throws Exception {
	
		System.out.println("---- SampleList ------");
		System.out.println("---- vo.getBbsId ------> " +  vo.getBbsId());
		
		
		List<SampleVO> list = sampleService.selectSampleList(vo);
		model.addAttribute("result", list);
		
		
		/* 대분류 선택 */
		List<?> list1 = workService.selectDepth1(workVO);		
		model.addAttribute("resultDepth1", list1);
		
		return "mapo/sample/SampleList";
	}
	
	
	
	
	/**
	 * 게시판 등록 화면 호출
	 * @param vo
	 * @param model
	 * @return
	 * @throws FdlException
	 */
	@RequestMapping("mapo/sample/SampleRegister.do")
	public String SampleInsertView(@ModelAttribute("searchVO") SampleVO vo, ModelMap model) throws FdlException {
		
		LoginVO user = (LoginVO) EgovUserDetailsHelper.getAuthenticatedUser();
		
		Boolean isAuthenticated = EgovUserDetailsHelper.isAuthenticated();
		
		if(!isAuthenticated) {
			return "egovframework/com/uat/uia/EgovLoginUsr";
		}
		
		model.addAttribute("articleVO", vo);
		
		return "/mapo/sample/SampleRegister";
	}
	
	
	
}

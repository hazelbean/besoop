package mapo.work.web;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;
import org.springmodules.validation.commons.DefaultBeanValidator;

import egovframework.com.cmm.EgovComponentChecker;
import egovframework.com.cmm.EgovMessageSource;
import egovframework.com.cmm.LoginVO;
import egovframework.com.cmm.config.EgovLoginConfig;
import egovframework.com.cmm.service.EgovCmmUseService;
import egovframework.com.cmm.service.EgovFileMngService;
import egovframework.com.cmm.service.EgovFileMngUtil;
import egovframework.com.cmm.service.EgovProperties;
import egovframework.com.cmm.service.FileVO;
import egovframework.com.cmm.util.EgovUserDetailsHelper;
import egovframework.com.uat.uia.service.EgovLoginService;
import egovframework.com.uat.uia.web.EgovLoginController;
import egovframework.com.uss.olh.faq.service.EgovFaqService;
import egovframework.com.uss.olh.faq.service.FaqVO;
import egovframework.com.uss.umt.service.EgovUserManageService;
import egovframework.com.utl.fcc.service.EgovStringUtil;
import egovframework.rte.fdl.property.EgovPropertyService;
import egovframework.rte.psl.dataaccess.util.EgovMap;
import egovframework.rte.ptl.mvc.tags.ui.pagination.PaginationInfo;
import mapo.work.service.WorkService;
import mapo.work.service.WorkVO;

@Controller
public class ComController {
	
	/** EgovLoginService */
	@Resource(name = "loginService")
	private EgovLoginService loginService;

	/** EgovCmmUseService */
	@Resource(name = "EgovCmmUseService")
	private EgovCmmUseService cmmUseService;

	/** EgovMessageSource */
	@Resource(name = "egovMessageSource")
	EgovMessageSource egovMessageSource;

	@Resource(name = "egovLoginConfig")
	EgovLoginConfig egovLoginConfig;
	
	/** userManageService */
	@Resource(name = "userManageService")
	private EgovUserManageService userManageService;
	
	
	/** FAQ Service */
	@Resource(name = "EgovFaqService")
	private EgovFaqService egovFaqService;
	
	/** EgovPropertyService */
	@Resource(name = "propertiesService")
	protected EgovPropertyService propertiesService;
	
	// ???????????? ??????
	@Resource(name = "EgovFileMngService")
	private EgovFileMngService fileMngService;

	@Resource(name = "EgovFileMngUtil")
	private EgovFileMngUtil fileUtil;
	
	// Validation ??????
	@Autowired
	private DefaultBeanValidator beanValidator;

	
	/** log */
	private static final Logger LOGGER = LoggerFactory.getLogger(EgovLoginController.class);

	
	// Service
	@Resource(name = "workService")
	private WorkService workService;
	

	
	/**
	 * ?????? ?????? ??????
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("mapo/main.do")
	public String MapoMain( @ModelAttribute("WorkVO") WorkVO workVO, @ModelAttribute("searchVO") FaqVO searchVO, ModelMap model) throws Exception {
		
		// ????????? ?????? ????????????
		LoginVO loginVO = (LoginVO) EgovUserDetailsHelper.getAuthenticatedUser();
		
		if ( loginVO != null ) {
			System.out.println("loginVO id 		 [ ID ] 		: " + loginVO.getId());
			System.out.println("loginVO name 	 [ ???????????? ] 		: " + loginVO.getName());				// ????????????
			System.out.println("loginVO ofcpsNm  [ ??????   ] 		: " + loginVO.getOfcpsNm());			// ??????
			System.out.println("loginVO UserSe   [ ??????????????? ] 	: " + loginVO.getUserSe());				// ???????????????
			System.out.println("loginVO orgnztId [ ??????(??????) ] 	: " + loginVO.getOrgnztId());			// ??????(??????)ID
			System.out.println("loginVO orgnztNm [ ??????(??????) ] 	: " + loginVO.getOrgnztNm());			// ??????(??????)???
			
			System.out.println("loginVO psitnstCode 	 [ ??????????????????(?????????, ????????????) ] : " + loginVO.getPsitnstCode());		// ??????????????????(???, ???????????? ??????)
			System.out.println("loginVO psitnstCodeNm 	 [ ??????????????????(?????????, ????????????) ] : " + loginVO.getPsitnstCodeNm());		// ??????????????????(???, ???????????? ??????) ???
			System.out.println("loginVO pstinstMidCode 	 [ ???????????? ?????????(???) ] : " + loginVO.getPstinstMidCode());				// ???????????? ?????????(???) ??????
			System.out.println("loginVO pstinstMidCodeNm [ ???????????? ?????????(???) ] : " + loginVO.getPstinstMidCodeNm());			// ???????????? ?????????(???) ???
			System.out.println("loginVO authorCode 		 [ ???????????? ] : " + loginVO.getAuthorCode());							// ????????????
			System.out.println("loginVO authorCodeNm 	 [ ???????????? ] : " + loginVO.getAuthorCodeNm());						// ???????????????
			System.out.println("loginVO groupId 		 [ ??????ID ] : " + loginVO.getGroupId());								// ??????ID
			System.out.println("loginVO groupNm 		 [ ?????????   ] : " + loginVO.getGroupNm());								// ????????????			
		}
		
		/* ???????????? : ?????????????????? */
		workVO.setSearchkeyword("");
        List<?> workList = workService.selectWorkMain(workVO);
		model.addAttribute("workList", workList);
		
		/* ???????????? : ?????????????????? */
		workVO.setSearchkeyword("workDist");
		List<?> resultList = workService.selectWorkMain(workVO);
		model.addAttribute("resultList", resultList);
		
		/* ???????????? : ????????????  */
		if ( loginVO != null ) {
			workVO.setMyOrgId(loginVO.getPsitnstCode());
			System.out.println("++++++++++ workDetailOrg ????????? ??????ID ++++++++++ " + workVO.getMyOrgId());	
		}
		List<?> workListOrg = workService.selectWorkMainOrg(workVO);
        model.addAttribute("workListOrg", workListOrg);

		/* ???????????? : FAQ */
        List<?> faqList = egovFaqService.selectFaqList(searchVO);
		model.addAttribute("faqList", faqList);

		return "mapo/MapoMain";
	}

	
	
	/**
	 * ?????? ????????? ???????????? ??????
	 * @param vo - ???????????? ????????? URL??? ?????? LoginVO
	 * @return ????????? ?????????
	 * @exception Exception
	 */
	/*@IncludedInfo(name = "?????????", listUrl = "/uat/uia/MapoLoginUsr.do", order = 10, gid = 10)*/
	@RequestMapping(value = "/uat/uia/MapoLoginUsr.do")
	public String MapoLoginUsr(@ModelAttribute("loginVO") LoginVO loginVO, HttpServletRequest request, HttpServletResponse response, ModelMap model) throws Exception {
		if (EgovComponentChecker.hasComponent("mberManageService")) {
			model.addAttribute("useMemberManage", "true");
		}
				
		//??????????????? ?????? ????????? ??????
		String auth_error =  request.getParameter("auth_error") == null ? "" : (String)request.getParameter("auth_error");
		if(auth_error != null && auth_error.equals("1")){
			return "egovframework/com/cmm/error/accessDenied";
		}

		String message = (String)request.getParameter("loginMessage");
		if (message!=null) model.addAttribute("loginMessage", message);
		

		return "egovframework/com/uat/uia/MapoLoginUsr";
	}
	
	
	/**
	 * ??????(??????) ???????????? ????????????
	 * @param vo - ?????????, ??????????????? ?????? LoginVO
	 * @param request - ??????????????? ?????? HttpServletRequest
	 * @return result - ???????????????(????????????)
	 * @exception Exception
	 */
	@RequestMapping(value = "/uat/uia/actionMapoLogin.do")
	public String actionMapoLogin(@ModelAttribute("loginVO") LoginVO loginVO, HttpServletRequest request, ModelMap model) throws Exception {

		// 1. ????????????????????? ???????????? 
		if( egovLoginConfig.isLock()){
		    Map<?,?> mapLockUserInfo = (EgovMap)loginService.selectLoginIncorrect(loginVO);
		    if(mapLockUserInfo != null){			
				//2.1 ????????????????????? ??????
				String sLoginIncorrectCode = loginService.processLoginIncorrect(loginVO, mapLockUserInfo);
				if(!sLoginIncorrectCode.equals("E")){
					if(sLoginIncorrectCode.equals("L")){
						model.addAttribute("loginMessage", egovMessageSource.getMessageArgs("fail.common.loginIncorrect", new Object[] {egovLoginConfig.getLockCount(),request.getLocale()}));
					}else if(sLoginIncorrectCode.equals("C")){
						model.addAttribute("loginMessage", egovMessageSource.getMessage("fail.common.login",request.getLocale()));
					}
					return "egovframework/com/uat/uia/MapoLoginUsr";
				}
		    }else{
		    	model.addAttribute("loginMessage", egovMessageSource.getMessage("fail.common.login",request.getLocale()));
		    	return "egovframework/com/uat/uia/MapoLoginUsr";
		    }
		}
		
		// 2. ????????? ??????
		LoginVO resultVO = loginService.actionLogin(loginVO);
		
		// 3. ?????? ????????? ??????
		if (resultVO != null && resultVO.getId() != null && !resultVO.getId().equals("")) {

			// 3-1. ????????? ????????? ????????? ??????
			request.getSession().setAttribute("loginVO", resultVO);
			// 2019.10.01 ????????? ???????????? ??????
			request.getSession().setAttribute("accessUser", resultVO.getUserSe().concat(resultVO.getId()));

			return "redirect:/mapo/main.do";

		} else {
			model.addAttribute("loginMessage", egovMessageSource.getMessage("fail.common.login",request.getLocale()));
			return "egovframework/com/uat/uia/MapoLoginUsr";
		}
	}
	
	
	/**
	 * ?????? ????????????
	 * @return String
	 * @exception Exception
	 */
	@RequestMapping(value = "/uat/uia/actionMapoLogout.do")
	public String actionMapoLogout(HttpServletRequest request, ModelMap model) throws Exception {
	
		request.getSession().setAttribute("loginVO", null);		
		request.getSession().setAttribute("accessUser", null);
	
		return "redirect:/mapo/main.do";
	}
	
	
	/**
	 * FAQ ?????? ??????
	 * @param searchVO
	 * @param model
	 * @return	"mapo/faq/MapoFaqList"
	 * @throws Exception
	 */
	@RequestMapping(value = "/mapo/selectFaqList.do")
	public String selectMapoFaqList(@ModelAttribute("searchVO") FaqVO searchVO, ModelMap model) throws Exception {

		/** EgovPropertyService.SiteList */
		searchVO.setPageUnit(propertiesService.getInt("pageUnit"));
		searchVO.setPageSize(propertiesService.getInt("pageSize"));

		/** pageing */
		PaginationInfo paginationInfo = new PaginationInfo();
		paginationInfo.setCurrentPageNo(searchVO.getPageIndex());
		paginationInfo.setRecordCountPerPage(searchVO.getPageUnit());
		paginationInfo.setPageSize(searchVO.getPageSize());

		searchVO.setFirstIndex(paginationInfo.getFirstRecordIndex());
		searchVO.setLastIndex(paginationInfo.getLastRecordIndex());
		searchVO.setRecordCountPerPage(paginationInfo.getRecordCountPerPage());

		List<?> FaqList = egovFaqService.selectFaqList(searchVO);
		model.addAttribute("resultList", FaqList);

		int totCnt = egovFaqService.selectFaqListCnt(searchVO);
		paginationInfo.setTotalRecordCount(totCnt);
		model.addAttribute("paginationInfo", paginationInfo);

		model.addAttribute("searchWrd", searchVO.getSearchWrd());
		
		return "mapo/faq/MapoFaqList";
	}

	
	/**
	 * FAQ ????????? ?????? ??????????????? ????????????.
	 * @param faqVO
	 * @param searchVO
	 * @param model
	 * @return	"mapo/faq/MapoFaqDetail"
	 * @throws Exception
	 */
	@RequestMapping("/mapo/selectFaqDetail.do")
	public String selectFaqDetail(FaqVO faqVO, @ModelAttribute("searchVO") FaqVO searchVO, ModelMap model) throws Exception {

		FaqVO vo = egovFaqService.selectFaqDetail(searchVO);

		model.addAttribute("result", vo);

		return "mapo/faq/MapoFaqDetail";
	}
	
	
	/**
	 * FAQ??? ??????????????????.
	 * @param faqVO
	 * @param searchVO
	 * @return	"forward:/mapo/selectFaqList.do"
	 * @throws Exception
	 */
	@RequestMapping("/mapo/deleteFaq.do")
	public String deleteFaq(FaqVO faqVO, @ModelAttribute("searchVO") FaqVO searchVO) throws Exception {

		// ???????????? ????????? ?????? ID ?????? start....
		String _atchFileId = faqVO.getAtchFileId();

		egovFaqService.deleteFaq(faqVO);

		// ??????????????? ???????????? ??????  Vo
		FileVO fvo = new FileVO();
		fvo.setAtchFileId(_atchFileId);

		fileMngService.deleteAllFileInf(fvo);
		// ???????????? ?????? End.............

		
		return "forward:/mapo/selectFaqList.do";
	}
	
	
	
	/**
	 * FAQ??? ???????????? ?????? ??? ??????
	 * @param searchVO
	 * @param model
	 * @return	"/uss/olh/faq/EgovFaqRegist"
	 * @throws Exception
	 */
	@RequestMapping("/mapo/insertFaqView.do")
	public String insertFaqView(@ModelAttribute("searchVO") FaqVO searchVO, Model model) throws Exception {

		model.addAttribute("faqVO", new FaqVO());
		
    	// ??????????????? ??????
    	String whiteListFileUploadExtensions = EgovProperties.getProperty("Globals.fileUpload.Extensions");
    	String fileUploadMaxSize = EgovProperties.getProperty("Globals.fileUpload.maxSize");

        model.addAttribute("fileUploadExtensions", whiteListFileUploadExtensions);
        model.addAttribute("fileUploadMaxSize", fileUploadMaxSize);

		return "mapo/faq/MapoFaqRegist";

	}
	
	/**
	 * validato rule dynamic Javascript
	 */
	@RequestMapping("/mapo/validator.do")
	public String validate(){
		return "egovframework/com/cmm/validator";
	}
		
		
	/**
	 * FAQ??? ????????????.
	 * @param multiRequest
	 * @param searchVO
	 * @param faqVO
	 * @param bindingResult
	 * @return	"forward:/uss/olh/faq/selectFaqList.do"
	 * @throws Exception
	 */
	@RequestMapping("/mapo/insertFaq.do")
	public String insertFaqCn(final MultipartHttpServletRequest multiRequest, // ??????????????? ??????...
			@ModelAttribute("searchVO") FaqVO searchVO, @ModelAttribute("faqManageVO") FaqVO faqVO, BindingResult bindingResult) throws Exception {

		beanValidator.validate(faqVO, bindingResult);

		if (bindingResult.hasErrors()) {
			return "mapo/faq/MapoFaqRegist";
		}

		// ???????????? ?????? ????????????ID ??????
		List<FileVO> _result = null;
		String _atchFileId = "";

		//final Map<String, MultipartFile> files = multiRequest.getFileMap();
		final List<MultipartFile> files = multiRequest.getFiles("file_1");

		if (!files.isEmpty()) {
			_result = fileUtil.parseFileInf(files, "FAQ_", 0, "", "");
			_atchFileId = fileMngService.insertFileInfs(_result); //????????? ?????????????????? ????????? ???????????? ID??? ????????????.
		}

		// ???????????? ????????????ID??? ????????????..
		faqVO.setAtchFileId(_atchFileId); // ???????????? ID

		// ?????????VO??????  ????????? ?????? ????????????
		LoginVO loginVO = (LoginVO) EgovUserDetailsHelper.getAuthenticatedUser();

		String frstRegisterId = loginVO == null ? "" : EgovStringUtil.isNullToString(loginVO.getUniqId());

		faqVO.setFrstRegisterId(frstRegisterId); // ???????????????ID
		faqVO.setLastUpdusrId(frstRegisterId); // ???????????????ID

		egovFaqService.insertFaq(faqVO);

		// forward ?????? ??? ?????? ?????? ??? ???????????? ???????????? ?????? ?????? ??????
		//return "forward:/mapo/selectFaqList.do";
		return "redirect:/mapo/selectFaqList.do";

	}
	

	/**
	 * FAQ??? ???????????? ?????? ??? ??????
	 * @param faqId
	 * @param searchVO
	 * @param model
	 * @return	"/uss/olh/faq/EgovFaqUpdt"
	 * @throws Exception
	 */
	@RequestMapping("/mapo/updateFaqView.do")
	public String updateFaqView(@RequestParam("faqId") String faqId, @ModelAttribute("searchVO") FaqVO searchVO, ModelMap model) throws Exception {

		FaqVO faqVO = new FaqVO();

		// Primary Key ??? ??????
		faqVO.setFaqId(faqId);

		// ???????????? CoC ??? ?????? JSTL????????? ??????
		model.addAttribute("faqVO", egovFaqService.selectFaqDetail(faqVO));

    	// ??????????????? ??????
    	String whiteListFileUploadExtensions = EgovProperties.getProperty("Globals.fileUpload.Extensions");
    	String fileUploadMaxSize = EgovProperties.getProperty("Globals.fileUpload.maxSize");
    	
    	System.out.println("????????????  whiteListFileUploadExtensions---> " + whiteListFileUploadExtensions);
    	System.out.println("????????????  fileUploadMaxSize---> " + fileUploadMaxSize);

        model.addAttribute("fileUploadExtensions", whiteListFileUploadExtensions);
        model.addAttribute("fileUploadMaxSize", fileUploadMaxSize);
		
		return "mapo/faq/MapoFaqUpdt";
	}

	
	/**
	 * FAQ??? ??????????????????.
	 * @param atchFileAt
	 * @param multiRequest
	 * @param searchVO
	 * @param faqVO
	 * @param bindingResult
	 * @param model
	 * @return	"forward:/uss/olh/faq/selectFaqList.do"
	 * @throws Exception
	 */
	@RequestMapping("/mapo/updateFaq.do")
	public String updateFaqCn(final MultipartHttpServletRequest multiRequest,
			@ModelAttribute("searchVO") FaqVO searchVO, @ModelAttribute("faqVO") FaqVO faqVO, BindingResult bindingResult, ModelMap model)
			throws Exception {

		// Validation
		beanValidator.validate(faqVO, bindingResult);
		if (bindingResult.hasErrors()) {
			return "mapo/faq/MapoFaqUpdt";
		}

		
		// ???????????? ?????? ID ?????? start....
		String atchFileId = faqVO.getAtchFileId();

		//final Map<String, MultipartFile> files = multiRequest.getFileMap();
		final List<MultipartFile> files = multiRequest.getFiles("file_1");
	    if (!files.isEmpty()) {
			if (atchFileId == null || "".equals(atchFileId)) {
			    List<FileVO> result = fileUtil.parseFileInf(files, "FAQ_", 0, atchFileId, "");
			    atchFileId = fileMngService.insertFileInfs(result);
			    faqVO.setAtchFileId(atchFileId);
			} else {
			    FileVO fvo = new FileVO();
			    fvo.setAtchFileId(atchFileId);
			    int cnt = fileMngService.getMaxFileSN(fvo);
			    List<FileVO> _result = fileUtil.parseFileInf(files, "FAQ_", cnt, atchFileId, "");
			    fileMngService.updateFileInfs(_result);
			}
	    }
		// ???????????? ?????? ID ?????? end...

		// ?????????VO??????  ????????? ?????? ????????????
		LoginVO loginVO = (LoginVO) EgovUserDetailsHelper.getAuthenticatedUser();
		String lastUpdusrId = loginVO == null ? "" : EgovStringUtil.isNullToString(loginVO.getUniqId());
		faqVO.setLastUpdusrId(lastUpdusrId); // ???????????????ID

		egovFaqService.updateFaq(faqVO);

		return "forward:/mapo/selectFaqList.do";

	}
	
	/**
	 * ????????? ??????
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("mapo/testList.do")
	public String SampleTestList(ModelMap model) throws Exception {
		
		
		// ?????? ?????????
		WorkVO workVO = new WorkVO();
		
		List<?> list1 = workService.selectDepth1(workVO);
		List<?> list2 = workService.selectDepth2(workVO);
		List<?> list3 = workService.selectDepth3(workVO);
		List<?> list4 = workService.selectDepth4(workVO);
		
		
		model.addAttribute("resultDepth1", list1);
		model.addAttribute("resultDepth2", list2);
		model.addAttribute("resultDepth3", list3);
		model.addAttribute("resultDepth4", list4);
		
		// ???????????? ?????????
		workVO.setClCode("TAS"); // ????????? ?????? ??????

		LOGGER.debug("workVO.getClCode() 1111 =====> ", workVO.getClCode());
		System.out.println(" workVO.getClCode() 2222 ====>  : " + workVO.getClCode());

		List<?> list = workService.selectWorkGubun(workVO);
		model.addAttribute("resultGubun", list);
		
		return "mapo/SampleTestList";
	}
	
	
	/**
	 * ?????? ??????
	 * @param vo
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value="/mapo/selectOrg1.do", method = RequestMethod.POST)
	@ResponseBody
	public ModelAndView selectOrg1(@ModelAttribute("WorkVO") WorkVO workVO, ModelMap model, @RequestParam("mode") String mode) throws Exception {
	
		System.out.println("mode -----> " + mode);
		System.out.println("getCode -----> " + workVO.getCode());
		
		/* Ajax List ????????? ???????????? ModelAndView ??? ???????????? ??? */
		ModelAndView modelAndView = new ModelAndView();
		
		
		List<?> list = new ArrayList<>();
		
		/* ????????? ?????? */
		if( "org1".equals(mode) ) {
			
			list = workService.selectDepth2(workVO);
			
		/* ????????? ?????? */
		} else if ( "org2".equals(mode) ) {
			
			list = workService.selectDepth3(workVO);
			
		/* ????????? ??????	*/
		} else if ( "org3".equals(mode)) {
			
			list = workService.selectDepth4(workVO);
		}
		
		System.out.println("list.size : " + list.size());
		
		modelAndView.setViewName("jsonView");
		modelAndView.addObject("result", list);

		return modelAndView;
	}
	
	
	
	
}

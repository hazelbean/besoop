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
	
	// 첨부파일 관련
	@Resource(name = "EgovFileMngService")
	private EgovFileMngService fileMngService;

	@Resource(name = "EgovFileMngUtil")
	private EgovFileMngUtil fileUtil;
	
	// Validation 관련
	@Autowired
	private DefaultBeanValidator beanValidator;

	
	/** log */
	private static final Logger LOGGER = LoggerFactory.getLogger(EgovLoginController.class);

	
	// Service
	@Resource(name = "workService")
	private WorkService workService;
	

	
	/**
	 * 메인 화면 이동
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("mapo/main.do")
	public String MapoMain( @ModelAttribute("WorkVO") WorkVO workVO, @ModelAttribute("searchVO") FaqVO searchVO, ModelMap model) throws Exception {
		
		// 로그인 정보 가져오기
		LoginVO loginVO = (LoginVO) EgovUserDetailsHelper.getAuthenticatedUser();
		
		if ( loginVO != null ) {
			System.out.println("loginVO id 		 [ ID ] 		: " + loginVO.getId());
			System.out.println("loginVO name 	 [ 사용자명 ] 		: " + loginVO.getName());				// 사용자명
			System.out.println("loginVO ofcpsNm  [ 직위   ] 		: " + loginVO.getOfcpsNm());			// 직위
			System.out.println("loginVO UserSe   [ 사용자구분 ] 	: " + loginVO.getUserSe());				// 사용자구분
			System.out.println("loginVO orgnztId [ 조직(부서) ] 	: " + loginVO.getOrgnztId());			// 조직(부서)ID
			System.out.println("loginVO orgnztNm [ 조직(부서) ] 	: " + loginVO.getOrgnztNm());			// 조직(부서)명
			
			System.out.println("loginVO psitnstCode 	 [ 소속기관코드(구청팀, 산하기관) ] : " + loginVO.getPsitnstCode());		// 소속기관코드(팀, 산하기관 코드)
			System.out.println("loginVO psitnstCodeNm 	 [ 소속기관코드(구청팀, 산하기관) ] : " + loginVO.getPsitnstCodeNm());		// 소속기관코드(팀, 산하기관 코드) 명
			System.out.println("loginVO pstinstMidCode 	 [ 소속기관 소분류(과) ] : " + loginVO.getPstinstMidCode());				// 소속기관 소분류(과) 코드
			System.out.println("loginVO pstinstMidCodeNm [ 소속기관 소분류(과) ] : " + loginVO.getPstinstMidCodeNm());			// 소속기관 소분류(과) 명
			System.out.println("loginVO authorCode 		 [ 권한코드 ] : " + loginVO.getAuthorCode());							// 권한코드
			System.out.println("loginVO authorCodeNm 	 [ 권한코드 ] : " + loginVO.getAuthorCodeNm());						// 권한코드명
			System.out.println("loginVO groupId 		 [ 그룹ID ] : " + loginVO.getGroupId());								// 그룹ID
			System.out.println("loginVO groupNm 		 [ 그룹명   ] : " + loginVO.getGroupNm());								// 그룹이름			
		}
		
		/* 마포구청 : 업무생성확인 */
		workVO.setSearchkeyword("");
        List<?> workList = workService.selectWorkMain(workVO);
		model.addAttribute("workList", workList);
		
		/* 마포구청 : 업무배포결과 */
		workVO.setSearchkeyword("workDist");
		List<?> resultList = workService.selectWorkMain(workVO);
		model.addAttribute("resultList", resultList);
		
		/* 복지시설 : 업무확인  */
		if ( loginVO != null ) {
			workVO.setMyOrgId(loginVO.getPsitnstCode());
			System.out.println("++++++++++ workDetailOrg 로그인 기관ID ++++++++++ " + workVO.getMyOrgId());	
		}
		List<?> workListOrg = workService.selectWorkMainOrg(workVO);
        model.addAttribute("workListOrg", workListOrg);

		/* 복지시설 : FAQ */
        List<?> faqList = egovFaqService.selectFaqList(searchVO);
		model.addAttribute("faqList", faqList);

		return "mapo/MapoMain";
	}

	
	
	/**
	 * 마포 로그인 화면으로 이동
	 * @param vo - 로그인후 이동할 URL이 담긴 LoginVO
	 * @return 로그인 페이지
	 * @exception Exception
	 */
	/*@IncludedInfo(name = "로그인", listUrl = "/uat/uia/MapoLoginUsr.do", order = 10, gid = 10)*/
	@RequestMapping(value = "/uat/uia/MapoLoginUsr.do")
	public String MapoLoginUsr(@ModelAttribute("loginVO") LoginVO loginVO, HttpServletRequest request, HttpServletResponse response, ModelMap model) throws Exception {
		if (EgovComponentChecker.hasComponent("mberManageService")) {
			model.addAttribute("useMemberManage", "true");
		}
				
		//권한체크시 에러 페이지 이동
		String auth_error =  request.getParameter("auth_error") == null ? "" : (String)request.getParameter("auth_error");
		if(auth_error != null && auth_error.equals("1")){
			return "egovframework/com/cmm/error/accessDenied";
		}

		String message = (String)request.getParameter("loginMessage");
		if (message!=null) model.addAttribute("loginMessage", message);
		

		return "egovframework/com/uat/uia/MapoLoginUsr";
	}
	
	
	/**
	 * 일반(세션) 로그인을 처리한다
	 * @param vo - 아이디, 비밀번호가 담긴 LoginVO
	 * @param request - 세션처리를 위한 HttpServletRequest
	 * @return result - 로그인결과(세션정보)
	 * @exception Exception
	 */
	@RequestMapping(value = "/uat/uia/actionMapoLogin.do")
	public String actionMapoLogin(@ModelAttribute("loginVO") LoginVO loginVO, HttpServletRequest request, ModelMap model) throws Exception {

		// 1. 로그인인증제한 활성화시 
		if( egovLoginConfig.isLock()){
		    Map<?,?> mapLockUserInfo = (EgovMap)loginService.selectLoginIncorrect(loginVO);
		    if(mapLockUserInfo != null){			
				//2.1 로그인인증제한 처리
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
		
		// 2. 로그인 처리
		LoginVO resultVO = loginService.actionLogin(loginVO);
		
		// 3. 일반 로그인 처리
		if (resultVO != null && resultVO.getId() != null && !resultVO.getId().equals("")) {

			// 3-1. 로그인 정보를 세션에 저장
			request.getSession().setAttribute("loginVO", resultVO);
			// 2019.10.01 로그인 인증세션 추가
			request.getSession().setAttribute("accessUser", resultVO.getUserSe().concat(resultVO.getId()));

			return "redirect:/mapo/main.do";

		} else {
			model.addAttribute("loginMessage", egovMessageSource.getMessage("fail.common.login",request.getLocale()));
			return "egovframework/com/uat/uia/MapoLoginUsr";
		}
	}
	
	
	/**
	 * 마포 로그아웃
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
	 * FAQ 목록 조회
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
	 * FAQ 목록에 대한 상세정보를 조회한다.
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
	 * FAQ를 삭제처리한다.
	 * @param faqVO
	 * @param searchVO
	 * @return	"forward:/mapo/selectFaqList.do"
	 * @throws Exception
	 */
	@RequestMapping("/mapo/deleteFaq.do")
	public String deleteFaq(FaqVO faqVO, @ModelAttribute("searchVO") FaqVO searchVO) throws Exception {

		// 첨부파일 삭제를 위한 ID 생성 start....
		String _atchFileId = faqVO.getAtchFileId();

		egovFaqService.deleteFaq(faqVO);

		// 첨부파일을 삭제하기 위한  Vo
		FileVO fvo = new FileVO();
		fvo.setAtchFileId(_atchFileId);

		fileMngService.deleteAllFileInf(fvo);
		// 첨부파일 삭제 End.............

		
		return "forward:/mapo/selectFaqList.do";
	}
	
	
	
	/**
	 * FAQ를 등록하기 위한 전 처리
	 * @param searchVO
	 * @param model
	 * @return	"/uss/olh/faq/EgovFaqRegist"
	 * @throws Exception
	 */
	@RequestMapping("/mapo/insertFaqView.do")
	public String insertFaqView(@ModelAttribute("searchVO") FaqVO searchVO, Model model) throws Exception {

		model.addAttribute("faqVO", new FaqVO());
		
    	// 파일업로드 제한
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
	 * FAQ를 등록한다.
	 * @param multiRequest
	 * @param searchVO
	 * @param faqVO
	 * @param bindingResult
	 * @return	"forward:/uss/olh/faq/selectFaqList.do"
	 * @throws Exception
	 */
	@RequestMapping("/mapo/insertFaq.do")
	public String insertFaqCn(final MultipartHttpServletRequest multiRequest, // 첨부파일을 위한...
			@ModelAttribute("searchVO") FaqVO searchVO, @ModelAttribute("faqManageVO") FaqVO faqVO, BindingResult bindingResult) throws Exception {

		beanValidator.validate(faqVO, bindingResult);

		if (bindingResult.hasErrors()) {
			return "mapo/faq/MapoFaqRegist";
		}

		// 첨부파일 관련 첨부파일ID 생성
		List<FileVO> _result = null;
		String _atchFileId = "";

		//final Map<String, MultipartFile> files = multiRequest.getFileMap();
		final List<MultipartFile> files = multiRequest.getFiles("file_1");

		if (!files.isEmpty()) {
			_result = fileUtil.parseFileInf(files, "FAQ_", 0, "", "");
			_atchFileId = fileMngService.insertFileInfs(_result); //파일이 생성되고나면 생성된 첨부파일 ID를 리턴한다.
		}

		// 리턴받은 첨부파일ID를 셋팅한다..
		faqVO.setAtchFileId(_atchFileId); // 첨부파일 ID

		// 로그인VO에서  사용자 정보 가져오기
		LoginVO loginVO = (LoginVO) EgovUserDetailsHelper.getAuthenticatedUser();

		String frstRegisterId = loginVO == null ? "" : EgovStringUtil.isNullToString(loginVO.getUniqId());

		faqVO.setFrstRegisterId(frstRegisterId); // 최초등록자ID
		faqVO.setLastUpdusrId(frstRegisterId); // 최종수정자ID

		egovFaqService.insertFaq(faqVO);

		// forward 처리 시 새글 등록 후 페이징이 정상작동 되지 않아 수정
		//return "forward:/mapo/selectFaqList.do";
		return "redirect:/mapo/selectFaqList.do";

	}
	

	/**
	 * FAQ를 수정하기 위한 전 처리
	 * @param faqId
	 * @param searchVO
	 * @param model
	 * @return	"/uss/olh/faq/EgovFaqUpdt"
	 * @throws Exception
	 */
	@RequestMapping("/mapo/updateFaqView.do")
	public String updateFaqView(@RequestParam("faqId") String faqId, @ModelAttribute("searchVO") FaqVO searchVO, ModelMap model) throws Exception {

		FaqVO faqVO = new FaqVO();

		// Primary Key 값 세팅
		faqVO.setFaqId(faqId);

		// 변수명은 CoC 에 따라 JSTL사용을 위해
		model.addAttribute("faqVO", egovFaqService.selectFaqDetail(faqVO));

    	// 파일업로드 제한
    	String whiteListFileUploadExtensions = EgovProperties.getProperty("Globals.fileUpload.Extensions");
    	String fileUploadMaxSize = EgovProperties.getProperty("Globals.fileUpload.maxSize");
    	
    	System.out.println("첨부파일  whiteListFileUploadExtensions---> " + whiteListFileUploadExtensions);
    	System.out.println("첨부파일  fileUploadMaxSize---> " + fileUploadMaxSize);

        model.addAttribute("fileUploadExtensions", whiteListFileUploadExtensions);
        model.addAttribute("fileUploadMaxSize", fileUploadMaxSize);
		
		return "mapo/faq/MapoFaqUpdt";
	}

	
	/**
	 * FAQ를 수정처리한다.
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

		
		// 첨부파일 관련 ID 생성 start....
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
		// 첨부파일 관련 ID 생성 end...

		// 로그인VO에서  사용자 정보 가져오기
		LoginVO loginVO = (LoginVO) EgovUserDetailsHelper.getAuthenticatedUser();
		String lastUpdusrId = loginVO == null ? "" : EgovStringUtil.isNullToString(loginVO.getUniqId());
		faqVO.setLastUpdusrId(lastUpdusrId); // 최종수정자ID

		egovFaqService.updateFaq(faqVO);

		return "forward:/mapo/selectFaqList.do";

	}
	
	/**
	 * 테스트 화면
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("mapo/testList.do")
	public String SampleTestList(ModelMap model) throws Exception {
		
		
		// 트리 테스트
		WorkVO workVO = new WorkVO();
		
		List<?> list1 = workService.selectDepth1(workVO);
		List<?> list2 = workService.selectDepth2(workVO);
		List<?> list3 = workService.selectDepth3(workVO);
		List<?> list4 = workService.selectDepth4(workVO);
		
		
		model.addAttribute("resultDepth1", list1);
		model.addAttribute("resultDepth2", list2);
		model.addAttribute("resultDepth3", list3);
		model.addAttribute("resultDepth4", list4);
		
		// 업무구분 테스트
		workVO.setClCode("TAS"); // 조회할 코드 셋팅

		LOGGER.debug("workVO.getClCode() 1111 =====> ", workVO.getClCode());
		System.out.println(" workVO.getClCode() 2222 ====>  : " + workVO.getClCode());

		List<?> list = workService.selectWorkGubun(workVO);
		model.addAttribute("resultGubun", list);
		
		return "mapo/SampleTestList";
	}
	
	
	/**
	 * 기관 선택
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
	
	
	
	
}

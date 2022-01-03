package mapo.com.sample.web;

import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import egovframework.com.cmm.ComDefaultVO;
import egovframework.com.cmm.LoginVO;
import egovframework.com.cmm.service.EgovFileMngService;
import egovframework.com.cmm.service.EgovFileMngUtil;
import egovframework.com.cmm.service.EgovProperties;
import egovframework.com.cmm.service.FileVO;
import egovframework.com.cmm.service.Globals;
import egovframework.com.cmm.util.EgovUserDetailsHelper;
import egovframework.rte.fdl.property.EgovPropertyService;
import egovframework.rte.ptl.mvc.tags.ui.pagination.PaginationInfo;
import mapo.com.sample.service.TestService;
import mapo.com.sample.service.TestVO;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

@Controller
public class TestController {
	
	private final Logger LOGGER = LoggerFactory.getLogger(this.getClass());

	@Resource(name = "testService")
	private TestService testService;

	
	// 첨부파일 관련
	@Resource(name = "EgovFileMngService")
	private EgovFileMngService fileMngService;

	@Resource(name = "EgovFileMngUtil")
	private EgovFileMngUtil fileUtil;
		
	
	/** EgovPropertyService */
	@Resource(name = "propertiesService")
	protected EgovPropertyService propertiesService;
	
	

	/**
	 * 테스트 리스트 화면 이동
	 * 
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("mapo/sample/TestList.do")
	public String TestList(@ModelAttribute("TestVO") TestVO testVO, ModelMap model) throws Exception {

		/*  페이징 처리  */

		/** EgovPropertyService.sample */
		testVO.setPageUnit(propertiesService.getInt("pageUnit"));
		testVO.setPageSize(propertiesService.getInt("pageSize"));

		/** pageing */
		PaginationInfo paginationInfo = new PaginationInfo();
		paginationInfo.setCurrentPageNo(testVO.getPageIndex());
		paginationInfo.setRecordCountPerPage(testVO.getPageUnit());
		paginationInfo.setPageSize(testVO.getPageSize());

		testVO.setFirstIndex(paginationInfo.getFirstRecordIndex());
		testVO.setLastIndex(paginationInfo.getLastRecordIndex());
		testVO.setRecordCountPerPage(paginationInfo.getRecordCountPerPage());

		List<?> list = testService.selectTestList(testVO);
		model.addAttribute("resultList", list);

		int totCnt = testService.selectTestListTotcnt(testVO);
		paginationInfo.setTotalRecordCount(totCnt);
		model.addAttribute("paginationInfo", paginationInfo);

		return "mapo/sample/TestList";
	}

	/**
	 * 등록/수정 화면 이동
	 * 
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/mapo/sample/TestMgmt.do", method = RequestMethod.GET)
	public String TestMgmt(@ModelAttribute("TestVO") TestVO vo, ModelMap model, HttpServletRequest request) throws Exception {

		System.out.println("실행 TestMgmt GET -------------> ");
		
		/* 현재일자 취득 */
		SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMdd");

		Calendar c1 = Calendar.getInstance();
		String strToday = sdf.format(c1.getTime());

		System.out.println("Today == > " + strToday);
		System.out.println("===========================");
	

		// 로그인 정보 가져오기
		LoginVO loginVO = (LoginVO) EgovUserDetailsHelper.getAuthenticatedUser();

		if (loginVO != null) {
			System.out.println("loginVO id : " + loginVO.getId());
			System.out.println("loginVO name : " + loginVO.getName()); //사용자명
			System.out.println("loginVO UserSe : " + loginVO.getUserSe()); //사용자구분
			System.out.println("loginVO orgnztId : " + loginVO.getOrgnztId()); //조직(부서)ID
			System.out.println("loginVO orgnztNm : " + loginVO.getOrgnztNm()); //조직(부서)명
		}

		/* 게시글 상세 조회 */
		vo = testService.selectTest(vo);

		vo.setIndate(strToday);
		vo.setWriter(loginVO.getId());
		vo.setWriterNm(loginVO.getName());

		model.addAttribute("testVO", vo);

		return "mapo/sample/TestMgmt";
	}

	/**
	 * 게시글 등록/수정 (첨부파일 없음)
	 * 
	 * @return
	 * @throws Exception
	 */
	/*@RequestMapping(value="/mapo/sample/TestMgmt.do", method=RequestMethod.POST)
	public String TestMgmt2(@ModelAttribute("TestVO") TestVO vo, @RequestParam("mode") String mode, ModelMap mdoel) throws Exception {
		
		System.out.println("mode --> " + mode);
		
		// 등록 & 수정 분기
		if ("add".equals(mode)) {
			testService.insertTestBoard(vo);
			
		} else if ("mod".equals(mode)) {
			testService.updateTestBoard(vo);
		
		} else if ("del".equals(mode)){
			testService.deleteTestBoard(vo);
		}
					
		
		 게시판 리스트(목록) 화면으로 이동 
		return "redirect:/mapo/sample/TestList.do";
	}*/

	
	/**
	 * 게시글 등록/수정 (첨부파일 포함)
	 * @param vo
	 * @param mode
	 * @param mdoel
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/mapo/sample/TestMgmt.do", method = RequestMethod.POST)
	public String TestMgmt2(final MultipartHttpServletRequest multiRequest, // 첨부파일을 위한...
			@ModelAttribute("TestVO") TestVO vo, @RequestParam("mode") String mode, ModelMap mdoel
		
			) throws Exception {

		System.out.println("실행 TestMgmt POST -------------> ");
		
		// 2021.08.27 첨부파일 설정
		/*
		 Iterator fileIter = mptRequest.getFileNames();
		 
		while (fileIter.hasNext()) {
			MultipartFile mFile = mptRequest.getFile((String)fileIter.next());
		 
			if (mFile.getSize() > 0) {
				HashMap map = EgovFileMngUtil.uploadFile(mFile);
		 
				System.out.println("[ "+Globals.FILE_PATH+" : "+map.get(Globals.FILE_PATH)+" ]");
				System.out.println("[ "+Globals.FILE_SIZE+" : "+map.get(Globals.FILE_SIZE)+" ]");
				System.out.println("[ "+Globals.ORIGIN_FILE_NM+" : "+map.get(Globals.ORIGIN_FILE_NM)+" ]");
				System.out.println("[ "+Globals.UPLOAD_FILE_NM+" : "+map.get(Globals.UPLOAD_FILE_NM)+" ]");
				System.out.println("[ "+Globals.FILE_EXT+" : "+map.get(Globals.FILE_EXT)+" ]");
				
				vo.setFilename(map.get(Globals.UPLOAD_FILE_NM).toString());
			}	
		}*/
	
		System.out.println("mode --> " + mode);
		
		// 첨부파일 관련 첨부파일ID 생성
		List<FileVO> _result = null;
		String _atchFileId = "";

		//final Map<String, MultipartFile> files = multiRequest.getFileMap();
		final List<MultipartFile> files = multiRequest.getFiles("file_1");

		if (!files.isEmpty()) {
			_result = fileUtil.parseFileInf(files, "WORK_", 0, "", "");
			_atchFileId = fileMngService.insertFileInfs(_result); //파일이 생성되고나면 생성된 첨부파일 ID를 리턴한다.
		}

		// 리턴받은 첨부파일ID를 셋팅한다..
		vo.setAtchFileId(_atchFileId); // 첨부파일 ID

		
		System.out.println("_atchFileId --> " + _atchFileId);
		System.out.println("vo.getAtchFileId --> " + vo.getAtchFileId());
		

		// 등록 & 수정 분기
		if ("add".equals(mode)) {
			
			// idx 값 취득
			String maxCnt = testService.selectMaxIdx(vo);
			System.out.println("maxCnt --> " + maxCnt);
			
			// 취득한 값 셋팅
			vo.setIdx(maxCnt);
	
			// Insert 
			testService.insertTestBoard(vo);			
			
			// 첨부파일이 있을 경우 첨부 파일 테이블에 저장
			//if(vo.getFilename() != null && !"".equals(vo.getFilename())) {
				
			//	testService.insertTestAttach(vo);
			//}
			

		} else if ("mod".equals(mode)) {
			testService.updateTestBoard(vo);

		} else if ("del".equals(mode)) {
			testService.deleteTestBoard(vo);
		}

		/* 게시판 리스트(목록) 화면으로 이동 */
		return "redirect:/mapo/sample/TestList.do";
	}

	
	/**
	 * 첨부파일 다운로드
	 * @param request
	 * @param response
	 * @throws Exception
	 */
	@RequestMapping(value="/mapo/sample/fileGet.do", method=RequestMethod.GET)
	public void fileDownload(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		String stordFilePath = EgovProperties.getProperty("Globals.fileStorePath");
		
		// 저장된 파일명
		String filename = request.getParameter("filename");
		// 첨부된 원 파일명
		String original = request.getParameter("original");
		
		
		 
		//if ("".equals(original)) {
			original = filename;
		//}
			
	
		System.out.println("filename --------------> " + filename);
		System.out.println("original --------------> " + original);
		System.out.println("stordFilePath --------------> " + stordFilePath + filename);
		 
		request.setAttribute("downFile", stordFilePath + filename);
		request.setAttribute("orginFile", original);
		 
		EgovFileMngUtil.downFile(request, response);
	}
	
	/**
	 * 댓글 등록/수정
	 * 
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/mapo/sample/TestReply.do", method = RequestMethod.POST)
	@ResponseBody
	public String TestReply(@ModelAttribute("TestVO") TestVO vo, ModelMap mdoel) throws Exception {

		String msg = "";
		
		// 정상실행 시 : count = 1 
		int count = testService.insertTestReply(vo);
		
		LOGGER.debug("LOGGER ====> count : ", count);
		
		System.out.println("System ====> count : " + count);
		
		if (count == 1) {
			msg = "ok";
			
		} else {
			msg = "false";
		}

		/* redirect 사용할 경우 파라미터가 초기화 되므로 값을 넘겨줘야 함 */
		//return "redirect:/mapo/sample/TestView.do?idx=" + vo.getIdx();
		
		return msg;
	}

	
	
	
	/**
	 * 상세조회 & 댓글 조회
	 * 
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/mapo/sample/TestView.do")
	public String TestView(@ModelAttribute("TestVO") TestVO vo, ModelMap model) throws Exception {

		/* 현재일자 취득 */
		SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMdd");

		Calendar c1 = Calendar.getInstance();
		String strToday = sdf.format(c1.getTime());

		System.out.println("Today == > " + strToday);

		/* 게시글 카운트 수 증가 */
		testService.updateTestBoardCount(vo);

		/* 게시글 상세 조회 */
		vo = testService.selectTest(vo);
		
		/* 첨부파일 리스트 조회 */
		//TestVO tempVo = testService.selectTestAttach(vo);
		//vo.setFilename(tempVo.getFilename());
		//vo.setSeq(tempVo.getSeq());

		model.addAttribute("testVO", vo);
		model.addAttribute("strToday", strToday);

		/* 댓글 리스트 조회 */
		List<?> list = testService.selectTestReply(vo);
		model.addAttribute("resultList", list);	

		return "mapo/sample/TestView";
	}

	
	/**
	 * 로그인 여부 확인
	 * @param user_id
	 * @param password
	 * @param model
	 * @param request
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/mapo/sample/TestLogin.do")
	public String TestLogin(@RequestParam("user_id") String user_id, @RequestParam("password") String password, ModelMap model, HttpServletRequest request) throws Exception {

		// 화면에서 넘어온 parameter 값 확인
		System.out.println("user_id : " + user_id);
		System.out.println("password : " + password);

		TestVO vo = new TestVO();
		vo.setUserid(user_id);
		vo.setPassword(password);

		String userName = testService.selectLoginCheck(vo);
		System.out.println("* userName : " + userName);

		if (userName != null && "".equals(userName)) {
			request.getSession().setAttribute("userId", user_id);
			request.getSession().setAttribute("userName", userName);

		} else {
			request.getSession().setAttribute("userId", "");
			request.getSession().setAttribute("userName", "");
			model.addAttribute("msg", "사용자 정보가 올바르지 않습니다.");
		}

		// 로그인 정보 가져오기
		LoginVO loginVO = (LoginVO) EgovUserDetailsHelper.getAuthenticatedUser();

		if (loginVO != null) {
			System.out.println("loginVO id : " + loginVO.getId());
			System.out.println("loginVO name : " + loginVO.getName()); //사용자명
			System.out.println("loginVO UserSe : " + loginVO.getUserSe()); //사용자구분
			System.out.println("loginVO orgnztId : " + loginVO.getOrgnztId()); //조직(부서)ID
			System.out.println("loginVO orgnztNm : " + loginVO.getOrgnztNm()); //조직(부서)명
		}

		return "mapo/sample/TestList";
	}

	
	/**
	 * 로그아웃
	 * @param model
	 * @param request
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/mapo/sample/logout.do")
	public String logout(ModelMap model, HttpServletRequest request) throws Exception {

		// 세션 정보 사라짐
		request.getSession().invalidate();

		return "mapo/sample/TestList";
	}
}

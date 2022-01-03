package mapo.work.web;

import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

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

import egovframework.com.cmm.service.EgovFileMngService;
import egovframework.com.cmm.service.EgovFileMngUtil;
import egovframework.com.cmm.service.EgovProperties;
import egovframework.com.cmm.service.FileVO;
import egovframework.com.uss.olh.faq.service.FaqVO;
import egovframework.rte.fdl.property.EgovPropertyService;
import mapo.work.service.WorkService;
import mapo.work.service.WorkVO;

@Controller
public class WorkUpdateController {

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
	 * 업무생성 화면 저장(화면 수정)
	 * 
	 * @param gthtaskVO
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/mapo/insertWorkFromUpdate.do", method = RequestMethod.POST)
	@ResponseBody
	public String insertWorkFromUpdate(final MultipartHttpServletRequest multiRequest, // 첨부파일을 위한...
			@ModelAttribute("WorkVO") WorkVO workVO, @ModelAttribute("faqVO") FaqVO faqVO,@RequestParam("mode") String mode,ModelMap model) throws Exception {

		System.out.println("실행 updateWork -------------> ");
		System.out.println("mode -------------> " + mode);
	

		// 첨부파일 관련 첨부파일ID 생성
		//List<FileVO> _result = null;
		//String _atchFileId = "";
		String atchFileId = faqVO.getAtchFileId();

		final List<MultipartFile> files = multiRequest.getFiles("file_1");

		System.out.println("files -------------> " + files.size());

		//comtnfiledetail db에 잘 들어가는지 확인
		if (!files.isEmpty()) {
//			_result = fileUtil.parseFileInf(files, "WORK_", 0, "", "");
//			_atchFileId = fileMngService.insertFileInfs(_result); //파일이 생성되고나면 생성된 첨부파일 ID를 리턴한다.
			if (atchFileId == null || "".equals(atchFileId)) {
			    List<FileVO> result = fileUtil.parseFileInf(files, "WORK_", 0, atchFileId, "");
			    atchFileId = fileMngService.insertFileInfs(result);
			    faqVO.setAtchFileId(atchFileId);
			}else {
			    FileVO fvo = new FileVO();
			    fvo.setAtchFileId(atchFileId);
			    int cnt = fileMngService.getMaxFileSN(fvo);
			    List<FileVO> _result2 = fileUtil.parseFileInf(files, "WORK_", cnt, atchFileId, "");
			    fileMngService.updateFileInfs(_result2);
			}
		}
		

		// 리턴받은 첨부파일ID를 셋팅한다..
		workVO.setAtchFileId(atchFileId); // 첨부파일 ID

		System.out.println("_atchFileId --> " + atchFileId);
		System.out.println("vo.getAtchFileId --> " + workVO.getAtchFileId());
		System.out.println("updateId --->" + workVO.getInsertId()); 

		String msg = "";

		/* 수정 로직 */
			// 업무ID 설정
			System.out.println("--------------taskId-----------" + workVO.getTaskId());
//			int taskId = Integer.parseInt(workVO.getTempId());
			int taskId = workVO.getTaskId();
			workVO.setTaskId(taskId);

			System.out.println("update taskId -------------> " + taskId);

			int result = workService.updateTask(workVO);
			
			
			// 저장성공 시 taskId 화면으로 전달
			if (result == 1) {
				msg = "OK" + "/" + taskId;

			} else {
				msg = "FAIL"+ "/" + taskId;
			}

		return msg;
	}
	
	/**
	 * 업무수정에서 항목 삭제 
	 * @param taskId
	 * @param valueArr
	 * @param request
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("mapo/workItemSelectedDelete.do")
	@ResponseBody
	public String AddWorkView(@RequestParam(value = "taskId") int taskId, 
			@RequestParam(value = "valueArr") List<String> valueArr, 
			HttpServletRequest request,
			ModelMap model) throws Exception {
		WorkVO wo = new WorkVO();
		wo.setTaskId(taskId);
		int result = 0;
		String updateMsg = "";
		
		for(int i = 0; i<valueArr.size(); i++) {
			int itemValue = Integer.parseInt(valueArr.get(i));
			System.out.println("결과 확인 itemValue : "  + itemValue );
			wo.setItemId(itemValue);
			result = workService.workItemSelectedDelete(wo);
			System.out.println("결과 확인 : "  + result );
		}
		
		if(result > 0) {
			updateMsg = "OK";
		}else {
			updateMsg = "fail";
		}
		
		return updateMsg;
	}
	
	
	/**
	 * 업무수정에서 항목 추가 
	 * @param workVO
	 * @param model
	 * @param taskId
	 * @param itemNm
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/mapo/addItemFromWorkUpdate.do")
	@ResponseBody
	public String addItemFromWorkUpdate(@ModelAttribute("WorkVO") WorkVO workVO, ModelMap model, 
			@RequestParam("taskId") int taskId,
			@RequestParam("itemNm") String itemNm,
			@RequestParam("insertId") String insertId) throws Exception {
		workVO.setTaskId(taskId);
		workVO.setItemNm(itemNm);
		workVO.setInsertId(insertId);
		
		int result = workService.addItemFromWorkUpdate(workVO);
		
		String msg = "";

		if(result > 0) {
			msg = "OK" ;
		}else {
			msg ="fail";
		}
		return msg;
	}
}

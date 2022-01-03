package mapo.work.web;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import mapo.work.service.WorkService;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

@Controller
public class ExcelController {

	private static final Logger logger = LoggerFactory.getLogger(ExcelController.class);
    
	// Service
	@Resource(name = "workService")
	private WorkService workService;
    
    @RequestMapping(value = "mapo/excelDown.do", method = RequestMethod.POST)
    public void ExcelDown(HttpServletResponse response, @RequestParam(value = "taskId") String taskId){
    	System.out.println("-----------id ---------"+taskId);
        logger.info("@@@@@@@@@@@@@@@ ExcelDown START @@@@@@@@@@@@@@@");
        
        workService.getExcelDown(response,taskId);
        
        logger.info("@@@@@@@@@@@@@@@ ExcelDown END @@@@@@@@@@@@@@@");
        
    }


}

package mapo.work.service.impl;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletResponse;


import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.apache.poi.hssf.util.HSSFColor.HSSFColorPredefined;
import org.apache.poi.ss.usermodel.BorderStyle;
import org.apache.poi.ss.usermodel.Cell;
import org.apache.poi.ss.usermodel.CellStyle;
import org.apache.poi.ss.usermodel.FillPatternType;
import org.apache.poi.ss.usermodel.HorizontalAlignment;
import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.ss.usermodel.Sheet;
import org.apache.poi.ss.usermodel.Workbook;

import org.springframework.stereotype.Service;

import egovframework.rte.psl.dataaccess.util.EgovMap;
import mapo.work.service.ExcelDto;
import com.dsjdf.jdf.DateTime;

import mapo.work.service.WorkService;
import mapo.work.service.WorkVO;
import mapo.work.service.WorkVO2;
import mapo.work.web.ExcelController;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

@Service("workService")
public class WorkServiceImpl implements WorkService {

	@Resource(name="workDAO")
	private WorkDAO workDAO;
	
	// Service
	@Resource(name = "workService")
	private WorkService workService;
	
	private static final Logger logger = LoggerFactory.getLogger(ExcelController.class);

	
	/**
	 * 업무진행상태 조회
	 */
	@Override
	public List<?> selectWorkStep(WorkVO workVO) throws Exception {
		return workDAO.selectWorkStep(workVO);
	}
	
	
	/**
	 * 업무구분 조회
	 */
	@Override
	public List<?> selectWorkGubun(WorkVO workVO) throws Exception {
		return workDAO.selectWorkGubun(workVO);
	}

	/**
	 * 업무 저장
	 */
	@Override
	public int insertWork(WorkVO workVO) throws Exception {
		return workDAO.insertWork(workVO);
	}
	
	/**
	 * 항목 저장
	 */
	@Override
	public int insertItem(ArrayList<WorkVO> workVO) throws Exception {
		return workDAO.insertItem(workVO);
	}
	
	/**
	 * 업무 Task_id컬럼 ,ITem_id 컬럼 조회
	 */
	@Override
	public int selectTaskId() throws Exception {
		return workDAO.selectTaskId();
	}
	@Override
	public int selectItemId() throws Exception {
		return workDAO.selectItemId();
	}
	
	/**
	 * 시설 선택 저장
	 */
	@Override
	public int insertFacilityList(ArrayList<Integer> orgIdLists) throws Exception {
		return workDAO.insertFacilityList(orgIdLists);
	}
	/**
	 * 시설 선택 저장 전 기존 데이터 삭제
	 */
	@Override
	public int deleteFacilityList(WorkVO workVO) throws Exception {
		return workDAO.deleteFacilityList(workVO);
	}
	

	/**
	 * 기관 분류 (대분류)
	 */
	@Override
	public List<?> selectDepth1(WorkVO workVO) throws Exception {
		return workDAO.selectDepth1(workVO);
	}

	/**
	 * 기관준류 (중분류)
	 */
	@Override
	public List<?> selectDepth2(WorkVO workVO) throws Exception {
		return workDAO.selectDepth2(workVO);
	}
	
	/**
	 * 기관분류 (소분류)
	 */
	@Override
	public List<?> selectDepth3(WorkVO workVO) throws Exception {
		return workDAO.selectDepth3(workVO);
	}

	/**
	 * 기관분류 (기관코드)
	 */
	@Override
	public List<?> selectDepth4(WorkVO workVO) throws Exception {		
		return workDAO.selectDepth4(workVO);
	}
	
	/**
	 * 업무리스트 조회
	 */
	@Override
	public List<?> selectWorkList(WorkVO workVO) throws Exception {
		return workDAO.selectWorkList(workVO);
	}
	
	/**
	 * 업무 갯수 조회
	 */
	@Override
	public int selectWorkTotal(WorkVO workVO) throws Exception {
		return workDAO.selectWorkTotal(workVO);
	}

	/**
	 * 업무 상세
	 */
	@Override
	public WorkVO selectWorkDetail(WorkVO workVO) throws Exception {
		return workDAO.selectWorkDetail(workVO);
	}
	
	/**
	 * 업무상세 리스트
	 * @param workVO
	 * @return
	 */
	public List<?> selectItemList(WorkVO workVO) throws Exception {
		return workDAO.selectItemList(workVO);
	}
	
	/**
	 * 업무상세 리스트 복지기관
	 * @param workVO
	 * @return
	 */
	public List<?> selectItemListOrg(WorkVO workVO) throws Exception {
		return workDAO.selectItemListOrg(workVO);
	}

	/**
	 * 복지지설 조회
	 */
	@Override
	public List<?> selectGthOrgList(WorkVO workVO) throws Exception {
		return workDAO.selectGthOrgList(workVO);
	}


	/**
	 * 공통코드 중분류 추가
	 */
	@Override
	public List<?> selectMiddleCode(WorkVO workVO) throws Exception {
		return workDAO.selectMiddleCode(workVO);
	}


	/**
	 * 항목저장
	 */
	@Override
	public int insertItem2(WorkVO wo) {
		return workDAO.insertItem2(wo);
	}

	/**
	 * 항목값 입력
	 */
	@Override
	public int insertItemValue(WorkVO workVO) throws Exception {
		return workDAO.insertItemValue(workVO);
	}


	/**
	 * 업무 업데이트
	 */
	@Override
	public int updateTask(WorkVO workVO) throws Exception {
		return workDAO.updateTask(workVO);
	}
	

	/**
	 * 기존 기관개수 카운트 
	 */
	@Override
	public int selectOrgCnt(WorkVO workVO) throws Exception {
		return workDAO.selectOrgCnt(workVO);
	}


	/**
	 * 기관 리스트 저장
	 */
	@Override
	public int insertOrgList(WorkVO vo) throws Exception {
		return workDAO.insertOrgList(vo);
	}


	/**
	 * 업무배포 (기관 저장)
	 */
	@Override
	public int insertTaskDist(WorkVO workVO) throws Exception {
		return workDAO.insertTaskDist(workVO);
	}
	
	
	/**
	 * 업무배포 (항목 저장)
	 */
	@Override
	public int insertTaskCheck(WorkVO workVO) throws Exception {
		return workDAO.insertTaskCheck(workVO);
	}


	/**
	 * 업무 상태(STEP) 코드 변경
	 */
	@Override
	public int updateTaskStep(WorkVO workVO) throws Exception {
		return workDAO.updateTaskStep(workVO);
	}

	/**
	 * 업무확인(복지지설)
	 */	
	@Override
	public List<?> selectWorkListOrg(WorkVO workVO) throws Exception {
		return workDAO.selectWorkListOrg(workVO);
	}



	/**
	 * 업무 담당자 조회
	 */
	@Override
	public List<?> selectWorkManager(WorkVO workVO) throws Exception {
		return workDAO.selectWorkManager(workVO);
	}

	/**
	 * 배포 리스트 조회
	 */
	@Override
	public List<?> selectResultGubun(WorkVO workVO) throws Exception {
		return workDAO.selectResultGubun(workVO);
	}
	
	/**
	 * 배포 갯수 조회
	 */
	@Override
	public int selectResultTotal(WorkVO workVO) throws Exception {
		return workDAO.selectResultTotal(workVO);
	}
	
	/**
	 * 배포 리스트 조회(항목 포함)
	 */
	@Override
	public List<?> selectResultItemGubun(WorkVO workVO) throws Exception {
		return workDAO.selectResultItemGubun(workVO);
	}
	
	/**
	 * 배포 결과 (항목 제목 조회) 
	 */
	@Override
	public List<?> selectResultItem(WorkVO workVO) throws Exception {
		return workDAO.selectResultItem(workVO);
	}
	

	/**
	 * 배포 결과 (항목 제목 갯수 조회) 
	 */
	@Override
	public int selectResultItemSize(WorkVO workVO) throws Exception {
		return workDAO.selectResultItemSize(workVO);
	}
	
	/**
	 * 항목 값
	 */
	@Override
	public List<?> selectResultItemValue(WorkVO workVO) throws Exception {
		return workDAO.selectResultItemValue(workVO);
	}
	
	/**
	 * 배포 갯수 조회(항목 포함)
	 */
//	@Override
//	public int selectResultItemTotal(WorkVO workVO) throws Exception {
//		return workDAO.selectResultItemTotal(workVO);
//	}

	/**
	 * 배포결과 상세 승인완료
	 */
	@Override
	public int workResultApproved(WorkVO workVO) throws Exception {
		return workDAO.workResultApproved(workVO);
	}
	
	/**
	 * 배포결과 상세 수정요청
	 */
	@Override
	public int workResultUpdateRequest(WorkVO workVO) {
		return workDAO.workResultUpdateRequest(workVO);
	}
	
	/**
	 * 배포결과 업무완료
	 */
	@Override
	public int workCompleteDist(WorkVO workVO) throws Exception {
		return workDAO.workCompleteDist(workVO);
	}
	
	@Override
	public int workComplete(WorkVO workVO) throws Exception {
		return workDAO.workComplete(workVO);
	}



	/**
	 * 업무별 기관 리스트 조회
	 */
	@Override
	public List<?> selectWorkOrgList(WorkVO workVO) throws Exception {
		return workDAO.selectWorkOrgList(workVO);
	}


	/**
	 * 아이템 항목 개수 조회
	 */
	@Override
	public int selectWorkItemCnt(WorkVO workVO) throws Exception {
		return workDAO.selectWorkItemCnt(workVO);
	}

	/**
	 * 아이템 삭제
	 */
	@Override
	public int deleteWorkItem(WorkVO workVO) throws Exception {
		return workDAO.deleteWorkItem(workVO);
	}

	/**
	 * 업무폼 삭제
	 */
	@Override
	public int deleteWorkForm(WorkVO workVO) throws Exception {
		return workDAO.deleteWorkForm(workVO);
	}

	/**
	 * 업무 갯수 조회
	 */
	@Override
	public int selectWorkTotalOrg(WorkVO workVO) throws Exception {
		return workDAO.selectWorkTotalOrg(workVO);
	}
	
	/**
	 * 복지기관 업무 승인요청
	 */
	@Override
	public int updateApproval(WorkVO workVO) throws Exception {
		return workDAO.updateApproval(workVO);
	}

	/**
	 * 승인여부 조회
	 */
	@Override
	public WorkVO selectApproval(WorkVO workVO) throws Exception {
		return workDAO.selectApproval(workVO);
	}
	
	/**
	 * 업무 확인여부 조회
	 */
	@Override
	public int updateCount(WorkVO workVO) throws Exception {
		return workDAO.updateCount(workVO);
	}

	@Override
	public List<?> selectResultItemGubun2(WorkVO2 workVO) throws Exception {
		return workDAO.selectResultItemGubun2(workVO);
	}
	

	/*
	 * 엑셀 다운로드
	 */
	@Override
    public void getExcelDown(HttpServletResponse response, String taskId) {
        Map<String, Object> map = new HashMap<String, Object>();

        WorkVO2 wo2 = new WorkVO2();
        wo2.setTaskId(taskId);
        
        try{
        	
        	List<?> list = null;
    		try {
    			list = workService.selectResultItemGubun2(wo2);
    		} catch (Exception e) {
    			// TODO Auto-generated catch block
    			e.printStackTrace();
    		}
            //Excel Down 시작
            Workbook workbook = new HSSFWorkbook();
            //시트생성
            Sheet sheet = workbook.createSheet("배포결과");
            
            //행, 열, 열번호
            Row row = null;
            Cell cell = null;
            int rowNo = 0;
            
            // 테이블 헤더용 스타일
            CellStyle headStyle = workbook.createCellStyle();
    
            // 가는 경계선을 가집니다.
            headStyle.setBorderTop(BorderStyle.THIN);
            headStyle.setBorderBottom(BorderStyle.THIN);
            headStyle.setBorderLeft(BorderStyle.THIN);
            headStyle.setBorderRight(BorderStyle.THIN);
    
            // 배경색은 노란색입니다.
            headStyle.setFillForegroundColor(HSSFColorPredefined.YELLOW.getIndex());
            headStyle.setFillPattern(FillPatternType.SOLID_FOREGROUND);
    
            // 데이터는 가운데 정렬합니다.
            headStyle.setAlignment(HorizontalAlignment.CENTER);
    
            // 데이터용 경계 스타일 테두리만 지정
            CellStyle bodyStyle = workbook.createCellStyle();
//            bodyStyle.setBorderTop(BorderStyle.THIN);
//            bodyStyle.setBorderBottom(BorderStyle.THIN);
//            bodyStyle.setBorderLeft(BorderStyle.THIN);
//            bodyStyle.setBorderRight(BorderStyle.THIN);
            
            //항목 제목 리스트
            List<?> titleItemList = null;
            WorkVO wo = new WorkVO();
            int taskIdCast = Integer.parseInt(taskId);
            wo.setTaskId(taskIdCast);
            try {
            	 titleItemList = workService.selectResultItem(wo);
    		} catch (Exception e) {
    			// TODO Auto-generated catch block
    			e.printStackTrace();
    		}
            
            //항목 값 리스트
            List<?> valueItemList = null;
            try {
            	valueItemList = workService.selectResultItemValue(wo);
    		} catch (Exception e) {
    			// TODO Auto-generated catch block
    			e.printStackTrace();
    		}
            
           
            // 헤더 생성
            row = sheet.createRow(rowNo++);
    
            cell = row.createCell(0);
            cell.setCellStyle(headStyle);
            cell.setCellValue("업무id");
    
            cell = row.createCell(1);
            cell.setCellStyle(headStyle);
            cell.setCellValue("진행상태");
    
            cell = row.createCell(2);
            cell.setCellStyle(headStyle);
            cell.setCellValue("업무구분");
            
            cell = row.createCell(3);
            cell.setCellStyle(headStyle);
            cell.setCellValue("업무제목");
            
            cell = row.createCell(4);
            cell.setCellStyle(headStyle);
            cell.setCellValue("기관명");
            
            cell = row.createCell(5);
            cell.setCellStyle(headStyle);
            cell.setCellValue("최초확인자");
            
            cell = row.createCell(6);
            cell.setCellStyle(headStyle);
            cell.setCellValue("최초확인일");
            
            cell = row.createCell(7);
            cell.setCellStyle(headStyle);
            cell.setCellValue("승인요청자(ID)");
            
            cell = row.createCell(8);
            cell.setCellStyle(headStyle);
            cell.setCellValue("승인요청일시");
            
            /* 항목 제목 */
            for(int i=0; i<titleItemList.size(); i++) {
            	WorkVO woTitle = (WorkVO) titleItemList.get(i);
            	cell = row.createCell(9+i);
            	cell.setCellStyle(headStyle);
            	cell.setCellValue(woTitle.getItemNm());
            }

            // 데이터 부분 생성
//            for(Object map1 : list) {
            for (int i = 0; i < list.size(); i++) {
                Map<String, Object> mapValue = (Map<String, Object>) list.get(i);
                
                logger.info("DB DATA : " + mapValue.toString());
                
                row = sheet.createRow(rowNo++);
                cell = row.createCell(0);
                cell.setCellStyle(bodyStyle);
                cell.setCellValue(""+mapValue.get("taskId"));
                
                cell = row.createCell(1);
                cell.setCellStyle(bodyStyle);
                cell.setCellValue(""+mapValue.get("codeNm"));
                
                cell = row.createCell(2);
                cell.setCellStyle(bodyStyle);
                cell.setCellValue(""+mapValue.get("tasNm"));
                
                cell = row.createCell(3);
                cell.setCellStyle(bodyStyle);
                cell.setCellValue(""+mapValue.get("taskNm"));
                
                cell = row.createCell(4);
                cell.setCellStyle(bodyStyle);
                cell.setCellValue(""+mapValue.get("orgNm"));
                
                cell = row.createCell(5);
                cell.setCellStyle(bodyStyle);
                if (mapValue.get("frstReadId") == null) {
					cell.setCellValue(" ");
				} else {
					cell.setCellValue(mapValue.get("userNm")+"("+(""+mapValue.get("frstReadId"))+")");
				}
                
                cell = row.createCell(6);
                cell.setCellStyle(bodyStyle);
                if (mapValue.get("frstReadDt") == null) {
					cell.setCellValue(" ");
				} else {
					cell.setCellValue(""+mapValue.get("frstReadDt"));
				}
//                승인요청자
                cell = row.createCell(7);
                cell.setCellStyle(bodyStyle);
                if (mapValue.get("updateId") == null) {
					cell.setCellValue(" ");
				} else {
					cell.setCellValue(mapValue.get("updateNm")+"("+(""+mapValue.get("updateId"))+")");
				}
                
                cell = row.createCell(8);
                cell.setCellStyle(bodyStyle);
                if (mapValue.get("updateDt") == null) {
					cell.setCellValue(" ");
				} else {
					cell.setCellValue(""+mapValue.get("updateDt"));
				}
                
                /* 항목 값 생성 (동적) */
                WorkVO woValue = (WorkVO) valueItemList.get(i);

				cell = row.createCell(9);
				cell.setCellStyle(bodyStyle);
				if (woValue.getItem1() == null) {
					cell.setCellValue(" ");
				} else {
					cell.setCellValue("" + woValue.getItem1());
				}

				cell = row.createCell(10);
				cell.setCellStyle(bodyStyle);
				if (woValue.getItem2() == null) {
					cell.setCellValue(" ");
				} else {
					cell.setCellValue("" + woValue.getItem2());
				}

				cell = row.createCell(11);
				cell.setCellStyle(bodyStyle);
				if (woValue.getItem3() == null) {
					cell.setCellValue(" ");
				} else {
					cell.setCellValue("" + woValue.getItem3());
				}

				cell = row.createCell(12);
				cell.setCellStyle(bodyStyle);
				if (woValue.getItem4() == null) {
					cell.setCellValue(" ");
				} else {
					cell.setCellValue("" + woValue.getItem4());
				}

				cell = row.createCell(13);
				cell.setCellStyle(bodyStyle);
				if (woValue.getItem5() == null) {
					cell.setCellValue(" ");
				} else {
					cell.setCellValue("" + woValue.getItem5());
				}

				cell = row.createCell(14);
				cell.setCellStyle(bodyStyle);
				if (woValue.getItem6() == null) {
					cell.setCellValue(" ");
				} else {
					cell.setCellValue("" + woValue.getItem6());
				}

				cell = row.createCell(15);
				cell.setCellStyle(bodyStyle);
				if (woValue.getItem7() == null) {
					cell.setCellValue(" ");
				} else {
					cell.setCellValue("" + woValue.getItem7());
				}

				cell = row.createCell(16);
				cell.setCellStyle(bodyStyle);
				if (woValue.getItem8() == null) {
					cell.setCellValue(" ");
				} else {
					cell.setCellValue("" + woValue.getItem8());
				}

				cell = row.createCell(17);
				cell.setCellStyle(bodyStyle);
				if (woValue.getItem9() == null) {
					cell.setCellValue(" ");
				} else {
					cell.setCellValue("" + woValue.getItem9());
				}

				cell = row.createCell(18);
				cell.setCellStyle(bodyStyle);
				if (woValue.getItem10() == null) {
					cell.setCellValue(" ");
				} else {
					cell.setCellValue("" + woValue.getItem10());
				}
				
				cell = row.createCell(19);
				cell.setCellStyle(bodyStyle);
				if (woValue.getItem11() == null) {
					cell.setCellValue(" ");
				} else {
					cell.setCellValue("" + woValue.getItem11());
				}
				
				cell = row.createCell(20);
				cell.setCellStyle(bodyStyle);
				if (woValue.getItem12() == null) {
					cell.setCellValue(" ");
				} else {
					cell.setCellValue("" + woValue.getItem12());
				}
				
				cell = row.createCell(21);
				cell.setCellStyle(bodyStyle);
				if (woValue.getItem13() == null) {
					cell.setCellValue(" ");
				} else {
					cell.setCellValue("" + woValue.getItem13());
				}
				
				cell = row.createCell(22);
				cell.setCellStyle(bodyStyle);
				if (woValue.getItem14() == null) {
					cell.setCellValue(" ");
				} else {
					cell.setCellValue("" + woValue.getItem14());
				}
				
				cell = row.createCell(23);
				cell.setCellStyle(bodyStyle);
				if (woValue.getItem15() == null) {
					cell.setCellValue(" ");
				} else {
					cell.setCellValue("" + woValue.getItem15());
				}
				
				cell = row.createCell(24);
				cell.setCellStyle(bodyStyle);
				if (woValue.getItem16() == null) {
					cell.setCellValue(" ");
				} else {
					cell.setCellValue("" + woValue.getItem16());
				}
				
				cell = row.createCell(25);
				cell.setCellStyle(bodyStyle);
				if (woValue.getItem17() == null) {
					cell.setCellValue(" ");
				} else {
					cell.setCellValue("" + woValue.getItem17());
				}
				
				cell = row.createCell(26);
				cell.setCellStyle(bodyStyle);
				if (woValue.getItem18() == null) {
					cell.setCellValue(" ");
				} else {
					cell.setCellValue("" + woValue.getItem18());
				}
				
				cell = row.createCell(27);
				cell.setCellStyle(bodyStyle);
				if (woValue.getItem19() == null) {
					cell.setCellValue(" ");
				} else {
					cell.setCellValue("" + woValue.getItem19());
				}
				
				cell = row.createCell(28);
				cell.setCellStyle(bodyStyle);
				if (woValue.getItem20() == null) {
					cell.setCellValue(" ");
				} else {
					cell.setCellValue("" + woValue.getItem20());
				}
				
				cell = row.createCell(29);
				cell.setCellStyle(bodyStyle);
				if (woValue.getItem21() == null) {
					cell.setCellValue(" ");
				} else {
					cell.setCellValue("" + woValue.getItem21());
				}
				
				cell = row.createCell(30);
				cell.setCellStyle(bodyStyle);
				if (woValue.getItem22() == null) {
					cell.setCellValue(" ");
				} else {
					cell.setCellValue("" + woValue.getItem22());
				}
				
				cell = row.createCell(31);
				cell.setCellStyle(bodyStyle);
				if (woValue.getItem23() == null) {
					cell.setCellValue(" ");
				} else {
					cell.setCellValue("" + woValue.getItem23());
				}
				
				cell = row.createCell(32);
				cell.setCellStyle(bodyStyle);
				if (woValue.getItem24() == null) {
					cell.setCellValue(" ");
				} else {
					cell.setCellValue("" + woValue.getItem24());
				}
				
				cell = row.createCell(33);
				cell.setCellStyle(bodyStyle);
				if (woValue.getItem25() == null) {
					cell.setCellValue(" ");
				} else {
					cell.setCellValue("" + woValue.getItem25());
				}
				
				cell = row.createCell(34);
				cell.setCellStyle(bodyStyle);
				if (woValue.getItem26() == null) {
					cell.setCellValue(" ");
				} else {
					cell.setCellValue("" + woValue.getItem26());
				}
				
				cell = row.createCell(35);
				cell.setCellStyle(bodyStyle);
				if (woValue.getItem27() == null) {
					cell.setCellValue(" ");
				} else {
					cell.setCellValue("" + woValue.getItem27());
				}
				
				cell = row.createCell(36);
				cell.setCellStyle(bodyStyle);
				if (woValue.getItem28() == null) {
					cell.setCellValue(" ");
				} else {
					cell.setCellValue("" + woValue.getItem28());
				}
				
				cell = row.createCell(37);
				cell.setCellStyle(bodyStyle);
				if (woValue.getItem29() == null) {
					cell.setCellValue(" ");
				} else {
					cell.setCellValue("" + woValue.getItem29());
				}
				
				cell = row.createCell(38);
				cell.setCellStyle(bodyStyle);
				if (woValue.getItem30() == null) {
					cell.setCellValue(" ");
				} else {
					cell.setCellValue("" + woValue.getItem30());
				}
				/* (30개 추가)만약 WorkVO 객체에서 item변수 추가 시 여기에 같이 추가해야 함*/
            }
            //-------------------- for문 EDN -----------------------------------

            String filename = "배포결과_" + DateTime.getDateString() + ".xls";
            String outputFileName = new String(filename.getBytes("KSC5601"), "8859_1");
    
            // 컨텐츠 타입과 파일명 지정
            response.setContentType("ms-vnd/excel");
            response.setHeader("Content-Disposition", "attachment;filename=\"" + outputFileName + "\"");
 
            // 엑셀 출력
            workbook.write(response.getOutputStream());
            workbook.close();
            
        } catch (IOException e) {
        	
            e.printStackTrace();
        }
        
    }

	/**
	 * 업무 미리보기 마포구청
	 */
	@Override
	public List<?> selectWorkMain(WorkVO workVO) throws Exception {
		return workDAO.selectWorkMain(workVO);
	}

	/**
	 * 업무 미리보기 복지시설
	 */
	@Override
	public List<?> selectWorkMainOrg(WorkVO workVO) throws Exception {
		return workDAO.selectWorkMainOrg(workVO);
	}

	/**
	 * 업무수정에서 항목 삭제
	 */
	@Override
	public int workItemSelectedDelete(WorkVO workVO) throws Exception {
		return workDAO.workItemSelectedDelete(workVO);
	}


	/**
	 * 업무수정에서 항목 추가
	 */
	@Override
	public int addItemFromWorkUpdate(WorkVO workVO) {
		return workDAO.addItemFromWorkUpdate(workVO);
	}

}

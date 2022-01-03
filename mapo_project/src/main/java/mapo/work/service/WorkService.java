package mapo.work.service;

import java.util.ArrayList;
import java.util.List;

import egovframework.rte.psl.dataaccess.util.EgovMap;

import javax.servlet.http.HttpServletResponse;



public interface WorkService {
	
	/**
	 * 업무진행상태 조회
	 * @param workVO
	 * @return
	 * @throws Exception
	 */
	public List<?> selectWorkStep(WorkVO workVO) throws Exception;

	/**
	 * 업무구분 조회
	 * @param workVO
	 * @return
	 * @throws Exception
	 */
	public List<?> selectWorkGubun(WorkVO workVO) throws Exception;
	
	/**
	 * 업무 저장
	 * @param workVO
	 * @return
	 * @throws Exception
	 */
	public int insertWork(WorkVO workVO) throws Exception;
	
	/**
	 * 항목 저장
	 * @param workVO
	 * @return
	 * @throws Exception
	 */
	public int insertItem(ArrayList<WorkVO> workVO) throws Exception;

	
	/**
	 * 업무 Task_id컬럼 ,ITem_id 컬럼 조회
	 * @return
	 * @throws Exception
	 */
	public int selectTaskId() throws Exception;
	public int selectItemId() throws Exception;
	
	/**
	 * 시설 선택 저장
	 * @param orgIdLists
	 * @return
	 * @throws Exception
	 */
	public int insertFacilityList(ArrayList<Integer> orgIdLists) throws Exception;
	
	/**
	 * 시설 선택 저장 전 기존 데이터 삭제
	 * @return
	 * @throws Exception
	 */
	public int deleteFacilityList(WorkVO workVO) throws Exception;
	
	/**
	 * 기관 조회 (대분류)
	 * @param workVO
	 * @return
	 * @throws Exception
	 */
	public List<?> selectDepth1(WorkVO workVO) throws Exception;
	
	
	/**
	 * 기관 조회 (중분류)
	 * @param workVO
	 * @return
	 * @throws Exception
	 */
	public List<?> selectDepth2(WorkVO workVO) throws Exception;
	
	
	/**
	 * 기관 조회 (소분류)
	 * @param workVO
	 * @return
	 * @throws Exception
	 */
	public List<?> selectDepth3(WorkVO workVO) throws Exception;
	
	
	/**
	 * 기관 조회 (기관코드)
	 * @param workVO
	 * @return
	 * @throws Exception
	 */
	public List<?> selectDepth4(WorkVO workVO) throws Exception;
	
	/**
	 * 업무확인 (마포구청)
	 * @param workVO
	 * @return
	 * @throws Exception
	 */
	public List<?> selectWorkList(WorkVO workVO) throws Exception;
	
	/**
	 * 업무확인 (복지시설)
	 * @param workVO
	 * @return
	 * @throws Exception
	 */
	public List<?> selectWorkListOrg(WorkVO workVO) throws Exception;

	/**
	 * 업무 갯수 조회
	 * @param workVO
	 * @return
	 * @throws Exception
	 */
	public int selectWorkTotal(WorkVO workVO) throws Exception;
	
	/**
	 * 업무 갯수 조회(복지기관)
	 * @param workVO
	 * @return
	 * @throws Exception
	 */
	public int selectWorkTotalOrg(WorkVO workVO) throws Exception;
	
	/**
	 * 업무 상세
	 * @param workVO
	 * @return
	 * @throws Exception
	 */
	public WorkVO selectWorkDetail(WorkVO workVO) throws Exception;
	
	/**
	 * 업무 항목 조회
	 * @param workVO
	 * @return
	 * @throws Exception
	 */
	public List<?> selectItemList(WorkVO workVO) throws Exception;
	
	/**
	 * 업무 항목 조회(복지기관)
	 * @param workVO
	 * @return
	 * @throws Exception
	 */
	public List<?> selectItemListOrg(WorkVO workVO) throws Exception;
	
	/**
	 * 승인여부 조회
	 * @param workVO
	 * @return
	 * @throws Exception
	 */
	public WorkVO selectApproval(WorkVO workVO) throws Exception;

	/**
	 * 복지시설 리스트 조회
	 * @param workVO
	 * @return
	 */
	public List<?> selectGthOrgList(WorkVO workVO) throws Exception;


	/**
	 * 공통코드 중분류 조회
	 * @param workVO
	 * @return
	 */
	public List<?> selectMiddleCode(WorkVO workVO)throws Exception;

	/**
	 * 항목저장
	 * @param wo
	 * @return
	 */
	public int insertItem2(WorkVO wo) throws Exception;
	
	/**
	 * 항목값 입력
	 * @param workVO
	 * @return
	 */
	public int insertItemValue(WorkVO workVO) throws Exception;

	/**
	 * 업무 업데이트
	 * @param workVO
	 * @return
	 */
	public int updateTask(WorkVO workVO) throws Exception;

	/**
	 * 기존 기관개수 카운트 
	 * @param workVO
	 * @return
	 * @throws Exception
	 */
	public int selectOrgCnt(WorkVO workVO) throws Exception;

	/**
	 * 기관리스트 저장
	 * @param vo
	 * @return
	 * @throws Exception
	 */
	public int insertOrgList(WorkVO vo) throws Exception;

	/**
	 * 업무배포 (기관 저장)
	 * @param workVO
	 * @return
	 * @throws Exception
	 */
	public int insertTaskDist(WorkVO workVO) throws Exception;
	
	/**
	 * 업무배포 (항목 저장)
	 * @param workVO
	 * @return
	 * @throws Exception
	 */
	public int insertTaskCheck(WorkVO workVO) throws Exception;

	/**
	 * 업무 상태(STEP) 코드 변경
	 * @param workVO
	 * @return
	 * @throws Exception
	 */
	public int updateTaskStep(WorkVO workVO) throws Exception;

	/**
	 * 업무 담당자 조회
	 * @param workVO
	 * @return
	 * @throws Exception
	 */
	public List<?> selectWorkManager(WorkVO workVO) throws Exception;
	
	/**
	 * 배포 리스트 조회
	 * @param workVO
	 * @return
	 * @throws Exception
	 */
	public List<?> selectResultGubun(WorkVO workVO) throws Exception;
	
	/**
	 * 배포 갯수 조회
	 * @param workVO
	 * @return
	 * @throws Exception
	 */
	public int selectResultTotal(WorkVO workVO) throws Exception;
	
	/**
	 * 배포 리스트 조회(항목 포함)
	 * @param workVO
	 * @return
	 * @throws Exception
	 */
	public List<?> selectResultItemGubun(WorkVO workVO) throws Exception;
	
	/**
	 * 엑셀 다운로드시 리스트 조회
	 * @param workVO
	 * @return
	 * @throws Exception
	 */
	public List<?> selectResultItemGubun2(WorkVO2 workVO) throws Exception;
	
	
	/**
	 * 배포 결과 (항목 제목 조회) 
	 * @param workVO
	 * @return
	 * @throws Exception
	 */
	public List<?> selectResultItem(WorkVO workVO) throws Exception;
	
	/**
	 * 배포 결과 (항목 제목 갯수 조회) 
	 * @param workVO
	 * @return
	 * @throws Exception
	 */
	public int selectResultItemSize(WorkVO workVO) throws Exception;
	
	/**
	 * 배포 결과 (항목 값 조회)
	 * @param workVO
	 * @return
	 * @throws Exception
	 */
	public List<?> selectResultItemValue(WorkVO workVO) throws Exception;
	
	/**
	 * 배포 갯수 조회(항목 포함)
	 * @param workVO
	 * @return
	 * @throws Exception
	 */
//	public int selectResultItemTotal(WorkVO workVO) throws Exception;
	
	/**
	 * 배포결과 상세 승인완료
	 * @param workVO
	 * @return
	 * @throws Exception
	 */
	public int workResultApproved(WorkVO workVO) throws Exception;

	/**
	 * 배포결과 상세 수정요청
	 * @param wo
	 * @return
	 */
	public int workResultUpdateRequest(WorkVO workVO) throws Exception;
	
	/**
	 * 배포결과 업무완료
	 * @param workVO
	 * @return
	 * @throws Exception
	 */
	public int workCompleteDist(WorkVO workVO) throws Exception;
	
	public int workComplete(WorkVO workVO) throws Exception;
	
	
	
	/**
	 * 업무별 기관 리스트 조회
	 * @param workVO
	 * @return
	 * @throws Exception
	 */
	public List<?> selectWorkOrgList(WorkVO workVO) throws Exception;

	
	/**
	 * 아이템 항목 개수 조회
	 * @param workVO
	 * @return
	 * @throws Exception
	 */
	public int selectWorkItemCnt(WorkVO workVO) throws Exception;

	
	/**
	 * 아이템 항목 삭제
	 * @param workVO
	 * @return
	 * @throws Exception
	 */
	public int deleteWorkItem(WorkVO workVO) throws Exception;

	
	/**
	 * 업무 폼 삭제
	 * @param workVO
	 * @return
	 * @throws Exception
	 */
	public int deleteWorkForm(WorkVO workVO) throws Exception;
	
	/**
	 * 복지기관 업무 승인요청
	 * @param workVO
	 * @return
	 * @throws Exception
	 */
	public int updateApproval(WorkVO workVO) throws Exception;
	
	/**
	 * 업무 확인여부 조회
	 * @param workVO
	 * @return
	 * @throws Exception
	 */
	public int updateCount(WorkVO workVO) throws Exception;

	public void getExcelDown(HttpServletResponse response, String taskId);
	
	/**
	 * 업무 미리보기(메인)
	 * @param workVO
	 * @return
	 * @throws Exception
	 */
	public List<?> selectWorkMain(WorkVO workVO) throws Exception;
	
	/**
	 * 업무 미리보기(메인)
	 * @param workVO
	 * @return
	 * @throws Exception
	 */
	public List<?> selectWorkMainOrg(WorkVO workVO) throws Exception;
	
	/**
	 * 업무수정에서 항목 삭제
	 * @param workVO
	 * @return
	 * @throws Exception
	 */
	public int workItemSelectedDelete(WorkVO workVO) throws Exception;

	/**
	 * 업무수정에서 항목 추가
	 * @param workVO
	 * @return
	 */
	public int addItemFromWorkUpdate(WorkVO workVO) throws Exception;

		
}

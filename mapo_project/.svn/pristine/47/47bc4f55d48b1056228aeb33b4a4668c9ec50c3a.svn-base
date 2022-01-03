package mapo.org.service;

import java.util.List;

import mapo.work.service.WorkVO;

public interface OrgService{

	/**
	 * 기관 리스트 조회
	 * @return
	 * @throws Exception
	 */
	public List<?> selectOrgList(WorkVO workVO) throws Exception;
	
	/**
	 * 게시글 총 카운트 조회
	 * @param workVO
	 * @return
	 * @throws Exception
	 */
	public int selectOrgListTotcnt(WorkVO workVO) throws Exception;
	
	/**
	 * 기관 등록
	 * @param orgVO
	 * @return
	 * @throws Exception
	 */
	public int insertOrg(OrgVO orgVO) throws Exception;
	
	/**
	 * 기관 상세
	 * @param orgVO
	 * @return
	 * @throws Exception
	 */
	public OrgVO selectOrgDetail(OrgVO orgVO) throws Exception;
	
	/**
	 * 기관 수정
	 * @param orgVO
	 * @return
	 * @throws Exception
	 */
	public int updateOrg(OrgVO orgVO) throws Exception;
	
	/**
	 * 기관 삭제
	 * @param orgId
	 * @return
	 * @throws Exception
	 */
	public int deleteOrg(int orgId) throws Exception;
	
	/**
	 * 복지지설 관리 시설분류 selected된 시설이름 조회
	 * @param org1 ~ org4
	 * @return
	 * @throws Exception
	 */
	public String selectOrg1Nm(String org1) throws Exception;
	public String selectOrg2Nm(String org2) throws Exception;
	public String selectOrg3Nm(String org3) throws Exception;
	public String selectOrg4Nm(String org4) throws Exception;
	
}

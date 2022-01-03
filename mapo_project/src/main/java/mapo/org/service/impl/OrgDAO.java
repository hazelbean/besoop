package mapo.org.service.impl;

import java.util.List;

import org.springframework.stereotype.Repository;
import egovframework.com.cmm.service.impl.EgovComAbstractDAO;
import mapo.org.service.OrgVO;
import mapo.work.service.WorkVO;

@Repository("orgDAO")
public class OrgDAO extends EgovComAbstractDAO{

	public List<?> selectOrgList(WorkVO workVO) {
		return selectList("orgDAO.selectOrgList",workVO);
	}

	public int selectOrgListTotcnt(WorkVO workVO) {
		return selectOne("orgDAO.selectOrgListTotcnt",workVO);
	}

	public int insertOrg(OrgVO orgVO) {
		return insert("orgDAO.insertOrg",orgVO);
	}

	public OrgVO selectOrgDetail(OrgVO orgVO) {
		return selectOne("orgDAO.selectOrgDetail",orgVO);
	}

	public int updateOrg(OrgVO orgVO) {
		return update("orgDAO.updateOrg",orgVO);
	}

	public int deleteOrg(int orgId) {
		return update("orgDAO.deleteOrg",orgId);
	}
	
	/**
	 * 복지지설 관리 시설분류 selected된 시설이름 조회
	 * @param org1 ~ org4
	 * @return
	 */
	public String selectOrg1Nm(String org1) {
		return selectOne("orgDAO.selectOrg1Nm",org1);
	}
	public String selectOrg2Nm(String org2) {
		return selectOne("orgDAO.selectOrg2Nm",org2);
	}
	public String selectOrg3Nm(String org3) {
		return selectOne("orgDAO.selectOrg3Nm",org3);
	}
	public String selectOrg4Nm(String org4) {
		return selectOne("orgDAO.selectOrg4Nm",org4);
	}

}

package mapo.org.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import mapo.org.service.OrgService;
import mapo.org.service.OrgVO;
import mapo.work.service.WorkVO;
import mapo.work.service.impl.WorkDAO;

@Service("orgService")
public class OrgServiceImpl implements OrgService{
	
	@Resource(name="orgDAO")
	private OrgDAO orgDAO;
	
	public List<?> selectOrgList(WorkVO workVO) throws Exception{
		return orgDAO.selectOrgList(workVO);
	}

	@Override
	public int selectOrgListTotcnt(WorkVO workVO) throws Exception {
		return orgDAO.selectOrgListTotcnt(workVO);
	}

	@Override
	public int insertOrg(OrgVO orgVO) throws Exception {
		return orgDAO.insertOrg(orgVO);
	}

	@Override
	public OrgVO selectOrgDetail(OrgVO orgVO) throws Exception {
		return orgDAO.selectOrgDetail(orgVO);
	}

	@Override
	public int updateOrg(OrgVO orgVO) throws Exception {
		return orgDAO.updateOrg(orgVO);
	}

	@Override
	public int deleteOrg(int orgId) throws Exception {
		return orgDAO.deleteOrg(orgId);
	}
	
	
	/**
	 * 복지지설 관리 시설분류 selected된 시설이름 조회 (org1 ~ org4)
	 */
	@Override
	public String selectOrg1Nm(String org1) throws Exception {
		return orgDAO.selectOrg1Nm(org1);
	}


	@Override
	public String selectOrg2Nm(String org2) throws Exception {
		return orgDAO.selectOrg2Nm(org2);
	}


	@Override
	public String selectOrg3Nm(String org3) throws Exception {
		return orgDAO.selectOrg3Nm(org3);
	}


	@Override
	public String selectOrg4Nm(String org4) throws Exception {
		return orgDAO.selectOrg4Nm(org4);
	}


}

package mapo.org.service;

import java.io.Serializable;

import egovframework.com.cmm.ComDefaultVO;

public class OrgVO extends ComDefaultVO implements Serializable{

	private String orgId;			// 기관ID
	private String orgNm;			// 기관명 
	private String orgAddress;		// 소재지
	private String orgTelNO;		// 대표전화
	private String orgBoss;			// 대표자
	
	private String insertId;		// 등록자ID
	private String insertDt;		// 등록일자
	private String updateId;		// 수정자ID
	private String updateDt;		// 수정일자
	private String useYn;			// 사용여부
	
	/* 		공통코드 	*/
	private String clCode;			// 대분류 코드
	private String clCodeNm;		// 대분류 코드명
	
	private String codeId;		 	// 중분류 코드
	private String codeIdNm;		// 중분류 코드명
	
	private String code;			// 소분류 코드
	private String codeNm;			// 소분류 코드명
	 
	private String useAt;			// 사용여부
	private String fistRegistPnttm;	// 최초등록시점
	private String frstRegistId;	// 최초등록자ID
	private String lastUpdtPnttm;	// 최초수정시점
	private String LastUpdusrId;	// 최초수정자ID

	private String searchOrg;		// 기관 검색
	private String selectLc;		// 대분류 검색
	private String selectMc;		// 중분류 검색
	private String selectSc;		// 소분류 검색
	private String selectOrgName;	// 산하기관
	
	private String org1;			// 대분류 검색
	private String org2;			// 중분류 검색
	private String org3;			// 소분류 검색
	private String org4;			// 산하기관
	
	public String getOrgId() {
		return orgId;
	}
	public void setOrgId(String orgId) {
		this.orgId = orgId;
	}
	public String getOrgNm() {
		return orgNm;
	}
	public void setOrgNm(String orgNm) {
		this.orgNm = orgNm;
	}
	public String getOrgAddress() {
		return orgAddress;
	}
	public void setOrgAddress(String orgAddress) {
		this.orgAddress = orgAddress;
	}
	public String getOrgTelNO() {
		return orgTelNO;
	}
	public void setOrgTelNO(String orgTelNO) {
		this.orgTelNO = orgTelNO;
	}
	public String getOrgBoss() {
		return orgBoss;
	}
	public void setOrgBoss(String orgBoss) {
		this.orgBoss = orgBoss;
	}
	public String getInsertId() {
		return insertId;
	}
	public void setInsertId(String insertId) {
		this.insertId = insertId;
	}
	public String getInsertDt() {
		return insertDt;
	}
	public void setInsertDt(String insertDt) {
		this.insertDt = insertDt;
	}
	public String getUpdateId() {
		return updateId;
	}
	public void setUpdateId(String updateId) {
		this.updateId = updateId;
	}
	public String getUpdateDt() {
		return updateDt;
	}
	public void setUpdateDt(String updateDt) {
		this.updateDt = updateDt;
	}
	public String getUseYn() {
		return useYn;
	}
	public void setUseYn(String useYn) {
		this.useYn = useYn;
	}
	public String getClCode() {
		return clCode;
	}
	public void setClCode(String clCode) {
		this.clCode = clCode;
	}
	public String getClCodeNm() {
		return clCodeNm;
	}
	public void setClCodeNm(String clCodeNm) {
		this.clCodeNm = clCodeNm;
	}
	public String getCodeId() {
		return codeId;
	}
	public void setCodeId(String codeId) {
		this.codeId = codeId;
	}
	public String getCodeIdNm() {
		return codeIdNm;
	}
	public void setCodeIdNm(String codeIdNm) {
		this.codeIdNm = codeIdNm;
	}
	public String getCode() {
		return code;
	}
	public void setCode(String code) {
		this.code = code;
	}
	public String getCodeNm() {
		return codeNm;
	}
	public void setCodeNm(String codeNm) {
		this.codeNm = codeNm;
	}
	public String getUseAt() {
		return useAt;
	}
	public void setUseAt(String useAt) {
		this.useAt = useAt;
	}
	public String getFistRegistPnttm() {
		return fistRegistPnttm;
	}
	public void setFistRegistPnttm(String fistRegistPnttm) {
		this.fistRegistPnttm = fistRegistPnttm;
	}
	public String getFrstRegistId() {
		return frstRegistId;
	}
	public void setFrstRegistId(String frstRegistId) {
		this.frstRegistId = frstRegistId;
	}
	public String getLastUpdtPnttm() {
		return lastUpdtPnttm;
	}
	public void setLastUpdtPnttm(String lastUpdtPnttm) {
		this.lastUpdtPnttm = lastUpdtPnttm;
	}
	public String getLastUpdusrId() {
		return LastUpdusrId;
	}
	public void setLastUpdusrId(String lastUpdusrId) {
		LastUpdusrId = lastUpdusrId;
	}
	public String getSearchOrg() {
		return searchOrg;
	}
	public void setSearchOrg(String searchOrg) {
		this.searchOrg = searchOrg;
	}
	public String getSelectLc() {
		return selectLc;
	}
	public void setSelectLc(String selectLc) {
		this.selectLc = selectLc;
	}
	public String getSelectMc() {
		return selectMc;
	}
	public void setSelectMc(String selectMc) {
		this.selectMc = selectMc;
	}
	public String getSelectSc() {
		return selectSc;
	}
	public void setSelectSc(String selectSc) {
		this.selectSc = selectSc;
	}
	public String getSelectOrgName() {
		return selectOrgName;
	}
	public void setSelectOrgName(String selectOrgName) {
		this.selectOrgName = selectOrgName;
	}
	public String getOrg1() {
		return org1;
	}
	public void setOrg1(String org1) {
		this.org1 = org1;
	}
	public String getOrg2() {
		return org2;
	}
	public void setOrg2(String org2) {
		this.org2 = org2;
	}
	public String getOrg3() {
		return org3;
	}
	public void setOrg3(String org3) {
		this.org3 = org3;
	}
	public String getOrg4() {
		return org4;
	}
	public void setOrg4(String org4) {
		this.org4 = org4;
	}
	
}

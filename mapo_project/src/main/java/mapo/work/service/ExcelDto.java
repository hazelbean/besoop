package mapo.work.service;

import java.io.Serializable;

import org.apache.commons.collections.map.ListOrderedMap;

public class ExcelDto extends ListOrderedMap {

	private int taskId;				// 업무ID
	private String codeNm;			// 진행상태
	/* 공통코드 : 업무구분(TAS) */
	private String tasNm;			// 업무구분명
	private String taskNm;			// 업무제목
	private String orgNm;			// 기관 코드명(기관명) 
	private String frstReadId;		// 최초확인자 ID
	private String frstReadDt;		// 최초확인일시
	
	public int getTaskId() {
		return taskId;
	}
	public void setTaskId(int taskId) {
		this.taskId = taskId;
	}
	public String getCodeNm() {
		return codeNm;
	}
	public void setCodeNm(String codeNm) {
		this.codeNm = codeNm;
	}
	public String getTasNm() {
		return tasNm;
	}
	public void setTasNm(String tasNm) {
		this.tasNm = tasNm;
	}
	public String getTaskNm() {
		return taskNm;
	}
	public void setTaskNm(String taskNm) {
		this.taskNm = taskNm;
	}
	public String getOrgNm() {
		return orgNm;
	}
	public void setOrgNm(String orgNm) {
		this.orgNm = orgNm;
	}
	public String getFrstReadId() {
		return frstReadId;
	}
	public void setFrstReadId(String frstReadId) {
		this.frstReadId = frstReadId;
	}
	public String getFrstReadDt() {
		return frstReadDt;
	}
	public void setFrstReadDt(String frstReadDt) {
		this.frstReadDt = frstReadDt;
	}
}

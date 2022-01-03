package mapo.com.sample.service;

import java.io.Serializable;

@SuppressWarnings("serial")
public class SampleVO implements Serializable {

	// 게시판 아이디
	private String bbsId = "";
	
	// 게시물 내용
	private String nttCn = "";		
	
	// 게시물 아이디
	private long nttId = 0L;
	
	// 게시물 제목
	private String nttSj = "";
	
	// 최초 등록자 아이디
	private String frstRegisterId = "";
	
	// 최초 등록 시점
	private String frstRegisterPnttm = "";
	
	

	public String getBbsId() {
		return bbsId;
	}

	public void setBbsId(String bbsId) {
		this.bbsId = bbsId;
	}

	public String getNttCn() {
		return nttCn;
	}

	public void setNttCn(String nttCn) {
		this.nttCn = nttCn;
	}

	public long getNttId() {
		return nttId;
	}

	public void setNttId(long nttId) {
		this.nttId = nttId;
	}

	public String getNttSj() {
		return nttSj;
	}

	public void setNttSj(String nttSj) {
		this.nttSj = nttSj;
	}

	public String getFrstRegisterId() {
		return frstRegisterId;
	}

	public void setFrstRegisterId(String frstRegisterId) {
		this.frstRegisterId = frstRegisterId;
	}

	public String getFrstRegisterPnttm() {
		return frstRegisterPnttm;
	}

	public void setFrstRegisterPnttm(String frstRegisterPnttm) {
		this.frstRegisterPnttm = frstRegisterPnttm;
	}
	
}

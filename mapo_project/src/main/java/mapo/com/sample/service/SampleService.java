package mapo.com.sample.service;

import java.util.List;

public interface SampleService {

	public List<SampleVO> selectSampleList(SampleVO vo) throws Exception;
	
	public void SampleInsert(SampleVO vo);
}

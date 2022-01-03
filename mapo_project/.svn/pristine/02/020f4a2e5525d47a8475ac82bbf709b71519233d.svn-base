package mapo.com.sample.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import mapo.com.sample.service.SampleService;
import mapo.com.sample.service.SampleVO;

@Service("SampleService")
public class SampleServiceImpl implements SampleService {

	@Resource(name = "commonDAO")
	private CommonDAO commonDAO;

	@Override
	public List<SampleVO> selectSampleList(SampleVO vo) throws Exception{
		
		// SampleDAO 는 Sample_SQL_mysql.xml 의 namespace 임
		// ★ xml 뒤에 _mysql 이라고 반드시 적어야 함 ★
		List<SampleVO> list = commonDAO.selectList("SampleDAO.selectSampleList", vo);
		return list;
	}

	@Override
	public void SampleInsert(SampleVO vo) {
		// TODO Auto-generated method stub
		
	}
	
	

}

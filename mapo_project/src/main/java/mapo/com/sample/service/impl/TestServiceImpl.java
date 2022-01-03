package mapo.com.sample.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import mapo.com.sample.service.TestService;
import mapo.com.sample.service.TestVO;

@Service("testService")
public class TestServiceImpl implements TestService {

	@Resource(name="testDAO")
	private TestDAO testDAO;

	
	/**
	 * 게시글 등록 (첨부파일 등록)
	 */
	@Override
	public String insertTestBoard(TestVO vo) throws Exception {
		System.out.println(vo.toString());
		
		testDAO.insertTestBoard(vo);
		
	
		//if(vo.getFilename() != null && !"".equals(vo.getFilename())) {
		//
			//testDAO.insertTestAttach(vo);
		//}
	
		
		return vo.getIdx();
	}

	@Override
	public void updateTestBoard(TestVO vo) throws Exception {
		testDAO.updateTestBoard(vo);
		
	}

	@Override
	public void deleteTestBoard(TestVO vo) throws Exception {
		testDAO.deleteTestBoard(vo);
		
	}

	@Override
	public TestVO selectTest(TestVO vo) throws Exception {
		TestVO resultVO = testDAO.selectTest(vo);
		
		if(resultVO == null) {
			//System.out.println("info.nodata.msg");
			resultVO = new TestVO();
		}
				
		return resultVO;
	}
	
	
	@Override
	public List<?> selectTestList(TestVO vo) throws Exception {

		return testDAO.selectTestList(vo);
	}
	
	@Override
	public String selectLoginCheck(TestVO vo) throws Exception {
		return testDAO.selectLoginCheck(vo);
	}

	@Override
	public int selectTestListTotcnt(TestVO vo) throws Exception {
	
		return testDAO.selectTestListTotcnt(vo);
	}


	@Override
	public int insertTestReply(TestVO vo) throws Exception {
		System.out.println(vo.toString());
		
		return testDAO.insertTestReply(vo);
	}

	@Override
	public List<?> selectTestReply(TestVO vo) throws Exception {
		return testDAO.selectTestReply(vo);
	}

	@Override
	public void updateTestBoardCount(TestVO vo) throws Exception {
		testDAO.updateTestBoardCount(vo);
	}

	@Override
	public int insertTestAttach(TestVO vo) throws Exception {	
		return testDAO.insertTestAttach(vo);
	}

	@Override
	public int deleteTestAttach(TestVO vo) throws Exception {		
		return testDAO.deleteTestAttach(vo);
	}

	@Override
	public TestVO selectTestAttach(TestVO vo) throws Exception {
		return testDAO.selectTestAttach(vo);
	}

	@Override
	public String selectMaxIdx(TestVO vo) throws Exception {
		return testDAO.selectMaxIdx(vo);
	}

}

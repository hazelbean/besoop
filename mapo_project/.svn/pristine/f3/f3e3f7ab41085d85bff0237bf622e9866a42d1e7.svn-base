package mapo.com.sample.service.impl;

import java.util.List;

import org.springframework.stereotype.Repository;

import egovframework.com.cmm.service.impl.EgovComAbstractDAO;
import mapo.com.sample.service.TestVO;

@Repository("testDAO")
public class TestDAO extends EgovComAbstractDAO {
	
	/**
	 * 게시글 등록
	 * @param vo
	 * @return
	 * @throws Exception
	 */
	public int insertTestBoard(TestVO vo) throws Exception {
		return insert("insertTestBoard", vo);
	}
	
	/**
	 * 게시글 업데이트
	 * @param vo
	 * @return
	 * @throws Exception
	 */
	public int updateTestBoard(TestVO vo) throws Exception {
		return update("updateTestBoard", vo);
	}
	
	
	/**
	 * 게시글 삭제
	 * @param vo
	 * @return
	 * @throws Exception
	 */
	public int deleteTestBoard(TestVO vo) throws Exception{
		return delete("deleteTestBoard", vo);
	}
	
	
	/**
	 * 게시글 상세 조회 (단일건)
	 * @param vo
	 * @return
	 * @throws Exception
	 */
	public TestVO selectTest(TestVO vo) throws Exception {
		return selectOne("selectTest", vo);
	}
	
	/**
	 * 게시글 리스트(목록) 조회 
	 * @param vo
	 * @return
	 * @throws Exception
	 */
	public List<?> selectTestList(TestVO vo) throws Exception {
		return selectList("testDAO.selectTestList", vo);
	}

	/**
	 * 로그인 체크
	 * @param vo
	 * @return
	 * @throws Exception
	 */
	public String selectLoginCheck(TestVO vo) throws Exception {
		return selectOne("selectLoginCheck", vo);
	}
	

	/**
	 * 게시글 카운트
	 * @param vo
	 * @return
	 * @throws Exception
	 */
	public int selectTestListTotcnt(TestVO vo) throws Exception {
			return selectOne("selectTestListTotcnt", vo);
	}
	
	/**
	 * 댓글 등록
	 * @param vo
	 * @return
	 * @throws Exception
	 */
	public int insertTestReply(TestVO vo) throws Exception {
		return insert("insertTestReply", vo);
	}
	
	
	/**
	 * 댓글 리스트 조회
	 * @param vo
	 * @return
	 * @throws Exception
	 */
	public List<?> selectTestReply(TestVO vo) throws Exception {
		return selectList("testDAO.selectTestReply", vo);
	}
	
	
	/**
	 * 카운트수 증가
	 * @param vo
	 * @return
	 * @throws Exception
	 */
	public int updateTestBoardCount(TestVO vo) throws Exception {
		return update("testDAO.updateTestBoardCount", vo);
	}
	
	
	/**
	 * 첨부파일 등록
	 * @param vo
	 * @return
	 * @throws Exception
	 */
	public int insertTestAttach(TestVO vo) throws Exception {
		return insert("testDAO.insertTestAttach", vo);
	}
	
	
	/**
	 * 첨부파일 삭제
	 * @param vo
	 * @return
	 * @throws Exception
	 */
	public int deleteTestAttach(TestVO vo) throws Exception {
		return delete("testDAO.deleteTestAttach", vo);
	}
	
	
	/**
	 * 첨부파일 조회(단일건)
	 * @param vo
	 * @return
	 * @throws Exception
	 */
	public TestVO selectTestAttach(TestVO vo) throws Exception {
		return selectOne("testDAO.selectTestAttach", vo);
	}
	
	
	/**
	 * 게시글 MAX IDX 취득
	 * @param vo
	 * @return
	 * @throws Exception
	 */
	public String selectMaxIdx(TestVO vo) throws Exception {
		return selectOne("selectMaxIdx", vo);
	}
	
}

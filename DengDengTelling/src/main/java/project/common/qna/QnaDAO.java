package project.common.qna;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

import project.common.dao.AbstractDAO;

@Repository("qnaDAO")
public class QnaDAO extends AbstractDAO {

	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> selectBoardList(Map<String, Object> map) throws Exception {
		return (List<Map<String, Object>>)selectList("qna.selectBoardList", map); 
		 /* selectList는 리스트를 조회할 때 사용됨 selectBoardList쿼리 이름, Map<String,Object> map 쿼리 실행시
		       필요한 변수들임 결과값은 List<Map<String, Object>> 형식으로 반환할 수 있도록 형변환 함
		    qna.selectBoardList에서 qna는 XML에서 설정한 namespace의 이름임 */
	}

	@SuppressWarnings("unchecked")
	public Map<String, Object> selectMemInfo(Map<String, Object> map) throws Exception {
		return (Map<String, Object>) selectOne("qna.selectMemInfo", map);
	}
	
	public void insertBoard(Map<String, Object> map) throws Exception {
		insert("qna.insertBoard", map);
	}
	 
	public void updateHitCnt(Map<String,Object> map) throws Exception {
		update("qna.updateHitCnt", map);
	}
	
	public int countBoardList() throws Exception {
		return (Integer)selectOne("qna.countBoardList");
	}
	  
	@SuppressWarnings("unchecked")
	public Map<String, Object> selectBoardDetail(Map<String, Object> map) throws Exception {
		return (Map<String, Object>) selectOne("qna.selectBoardDetail", map);
	}
	
	public void updateBoard(Map<String, Object> map) throws Exception {
		update("qna.updateBoard", map);
	}
	 
	public void deleteBoard(Map<String, Object> map) throws Exception {
		update("qna.deleteBoard", map);
	}

	public void insertReplyBoard(Map<String, Object> map) throws Exception{
		update("qna.insertReplyBoard", map);
	}
	
	public void updateReplyBoard(Map<String, Object> map) throws Exception {
		update("qna.updateReplyBoard", map);
	}
	
	@SuppressWarnings("unchecked")
	public Map<String, Object> selectAdminInfo(Map<String, Object> map) throws Exception {
		return (Map<String, Object>) selectOne("qna.selectAdminInfo", map);
	}
	
	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> qnaSearch(Map<String, Object> map) throws Exception {
		return (List<Map<String, Object>>)selectList("qna.qnaSearch", map);
	}
	
	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> selectFileList(Map<String, Object> map) throws Exception {
		return (List<Map<String, Object>>) selectList("qna.selectFileList", map);
	}
	
	public void insertFile(Map<String, Object> map) throws Exception {
		insert("qna.insertFile", map);
	}
	
	public void updateFile(Map<String, Object> map) throws Exception{
		update("qna.updateFile", map);
	}
	
	public void deleteFile(Map<String, Object> map) throws Exception{
		update("qna.deleteFile", map);
	}
	
	@SuppressWarnings("unchecked")
	public Map<String, Object> selectFileInfo(Map<String, Object> map) throws Exception {
		return (Map<String, Object>)selectOne("qna.selectFileInfo", map);
	}
	
}

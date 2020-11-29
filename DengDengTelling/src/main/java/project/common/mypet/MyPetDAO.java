package project.common.mypet;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Repository;

import project.common.dao.AbstractDAO;

@Repository("mypetDAO")
public class MyPetDAO extends AbstractDAO {

	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> selectBoardList(Map<String, Object> map) throws Exception {
		return (List<Map<String, Object>>)selectList("mypet.selectBoardList", map); //selectPagingList????
		 /* selectList는 리스트를 조회할 때 사용됨 selectmypetList쿼리 이름, Map<String,Object> map 쿼리 실행시
		       필요한 변수들임 결과값은 List<Map<String, Object>> 형식으로 반환할 수 있도록 형변환 함
		    mypet.selectmypetList에서 mypet는 XML에서 설정한 namespace의 이름임 */
	}

	public void insertBoard(Map<String, Object> map) throws Exception {
		insert("mypet.insertBoard", map);
	}
	
	public void updateHitCnt(Map<String,Object> map) throws Exception {
		update("mypet.updateHitCnt", map);
	}
	  
	@SuppressWarnings("unchecked")
	public Map<String, Object> selectBoardDetail(Map<String, Object> map) throws Exception {
		return (Map<String, Object>) selectOne("mypet.selectBoardDetail", map);
	}
	
	public void updateBoard(Map<String, Object> map) throws Exception {
		update("mypet.updateBoard", map);
	}
	 
	public void deleteBoard(Map<String, Object> map) throws Exception {
		update("mypet.deleteBoard", map);
	}
	
	public void insertFile(Map<String, Object> map) throws Exception {
		insert("mypet.insertFile", map);
	}
	  
	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> selectFileList(Map<String, Object> map) throws Exception {
		return (List<Map<String, Object>>) selectList("mypet.selectFileList", map);
	}

	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> mypetSearch(Map<String, Object> map) throws Exception {
		
		return (List<Map<String, Object>>)selectList("mypet.mypetSearch", map);
	}
	
	@SuppressWarnings("unchecked") //댓글 디테일
	public List<Map<String, Object>> selectCmtList(Map<String, Object> map) throws Exception {
		
		return (List<Map<String, Object>>)selectList("mypet.selectCmtList", map);
	}

	public void insertComment(Map<String, Object> map) throws Exception {
		insert("mypet.insertComment", map);
		
	}

	public void deleteComment(Map<String, Object> map) throws Exception {
		delete("mypet.deleteComment", map);
		
	}
	
	@SuppressWarnings("unchecked")
	public Map<String, Object> selectMemInfo(Map<String, Object> map) throws Exception {
		
		return (Map<String, Object>)selectOne("mypet.selectMemInfo", map);
	}

	public void deleteFile(Map<String, Object> map) throws Exception {
		update("mypet.deleteFile", map);
	}

	public void updateFile(Map<String, Object> map) throws Exception{
		update("mypet.updateFile", map);
	}

	public void insertFile2(Map<String, Object> map) throws Exception {
		insert("mypet.insertFile2", map);
	}
	
	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> selectFileList2(Map<String, Object> map) throws Exception {
		return (List<Map<String, Object>>)selectList("mypet.selectFileList2", map);
	}
	
	public void mypetThumbnail(Map<String, Object> map, HttpServletRequest request) throws Exception { 
		update("mypet.mypetThumbnail", map); 
	}
	  
	@SuppressWarnings("unchecked")
	public Map<String, Object> selectFileInfo(Map<String, Object> map) throws Exception {
		return (Map<String, Object>)selectOne("mypet.selectFileInfo", map);
	}
	 
}

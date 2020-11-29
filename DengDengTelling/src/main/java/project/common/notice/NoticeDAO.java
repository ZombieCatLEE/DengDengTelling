package project.common.notice;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

import project.common.dao.AbstractDAO;

@Repository("noticeDAO")
public class NoticeDAO extends AbstractDAO {
	
	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> selectBoardList(Map<String, Object> map) {
		return (List<Map<String, Object>>)selectList("notice.selectBoardList", map);
	}

	public void insertBoard(Map<String, Object> map) throws Exception {
		insert("notice.insertBoard", map);
	}

	public void updateHitCnt(Map<String, Object> map) throws Exception {
		update("notice.updateHitCnt", map);
	}
	
	public int countBoardList() throws Exception {
		return (Integer)selectOne("notice.countBoardList");
	}
	
	@SuppressWarnings("unchecked")
	public Map<String, Object> selectBoardDetail(Map<String, Object> map) throws Exception {
		return (Map<String, Object>)selectOne("notice.selectBoardDetail", map);
	}

	public void updateBoard(Map<String, Object> map) throws Exception {
		update("notice.updateBoard", map);
	}

	public void deleteBoard(Map<String, Object> map) throws Exception {
		delete("notice.deleteBoard", map);
	}

	public void insertFile(Map<String, Object> map) throws Exception {
		insert("notice.insertFile", map);
	}

	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> noticeSearch(Map<String, Object> map) throws Exception {
		return (List<Map<String, Object>>)selectList("notice.noticeSearch", map);
	}

	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> selectFileList(Map<String, Object> map) throws Exception{
		return (List<Map<String, Object>>)selectList("notice.selectFileList", map);
	}

	
	@SuppressWarnings("unchecked")
	public Map<String, Object> selectAdminInfo(Map<String, Object> map) {
		return (Map<String, Object>)selectOne("notice.selectAdminInfo", map);
	}

	public void deleteFile(Map<String, Object> map) throws Exception{
		update("notice.deleteFile", map);
	}

	public void updateFile(Map<String, Object> map) throws Exception{
		update("notice.updateFile", map);
	}
	
	@SuppressWarnings("unchecked")
	public Map<String, Object> selectFileInfo(Map<String, Object> map) throws Exception {
		return (Map<String, Object>)selectOne("notice.selectFileInfo", map);
	}
	
}

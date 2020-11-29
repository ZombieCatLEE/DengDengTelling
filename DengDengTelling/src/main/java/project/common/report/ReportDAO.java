/*20.02.12*/
package project.common.report;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

import project.common.dao.AbstractDAO;

@Repository("reportDAO")
public class ReportDAO extends AbstractDAO {

	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> selectBoardList(Map<String, Object> map) throws Exception {
		return (List<Map<String, Object>>)selectList("report.selectBoardList", map);
	}

	@SuppressWarnings("unchecked")
	public Map<String, Object> selectMemInfo(Map<String, Object> map) throws Exception {
		return (Map<String, Object>) selectOne("report.selectMemInfo", map);
	}
	
	public void insertBoard(Map<String, Object> map) throws Exception {
		insert("report.insertBoard", map);
	}
	 
	public void updateHitCnt(Map<String,Object> map) throws Exception {
		update("report.updateHitCnt", map);
	}
	
	public int countBoardList() throws Exception {
		return (Integer)selectOne("report.countBoardList");
	}
	  
	@SuppressWarnings("unchecked")
	public Map<String, Object> selectBoardDetail(Map<String, Object> map) throws Exception {
		return (Map<String, Object>) selectOne("report.selectBoardDetail", map);
	}
	
	public void updateBoard(Map<String, Object> map) throws Exception {
		update("report.updateBoard", map);
	}
	 
	public void deleteBoard(Map<String, Object> map) throws Exception {
		update("report.deleteBoard", map);
	}
	
	public void insertFile(Map<String, Object> map) throws Exception {
		insert("report.insertFile", map);
	}
	  
	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> selectFileList(Map<String, Object> map) throws Exception {
		return (List<Map<String, Object>>) selectList("report.selectFileList", map);
	}	
	
	public void deleteFile(Map<String, Object> map) throws Exception{
		update("report.deleteFile", map);
	}

	public void updateFile(Map<String, Object> map) throws Exception{
		update("report.updateFile", map);
	}

	public void insertReplyBoard(Map<String, Object> map) throws Exception{
		update("report.insertReplyBoard", map);
	}
	
	public void updateReplyBoard(Map<String, Object> map) throws Exception {
		update("report.updateReplyBoard", map);
	}
	
	@SuppressWarnings("unchecked")
	public Map<String, Object> selectAdminInfo(Map<String, Object> map) throws Exception {
		return (Map<String, Object>) selectOne("report.selectAdminInfo", map);
	}
	
	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> reportSearch(Map<String, Object> map) throws Exception {
		return (List<Map<String, Object>>)selectList("report.reportSearch", map);
	}
	
	@SuppressWarnings("unchecked")
	public Map<String, Object> selectFileInfo(Map<String, Object> map) throws Exception {
		return (Map<String, Object>)selectOne("report.selectFileInfo", map);
	}
	
}

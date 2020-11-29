/*20.02.12*/
package project.common.qna;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Service;

import project.common.util.FileUtils;

@Service("qnaService")	
public class QnaServiceImpl implements QnaService {
	
	Logger log = Logger.getLogger(this.getClass());
	
	@Resource(name="qnaDAO")	//Service에서 데이터 접근을 위한 DAO객체를 선언함
	private QnaDAO qnaDAO;
	
	@Resource(name="fileUtils")
	private FileUtils fileUtils; 
	
	@Override
	public List<Map<String, Object>> selectBoardList(Map<String, Object> map) throws Exception {
		return qnaDAO.selectBoardList(map);
		// Service의 selectBoardList의 결과값으로 qnaDAO클래스의  selectBoardList() 호출 후 그 결과값을 return함
	}
	
	@Override
	public Map<String, Object> selectMemInfo(Map<String, Object> map) throws Exception {
		return qnaDAO.selectMemInfo(map);
	}
	
	@Override 
	public void insertBoard(Map<String, Object> map, HttpServletRequest request) throws Exception {
		qnaDAO.insertBoard(map);
		
		List<Map<String,Object>> list = fileUtils.parseInsertFileInfo_board(map, request);
		for(int i=0, size=list.size(); i<size; i++) {
			qnaDAO.insertFile(list.get(i));
		} 
		
		System.out.println(list);
	}

	@Override
	public Map<String, Object> selectBoardDetail(Map<String, Object> map) throws Exception {
		qnaDAO.updateHitCnt(map);
		
		Map<String,Object> resultMap = new HashMap<String,Object>();
		Map<String,Object> tempMap = qnaDAO.selectBoardDetail(map);
		resultMap.put("map", tempMap);
		
		List<Map<String,Object>> list = qnaDAO.selectFileList(map);
		resultMap.put("list", list);
		
		return resultMap;
	}
	
	@Override
	public void updateBoard(Map<String, Object> map, HttpServletRequest request) throws Exception {
		qnaDAO.updateBoard(map); 
		
		qnaDAO.deleteFile(map);
		
		List<Map<String,Object>> list = fileUtils.parseUpdateFileInfo_board(map, request);
		Map<String,Object> tempMap = null;
		for(int i=0, size=list.size(); i<size; i++) {
			tempMap = list.get(i);
			if(tempMap.get("IS_NEW").equals("Y")){
				qnaDAO.insertFile(tempMap);
			}
			else{
				qnaDAO.updateFile(tempMap);
			}
		}
	}

	@Override
	public void deleteBoard(Map<String, Object> map) throws Exception {
		qnaDAO.deleteBoard(map);
	}
	
	@Override 
	public void insertReplyBoard(Map<String, Object> map, HttpServletRequest request) throws Exception {
		qnaDAO.insertReplyBoard(map);
		
		List<Map<String,Object>> list = fileUtils.parseInsertFileInfo_board(map, request);
		for(int i=0, size=list.size(); i<size; i++) {
			qnaDAO.insertFile(list.get(i));
		} 
	}
	
	@Override
	public void updateReplyBoard(Map<String, Object> map, HttpServletRequest request) throws Exception {
		qnaDAO.updateReplyBoard(map); 
		
		qnaDAO.deleteFile(map);
		List<Map<String,Object>> list = fileUtils.parseUpdateFileInfo_board(map, request);
		Map<String,Object> tempMap = null;
		for(int i=0, size=list.size(); i<size; i++) {
			tempMap = list.get(i);
			if(tempMap.get("IS_NEW").equals("Y")){
				qnaDAO.insertFile(tempMap);
			}
			else{
				qnaDAO.updateFile(tempMap);
			}
		}
	}
	
	@Override
	public Map<String, Object> selectAdminInfo(Map<String, Object> map) throws Exception {
		return qnaDAO.selectAdminInfo(map);
	}
	
	@Override
	public Map<String, Object> selectFileInfo(Map<String, Object> map) throws Exception {
		return qnaDAO.selectFileInfo(map);
	}
	
	@Override
	public List<Map<String, Object>> qnaSearch(Map<String, Object> map) throws Exception {
		return qnaDAO.qnaSearch(map);
	}
	
	@Override
	public int countBoardList() throws Exception {
		return qnaDAO.countBoardList();
	}
}

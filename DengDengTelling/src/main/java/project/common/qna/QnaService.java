package project.common.qna;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

public interface QnaService {

	List<Map<String, Object>> selectBoardList(Map<String, Object> map) throws Exception;

	void insertBoard(Map<String, Object> map, HttpServletRequest request) throws Exception;
	
	Map<String, Object> selectBoardDetail(Map<String, Object> map) throws Exception;
	  
	void updateBoard(Map<String, Object> map, HttpServletRequest request) throws Exception;
	  
	void deleteBoard(Map<String, Object> map) throws Exception;
	 
	Map<String, Object> selectMemInfo(Map<String, Object> map) throws Exception;
	
	void insertReplyBoard(Map<String, Object> map, HttpServletRequest request) throws Exception;
	
	void updateReplyBoard(Map<String, Object> map, HttpServletRequest request) throws Exception;
	
	Map<String, Object> selectAdminInfo(Map<String, Object> map) throws Exception;

	Map<String, Object> selectFileInfo(Map<String, Object> map) throws Exception;

	List<Map<String, Object>> qnaSearch(Map<String, Object> map) throws Exception;
	
	int countBoardList() throws Exception;
	
}

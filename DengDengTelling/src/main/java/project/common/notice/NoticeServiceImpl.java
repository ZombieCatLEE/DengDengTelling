package project.common.notice;

import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import project.common.util.FileUtils;

@Service("noticeService")
public class NoticeServiceImpl implements NoticeService {
	Logger log = Logger.getLogger(this.getClass());
	
	@Resource(name="noticeDAO")
	private NoticeDAO noticeDAO;
	
	@Resource(name="fileUtils")
	private FileUtils fileUtils;
	
	@Override
	public List<Map<String, Object>> selectBoardList(Map<String, Object> map) throws Exception {
		return noticeDAO.selectBoardList(map);
	}

	@Override
	public void insertBoard(Map<String, Object> map, HttpServletRequest request) throws Exception {
		noticeDAO.insertBoard(map);
		
		List<Map<String, Object>> list = fileUtils.parseInsertFileInfo_board(map, request);
		for(int i=0, size=list.size(); i<size; i++) {
			noticeDAO.insertFile(list.get(i));
		}
	}

	@Override
	public Map<String, Object> selectBoardDetail(Map<String, Object> map) throws Exception {
		noticeDAO.updateHitCnt(map);
		
		Map<String, Object> resultMap = new HashMap<String, Object>();
		Map<String, Object>	tempMap =noticeDAO.selectBoardDetail(map);
		resultMap.put("map", tempMap);
		
		List<Map<String, Object>> list = noticeDAO.selectFileList(map);
		resultMap.put("list", list);
		
		return resultMap;
	}

	@Override
	public void updateBoard(Map<String, Object> map, HttpServletRequest request) throws Exception {
		noticeDAO.updateBoard(map);
		
		noticeDAO.deleteFile(map);
		List<Map<String,Object>> list = fileUtils.parseUpdateFileInfo_board(map, request);
		Map<String,Object> tempMap = null;
		for(int i=0, size=list.size(); i<size; i++) {
			tempMap = list.get(i);
			if(tempMap.get("IS_NEW").equals("Y")){
				noticeDAO.insertFile(tempMap);
			}
			else{
				noticeDAO.updateFile(tempMap);
			}
		}
		
	}

	@Override
	public void deleteBoard(Map<String, Object> map) throws Exception {
		noticeDAO.deleteBoard(map);
	}

	@Override
	public List<Map<String, Object>> noticeSearch(Map<String, Object> map) throws Exception {
		return noticeDAO.noticeSearch(map);
	}

	@Override
	public Map<String, Object> selectAdminInfo(Map<String, Object> map) throws Exception {
		return noticeDAO.selectAdminInfo(map);
	}
	
	@Override
	public int countBoardList() throws Exception {
		return noticeDAO.countBoardList();
	}
	
	@Override
	public Map<String, Object> selectFileInfo(Map<String, Object> map) throws Exception {
		return noticeDAO.selectFileInfo(map);
	}
}

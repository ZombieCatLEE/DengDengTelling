/*20.02.12*/
package project.common.report;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Service;

import project.common.util.FileUtils;

@Service("reportService")	
public class ReportServiceImpl implements ReportService {
	
	Logger log = Logger.getLogger(this.getClass());
	
	@Resource(name="reportDAO")	
	private ReportDAO reportDAO;
	
	@Resource(name="fileUtils")
	private FileUtils fileUtils; 
	
	@Override
	public List<Map<String, Object>> selectBoardList(Map<String, Object> map) throws Exception {
		return reportDAO.selectBoardList(map);
	}
	
	@Override
	public Map<String, Object> selectMemInfo(Map<String, Object> map) throws Exception {
		return reportDAO.selectMemInfo(map);
	}
	
	@Override 
	public void insertBoard(Map<String, Object> map, HttpServletRequest request) throws Exception {
		reportDAO.insertBoard(map);
		
		List<Map<String,Object>> list = fileUtils.parseInsertFileInfo_board(map, request);
		for(int i=0, size=list.size(); i<size; i++) {
			reportDAO.insertFile(list.get(i));
		} 
	}

	@Override
	public Map<String, Object> selectBoardDetail(Map<String, Object> map) throws Exception {
		reportDAO.updateHitCnt(map);
		
		Map<String,Object> resultMap = new HashMap<String,Object>();
		Map<String,Object> tempMap = reportDAO.selectBoardDetail(map);
		resultMap.put("map", tempMap);
		
		List<Map<String,Object>> list = reportDAO.selectFileList(map);
		resultMap.put("list", list);
		
		return resultMap;
	}
	
	@Override
	public void updateBoard(Map<String, Object> map, HttpServletRequest request) throws Exception {
		reportDAO.updateBoard(map); 
		
		reportDAO.deleteFile(map);
		List<Map<String,Object>> list = fileUtils.parseUpdateFileInfo_board(map, request);
		Map<String,Object> tempMap = null;
		for(int i=0, size=list.size(); i<size; i++) {
			tempMap = list.get(i);
			if(tempMap.get("IS_NEW").equals("Y")){
				reportDAO.insertFile(tempMap);
			}
			else{
				reportDAO.updateFile(tempMap);
			}
		}
	}

	@Override
	public void deleteBoard(Map<String, Object> map) throws Exception {
		reportDAO.deleteBoard(map);
	}
	
	@Override 
	public void insertReplyBoard(Map<String, Object> map, HttpServletRequest request) throws Exception {
		reportDAO.insertReplyBoard(map);
		
		List<Map<String,Object>> list = fileUtils.parseInsertFileInfo_board(map, request);
		for(int i=0, size=list.size(); i<size; i++) {
			reportDAO.insertFile(list.get(i));
		} 
		
		reportDAO.deleteFile(map);
		List<Map<String,Object>> fileList = fileUtils.parseUpdateFileInfo_board(map, request);
		Map<String,Object> tempMap = null;
		for(int i=0, size=fileList.size(); i<size; i++) {
			tempMap = fileList.get(i);
			if(tempMap.get("IS_NEW").equals("Y")){
				reportDAO.insertFile(tempMap);
			}
			else{
				reportDAO.updateFile(tempMap);
			}
		}
	}
	
	@Override
	public void updateReplyBoard(Map<String, Object> map, HttpServletRequest request) throws Exception {
		reportDAO.updateReplyBoard(map); 
		
		reportDAO.deleteFile(map);
		List<Map<String,Object>> list = fileUtils.parseUpdateFileInfo_board(map, request);
		Map<String,Object> tempMap = null;
		for(int i=0, size=list.size(); i<size; i++) {
			tempMap = list.get(i);
			if(tempMap.get("IS_NEW").equals("Y")){
				reportDAO.insertFile(tempMap);
			}
			else{
				reportDAO.updateFile(tempMap);
			}
		}
	}
	
	@Override
	public Map<String, Object> selectAdminInfo(Map<String, Object> map) throws Exception {
		return reportDAO.selectAdminInfo(map);
	}
	
	@Override
	public Map<String, Object> selectFileInfo(Map<String, Object> map) throws Exception {
		return reportDAO.selectFileInfo(map);
	}
	
	@Override
	public List<Map<String, Object>> reportSearch(Map<String, Object> map) throws Exception {
		return reportDAO.reportSearch(map);
	}
	
	@Override
	public int countBoardList() throws Exception {
		return reportDAO.countBoardList();
	}
	
	
}

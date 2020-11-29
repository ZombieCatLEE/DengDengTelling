package project.common.admin;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import project.common.common.CommandMap;

public interface AdminService {
	
	//관리자 로그인 : 호석
	public Map<String, Object> adminLoginCheck(Map<String, Object> map) throws Exception;

	public List<Map<String, Object>> selectNoticeList(Map<String, Object> map) throws Exception;

	public Map<String, Object> selectNoticeDetail(Map<String, Object> map) throws Exception;

	public List<Map<String, Object>> adminNoticeSearch(Map<String, Object> map) throws Exception;

	public List<Map<String, Object>> selectQnaList(Map<String, Object> map) throws Exception;

	public List<Map<String, Object>> adminQnaSearch(Map<String, Object> map) throws Exception;

	public int countQnaList() throws Exception;

	public Map<String, Object> selectQnaDetail(Map<String, Object> map) throws Exception;

	public List<Map<String, Object>> selectReportList(Map<String, Object> map) throws Exception;

	public List<Map<String, Object>> adminReportSearch(Map<String, Object> map) throws Exception;

	public int countReportList() throws Exception;

	public Map<String, Object> selectReportDetail(Map<String, Object> map) throws Exception;

	public List<Map<String, Object>> adminMypetSearch(Map<String, Object> map) throws Exception;

	public List<Map<String, Object>> selectMypetList(Map<String, Object> map) throws Exception;

	public Map<String, Object> selectMypetDetail(Map<String, Object> map) throws Exception;

	public List<Map<String, Object>> adminMatchList(Map<String, Object> map) throws Exception;

	public List<Map<String, Object>> selectAllMemberList(Map<String, Object> map) throws Exception;

	public List<Map<String, Object>> adminMatchSearch(Map<String, Object> map) throws Exception;
	
	List<Map<String, Object>> adminMemSearch(Map<String, Object>map) throws Exception;  //회원검색 지연.

	List<Map<String, Object>> adminCashSearch(Map<String, Object>map) throws Exception;
	
	List<Map<String, Object>> adminCash(Map<String, Object>map) throws Exception;
	
	void adminCashWithdraw(Map<String, Object> map) throws Exception;
	
} 

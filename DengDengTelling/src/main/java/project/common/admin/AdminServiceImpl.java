package project.common.admin;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Service;

import project.common.common.CommandMap;


@Service("adminService")
public class AdminServiceImpl implements AdminService{

	Logger log = Logger.getLogger(this.getClass());

	@Resource(name="adminDAO")
	private AdminDAO adminDAO;

	@Override
	public List<Map<String, Object>> selectAllMemberList(Map<String, Object> map) throws Exception {

		return adminDAO.selectAllMemberList(map);
	}

	@Override
	public Map<String, Object> adminLoginCheck(Map<String, Object> map) throws Exception {
		// TODO Auto-generated method stub
		return adminDAO.adminSelectId(map);
	}

	@Override //공지사항 리스트 박선기
	public List<Map<String, Object>> selectNoticeList(Map<String, Object> map) throws Exception {

		return adminDAO.selectNoticeList(map);
	}

	@Override
	public Map<String, Object> selectNoticeDetail(Map<String, Object> map) throws Exception {

		Map<String, Object> resultMap = new HashMap<String, Object>();
		Map<String, Object>	tempMap =adminDAO.selectNoticeDetail(map);
		resultMap.put("map", tempMap);

		List<Map<String, Object>> list = adminDAO.selectNoticeFileList(map);
		resultMap.put("list", list); 

		return resultMap;
	}

	@Override
	public List<Map<String, Object>> adminNoticeSearch(Map<String, Object> map) throws Exception {

		return adminDAO.adminNoticeSearch(map);
	}

	@Override
	public List<Map<String, Object>> selectQnaList(Map<String, Object> map) throws Exception {

		return adminDAO.selectQnaList(map);
	}

	@Override
	public List<Map<String, Object>> adminQnaSearch(Map<String, Object> map) throws Exception {

		return adminDAO.adminQnaSearch(map);
	}

	@Override
	public int countQnaList() throws Exception {

		return adminDAO.countQnaList();
	}

	@Override
	public Map<String, Object> selectQnaDetail(Map<String, Object> map) throws Exception {
		Map<String,Object> resultMap = new HashMap<String,Object>();
		Map<String,Object> tempMap = adminDAO.selectQnaDetail(map);
		resultMap.put("map", tempMap);

		List<Map<String,Object>> list = adminDAO.selectQnaFileList(map);

		resultMap.put("list", list);

		return resultMap;
	}

	@Override
	public List<Map<String, Object>> selectReportList(Map<String, Object> map) throws Exception {

		return adminDAO.selectReportList(map);
	}

	@Override
	public List<Map<String, Object>> adminReportSearch(Map<String, Object> map) throws Exception {

		return adminDAO.adminReportSearch(map);
	}

	@Override
	public int countReportList() throws Exception {

		return adminDAO.countReportList();
	}

	@Override
	public Map<String, Object> selectReportDetail(Map<String, Object> map) throws Exception {

		Map<String,Object> resultMap = new HashMap<String,Object>();
		Map<String,Object> tempMap = adminDAO.selectReportDetail(map);
		resultMap.put("map", tempMap);

		List<Map<String,Object>> list = adminDAO.selectReportFileList(map);
		resultMap.put("list", list);

		return resultMap;
	}

	@Override
	public List<Map<String, Object>> adminMypetSearch(Map<String, Object> map) throws Exception {

		return adminDAO.adminMypetSearch(map);
	}

	@Override
	public List<Map<String, Object>> selectMypetList(Map<String, Object> map) throws Exception {

		return adminDAO.selectMypetList(map);
	}

	@Override
	public Map<String, Object> selectMypetDetail(Map<String, Object> map) throws Exception {

		Map<String, Object> resultMap = new HashMap<String, Object>();
		Map<String, Object> tempMap = adminDAO.selectMypetDetail(map);
		resultMap.put("map", tempMap);

		List<Map<String, Object>> list = adminDAO.selectMypetFileList(map);

		resultMap.put("list", list);

		List<Map<String, Object>> cmtList = adminDAO.selectCmtList(map); 
		resultMap.put("cmtList", cmtList); // 댓글
		return resultMap;
	}

	@Override
	public List<Map<String, Object>> adminMatchList(Map<String, Object> map) throws Exception {

		return adminDAO.adminMatchList(map);
	}

	@Override
	public List<Map<String, Object>> adminMatchSearch(Map<String, Object> map) throws Exception {

		return adminDAO.adminMatchSearch(map);
	}

	//회원검색 지연
	@Override
	public List<Map<String, Object>> adminMemSearch(Map<String, Object> map) throws Exception {
		return adminDAO.memSearch(map);
	}

	@Override
	public List<Map<String, Object>> adminCashSearch(Map<String, Object>map) throws Exception {
		return adminDAO.adminCashSearch(map);
	}
	
	@Override
	public List<Map<String, Object>> adminCash(Map<String, Object>map) throws Exception {
		return adminDAO.adminCash(map);
	}

	@Override
	public void adminCashWithdraw(Map<String, Object> map) throws Exception {
		adminDAO.adminCashWithdraw(map);
	}
}

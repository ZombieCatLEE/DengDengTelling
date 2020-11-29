package project.common.admin;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

import project.common.dao.AbstractDAO;

@Repository("adminDAO")
public class AdminDAO extends AbstractDAO { 

	//관리자 로그인 : 호석
	@SuppressWarnings("unchecked")
	public Map<String, Object> adminSelectId(Map<String, Object> map) throws Exception {
		// TODO Auto-generated method stub
		return (Map<String, Object>) selectOne("adminSql.adminLogin", map);
	}
	
	//박선기 공지사항 리스트 공지사항 시작
	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> selectNoticeList(Map<String, Object> map) throws Exception {
		
		return (List<Map<String, Object>>)selectList("adminSql.selectNoticeList", map);
	}

	//박선기 공지사항 디테일
	@SuppressWarnings("unchecked")
	public Map<String, Object> selectNoticeDetail(Map<String, Object> map) throws Exception {
		
		return (Map<String, Object>)selectOne("adminSql.selectNoticeDetail", map);
	}

	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> selectNoticeFileList(Map<String, Object> map) throws Exception {
		return (List<Map<String, Object>>)selectList("adminSql.selectNoticeFileList", map);
	}
	
	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> adminNoticeSearch(Map<String, Object> map) throws Exception {
		
		return (List<Map<String, Object>>)selectList("adminSql.adminNoticeSearch", map);
	}

	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> selectQnaList(Map<String, Object> map) throws Exception {
		
		return (List<Map<String, Object>>)selectList("adminSql.selectQnaList", map);
	}

	
	//qna시작
	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> adminQnaSearch(Map<String, Object> map) throws Exception{
		
		return (List<Map<String, Object>>)selectList("adminSql.adminQnaSearch", map);
	}

	public int countQnaList() throws Exception {
		
		return (Integer)selectOne("adminSql.countQnaList");
	}

	@SuppressWarnings("unchecked")
	public Map<String, Object> selectQnaDetail(Map<String, Object> map) throws Exception {
		
		return (Map<String, Object>)selectOne("adminSql.selectQnaDetail", map);
	}

	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> selectQnaFileList(Map<String, Object> map) throws Exception{
		
		return (List<Map<String, Object>>)selectList("adminSql.selectQnaFileList", map);
	}

	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> selectReportList(Map<String, Object> map) throws Exception {
		
		return (List<Map<String, Object>>)selectList("adminSql.selectReportList", map);
	}

	//리포트 시작
	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> adminReportSearch(Map<String, Object> map) throws Exception {
		
		return (List<Map<String, Object>>)selectList("adminSql.adminReportSearch", map);
	}

	public int countReportList() throws Exception {
		
		return (Integer)selectOne("adminSql.countReportList");
	}

	@SuppressWarnings("unchecked")
	public Map<String, Object> selectReportDetail(Map<String, Object> map) throws Exception {
		
		return (Map<String, Object>)selectOne("adminSql.selectReportDetail", map);
	}

	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> selectReportFileList(Map<String, Object> map) throws Exception {
		
		return (List<Map<String, Object>>)selectList("adminSql.selectReportFileList", map);
	}

	//마이펫 시작
	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> adminMypetSearch(Map<String, Object> map) throws Exception {
		
		return (List<Map<String, Object>>)selectList("adminSql.adminMypetSearch", map);
	}

	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> selectMypetList(Map<String, Object> map) throws Exception {
		
		return (List<Map<String, Object>>)selectList("adminSql.selectMypetList", map);
	}

	@SuppressWarnings("unchecked")
	public Map<String, Object> selectMypetDetail(Map<String, Object> map) throws Exception {
		
		return (Map<String, Object>)selectOne("adminSql.selectMypetDetail", map);
	}

	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> selectMypetFileList(Map<String, Object> map) throws Exception {
		
		return (List<Map<String, Object>>)selectList("adminSql.selectMypetFileList", map);
	}

	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> selectCmtList(Map<String, Object> map) throws Exception {
		
		return (List<Map<String, Object>>)selectList("adminSql.selectCmtList", map);
	}

	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> adminMatchList(Map<String, Object> map) throws Exception {
		
		return (List<Map<String, Object>>)selectList("adminSql.adminMatchList", map);
	}

	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> selectAllMemberList(Map<String, Object> map) throws Exception{
		
		return (List<Map<String, Object>>)selectList("adminSql.selectAllMemberList", map);
	}

	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> adminMatchSearch(Map<String, Object> map) throws Exception {
		
		return (List<Map<String, Object>>)selectList("adminSql.adminMatchSearch", map);
	}
	
	//회원검색
	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> memSearch(Map<String, Object> map) throws Exception {
		return (List<Map<String, Object>>)selectList("adminSql.memSearch", map);
	}

	//입출금 목록
	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> adminCash(Map<String, Object> map) throws Exception {
		return (List<Map<String, Object>>)selectList("adminSql.adminCash", map);
	}
	
	//입출금 검색
	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> adminCashSearch(Map<String, Object> map) throws Exception {
		return (List<Map<String, Object>>)selectList("adminSql.adminCashSearch", map);
	}
	
	//출금 승인
	public void adminCashWithdraw(Map<String, Object> map) throws Exception{
		update("adminSql.adminCashWithdraw", map);
	}
	
	
}

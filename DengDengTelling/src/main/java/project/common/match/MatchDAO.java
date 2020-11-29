package project.common.match;
//2020.02.12 호석
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Repository;

import project.common.dao.AbstractDAO;

@Repository("matchDAO")
public class MatchDAO extends AbstractDAO {

	//매치 리스트 뽑기
	@SuppressWarnings("unchecked")
	public Map<String, Object> matchList(Map<String, Object> map) throws Exception {
		
		return (Map<String, Object>) selectOne("matchSql.matchList", map);
	}
	
	//여기부터 매치 폼 진입 시 불러올 데이터 목록
	//펫시터 정보 가져오기
	@SuppressWarnings("unchecked")
	public Map<String, Object> sltPetsitter(Map<String, Object> map) throws Exception {
		
		return (Map<String, Object>) selectOne("matchSql.selectPetsitter", map);
	}
	
	//펫시터 추가 정보 가져오기
	@SuppressWarnings("unchecked")
	public Map<String, Object> sltPetsitterAdd(Map<String, Object> map) throws Exception {
		
		return (Map<String, Object>) selectOne("matchSql.selectPetsitterAdd", map);
	}
	
	//펫시터 프로필 사진 가져오기
	@SuppressWarnings("unchecked")
	public Map<String, Object> sltPetsitterProfile(Map<String, Object> map) throws Exception {
		
		return (Map<String, Object>) selectOne("matchSql.selectPetsitterProfile", map);
	}
	
	//위탁 장소 이미지 가져오기
	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> sltPetsitterAddImg(Map<String, Object> map) throws Exception {
		
		return (List<Map<String, Object>>) selectList("matchSql.selectPetsitterAddImg", map);
	}
	
	//펫 정보 가져오기
	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> sltPet(Map<String, Object> map) throws Exception {
		
		return (List<Map<String, Object>>) selectList("matchSql.selectPet", map);
	}
	
	//자격증 정보 가져오기
	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> sltCertificate(Map<String, Object> map) throws Exception {
		
		return (List<Map<String, Object>>) selectList("matchSql.selectCertificate", map);
	}
	
	//매치 등록 기능(펫시터)
	@SuppressWarnings("unchecked")
	public Map<String, Object> matchInsert(Map<String, Object> map, HttpServletRequest request) throws Exception {
		
		return (Map<String, Object>) selectOne("matchSql.matchInsert", map);
	}
	//매치 등록 수정(펫시터)
	//매치 등록 취소(펫시터)
	
	//매치 리스트 뽑기 - 모든 매치(매치 등록 역순)
	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> Map(Map<String, Object> map) throws Exception {
		
		return (List<Map<String, Object>>) selectList("matchSql.matchListAll", map);
	}
	
	//매치 리스트 뽑기 - 프로 펫시터(프로 등급, 펫시팅 횟수 높은 순)
	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> matchLtPro(Map<String, Object> map) throws Exception {
		
		return (List<Map<String, Object>>) selectList("matchSql.matchListPro", map);
	}
	
	//매치 리스트 뽑기 - 신입 펫시터(신입 등급, 가입일 최근 순)
	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> matchLtNew(Map<String, Object> map) throws Exception {
		
		return (List<Map<String, Object>>) selectList("matchSql.matchListNew", map);
	}
	
	//매치 디테일(GET)
	@SuppressWarnings("unchecked")
	public Map<String, Object> matchDtlAdd(Map<String, Object> map) throws Exception {
		
		return (Map<String, Object>) selectOne("matchSql.matchDetailAdd", map);
	}
		
	//매치 검색 기능(둘다)
	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> matchSrch(Map<String, Object> map) throws Exception {
		
		return (List<Map<String, Object>>) selectList("matchSql.matchSearch", map);
	}
	
	//멤버 정보 가져오기 : 멤버 + 프로필
	@SuppressWarnings("unchecked")
	public Map<String, Object> sltMember(Map<String, Object> map) throws Exception {
		
		return (Map<String, Object>) selectOne("matchSql.selectMember", map);
	}
	
	//멤버 프로필 사진 가져오기
	@SuppressWarnings("unchecked")
	public Map<String, Object> sltMemberProfile(Map<String, Object> map) throws Exception {
		
		return (Map<String, Object>) selectOne("matchSql.selectMemberProfile", map);
	}
	
	//멤버 펫 정보 가져오기 : 펫 + 추가 + 프로필
	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> sltMemPet(Map<String, Object> map) throws Exception {
		
		return (List<Map<String, Object>>) selectList("matchSql.selectMemPet", map);
	}
	
	//펫시팅 정보 저장하기
	@SuppressWarnings("unchecked")
	public Map<String, Object> insertPst(Map<String, Object> map) throws Exception {
		
		return (Map<String, Object>) selectOne("matchSql.insertPetsitting", map);
	}
	
	//가격 계산을 위해 펫 크기만 가져온다.
	public Map<String, String> petSize(String dengArr) throws Exception {
		
		return (Map<String, String>) selectOne("matchSql.selectPetSize", dengArr);
	}

	//펫시팅 리스트 뽑기(임시) 멤버 - 원래는 마이페이지로 넘어가서 확인하도록 해야 함.
	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> selectPstMem(Map<String, Object> map) throws Exception {
		
		return (List<Map<String, Object>>) selectList("matchSql.selectPetsittingMem", map);
	}
	
	//펫시팅 리스트 뽑기(임시) 펫시터 - 원래는 마이페이지로 넘어가서 확인하도록 해야 함.
	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> selectPstPst(Map<String, Object> map) throws Exception {
		
		return (List<Map<String, Object>>) selectList("matchSql.selectPetsittingPst", map);
	}
	
	//펫시팅 디테일 뽑기(임시) - 원래는 마이페이지로 넘어가서 확인하도록 해야 함.
	@SuppressWarnings("unchecked")
	public Map<String, Object> petsittingDtl(Map<String, Object> map) throws Exception {
		
		return (Map<String, Object>) selectOne("matchSql.petsittingDetail", map);
	}
	
	//펫시팅 진행 단계 업데이트
	@SuppressWarnings("unchecked")
	public Map<String, Object> updatePstStep(Map<String, Object> map) throws Exception {
		
		return (Map<String, Object>) selectOne("matchSql.updatePetsittingStep", map);
	}
	
	//펫시팅 취소
	@SuppressWarnings("unchecked")
	public Map<String, Object> delPetsitting(Map<String, Object> map) throws Exception {
		
		return (Map<String, Object>) selectOne("matchSql.deletePetsitting", map);
	}
	
	//결제 정보 저장
	@SuppressWarnings("unchecked")
	public Map<String, Object> insertCash(Map<String, Object> map) throws Exception {
		
		return (Map<String, Object>) selectOne("matchSql.insertCash", map);
	}
	
	//결제 진행 단계 수정
	@SuppressWarnings("unchecked")
	public Map<String, Object> updateCash(Map<String, Object> map) throws Exception {
		
		return (Map<String, Object>) selectOne("matchSql.updateCash", map);
	}
	
	//멤버 카운트 업
	@SuppressWarnings("unchecked")
	public Map<String, Object> updateMemberCount(Map<String, Object> map) throws Exception {
		
		return (Map<String, Object>) selectOne("matchSql.updateMemberCount", map);
	}
	
	//펫시터 카운트 업
	@SuppressWarnings("unchecked")
	public Map<String, Object> updatePetsitterCount(Map<String, Object> map) throws Exception {
		
		return (Map<String, Object>) selectOne("matchSql.updatePetsitterCount", map);
	}
	
	//펫 카운트 업
	@SuppressWarnings("unchecked")
	public Map<String, Object> updatePetCount(Map<String, Object> map) throws Exception {
		
		return (Map<String, Object>) selectOne("matchSql.updatePetCount", map);
	}
	
	//찜 등록
	@SuppressWarnings("unchecked")
	public Map<String, Object> pstMarkInsert(Map<String, Object> map) throws Exception {
		
		return (Map<String, Object>) selectOne("matchSql.pstMarkInsert", map);
	}
	
	//찜 등록
	@SuppressWarnings("unchecked")
	public Map<String, Object> pstMarkCheck(Map<String, Object> map) throws Exception {
		
		return (Map<String, Object>) selectOne("matchSql.pstMarkCheck", map);
	}
	
	//찜 삭제
	@SuppressWarnings("unchecked")
	public Map<String, Object> pstMarkDelete(Map<String, Object> map) throws Exception {

		return (Map<String, Object>) selectOne("matchSql.pstMarkDelete", map);
	}
	
	//매치 있나 확인
	@SuppressWarnings("unchecked")
	public Map<String, Object> matchCheck(String str) throws Exception {

		return (Map<String, Object>) selectOne("matchSql.matchCheck", str);
	}
	
	public void matchUpdate(Map<String, Object> map) throws Exception {
		update("matchSql.matchUpdate", map);
	}
	
}

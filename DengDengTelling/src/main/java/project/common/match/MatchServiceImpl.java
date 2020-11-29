package project.common.match;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Service;


@Service("matchService")
public class MatchServiceImpl implements MatchService{
	
	Logger log = Logger.getLogger(this.getClass());
	
	@Resource(name="matchDAO")
	private MatchDAO matchDAO;

	@Override
	public Map<String, Object> listMatch(Map<String, Object> map) throws Exception {
		
		return matchDAO.matchList(map);
	}
	
	//펫시터 정보
	@Override
	public Map<String, Object> selPetsitter(Map<String, Object> map) throws Exception {
		// TODO Auto-generated method stub
		return matchDAO.sltPetsitter(map);
	}
		
	//펫시터 추가 정보
	@Override
	public Map<String, Object> selPetsitterAdd(Map<String, Object> map) throws Exception {
		// TODO Auto-generated method stub
		return matchDAO.sltPetsitterAdd(map);
	}
	
	//펫시터 프로필 사진
	@Override
	public Map<String, Object> selPetsitterProfile(Map<String, Object> map) throws Exception {
		// TODO Auto-generated method stub
		return matchDAO.sltPetsitterProfile(map);
	}
	
	//펫시터 위탁 장소 사진
	@Override
	public List<Map<String, Object>> selPetsitterAddImg(Map<String, Object> map) throws Exception {
		// TODO Auto-generated method stub
		return matchDAO.sltPetsitterAddImg(map);
	}
		
	//펫 정보
	@Override
	public List<Map<String, Object>> selPet(Map<String, Object> map) throws Exception {
		// TODO Auto-generated method stub
		return matchDAO.sltPet(map);
	}
	
	//자격증
	@Override
	public List<Map<String, Object>> selCertificate(Map<String, Object> map) throws Exception {
		// TODO Auto-generated method stub
		return matchDAO.sltCertificate(map);
	}
	//매치 관련 정보 가져오기 끝
	
	
	//매치 등록
	@Override
	public Map<String, Object> insertMatch(Map<String, Object> map, HttpServletRequest request) throws Exception {
		// TODO Auto-generated method stub
		return matchDAO.matchInsert(map, request);
	}

	//매치 리스트 뽑기 - 모든 매치(매치 등록 역순)
	@Override
	public List<Map<String, Object>> matchAllList(Map<String, Object> map) throws Exception {
		return matchDAO.matchLtAll(map);
	}

	//매치 리스트 뽑기 - 프로 펫시터(프로 등급, 펫시팅 횟수 높은 순)
	@Override
	public List<Map<String, Object>> matchProList(Map<String, Object> map) throws Exception {
		return matchDAO.matchLtPro(map);
	}
		
	//매치 리스트 뽑기 - 신입 펫시터(신입 등급, 가입일 최근 순)
	@Override
	public List<Map<String, Object>> matchNewList(Map<String, Object> map) throws Exception {
		return matchDAO.matchLtNew(map);
	}
	
	//매치 디테일
	@Override
	public Map<String, Object> matchDetail(Map<String, Object> map) throws Exception {
		return matchDAO.matchDtlAdd(map);
	}
	
	//매치 검색 기능
	@Override
	public List<Map<String, Object>> mtchSearch(Map<String, Object> map) throws Exception {
		return matchDAO.matchSrch(map);
	}
	
	//멤버 정보 : 멤버 + 프로필
	@Override
	public Map<String, Object> selMember(Map<String, Object> map) throws Exception {
		return matchDAO.sltMember(map);
	}
		
	//멤버 프로필 사진
	public Map<String, Object> selMemberProfile(Map<String, Object> map) throws Exception {
		return matchDAO.sltMemberProfile(map);
	}
	
	//펫 정보(펫 + 추가 + 프로필)
	@Override
	public List<Map<String, Object>> selMemPet(Map<String, Object> map) throws Exception {
		return matchDAO.sltMemPet(map);
	}
	
	//펫시팅 등록
	@Override
	public Map<String, Object> insertPetsitt(Map<String, Object> map) throws Exception {
		return matchDAO.insertPst(map);
	}
	
	//펫 크기 가져오기(가격 비교용)
	@Override
	public Map<String, String> selPetSize(String dengArr) throws Exception {
		return matchDAO.petSize(dengArr);
	}
	
	//펫시팅 리스트 뽑기 - 임시
	@Override
	public List<Map<String, Object>> selPetsittingMem(Map<String, Object> map) throws Exception {
		return matchDAO.selectPstMem(map);
	}
	
	//펫시팅 리스트 뽑기 - 임시
	@Override
	public List<Map<String, Object>> selPetsittingPst(Map<String, Object> map) throws Exception {
		return matchDAO.selectPstPst(map);
	}
		
	//펫시팅 디테일 뽑기 - 임시
	@Override
	public Map<String, Object> pstDetail(Map<String, Object> map) throws Exception {
		return matchDAO.petsittingDtl(map);
	}
	
	//펫시팅 진행 단계 업데이트
	public Map<String, Object> upPetsittingStep(Map<String, Object> map) throws Exception {
		return matchDAO.updatePstStep(map);
	}
	
	//펫시팅 취소
	public Map<String, Object> deletePst(Map<String, Object> map) throws Exception {
		return matchDAO.delPetsitting(map);
	}
	
	//결제 정보 저장
	public Map<String, Object> insertCash(Map<String, Object> map) throws Exception {
		return matchDAO.insertCash(map);
	}
		
	//결제 진행 단계 수정
	public Map<String, Object> updateCash(Map<String, Object> map) throws Exception {
		return matchDAO.updateCash(map);
	}
	
	//멤버 카운트 업
	public Map<String, Object> updateMemberCount(Map<String, Object> map) throws Exception {
		return matchDAO.updateMemberCount(map);
	}
		
	//펫시터 카운트 업
	public Map<String, Object> updatePetsitterCount(Map<String, Object> map) throws Exception {
		return matchDAO.updatePetsitterCount(map);
	}
	
	//펫 카운트 업
	public Map<String, Object> updatePetCount(Map<String, Object> map) throws Exception {
		return matchDAO.updatePetCount(map);
	}
	
	//찜 등록
	public Map<String, Object> pstMarkInsert(Map<String, Object> map) throws Exception {
		return matchDAO.pstMarkInsert(map);
	}
	
	//찜 확인
	public Map<String, Object> pstMarkCheck(Map<String, Object> map) throws Exception {
		return matchDAO.pstMarkCheck(map);
	}
	//찜 삭제
	public Map<String, Object> pstMarkDelete(Map<String, Object> map) throws Exception {
		return matchDAO.pstMarkDelete(map);
	}
	
	//매치 중복 확인
	public Map<String, Object> matchCheck(String str) throws Exception {
		return matchDAO.matchCheck(str);
	}
	
	//매치 수정
	public void matchUpdate(Map<String, Object> map) throws Exception {
		matchDAO.matchUpdate(map);
	}
}

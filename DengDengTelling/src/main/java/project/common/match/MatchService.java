package project.common.match;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

public interface MatchService {
	
	//매치 리스트 업 : 호석
	public Map<String, Object> listMatch(Map<String, Object> map) throws Exception;
		
	//**************************************여기부터 매치 관련 정보 가져오기**************************************
	//펫시터 정보
	public Map<String, Object> selPetsitter(Map<String, Object> map) throws Exception;
	
	//펫시터 추가 정보
	public Map<String, Object> selPetsitterAdd(Map<String, Object> map) throws Exception;
	
	//펫시터 프로필 사진
	public Map<String, Object> selPetsitterProfile(Map<String, Object> map) throws Exception;
		
	//펫시터 위탁 장소 사진
	public List<Map<String, Object>> selPetsitterAddImg(Map<String, Object> map) throws Exception;
		
	//펫시터 펫 정보(펫 + 추가 + 프로필)
	public List<Map<String, Object>> selPet(Map<String, Object> map) throws Exception;
	
	//자격증
	public List<Map<String, Object>> selCertificate(Map<String, Object> map) throws Exception;
	//**************************************매치 관련 정보 가져오기 끝**************************************
	
	//매치 등록 : 호석
	public Map<String, Object> insertMatch(Map<String, Object> map, HttpServletRequest request) throws Exception;
	
	//매치 리스트 뽑기 - 모든 매치(매치 등록 역순)
	public List<Map<String, Object>> matchAllList(Map<String, Object> map) throws Exception;

	//매치 리스트 뽑기 - 프로 펫시터(프로 등급, 펫시팅 횟수 높은 순)
	public List<Map<String, Object>> matchProList(Map<String, Object> map) throws Exception;
	
	//매치 리스트 뽑기 - 신입 펫시터(신입 등급, 가입일 최근 순)
	public List<Map<String, Object>> matchNewList(Map<String, Object> map) throws Exception;
	
	//매치 디테일
	public Map<String, Object> matchDetail(Map<String, Object> map) throws Exception;
	
	//매치 검색 기능
	public List<Map<String, Object>> mtchSearch(Map<String, Object> map) throws Exception;

	//멤버 정보 : 멤버 + 프로필
	public Map<String, Object> selMember(Map<String, Object> map) throws Exception;
	
	//멤버 프로필 사진
	public Map<String, Object> selMemberProfile(Map<String, Object> map) throws Exception;
	
	//멤버 펫 정보(펫 + 추가 + 프로필)
	public List<Map<String, Object>> selMemPet(Map<String, Object> map) throws Exception;
	
	//펫시팅 등록
	public Map<String, Object> insertPetsitt(Map<String, Object> map) throws Exception;
	
	//펫 크기 가져오기(가격 비교용)
	public Map<String, String> selPetSize(String dengArr) throws Exception;
	
	//펫시팅 리스트 뽑기 - 임시
	public List<Map<String, Object>> selPetsittingMem(Map<String, Object> map) throws Exception;
	
	//펫시팅 리스트 뽑기 - 임시
	public List<Map<String, Object>> selPetsittingPst(Map<String, Object> map) throws Exception;
	
	//펫시팅 디테일 뽑기 - 임시
	public Map<String, Object> pstDetail(Map<String, Object> map) throws Exception;
	
	//펫시팅 진행 단계 업데이트
	public Map<String, Object> upPetsittingStep(Map<String, Object> map) throws Exception;
	
	//펫시팅 취소
	public Map<String, Object> deletePst(Map<String, Object> map) throws Exception;
	
	//결제 정보 저장
	public Map<String, Object> insertCash(Map<String, Object> map) throws Exception;
		
	//결제 진행 단계 수정
	public Map<String, Object> updateCash(Map<String, Object> map) throws Exception;
	
	//멤버 카운트 업
	public Map<String, Object> updateMemberCount(Map<String, Object> map) throws Exception;
		
	//펫시터 카운트 업
	public Map<String, Object> updatePetsitterCount(Map<String, Object> map) throws Exception;
	
	//펫 카운트 업
	public Map<String, Object> updatePetCount(Map<String, Object> map) throws Exception;
	
	//찜 등록
	public Map<String, Object> pstMarkInsert(Map<String, Object> map) throws Exception;
	
	//찜 확인
	public Map<String, Object> pstMarkCheck(Map<String, Object> map) throws Exception;
	
	//찜 삭제
	public Map<String, Object> pstMarkDelete(Map<String, Object> map) throws Exception;
	
	//매치 정보 확인
	public Map<String, Object> matchCheck(String str) throws Exception;
	
	//매치 업데이트
	void matchUpdate(Map<String, Object> map) throws Exception;

} 

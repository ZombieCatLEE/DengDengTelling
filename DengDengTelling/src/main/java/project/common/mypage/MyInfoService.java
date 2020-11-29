package project.common.mypage;


import java.util.List;
import java.util.Map;
import project.common.join.JoinDAO;

import javax.servlet.http.HttpServletRequest;

public interface MyInfoService {

	Map<String, Object> selectMemMyInfoDetail(Map<String, Object> map) throws Exception; //일반회원 상세보기

	Map<String, Object> selectPstMyInfoDetail(Map<String, Object> map) throws Exception; //펫시터 상세보기

	Map<String, Object> selectPstMyInfoAddDetail(Map<String, Object> map) throws Exception; //펫시터 상세보기

	List<Map<String, Object>> selectCertiInfo(Map<String, Object> map) throws Exception; //펫시터 자격증 정보 불러오기  지연수정 2020.03.06

	Map<String, Object> selectProfileInfo(Map<String, Object> map) throws Exception; //회원 프로필이미지 정보 불러오기

	List<Map<String, Object>> selectPstPlaceInfo(Map<String, Object> map) throws Exception; //펫시터 위탁장소 정보 불러오기

	void updateMyInfoModify(Map<String, Object> map, HttpServletRequest request) throws Exception;  //회원정보수정

	void updatePstPlace(Map<String, Object> map, HttpServletRequest request) throws Exception;  //위탁장소 수정

	void updateCerti(Map<String, Object> map, HttpServletRequest request) throws Exception;  //자격증 정보 수정

	int deleteMyInfo(Map<String, Object> map) throws Exception; //회원탈퇴

	List<Map<String, Object>> selectMyPetList(Map<String, Object> map) throws Exception; //나의 펫리스트 불러오기.

	Map<String, Object> selectProfile(Map<String, Object> map) throws Exception;

	List<Map<String, Object>> selectMyBookMarkList(Map<String, Object> map) throws Exception;

	Map<String, Object> bookMarkdetail(String ID) throws Exception;
	
	List<Map<String, Object>> memMatchList(Map<String, Object> map) throws Exception;

	List<Map<String, Object>> petMatchList(Map<String, Object> map) throws Exception;

	List<Map<String, Object>> myBookSearch(Map<String, Object> map) throws Exception;
	
	//2020.03.11 지연 : 댕댕이 삭제 
	void myPetDelete(String str) throws Exception;
	
	Map<String, Object> selectMyPetDeatail(String str) throws Exception;
	
	Map<String, Object> selectMyPetAddDeatail(String str) throws Exception;
	
	void updateMyPet(Map<String, Object> map, HttpServletRequest request) throws Exception;
	
	List<Map<String, String>> petInfoSerarch(Map<String, Object> map) throws Exception;
	
	List<Map<String, Object>> cashList(Map<String, Object> map) throws Exception;
	
	void withdrawReserve(Map<String, Object> map) throws Exception;
}

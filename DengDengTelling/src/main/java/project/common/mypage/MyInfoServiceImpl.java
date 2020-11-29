//2020.02.11. PM6:10
package project.common.mypage;
import java.util.Map;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.HashMap;
import java.util.List;
import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import project.common.login.LoginDAO;
import project.common.mypage.MyInfoDAO;
import project.common.join.JoinDAO;

import project.common.util.FileUtils;


@Service("myInfoService")
public class MyInfoServiceImpl implements MyInfoService{
	Logger log = Logger.getLogger(this.getClass());

	@Resource(name="myInfoDAO")
	private MyInfoDAO myInfoDAO;

	@Resource(name="loginDAO")
	private LoginDAO loginDAO;

	@Resource(name="fileUtils")
	private FileUtils fileUtils;

	@Resource(name="joinDAO")
	private JoinDAO joinDAO;


	@Override //상세 일반회원정보 불러오기 
	public Map<String, Object> selectMemMyInfoDetail(Map<String, Object> map) throws Exception {
		return myInfoDAO.selectMemMyInfoDetail(map);
	}

	@Override //상세 펫시터회원정보 불러오기
	public Map<String, Object> selectPstMyInfoDetail(Map<String, Object> map) throws Exception {
		return myInfoDAO.selectPstMyInfoDetail(map);
	}


	@Override  //상세 펫시터 추가 회원정보 불러오기
	public Map<String, Object> selectPstMyInfoAddDetail(Map<String, Object> map) throws Exception {
		// TODO Auto-generated method stub
		return myInfoDAO.selectPstMyInfoAddDetail(map);
	}

	@Override  //회원 프로필 정보 불러오기
	public Map<String, Object> selectProfileInfo(Map<String, Object> map) throws Exception {
		// TODO Auto-generated method stub

		//System.out.println("MyInfoService selectProfileInfo진입");
		return myInfoDAO.selectProfileInfo(map);
	}

	@Override //회원정보 수정
	public void updateMyInfoModify(Map<String, Object> map, HttpServletRequest request) throws Exception {

		myInfoDAO.updateMyInfoModify(map);	//회원정보 수정
		
		List<Map<String,Object>> list = fileUtils.parseInsertFileInfo(map, request);

		if(list.size()!=0) { //파일 수정일경우
			if(map.get("PROFILE_NO") == null || map.get("PROFILE_NO").equals("")) {
				Map<String,Object> tempMap = list.get(0);
				joinDAO.insertProfile(tempMap);
			} else {
				Map<String,Object> tempMap = list.get(0);
				System.out.println("PROFILE_NO2값은" + map.get("PROFILE_NO"));
				tempMap.put("PROFILE_NO",map.get("PROFILE_NO")); //수정할 파일 번호를 넘겨준다. 
				myInfoDAO.deleteProfile(tempMap);
				joinDAO.insertProfile(tempMap);
			}
		}
	}
	
	@Override //회원정보 삭제 
	public int deleteMyInfo(Map<String, Object> map) throws Exception {
		int res;
		Map<String, Object> member = loginDAO.selectId(map);	//회원 정보 가져오기
		
		if(member.get("PASSWORD1").equals(map.get("PASSWORD1"))){	//가져온 비밀번호랑 입력한 비밀번호 비교
			if(map.get("MEM_ID") != null && map.get("PSMEM_ID") == null) {	//일반 회원이면,
				myInfoDAO.deleteMemInfo(map);		//일반 회원 정보 삭제
			} else if(map.get("MEM_ID") == null && map.get("PSMEM_ID") != null) {	//펫시터면,
				myInfoDAO.deletePstInfo(map);		//펫시터 정보 삭제
			}
			myInfoDAO.deleteProfile(map);	//아이디에 해당하는 프로필 사진 삭제
			
			List<Map<String, Object>> petList = new ArrayList<Map<String,Object>>();
			petList = myInfoDAO.selectMyPetList(map);	//아이디에 해당하는 펫 정보 모두 가져오기
			
			if(petList != null) {	//가져온 펫 정보가 있으면,
				for(Map<String, Object> result : petList) {
					Map<String, Object> mapp = new HashMap<String, Object>();	//안에 넣어두면 매번 새로 생성
					mapp.put("ID", result.get("PET_MEM_ID"));	//가져온 펫 아이디를 키 ID에 넣어,
					myInfoDAO.deletePetMember(mapp);			//펫 삭제
					myInfoDAO.deleteProfile(mapp);				//펫 프로필 삭제
				}
			}
			res = 1;
		}else {
			res = 0;
		}
		return res;
	}
	
	@Override  //회원의 마이펫리스트 불러오기
	public List<Map<String, Object>> selectMyPetList(Map<String, Object> map) throws Exception {
		// TODO Auto-generated method stub
		return myInfoDAO.selectMyPetList(map);
	}

	@Override  //프로필 사진 꺼내오기
	public Map<String, Object> selectProfile(Map<String, Object> map) throws Exception {
		// TODO Auto-generated method stub
		return  myInfoDAO.selectProfile(map);
	}

	@Override  //지연 2020/03/06 수정 펫시터 자격증 정보 불러오기
	public List<Map<String, Object>> selectCertiInfo(Map<String, Object> map) throws Exception {
		// TODO Auto-generated method stub
		return myInfoDAO.selectCertiInfo(map);
	}

	@Override // 위탁장소 이미지 정보 불러오기
	public List<Map<String, Object>>  selectPstPlaceInfo(Map<String, Object> map) throws Exception {
		// TODO Auto-generated method stub
		return myInfoDAO.selectPstPlaceInfo(map);
	}

	@Override //위탁장소 이미지 수정
	public void updatePstPlace(Map<String, Object> map, HttpServletRequest request) throws Exception {
		// TODO Auto-generated method stub
		System.out.println("ServiceImpl 위탁장소 이미지 수정진입");
		myInfoDAO.deleteFile(map);
		List<Map<String,Object>> list = fileUtils.parseUpdateFileInfo_PstPlace(map, request);
		System.out.println("ServiceImpl 파일유틸성공");
		
		Map<String,Object> tempMap = null;
		
		for(int i = 0, size = list.size(); i < size; i++) {
			tempMap = list.get(i);
			if(tempMap.get("IS_NEW").equals("Y")){
				System.out.println("ServiceImpl 파일이 IS_NEW일때");
				joinDAO.insertPstPlaceImg(tempMap);
			}
			else{
				System.out.println("ServiceImpl 파일이 IS_NEW가 아닐때");
				myInfoDAO.updateFile(tempMap);
			}
		}
	}

	@Override //자격증 수정
	public void updateCerti(Map<String, Object> map, HttpServletRequest request) throws Exception {
		// TODO Auto-generated method stub
		System.out.println("ServiceImpl 자격증 수정진입");
		myInfoDAO.deleteCerti(map);
		List<Map<String,Object>> list = fileUtils.parseUpdateFileInfo_PstCerti(map, request);
		System.out.println("ServiceImpl 파일유틸성공");
		
		Map<String,Object> tempMap = null;
		
		for(int i = 0, size = list.size(); i < size; i++) {
			tempMap = list.get(i);
			if(tempMap.get("IS_NEW").equals("Y")){
				System.out.println("ServiceImpl 파일이 IS_NEW일때");
				joinDAO.insertCerti(tempMap);
			}
			else{
				System.out.println("ServiceImpl 파일이 IS_NEW가 아닐때");
				myInfoDAO.updateCerti(tempMap);
			}
		}
	}
	
	@Override //찜리스트 박선기
	public List<Map<String, Object>> selectMyBookMarkList(Map<String, Object> map) throws Exception {

		return myInfoDAO.selectMyBookMarkList(map);
	}

	@Override
	public Map<String, Object> bookMarkdetail(String ID) throws Exception {

		return myInfoDAO.bookMarkdetail(ID);
	}
	
	@Override //멤버 매치내역 
	public List<Map<String, Object>> memMatchList(Map<String, Object> map) throws Exception {
		
		return myInfoDAO.memMatchList(map);
	}

	@Override
	public List<Map<String, Object>> petMatchList(Map<String, Object> map) throws Exception {
		
		return myInfoDAO.petMatchList(map);
	}

	@Override
	public List<Map<String, Object>> myBookSearch(Map<String, Object> map) throws Exception {
		
		return null;
	}
	
	//댕댕이 삭제 2020.03.11 지연
	@Override
	public void myPetDelete(String str) throws Exception {
		// TODO Auto-generated method stub
		myInfoDAO.myPetDelete(str);
	}
	
	//펫 정보 가져오기
	public Map<String, Object> selectMyPetDeatail(String str) throws Exception {
		return myInfoDAO.selectMyPetDeatail(str);
	}
	
	//펫 추가 정보 가져오기
	public Map<String, Object> selectMyPetAddDeatail(String str) throws Exception {
		return myInfoDAO.selectMyPetAddDeatail(str);
	}
	
	//펫 정보 수정
	public void updateMyPet(Map<String, Object> map, HttpServletRequest request) throws Exception {
		//Map<>에 담긴 값 확인하기
		for(Map.Entry<String, Object> entry : map.entrySet()) {
			System.out.println("impl map [key] : " + entry.getKey() + ", " + "[value] : " + entry.getValue());
		}
		
		myInfoDAO.updateMyPet(map);
		myInfoDAO.updateMyPetAdd(map);
		
		List<Map<String,Object>> list = fileUtils.parseInsertFileInfo(map, request);

		//List<Map>에 담긴 값 확인하기
		for(Map<String, Object> result : list) {
			for(Map.Entry<String, Object> entry : result.entrySet()) {
				System.out.println("impl list [key] : " + entry.getKey() + ", " + "[value] : " + entry.getValue());
			}
		}
				
		if(list.size() != 0) { //파일 수정일경우
			if(map.get("PROFILE_NO") == null || map.get("PROFILE_NO").equals("")) {
				Map<String,Object> tempMap = list.get(0);
				joinDAO.insertProfile(tempMap);
			} else {
				Map<String,Object> tempMap = list.get(0);
				//System.out.println("PROFILE_NO2값은" + map.get("PROFILE_NO"));
				//tempMap.put("PROFILE_NO",map.get("PROFILE_NO")); //수정할 파일 번호를 넘겨준다. -> 업데이트 시 파일이 남아있기 때문에 삭제로 바꾸면서 주석 처리 
				myInfoDAO.deleteProfile(tempMap);
				joinDAO.insertProfile(tempMap);
			}
		}
	}
	
	//펫 목록 가져오기
	public List<Map<String, String>> petInfoSerarch(Map<String, Object> map) throws Exception {
		return myInfoDAO.petInfoSerarch(map);
	}
	
	//거래 내역 가져오기
	public List<Map<String, Object>> cashList(Map<String, Object> map) throws Exception {
		return myInfoDAO.cashList(map);
	}
	
	//출금 신청(펫시터)
	public void withdrawReserve(Map<String, Object> map) throws Exception {
		myInfoDAO.withdrawReserve(map);
	}
}  

//2020.02.11. PM6:10
package project.common.mypage;
import java.util.List;
import java.util.Map;
import org.springframework.stereotype.Repository;
import project.common.dao.AbstractDAO;

@Repository("myInfoDAO")
public class MyInfoDAO extends AbstractDAO {

	//일반회원상세정보보기
	@SuppressWarnings("unchecked")
	public Map<String, Object> selectMemMyInfoDetail(Map<String, Object> map) throws Exception {
		return (Map<String, Object>) selectOne ("myInfo.selectmeminfo",map);
	}

	//펫시터회원상세정보보기
	@SuppressWarnings("unchecked")
	public Map<String, Object> selectPstMyInfoDetail(Map<String, Object> map) throws Exception {
		return (Map<String, Object>) selectOne ("myInfo.selectpstinfo",map);
	}

	//펫시터회원상세추가정보보기
	@SuppressWarnings("unchecked")
	public Map<String, Object> selectPstMyInfoAddDetail(Map<String, Object> map) throws Exception {
		return (Map<String, Object>) selectOne ("myInfo.selectpstaddinfo",map);
	}

	//회원 프로필 정보보기
	@SuppressWarnings("unchecked")
	public Map<String, Object> selectProfileInfo(Map<String, Object> map) throws Exception {
		return (Map<String, Object>) selectOne("myInfo.selectProfileInfo",map);
	}

	//수정
	public void updateMyInfoModify(Map<String, Object> map) throws Exception {
		//펫시터 회원수정인경우
		if(map.get("MEM_TYPE").equals("펫시터")) {
			System.out.println("==============update DAO에서 펫시터구분 성공!!===============");
			update("myInfo.updatepstinfo",map);
			update("myInfo.updatepstaddinfo",map);
		} else {
			update("myInfo.updatememinfo",map);
		}
	}

	//프로필 수정
	public void updateProfile(Map<String, Object> map) throws Exception{
		update("myInfo.updateProfile", map);
	}

	//자격증 수정
	//public void updateCertifile(Map<String, Object> map) throws Exception{
	//	update("myInfo.updatecertiinfo", map);
	//}

	//회원 탈퇴
	public void deleteMemInfo(Map<String, Object> map) throws Exception {
		delete("myInfo.deleteMember", map);
	}

	//펫시터 탈퇴
	public void deletePstInfo(Map<String, Object> map) throws Exception {
		delete("myInfo.deletePetsitter", map);
	}
	
	//회원 탈퇴 시 펫 탈퇴
	public void deletePetMember(Map<String, Object> map) throws Exception {
		delete("myInfo.deletePetMember", map);
	}
	
	//회원 탈퇴 시 프로필 삭제 + 펫도 적용
	public void deleteProfile(Map<String, Object> map) throws Exception {
		delete("myInfo.deleteProfile", map);
	}

	//나의 댕댕이 리스트 가져오기
	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> selectMyPetList(Map<String, Object> map) throws Exception {
		return (List<Map<String, Object>>) selectList ("myInfo.selectmypet",map);
	}

	//프로필이미지 꺼내오기
	@SuppressWarnings("unchecked")
	public Map<String, Object> selectProfile(Map<String, Object> map) throws Exception{
		return (Map<String, Object>) selectOne("myInfo.selectProfile", map);
	}

	//지연 수정 2020.03.06 자격증정보 꺼내오기
	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> selectCertiInfo(Map<String, Object> map) throws Exception {
		return (List<Map<String, Object>>) selectList("myInfo.selectcertiinfo",map);
	}

	//위탁장소 첨부파일리스트 꺼내오기
	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> selectPstPlaceInfo(Map<String, Object> map) throws Exception{
		return (List<Map<String, Object>>)selectList("myInfo.selectPstPlaceList", map);
	}

	public void deleteFile(Map<String, Object> map) throws Exception{
		update("myInfo.deleteFile", map);
	}

	public void updateFile(Map<String, Object> map) throws Exception{
		update("myInfo.updateFile", map);
	}

	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> selectMyBookMarkList(Map<String, Object> map) throws Exception {
		return (List<Map<String, Object>>)selectList("myInfo.selectMyBookMarkList", map);
	}

	@SuppressWarnings("unchecked")
	public Map<String, Object> bookMarkdetail(String ID) throws Exception {
		return (Map<String, Object>)selectOne("myInfo.bookMarkdetail", ID);
	}
	
	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> memMatchList(Map<String, Object> map) throws Exception {
		return (List<Map<String, Object>>)selectList("myInfo.memMatchList", map);
	}

	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> petMatchList(Map<String, Object> map) throws Exception{
		return (List<Map<String, Object>>)selectList("myInfo.petMatchList", map);
	}

	//댕댕이 삭제 2020.03.11 지연
	public void myPetDelete(String str) throws Exception {
		delete("myInfo.deletePet", str); //PET_MEMBER 삭제
		//delete("myInfo.deletePetAdd",map); //PET_MEMBER_ADD 삭제, FK 걸려있어서 알아서 지워짐.
	}
	
	//자격증 수정용
	public void deleteCerti(Map<String, Object> map) throws Exception{
		update("myInfo.deleteCerti", map);
	}

	public void updateCerti(Map<String, Object> map) throws Exception{
		update("myInfo.updateCerti", map);
	}
	
	//펫 정보 가져오기
	@SuppressWarnings("unchecked")
	public Map<String, Object> selectMyPetDeatail(String str) throws Exception {
		return (Map<String, Object>) selectOne ("myInfo.selectMyPetDeatail", str);
	}
	
	//펫 추가 정보 가져오기 
	@SuppressWarnings("unchecked")
	public Map<String, Object> selectMyPetAddDeatail(String str) throws Exception {
		return (Map<String, Object>) selectOne ("myInfo.selectMyPetAddDeatail", str);
	}
	
	//펫 멤버 수정
	public void updateMyPet(Map<String, Object> map) throws Exception{
		update("myInfo.updateMyPet", map);
	}
	
	//펫 멤버 추가 수정
	public void updateMyPetAdd(Map<String, Object> map) throws Exception{
		update("myInfo.updateMyPetAdd", map);
	}
	
	@SuppressWarnings("unchecked")
	public List<Map<String, String>> petInfoSerarch(Map<String, Object> map) throws Exception {
		return (List<Map<String, String>>) selectList ("myInfo.petInfoSerarch", map);
	}
	
	//거래 내역 뽑기
	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> cashList(Map<String, Object> map) throws Exception {
		return (List<Map<String, Object>>) selectList ("myInfo.cashList", map);
	}
	
	
	public void withdrawReserve(Map<String, Object> map) throws Exception {
		update("myInfo.withdrawReserve", map);
	}
} 



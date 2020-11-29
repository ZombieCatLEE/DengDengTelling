//지연 수정  2020.03.06
package project.common.join;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Service;

import project.common.util.FileUtils;


@Service("joinService")
public class JoinServiceImpl implements JoinService {

	Logger log = Logger.getLogger(this.getClass());
 
	@Resource(name="fileUtils") 
	private FileUtils fileUtils;
	
	
	@Resource(name = "joinDAO")
	private JoinDAO joinDAO;

	@Override
	public String selectIdCheck(Map<String, Object> map) throws Exception {
		// TODO Auto-generated method stub
		return joinDAO.selectIdCheck(map);
	}

	 @Override public void insertMember(Map<String, Object> map, HttpServletRequest request) throws Exception
	 { // TODO Auto-generated method stub 
		 joinDAO.insertMember(map); 
		 
		 
		 List<Map<String,Object>> list = fileUtils.parseInsertFileInfo(map, request);
		 for(int i=0, size=list.size(); i<size; i++){ 
			
			 joinDAO.insertProfile(list.get(i));
			 
		 }
	}

	@Override
	public void insertPst(Map<String, Object> map, HttpServletRequest request) throws Exception {
		// TODO Auto-generated method stub
		joinDAO.insertPst(map);

		
		
		 List<Map<String,Object>> list = fileUtils.parseInsertFileInfo(map, request);
		 for(int i=0, size=list.size(); i<size; i++){ 
			System.out.println(list.get(i));
			
			 joinDAO.insertProfile(list.get(i));
		 }

	}

	@Override  //첫번째 펫시터 추가정보등록 
	public void insertPstAdd(Map<String, Object> map, HttpServletRequest request) throws Exception {
		// TODO Auto-generated method stub
		joinDAO.insertPstAdd(map);
		
		//자격증파일 등록
		List<Map<String,Object>> list = fileUtils.parseInsertCerti(map, request);
		 for(int i=0, size=list.size(); i<size; i++){ 
			System.out.println(list.get(i));
			
			 joinDAO.insertCerti(list.get(i));
		
		 }		 
		 
	}
	
	@Override  //두번째 펫시터 추가정보(위탁장소, 자기소개) 등록
	public void insertPstAdd2(Map<String, Object> map, HttpServletRequest request) throws Exception {
		// TODO Auto-generated method stub
		joinDAO.insertPstAdd2(map);
		
		//위탁장소 이미지 등록
		List<Map<String,Object>> list = fileUtils.parseInsertPlace(map, request);
		 for(int i=0, size=list.size(); i<size; i++){ 
			System.out.println(list.get(i));
			
			 joinDAO.insertPstPlaceImg(list.get(i));
		 }
	}

	@Override
	public Map<String, Object> getPstId(Map<String, Object> map) throws Exception {
		// TODO Auto-generated method stub
		return joinDAO.selectPstId(map);

	}
	
	@Override
	public void petRegistAdd(Map<String, Object> map) throws Exception {
		// TODO Auto-generated method stub
		joinDAO.insertPetAdd(map);
	}

	public void insertPet(Map<String, Object> map, HttpServletRequest request) throws Exception {
		
		//Map<>에 담긴 값 확인하기
		for(Map.Entry<String, Object> entry : map.entrySet()) {
			System.out.println("impl Map[key] : " + entry.getKey() + ", " + "[value] : " + entry.getValue());
		}
		
		joinDAO.insertPet(map);
		
		Map<String, Object> mapp = joinDAO.selectPetMemId(map);
		String pet_mem_id= (String) mapp.get("PET_MEM_ID");
		map.put("PET_MEM_ID", pet_mem_id);
		
		joinDAO.insertPetAdd(map);

		List<Map<String,Object>> list = fileUtils.parseInsertFileInfo(map, request);	//이 부분 에러
		for(int i=0, size=list.size(); i<size; i++){ 
			System.out.println(list.get(i));
			joinDAO.insertProfile(list.get(i));
		}
	}
	
	//요거 필요없음
	public void insertPetAdd(Map<String, Object> map) throws Exception {
		joinDAO.insertPetAdd(map);
	}
	
	//펫 등록시 아이디 가져오기
	public Map<String, Object> selectPetMemId(Map<String, Object> map) throws Exception {
		return joinDAO.selectPetMemId(map);
	}

	//펫시터 정보 가져오기
	@Override
	public Map<String, Object> selectPetsitter(String str) throws Exception {
		return joinDAO.selectPetsitter(str);
	}
	
	
	
	
	//아래는 주석 넣어놓은 코드(사용 안 함)
	@Override
	public void petRegist(Map<String, Object> map, HttpServletRequest request) throws Exception {
		// TODO Auto-generated method stub
		
	}

	@Override
	public String getPetMemId(Map<String, Object> map) throws Exception {
		// TODO Auto-generated method stub
		return null;
	}
	
	
	
	//댕댕이 등록
		/*
		 * @Override public void petRegist(Map<String, Object> map, HttpServletRequest
		 * request) throws Exception { // TODO Auto-generated method stub
		 * joinDAO.insertPet(map);
		 * 
		 * //PET_MEM_ID를 DB에서 꺼내오기 String pet_mem_id= joinDAO.selectPetMemId(map);
		 * //PET_MEM_ID를 DB에서 꺼내오기 System.out.println("PET_MEM_ID는" +pet_mem_id); //꺼내온
		 * 아이디값을 map에 넣어준다. map.put("PET_MEM_ID", pet_mem_id);
		 * 
		 * List<Map<String,Object>> list = fileUtils.parseInsertFileInfo(map, request);
		 * for(int i=0, size=list.size(); i<size; i++){ System.out.println(list.get(i));
		 * joinDAO.insertProfile(list.get(i));
		 * 
		 * } }
		 */
	

	/*
	 * @Override public String getPetMemId(Map<String, Object> map) throws Exception
	 * { // TODO Auto-generated method stub return joinDAO.selectPetMemId(map);
	 * 
	 * }
	 */

}

//지연 수정  2020.03.06
package project.common.util;

import java.io.File;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Component;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

@Component("fileUtils")
public class FileUtils {
	Logger log = Logger.getLogger(this.getClass());
	
	private static final String filePath = "";	
	//경로지정해야함	
	//게시판 파일업로드
	public List<Map<String,Object>> parseInsertFileInfo_board(Map<String,Object> map,
			HttpServletRequest request) throws Exception{
		String filePath = request.getSession().getServletContext().getRealPath("/resources/images/board/");
		MultipartHttpServletRequest multipartHttpServletRequest = (MultipartHttpServletRequest)request;
		Iterator<String> iterator = multipartHttpServletRequest.getFileNames(); 
		MultipartFile multipartFile = null;
		String originalFileName = null;
		String originalFileExtension = null;
		String storedFileName = null;

		List<Map<String,Object>> list = new ArrayList<Map<String,Object>>(); 
		Map<String, Object> listMap = null; 

		String boardIdx = (String)map.get("BOARD_NO");
		String id = (String)map.get("BOARD_CREA_ID");

		File file = new File(filePath);
		if(file.exists() == false){
			file.mkdirs();
		}

		while(iterator.hasNext()){
			multipartFile = multipartHttpServletRequest.getFile(iterator.next()); 
			if(multipartFile.isEmpty() == false){ 
				originalFileName = multipartFile.getOriginalFilename();
				originalFileExtension = originalFileName.substring(originalFileName.lastIndexOf("."));
				storedFileName = CommonUtils.getRandomString() + originalFileExtension; 

				file = new File(filePath + storedFileName); 
				multipartFile.transferTo(file); 

				listMap = new HashMap<String,Object>(); 
				listMap.put("BOARD_NO", boardIdx);
				listMap.put("BOARD_CREA_ID", id);
				listMap.put("BOARD_ORIGINAL_FILE_NAME", originalFileName);
				listMap.put("BOARD_STORED_FILE_NAME", storedFileName); 
				listMap.put("BOARD_FILE_SIZE", multipartFile.getSize()); 
				list.add(listMap); 
			}
		}
		return list; 
	}

	//게시판 수정
	public List<Map<String, Object>> parseUpdateFileInfo_board(Map<String, Object> map, HttpServletRequest request) throws Exception{
		MultipartHttpServletRequest multipartHttpServletRequest = (MultipartHttpServletRequest)request;
		Iterator<String> iterator = multipartHttpServletRequest.getFileNames();

		String filePath = request.getSession().getServletContext().getRealPath("/resources/images/board/");
		
		MultipartFile multipartFile = null;
		String originalFileName = null;
		String originalFileExtension = null;
		String storedFileName = null;

		List<Map<String,Object>> list = new ArrayList<Map<String,Object>>();
		Map<String, Object> listMap = null; 

		String boardIdx = (String)map.get("BOARD_NO");
		String id = (String)map.get("BOARD_CREA_ID");
		String requestName = null;
		String idx = null;


		while(iterator.hasNext()){
			multipartFile = multipartHttpServletRequest.getFile(iterator.next());
			if(multipartFile.isEmpty() == false){
				originalFileName = multipartFile.getOriginalFilename();
				originalFileExtension = originalFileName.substring(originalFileName.lastIndexOf("."));
				storedFileName = CommonUtils.getRandomString() + originalFileExtension;

				multipartFile.transferTo(new File(filePath + storedFileName));

				listMap = new HashMap<String,Object>();
				listMap.put("IS_NEW", "Y");
				listMap.put("BOARD_NO", boardIdx);
				listMap.put("BOARD_CREA_ID", id);
				listMap.put("BOARD_ORIGINAL_FILE_NAME", originalFileName);
				listMap.put("BOARD_STORED_FILE_NAME", storedFileName);
				listMap.put("BOARD_FILE_SIZE", multipartFile.getSize());
				list.add(listMap);
			}
			else{
				requestName = multipartFile.getName();
				idx = "BOARD_FILE_NO_"+requestName.substring(requestName.indexOf("_")+1);
				if(map.containsKey(idx) == true && map.get(idx) != null){
					listMap = new HashMap<String,Object>();
					listMap.put("IS_NEW", "N");
					listMap.put("BOARD_FILE_NO", map.get(idx));
					list.add(listMap);
				}
			}
		}
		return list;
	}


	// 위탁장소등록
	public List<Map<String, Object>> parseInsertPesiterImage(Map<String, Object> map, HttpServletRequest request)
			throws Exception {

		MultipartHttpServletRequest multipartHttpServletRequest = (MultipartHttpServletRequest) request;
		Iterator<String> iterator = multipartHttpServletRequest.getFileNames();
		MultipartFile multipartFile = null;
		String originalFileName = null;
		String originalFileExtension = null;
		String storedFileName = null;

		List<Map<String,Object>> list = new ArrayList<Map<String,Object>>();
		Map<String, Object> listMap = null; 

		String mem_id = (String) map.get("PSMEM_ID");
		File file = new File(filePath);

		// 파일을 저장할 경로에 해당폴더가 없으면 폴더를 생성
		if (file.exists() == false) {
			file.mkdirs();
		}

		while (iterator.hasNext()) {

			multipartFile = multipartHttpServletRequest.getFile(iterator.next());

			if (multipartFile.isEmpty() == false) {
				// 파일의 정보를 받아서 새로운 이름으로 변경하는 부분
				originalFileName = multipartFile.getOriginalFilename();
				originalFileExtension = originalFileName.substring(originalFileName.lastIndexOf("."));

				storedFileName = CommonUtils.getRandomString() + originalFileExtension;
				file = new File(filePath + storedFileName);
				multipartFile.transferTo(file);
				listMap = new HashMap<String, Object>();
				listMap.put("PSMEM_ID", mem_id);
				listMap.put("PSMEM_ORIGINAL_FILE_NAME", originalFileName);
				listMap.put("PSMEM_STORED_FILE_NAME", storedFileName);
				listMap.put("PSMEM_FILE_SIZE", multipartFile.getSize());
				list.add(listMap);
			}
		}
		return list;
	}

	//자격증 등록
	/*
	public List<Map<String, Object>> parseInsertLicense(Map<String, Object> map, HttpServletRequest request)
			throws Exception {

		MultipartHttpServletRequest multipartHttpServletRequest = (MultipartHttpServletRequest) request;
		Iterator<String> iterator = multipartHttpServletRequest.getFileNames();
		MultipartFile multipartFile = null;
		String originalFileName = null;
		String originalFileExtension = null;
		String storedFileName = null;
		List<Map<String, Object>> list = new ArrayList<Map<String, Object>>();
		Map<String, Object> listMap = null;
		//String boardIdx = (String)map.get("IDX");
		String mem_id = (String) map.get("PSMEM_ID");
		File file = new File(filePath);

		// 파일을 저장할 경로에 해당폴더가 없으면 폴더를 생성
		if (file.exists() == false) {
			file.mkdirs();
		}

		while (iterator.hasNext()) {

			multipartFile = multipartHttpServletRequest.getFile(iterator.next());

			if (multipartFile.isEmpty() == false) {
				// 파일의 정보를 받아서 새로운 이름으로 변경하는 부분
				originalFileName = multipartFile.getOriginalFilename();
				originalFileExtension = originalFileName.substring(originalFileName.lastIndexOf("."));

				storedFileName = CommonUtils.getRandomString() + originalFileExtension;
				file = new File(filePath + storedFileName);
				multipartFile.transferTo(file);
				listMap = new HashMap<String, Object>();
				listMap.put("PSMEM_ID", mem_id);
				listMap.put("PSMEM_LICENSE_FILE", originalFileName);
				listMap.put("PSMEM_LICENSE_FILE_SIZE", multipartFile.getSize());
				list.add(listMap);
			}
		}
		return list;
	}*/

	// 프로필파일업로드
	public List<Map<String, Object>> parseInsertFileInfo(Map<String, Object> map, HttpServletRequest request) throws Exception {
		String filePath = request.getSession().getServletContext().getRealPath("/resources/downimage/");
		MultipartHttpServletRequest multipartHttpServletRequest = (MultipartHttpServletRequest) request;
		Iterator<String> iterator = multipartHttpServletRequest.getFileNames();
		MultipartFile multipartFile = null;
		String originalFileName = null;
		String originalFileExtension = null;
		String storedFileName = null;
		List<Map<String, Object>> list = new ArrayList<Map<String, Object>>();
		Map<String, Object> listMap = null;
		// String boardIdx = (String)map.get("IDX");
		String id = (String) map.get("ID");

		//회원가입시 프로필 등록을 위한 ID구분을 위해  -> 이거 구분 필요없이 ID로 받으면 의미없지 않나?
		if(map.get("MEM_ID")!=null) {
			id = (String)map.get("MEM_ID");
		}else if(map.get("PSMEM_ID")!=null) {
			id=(String)map.get("PSMEM_ID");
		}else if(map.get("PET_MEM_ID")!=null){
			id=(String)map.get("PET_MEM_ID");
		}

		File file = new File(filePath);

		// 파일을 저장할 경로에 해당폴더가 없으면 폴더를 생성
		if (file.exists() == false) {
			file.mkdirs();
		}

		while (iterator.hasNext()) {

			multipartFile = multipartHttpServletRequest.getFile(iterator.next());

			if (multipartFile.isEmpty() == false) {
				// 파일의 정보를 받아서 새로운 이름으로 변경하는 부분
				originalFileName = multipartFile.getOriginalFilename();
				originalFileExtension = originalFileName.substring(originalFileName.lastIndexOf("."));

				storedFileName = CommonUtils.getRandomString() + originalFileExtension;
				file = new File(filePath + storedFileName);
				multipartFile.transferTo(file);
				listMap = new HashMap<String, Object>();
				listMap.put("ID", id);
				// listMap.put("PET_MEM_ID", "NULL");
				listMap.put("PROFILE_ORIGINAL_FILE_NAME", originalFileName);
				listMap.put("PROFILE_STORED_FILE_NAME", storedFileName);
				listMap.put("PROFILE_FILE_SIZE", multipartFile.getSize());

				list.add(listMap);
			}
		}
		return list;
	}

	// 위탁장소등록
	public List<Map<String, Object>> parseInsertPlace(Map<String, Object> map, HttpServletRequest request)
			throws Exception {
		String filePath = request.getSession().getServletContext().getRealPath("/resources/downimage/");
		MultipartHttpServletRequest multipartHttpServletRequest = (MultipartHttpServletRequest) request;
		Iterator<String> iterator = multipartHttpServletRequest.getFileNames();
		MultipartFile multipartFile = null;
		String originalFileName = null;
		String originalFileExtension = null;
		String storedFileName = null;
		List<Map<String, Object>> list = new ArrayList<Map<String, Object>>();
		Map<String, Object> listMap = null;
		// String boardIdx = (String)map.get("IDX");
		String mem_id = (String) map.get("PSMEM_ID");
		File file = new File(filePath);

		// 파일을 저장할 경로에 해당폴더가 없으면 폴더를 생성
		if (file.exists() == false) {
			file.mkdirs();
		}

		while (iterator.hasNext()) {

			multipartFile = multipartHttpServletRequest.getFile(iterator.next());

			if (multipartFile.isEmpty() == false) {
				// 파일의 정보를 받아서 새로운 이름으로 변경하는 부분
				originalFileName = multipartFile.getOriginalFilename();
				originalFileExtension = originalFileName.substring(originalFileName.lastIndexOf("."));

				storedFileName = CommonUtils.getRandomString() + originalFileExtension;
				file = new File(filePath + storedFileName);
				multipartFile.transferTo(file);
				listMap = new HashMap<String, Object>();
				listMap.put("PSMEM_ID", mem_id);
				listMap.put("PSMEM_ORIGINAL_FILE_NAME", originalFileName);
				listMap.put("PSMEM_STORED_FILE_NAME", storedFileName);
				listMap.put("PSMEM_FILE_SIZE", multipartFile.getSize());
				list.add(listMap);
			}
		}
		return list;
	}

	//2020.03.06 지연수정 : 자격증 등록  
	public List<Map<String, Object>> parseInsertCerti(Map<String, Object> map, HttpServletRequest request)
			throws Exception {

		String filePath = request.getSession().getServletContext().getRealPath("/resources/downimage/");
		MultipartHttpServletRequest multipartHttpServletRequest = (MultipartHttpServletRequest) request;
		Iterator<String> iterator = multipartHttpServletRequest.getFileNames();
		MultipartFile multipartFile = null;
		String originalFileName = null;
		String originalFileExtension = null;
		String storedFileName = null;
		List<Map<String, Object>> list = new ArrayList<Map<String, Object>>();
		Map<String, Object> listMap = null;
		//String boardIdx = (String)map.get("IDX");
		String mem_id = (String) map.get("PSMEM_ID");

		String[] Certi_name = request.getParameterValues("CERTI_NAME");
		String[] Certi_org = request.getParameterValues("CERTI_ORG");
		String[] Certi_date = request.getParameterValues("CERTI_DATE");

		File file = new File(filePath);

		// 파일을 저장할 경로에 해당폴더가 없으면 폴더를 생성
		if (file.exists() == false) {
			file.mkdirs();
		}

		int i = 0; //자격증 파일 이름,기관,일자정보가 담긴 배열을 구분하기 위한 index

		while (iterator.hasNext()) {

			multipartFile = multipartHttpServletRequest.getFile(iterator.next());

			if (multipartFile.isEmpty() == false) {
				// 파일의 정보를 받아서 새로운 이름으로 변경하는 부분
				originalFileName = multipartFile.getOriginalFilename();
				originalFileExtension = originalFileName.substring(originalFileName.lastIndexOf("."));

				storedFileName = CommonUtils.getRandomString() + originalFileExtension;
				file = new File(filePath + storedFileName);
				multipartFile.transferTo(file);
				listMap = new HashMap<String, Object>();
				listMap.put("PSMEM_ID", mem_id);
				listMap.put("CERTI_NAME", Certi_name[i]);
				listMap.put("CERTI_ORG", Certi_org[i]);
				listMap.put("CERTI_DATE", Certi_date[i]);
				listMap.put("PROFILE_ORIGINAL_FILE_NAME", originalFileName);
				listMap.put("PROFILE_STORED_FILE_NAME", storedFileName);
				listMap.put("PROFILE_FILE_SIZE", multipartFile.getSize());
				list.add(listMap);
			}
			i++;
		}
		return list;
	}

	//프로필 파일 수정
	public List<Map<String, Object>> parseUpdateFileInfo_profile(Map<String, Object> map, HttpServletRequest request) throws Exception{

		String filePath = request.getSession().getServletContext().getRealPath("/resources/downimage/");
		MultipartHttpServletRequest multipartHttpServletRequest = (MultipartHttpServletRequest)request;
		Iterator<String> iterator = multipartHttpServletRequest.getFileNames();

		MultipartFile multipartFile = null;
		String originalFileName = null;
		String originalFileExtension = null;
		String storedFileName = null;

		List<Map<String,Object>> list = new ArrayList<Map<String,Object>>();
		Map<String, Object> listMap = null; 

		String id = (String)map.get("ID");
		String requestName = null;
		String idx = null;

		while(iterator.hasNext()){  //첨부 파일이 있으면
			multipartFile = multipartHttpServletRequest.getFile(iterator.next());
			if(multipartFile.isEmpty() == false){
				originalFileName = multipartFile.getOriginalFilename();  //파일이름 가져오기
				originalFileExtension = originalFileName.substring(originalFileName.lastIndexOf(".")); // 파일타입(.jpg/.png등등)
				storedFileName = CommonUtils.getRandomString() + originalFileExtension; //저장될때 파일 이름

				multipartFile.transferTo(new File(filePath + storedFileName)); 

				listMap = new HashMap<String,Object>();
				listMap.put("IS_NEW", "Y");  //새로운 파일이라고 표시
				listMap.put("ID", id); 
				listMap.put("PROFILE_ORIGINAL_FILE_NAME", originalFileName); 
				listMap.put("PROFILE_STORED_FILE_NAME", storedFileName); 
				listMap.put("PROFILE_FILE_SIZE", multipartFile.getSize()); 
				list.add(listMap);
			}
			else{  //기존에 있던 파일이면
				requestName = multipartFile.getName();
				idx = "BOARD_FILE_NO_"+requestName.substring(requestName.indexOf("_")+1);
				if(map.containsKey(idx) == true && map.get(idx) != null){
					listMap = new HashMap<String,Object>();
					listMap.put("IS_NEW", "N");
					listMap.put("BOARD_FILE_NO", map.get(idx));
					list.add(listMap);
				}
			}
		}
		return list;
	}


	//위탁장소 이미지파일 수정
	public List<Map<String, Object>> parseUpdateFileInfo_PstPlace(Map<String, Object> map, HttpServletRequest request) throws Exception{

		String filePath = request.getSession().getServletContext().getRealPath("/resources/downimage/");
		MultipartHttpServletRequest multipartHttpServletRequest = (MultipartHttpServletRequest)request;
		Iterator<String> iterator = multipartHttpServletRequest.getFileNames();

		MultipartFile multipartFile = null;
		String originalFileName = null;
		String originalFileExtension = null;
		String storedFileName = null;

		List<Map<String,Object>> list = new ArrayList<Map<String,Object>>();
		Map<String, Object> listMap = null; 

		String id = (String)map.get("PSMEM_ID");
		String requestName = null;
		String idx = null;

		while(iterator.hasNext()){
			multipartFile = multipartHttpServletRequest.getFile(iterator.next());
			if(multipartFile.isEmpty() == false){
				originalFileName = multipartFile.getOriginalFilename();
				originalFileExtension = originalFileName.substring(originalFileName.lastIndexOf("."));
				storedFileName = CommonUtils.getRandomString() + originalFileExtension;

				multipartFile.transferTo(new File(filePath + storedFileName));

				listMap = new HashMap<String,Object>();
				listMap.put("IS_NEW", "Y");
				listMap.put("PSMEM_ID", id);
				listMap.put("PSMEM_ORIGINAL_FILE_NAME", originalFileName);
				listMap.put("PSMEM_STORED_FILE_NAME", storedFileName);
				listMap.put("PSMEM_FILE_SIZE", multipartFile.getSize());
				list.add(listMap);
			}
			else{
				requestName = multipartFile.getName();
				idx = "PSMEM_FILE_NO_"+requestName.substring(requestName.indexOf("_")+1);
				if(map.containsKey(idx) == true && map.get(idx) != null){
					listMap = new HashMap<String,Object>();
					listMap.put("IS_NEW", "N");
					listMap.put("PSMEM_FILE_NO", map.get(idx));
					list.add(listMap);
				}
			}
		}
		return list;
	}
	
	//자격증 정보 수정
	public List<Map<String, Object>> parseUpdateFileInfo_PstCerti(Map<String, Object> map, HttpServletRequest request) throws Exception{

		String filePath = request.getSession().getServletContext().getRealPath("/resources/downimage/");
		MultipartHttpServletRequest multipartHttpServletRequest = (MultipartHttpServletRequest)request;
		Iterator<String> iterator = multipartHttpServletRequest.getFileNames();
		
		MultipartFile multipartFile = null;
		String originalFileName = null;
		String originalFileExtension = null;
		String storedFileName = null;

		String[] Certi_name = request.getParameterValues("CERTI_NAME");
		String[] Certi_org = request.getParameterValues("CERTI_ORG");
		String[] Certi_date = request.getParameterValues("CERTI_DATE");

		int i = 0; //자격증 파일 이름,기관,일자정보가 담긴 배열을 구분하기 위한 index
		
		List<Map<String,Object>> list = new ArrayList<Map<String, Object>>();
		Map<String, Object> listMap = null;

		String id = (String) map.get("PSMEM_ID");
		String requestName = null;
		String idx = null;

		while(iterator.hasNext()) {
			multipartFile = multipartHttpServletRequest.getFile(iterator.next());
			if(multipartFile.isEmpty() == false){
				originalFileName = multipartFile.getOriginalFilename();
				originalFileExtension = originalFileName.substring(originalFileName.lastIndexOf("."));
				storedFileName = CommonUtils.getRandomString() + originalFileExtension;

				multipartFile.transferTo(new File(filePath + storedFileName));

				listMap = new HashMap<String,Object>();
				listMap.put("IS_NEW", "Y");
				listMap.put("PSMEM_ID", id);
				listMap.put("CERTI_NAME", Certi_name[i]);
				listMap.put("CERTI_ORG", Certi_org[i]);
				listMap.put("CERTI_DATE", Certi_date[i]);
				listMap.put("PROFILE_ORIGINAL_FILE_NAME", originalFileName);
				listMap.put("PROFILE_STORED_FILE_NAME", storedFileName);
				listMap.put("PROFILE_FILE_SIZE", multipartFile.getSize());
				list.add(listMap);
			}
			else{
				requestName = multipartFile.getName();
				idx = "CERTI_FILE_NO_" + requestName.substring(requestName.indexOf("_") + 1);
				
				if(map.containsKey(idx) == true && map.get(idx) != null){
					listMap = new HashMap<String,Object>();
					listMap.put("IS_NEW", "N");
					listMap.put("CERTI_NO", map.get(idx));
					list.add(listMap);
				}
			}
			i++;
		}
		return list;
	}
}


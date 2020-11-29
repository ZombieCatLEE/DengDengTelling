//2020.02.11. PM6:10
/* MyInfoService MyInfoController MyInfoDAO
http://localhost:8080/ninaebang/myPage/MyInfoDetail		내 정보 보기	/myInfo/MyInfoDetail		MyInfoDetail()		selectInfoDetail	MyInfoDetail.jsp
http://localhost:8080/ninaebang/myPage/MyInfoModifyForm	정보 수정 폼	/myInfo/MyInfoModifyForm	MyInfoModify()		selectInfoDetail	MyInfoModifyForm.jsp	
http://localhost:8080/ninaebang/myPage/MyInfoModify		내 정보 수정	/myInfo/MyInfoModify		MyInfoModify()-post	updateInfoModify	MyInfoModify.jsp	
http://localhost:8080/ninaebang/myPage/MyInfoDeleteComfirm회원탈퇴-비밀번호확인						MyInfoDelete.jsp	
http://localhost:8080/ninaebang/myPage/MyInfoDelete		회원탈퇴	/myInfo/MyInfoDelete		MyInfoDelete()		deleteInfo			redirect: main	*/
package project.common.mypage;
import java.util.Map;
import java.io.PrintWriter;
import java.math.BigDecimal;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Calendar;
import java.util.Date;
import java.util.Enumeration;
import java.util.HashMap;
import java.util.List;
import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import org.springframework.web.servlet.support.RequestContextUtils;

import project.common.common.CommandMap;
import project.common.mypage.MyInfoService;
import project.common.join.JoinService;
import project.common.match.MatchService;

@Controller
public class MyInfoController {
	@Resource(name="myInfoService") 
	private MyInfoService myInfoService;

	@Resource(name="joinService") 
	private JoinService joinService;
	
	@Resource(name="matchService")
	private MatchService matchService;
	
	///MyInfoDetail  마이페이지 회원정보 상세보기
	@RequestMapping(value="/MyInfodetail")
	public ModelAndView MyInfoDetail(CommandMap commandMap, HttpServletRequest request) throws Exception{

		HttpSession session = request.getSession();
		String id = (String)session.getAttribute("ID");
		String mem_type = (String)session.getAttribute("MEM_TYPE");
		commandMap.put("MEM_TYPE",mem_type);
		commandMap.put("ID",id);

		//펫시터일때
		if(mem_type.equals("펫시터")){ 
			ModelAndView mv = new ModelAndView("mypage/pstMyInfo");
			commandMap.put("PSMEM_ID",id);
			Map<String,Object> map = myInfoService.selectPstMyInfoDetail(commandMap.getMap());	//해당 ID값으로 회원상세정보들을 읽어온후 map에 저장. 
			Map<String,Object> map1 = myInfoService.selectPstMyInfoAddDetail(commandMap.getMap());  //펫시터 추가 정보 불러오기
			List<Map<String, Object>> certi = myInfoService.selectCertiInfo(commandMap.getMap()); //펫시터 자격증 정보 불러오기
			List<Map<String, Object>> list = myInfoService.selectPstPlaceInfo(commandMap.getMap()); //펫시터 위탁장소 이미지 불러오기

			mv.addObject("map",map); //회원정보를 담은 map을 mv에 저장
			mv.addObject("map1",map1); //회원정보를 담은 map을 mv에 저장
			mv.addObject("certi", certi); //펫시터 자격증 정보 mv에 저장
			mv.addObject("list", list); //위탁장소 이미지 저장
			
			if(myInfoService.selectProfile(commandMap.getMap()) != null) {
				Map<String, Object> pathMap = new HashMap<String, Object>();
				pathMap = myInfoService.selectProfile(commandMap.getMap());
				String path = (String) pathMap.get("PROFILE_STORED_FILE_NAME");

				mv.addObject("path", path); //프로필 저장경로를 mv에 저장
			}
			
			return mv;
		} 

		//일반회원일때
		ModelAndView mv = new ModelAndView("mypage/memMyInfo");
		commandMap.put("MEM_ID",id);
		Map<String,Object> map = myInfoService.selectMemMyInfoDetail(commandMap.getMap());	//해당 ID값으로 회원상세정보들을 읽어온후 map에 저장. 
		mv.addObject("map",map); //회원정보를 담은 map을 mv에 저장

		if(myInfoService.selectProfile(commandMap.getMap()) != null) {
			Map<String, Object> pathMap = new HashMap<String, Object>();
			pathMap = myInfoService.selectProfile(commandMap.getMap());  //DB에서  MEM_ID값으로 저장된 프로필이미지파일이름을 가져온다.
			String path = (String) pathMap.get("PROFILE_STORED_FILE_NAME");

			mv.addObject("path", path); //프로필 저장경로를 mv에 저장
		}
		return mv;
	}

	///MyInfoModifyForm  회원정보수정시 . 회원정보상세보기에서 수정버튼을 누르면 여기로 이동
	@RequestMapping(value="/memInfoModifyForm")
	public ModelAndView MyInfoModifyForm(CommandMap commandMap, HttpServletRequest request) throws Exception{

		System.out.println("-----------------memInfoModify 컨트롤러들어옴------------");

		HttpSession session = request.getSession();
		String id = (String) session.getAttribute("ID");  //수정할 회원의 정보를 읽어오기 위해 ID값을 가져온다. 
		String mem_type = (String)session.getAttribute("MEM_TYPE"); //회원유형에 따라 
		commandMap.put("MEM_TYPE",mem_type); 
		commandMap.put("ID", id);

		List<Map<String, Object>> list = null;

		//펫시터일때
		if(mem_type.equals("펫시터")){
			ModelAndView mv = new ModelAndView("mypage/pstModify");
			commandMap.put("PSMEM_ID",id); //id값을 map에 저장하고
			Map<String,Object> map = myInfoService.selectPstMyInfoDetail(commandMap.getMap()); //수정할 회원의 정보들을 읽어온후 map에 저장
			Map<String,Object> map1 = myInfoService.selectPstMyInfoAddDetail(commandMap.getMap()); //추가 정보를 읽어온후 map1에 저장
			List<Map<String, Object>> certi = myInfoService.selectCertiInfo(commandMap.getMap()); //펫시터 자격증 정보 불러오기
			list = myInfoService.selectPstPlaceInfo(commandMap.getMap()); //펫시터 위탁장소 이미지정보 불러오기

			mv.addObject("map",map); // map을 mv에 저장
			mv.addObject("map1",map1); // map을 mv에 저장
			mv.addObject("certi", certi); //펫시터 자격증 정보 mv에 저장
			mv.addObject("list", list); //위탁장소 이미지 저장

			if(myInfoService.selectProfile(commandMap.getMap()) != null) {
				Map<String, Object> pathMap = new HashMap<String, Object>();
				pathMap = myInfoService.selectProfile(commandMap.getMap());  //DB에서  MEM_ID값으로 저장된 프로필이미지파일이름을 가져온다.
				String path = (String) pathMap.get("PROFILE_STORED_FILE_NAME");
				
				mv.addObject("path", path); //프로필 저장경로를 mv에 저장
			}

			Map<String,Object> map2 = myInfoService.selectProfileInfo(commandMap.getMap());	//프로필 이미지 정보 가져오기
			mv.addObject("map2", map2);

			return mv;
		}

		//일반회원일때
		ModelAndView mv = new ModelAndView("mypage/memModify");
		commandMap.put("MEM_ID",id); //id값을 map에 저장하고
		Map<String,Object> map = myInfoService.selectMemMyInfoDetail(commandMap.getMap()); //수정할 회원의 정보들을 읽어온후 map에 저장
		mv.addObject("map",map); // map을 mv에 저장

		if(myInfoService.selectProfile(commandMap.getMap()) != null) {
			Map<String, Object> pathMap = new HashMap<String, Object>();
			pathMap = myInfoService.selectProfile(commandMap.getMap());  //DB에서  MEM_ID값으로 저장된 프로필이미지파일이름을 가져온다.
			String path = (String) pathMap.get("PROFILE_STORED_FILE_NAME");
			
			mv.addObject("path", path); //프로필 저장경로를 mv에 저장
		}
		
		Map<String,Object> map1 = myInfoService.selectProfileInfo(commandMap.getMap());	//프로필 이미지 정보 가져오기
		mv.addObject("map1", map1);

		return mv;
	}

	///MyInfoModify  회원정보수정. 회원정보수정페이지에서 정보수정후 확인버튼을 누르면 여기로 이동함. 
	@RequestMapping(value="/memInfoModify") 
	public ModelAndView MyInfoModify(CommandMap commandMap, HttpServletRequest request, HttpServletResponse response)throws Exception{
		ModelAndView mv = new ModelAndView("redirect:/memInfoModifyForm");	
		HttpSession session = request.getSession();
		
		Enumeration<String> params = request.getParameterNames();	//넘어온 값 확인 Request
		
		while(params.hasMoreElements()) {
			String name = (String) params.nextElement();
			System.out.println(name + " : " + request.getParameter(name));
		}
		
		String id = (String) session.getAttribute("ID");
		String mem_type = (String)session.getAttribute("MEM_TYPE");
		String profile_num = (String)commandMap.get("PROFILE_NO"); //프로필 수정을 위한 프로필번호값
		System.out.println("id : " + id + ", mem_type : " + mem_type + ", profile_num : " + profile_num);
		
		commandMap.put("MEM_TYPE", mem_type); //회원유형에 따라 DAO에서 다른 SQL문 수행
		commandMap.put("ID", id);

		//펫시터일때
		if(mem_type.equals("펫시터")) {
			commandMap.put("PSMEM_ID", id);
			
			for(Map.Entry<String, Object> entry : commandMap.entrySet()) {
				System.out.println("[key] : " + entry.getKey() + ", " + "[value] : " + entry.getValue());
			}
			
			myInfoService.updateMyInfoModify(commandMap.getMap(), request);	
			System.out.println("컨트롤러 MyInfoModify 펫시터일때");
			//	myInfoService.updatePstPlace(commandMap.getMap(), request);
			
			//String message = "정상적으로 수정되었습니다.";
			//mv.addObject("message", message);
			
			return mv;
		}

		//일반회원일때
		commandMap.put("MEM_ID",id);
		commandMap.put("PROFILE_NO", profile_num);
		
		myInfoService.updateMyInfoModify(commandMap.getMap(), request);
		System.out.println("멤버 쿼리 후");
		//String message = "정상적으로 수정되었습니다.";
		//mv.addObject("message", message);
		
		return mv;
	}


	//modifyPstPlaceForm 위탁장소 이미지 수정하기폼 페이지
	@RequestMapping(value="/modifyPstPlaceForm")
	public ModelAndView modifyPstPlaceForm(CommandMap commandMap, HttpServletRequest request) throws Exception{
		ModelAndView mv = new ModelAndView("mypage/pstModify3");

		HttpSession session = request.getSession();
		String id = (String) session.getAttribute("ID");
		System.out.println("위탁장소 이미지 새창에서 ID값은" +id);
		commandMap.put("PSMEM_ID",id); //id값을 map에 저장하고
		commandMap.put("ID",id); //id값을 map에 저장하고
		List<Map<String, Object>> list = myInfoService.selectPstPlaceInfo(commandMap.getMap()); //펫시터 위탁장소 이미지 정보불러오기
		mv.addObject("list", list); //위탁장소 이미지 저장

		return mv;
	}

	//modifyPstPlace 위탁장소 이미지 수정하기
	@RequestMapping(value="/modifyPstPlace")
	public ModelAndView modifyPstPlace(CommandMap commandMap, HttpServletRequest request) throws Exception{

		ModelAndView mv = new ModelAndView("redirect:/MyInfodetail");

		HttpSession session = request.getSession();
		String id = (String) session.getAttribute("ID");
		commandMap.put("PSMEM_ID",id);
		myInfoService.updatePstPlace(commandMap.getMap(), request);
		
		return mv;
	}

	//modifyCertiForm 자격증파일 수정 페이지
	@RequestMapping(value="/modifyCertiForm")
	public ModelAndView modifyCertiForm(CommandMap commandMap, HttpServletRequest request) throws Exception{
		ModelAndView mv = new ModelAndView("mypage/pstModifyCerti");

		HttpSession session = request.getSession();
		
		String id = (String) session.getAttribute("ID");
		commandMap.put("PSMEM_ID",id); //id값을 map에 저장하고
		commandMap.put("ID",id); //id값을 map에 저장하고
		List<Map<String, Object>> certi = myInfoService.selectCertiInfo(commandMap.getMap()); //펫시터 자격증 정보 불러오기
		mv.addObject("certi", certi); //자격증정보

		return mv;
	}

	//modifyCerti  자격증 수정하기
	@RequestMapping(value="/modifyCerti")
	public ModelAndView modifyCerti(CommandMap commandMap, HttpServletRequest request) throws Exception{
		
		ModelAndView mv = new ModelAndView("redirect:/MyInfodetail");

		HttpSession session = request.getSession();
		String id = (String) session.getAttribute("ID");	
		commandMap.put("PSMEM_ID",id);
		myInfoService.updateCerti(commandMap.getMap(), request);
		
		return mv;
	}

	//MyInfoDeleteComfirm 회원탈퇴 신청하기 페이지
	@RequestMapping(value="/memDeleteComfirm")
	public ModelAndView MyInfoDeleteConfirm(CommandMap commandMap, HttpServletRequest request) throws Exception{
		ModelAndView mv = new ModelAndView("mypage/memDelete");
		return mv;
	}
	
	//회원 탈퇴
	@RequestMapping(value="/myInfoDelete")
	public ModelAndView MyInfoDelete(CommandMap commandMap, HttpServletRequest request)throws Exception{
		ModelAndView mv=new ModelAndView("mypage/delete");	
		HttpSession session = request.getSession();
		Map<String, Object> map = new HashMap<String, Object>();
		
		if(request.getParameter("MEM_TYPE").equals("일반 회원")) {
			map.put("MEM_ID", request.getParameter("ID"));
		} else if(request.getParameter("MEM_TYPE").equals("펫시터")) {
			map.put("PSMEM_ID", request.getParameter("ID"));
		}
		
		map.put("ID", request.getParameter("ID"));
		map.put("PASSWORD1", request.getParameter("PASSWORD1"));
		
		int res = myInfoService.deleteMyInfo(map);	
		
		//비밀번호가 맞아서 탈퇴처리될때 로그아웃
		if(res==1) {
			session.invalidate();
		}
		mv.addObject("res",res);
		return mv;
	}

	///myPetList 마이펫리스트 멤버 / 펫시터 공통
	@RequestMapping(value="/myPetList")
	public ModelAndView MyPetList(Map<String, Object> commandMap, HttpServletRequest request) throws Exception{
		ModelAndView mv = new ModelAndView("mypage/memPetList");
		HttpSession session = request.getSession();
		
		String id = (String) session.getAttribute("ID");
		commandMap.put("ID", id);

		List<Map<String, Object>> petList = matchService.selPet(commandMap);
		int count = petList.size();
		System.out.println("Map의 size : " + count);
		
		mv.addObject("count", count);
		mv.addObject("petList", petList);
		
		return mv;
	}	
	
	//찜 목록
	@RequestMapping(value="/myBookMark")
	public ModelAndView myBookMark(Map<String, Object> commandMap, HttpSession session) throws Exception {
		ModelAndView mv = new ModelAndView("mypage/myBookMark");

		String id = (String)session.getAttribute("ID");
		commandMap.put("MEM_ID", id);
		
		List<Map<String, Object>> bookList = myInfoService.selectMyBookMarkList(commandMap);

		int count = bookList.size();
		System.out.println("매치 등록 건수 : " + count);
		
		mv.addObject("addList", bookList);
		mv.addObject("count", count);
		
		return mv;
	}
	//찜 디테일
	@RequestMapping(value="/bookListDetail")
	public ModelAndView bookListDetail(Map<String, Object> commandMap, @RequestParam("ID") String ID) throws Exception {
		ModelAndView mv = new ModelAndView("redirect:/matchDetailGo");
		
		Map<String, Object> map = new HashMap<String, Object>();
		
		map = myInfoService.bookMarkdetail(ID);
		
		int seq = ((BigDecimal) map.get("MATCH_NO")).intValue();

		mv.addObject("seq", seq);
		mv.addObject("ID", ID);
		return mv;
	}
	
	//댕댕이 삭제 지연 수정 2020.03.11
	@RequestMapping(value="/myPetDelete")
	public ModelAndView myPetDelete(@RequestParam("PET_MEM_ID") String PET_MEM_ID) throws Exception {
		ModelAndView mv = new ModelAndView("mypage/myPetDeleteResult");
		
		myInfoService.myPetDelete(PET_MEM_ID);
		
		String message = "삭제하였습니다.";
		String url = "/myPetList";
		mv.addObject("message", message);
		mv.addObject("url", url);

		return mv;
	}

	//매칭 리스트 멤버 / 펫시터 공통
	@RequestMapping(value="/memMatchList")
	public ModelAndView memMatchList(Map<String, Object> commandMap, HttpSession session) throws Exception {
		ModelAndView mv = new ModelAndView("mypage/memMatchList");
		
		String id = (String)session.getAttribute("ID");
		
		String type = (String)session.getAttribute("MEM_TYPE");
		
		if(type.equals("일반 회원")) {
			commandMap.put("MEM_ID", id);
			
			List<Map<String, Object>> matchList = myInfoService.memMatchList(commandMap);
			
			int count = matchList.size();
			
			mv.addObject("count", count);
			mv.addObject("matchList", matchList);
		} else if(type.equals("펫시터")) {
			commandMap.put("PSMEM_ID", id);
			
			List<Map<String, Object>> matchList = myInfoService.petMatchList(commandMap);
			
			int count = matchList.size();
			
			mv.addObject("count", count);
			mv.addObject("matchList", matchList);
		}
		
		return mv;
	}
	
	//마이펫 디테일 중간 단계
	@RequestMapping(value = "/myPetDetail")
	public ModelAndView metchDetailGo(CommandMap commandMap, @RequestParam("petId") String petId, RedirectAttributes redirectattributes) {
		ModelAndView mv = new ModelAndView("redirect:/myPetDetailForm");
		redirectattributes.addFlashAttribute("petId", petId);
		return mv;
	}
	
	//마이펫 디테일
	@RequestMapping(value="/myPetDetailForm")
	public ModelAndView myPetDetail(CommandMap commandMap, HttpServletRequest request) throws Exception {
		ModelAndView mv = new ModelAndView("mypage/petDetail");
		
		Map<String, Object> map = new HashMap<String, Object>();
		
		String PET_ID = "";
		
		Map<String, ?> flashMap = RequestContextUtils.getInputFlashMap(request);
		if(flashMap != null) {
			PET_ID = (String) flashMap.get("petId");
		}
		
		map.put("ID", PET_ID);
		
		Map<String, Object> detail = myInfoService.selectMyPetDeatail(PET_ID);
		Map<String, Object> detailAdd = myInfoService.selectMyPetAddDeatail(PET_ID);
		Map<String, Object> profile = myInfoService.selectProfile(map);
		
		mv.addObject("detail", detail);
		mv.addObject("detailAdd", detailAdd);
		mv.addObject("profile", profile);
		
		return mv;
	}
	
	//마이펫 수정 중간 단계
	@RequestMapping(value = "/myPetModifyForm")
	public ModelAndView myPetModifyForm(CommandMap commandMap, HttpServletRequest request, RedirectAttributes redirectattributes) {
		ModelAndView mv = new ModelAndView("redirect:/myPetModify");
		String petId = request.getParameter("petId");
		redirectattributes.addFlashAttribute("petId", petId);
		return mv;
	}
		
	//마이펫 수정 폼
	@RequestMapping(value="/myPetModify")
	public ModelAndView myPetModify(CommandMap commandMap, HttpServletRequest request) throws Exception {
		ModelAndView mv = new ModelAndView("mypage/petModify");
		
		Map<String, Object> map = new HashMap<String, Object>();
		
		String PET_ID = "";
		
		Map<String, ?> flashMap = RequestContextUtils.getInputFlashMap(request);
		if(flashMap != null) {
			PET_ID = (String) flashMap.get("petId");
		}
		
		map.put("ID", PET_ID);
		
		Map<String, Object> detail = myInfoService.selectMyPetDeatail(PET_ID);
		Map<String, Object> detailAdd = myInfoService.selectMyPetAddDeatail(PET_ID);
		Map<String, Object> profile = myInfoService.selectProfileInfo(map);
		
		mv.addObject("detail", detail);
		mv.addObject("detailAdd", detailAdd);
		mv.addObject("profile", profile);
		
		return mv;
	}
	
	///마이펫 수정
	@RequestMapping(value="/myPetModifySave") 
	public ModelAndView myPetModifySave(CommandMap commandMap, HttpServletRequest request, HttpServletResponse response)throws Exception{
		ModelAndView mv = new ModelAndView("redirect:/myPetDetail");	
		
		Enumeration<String> params = request.getParameterNames();	//넘어온 값 확인 Request
		
		while(params.hasMoreElements()) {
			String name = (String) params.nextElement();
			System.out.println("controller Request " + name + " : " + request.getParameter(name));
		}
		
		String id = request.getParameter("PET_MEM_ID");
		
		commandMap.put("ID", id);
		
		//Map<>에 담긴 값 확인하기
		for(Map.Entry<String, Object> entry : commandMap.entrySet()) {
			System.out.println("controller [key] : " + entry.getKey() + ", " + "[value] : " + entry.getValue());
		}
		
		myInfoService.updateMyPet(commandMap.getMap(), request);
		
		mv.addObject("petId", id);

		return mv;
	}

	//견종 검색 폼
	@RequestMapping(value="/petSearch") 
	public ModelAndView petSearch(CommandMap commandMap)throws Exception{
		ModelAndView mv = new ModelAndView("mypage/petDBSearch");
		
		List<Map<String, String>> list = myInfoService.petInfoSerarch(commandMap.getMap());
		
		mv.addObject("petInfoList", list);
		
		return mv;
	}
	
	//견종 검색
	@RequestMapping(value="/petSearchResult") 
	public ModelAndView petSearchResult(CommandMap commandMap)throws Exception{
		ModelAndView mv = new ModelAndView("redirect:/petSearch");
		
		return mv;
	}
	
	//매칭 내역 디테일 이동 중간 단계
	@RequestMapping(value = "/matchingListDetailGo")
	public ModelAndView metchDetailGo(CommandMap commandMap, @RequestParam("pnum") int pnum, RedirectAttributes redirectattributes) {
		ModelAndView mv = new ModelAndView("redirect:/matchingListDetail");
		redirectattributes.addFlashAttribute("PNUM", pnum);

		return mv;
	}
	
	//매칭 내역 디테일(펫시팅 진행 정보)
	@RequestMapping(value = "/matchingListDetail")
	public ModelAndView matchingListDetail(CommandMap commandMap,  HttpServletRequest request) throws Exception {
		ModelAndView mv = new ModelAndView("/mypage/matchingListDetail");

		Map<String, Object> map = new HashMap<String, Object>();
		Map<String, ?> flashMap = RequestContextUtils.getInputFlashMap(request);
		if(flashMap != null) {
			int PNUM = (int) flashMap.get("PNUM");
			map.put("PNUM", PNUM);
		}
		
		Map<String, Object> pstDetail = matchService.pstDetail(map);					//펫시팅 상세 정보 가져오기
		
		String M_ID = (String) pstDetail.get("MEM_ID");
		String P_ID = (String) pstDetail.get("PSMEM_ID");
		map.put("MEM_ID", M_ID);
		map.put("ID", P_ID);

		Map<String, Object> pstPfl = matchService.selPetsitterProfile(map);				//펫시터 프로필 가져오기
		List<Map<String, Object>> pet = matchService.selPet(map);						//펫시터 펫 정보 가져오기(펫, 추가, 프로필)
		List<Map<String, Object>> pstImg = matchService.selPetsitterAddImg(map);		//위탁 장소 이미지 가져오기
		List<Map<String, Object>> certi = matchService.selCertificate(map);				//자격증 이미지 가져오기

		Map<String, Object> memPfl = matchService.selMemberProfile(map);				//멤버 프로필 가져오기

		//이 부분은 펫시팅에 등록된 펫만 가지고 펫 정보를 가져오는 로직
		Map<String, Object> mapp = new HashMap<String, Object>();
		String petStr = (String) pstDetail.get("PET_ID");
		String[] petArr = null;
		petArr = petStr.split(", ");
		System.out.println("****************************" + Arrays.deepToString(petArr));
		mapp.put("PET_ARR", petArr);

		List<Map<String, Object>> memPet = matchService.selMemPet(mapp);				//멤버 펫 정보 가져오기(펫, 추가, 프로필)

		//서비스 목록 가져오기
		String serviceStr = (String) pstDetail.get("P_SERVICE");
		String[] serviceArr = serviceStr.split(",");
		System.out.println("서비스 목록(배열) : " + Arrays.toString(serviceArr));

		//진행 단계를 위한 날짜 가져가기. 딱히 방법이 안 떠올라서 여기다가 넣는다.
		int step = Integer.parseInt(pstDetail.get("PROGRESS_STEPS").toString());
		if(step == 3) {
			//펫시팅 진행 날짜 비교를 위한 날짜 뽑기
			SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMdd");
			Calendar cal = Calendar.getInstance();

			String nowDates = sdf.format(cal.getTime());
			int nowDay = Integer.parseInt(nowDates);
			System.out.println("오늘 날짜 : " + nowDay);

			//Info에서 넘어온 날짜값 중 필요한 날만 뽑기
			String Dates = (String) pstDetail.get("PETSITTING_DAYS");
			Dates = Dates.replace("-", "");
			String[] Days = Dates.split(", ");

			String firstDays = Days[0];
			String lastDays = Days[Days.length-1];
			int firstDay = Integer.parseInt(firstDays);
			int lastDay = Integer.parseInt(lastDays);
			System.out.println("예약 첫 날 : " + firstDay);
			System.out.println("예약 끝 날 : " + lastDay);

			SimpleDateFormat formatter = new SimpleDateFormat("yyyyMMdd");
			Date nDay = formatter.parse(nowDates);
			Date fDay = formatter.parse(firstDays);
			
			long diff = fDay.getTime() - nDay.getTime();
			long diffDay = diff / (24 * 60 * 60 * 1000);
			
			System.out.println("남은 날짜 : " + diffDay);
			
			mv.addObject("nowDay", nowDay);
			mv.addObject("firstDay", firstDay);
			mv.addObject("lastDay", lastDay);
			mv.addObject("diffDay", diffDay);
		}
		mv.addObject("serviceArr", serviceArr);
		mv.addObject("pstDetail", pstDetail);
		mv.addObject("pstPfl", pstPfl);
		mv.addObject("p_pet", pet);
		mv.addObject("pstImg", pstImg);
		mv.addObject("certi", certi);
		mv.addObject("memPfl", memPfl);
		mv.addObject("m_pet", memPet);

		return mv;
	}
	
	//찜 디테일 중간 단계
	@RequestMapping(value = "/bookmarkDetailGo")
	public ModelAndView bookmarkDetailGo(CommandMap commandMap, @RequestParam Map<String, Object> params, RedirectAttributes redirectattributes) {
		ModelAndView mv = new ModelAndView("redirect:/bookmarkDetail");
		redirectattributes.addFlashAttribute("params", params);
		return mv;
	}


	//찜 디테일
	@RequestMapping(value = "/bookmarkDetail")
	public ModelAndView bookmarkDetail(CommandMap commandmap, HttpServletRequest request) throws Exception {
		ModelAndView mv = new ModelAndView("/mypage/bookmarkDetail");

		Map<String, Object> params = new HashMap<String, Object>();
		Map<String, ?> flashMap = RequestContextUtils.getInputFlashMap(request);
		if(flashMap != null) {
			params = (Map<String, Object>) flashMap.get("params");
		}

		Map<String, Object> mthdtl = matchService.matchDetail(params);					//매치 정보 가져오기

		Map<String, Object> pst = matchService.selPetsitter(params);					//펫시터 정보 가져오기
		Map<String, Object> pstAdd = matchService.selPetsitterAdd(params);				//펫시터 추가 정보 가져오기
		Map<String, Object> pstPfl = matchService.selPetsitterProfile(params);			//펫시터 프로필 가져오기

		List<Map<String, Object>> pet = matchService.selPet(params);					//펫 정보 가져오기
		List<Map<String, Object>> pstImg = matchService.selPetsitterAddImg(params);	//위탁 장소 이미지 가져오기
		List<Map<String, Object>> certi = matchService.selCertificate(params);			//자격증 이미지 가져오기

		//가능한 서비스 목록 가져오기
		String serviceLt = (String) mthdtl.get("POSSIBLE_SERVICE");
		String[] serviceList = serviceLt.split(",");

		System.out.println("가능한 서비스 : " + Arrays.toString(serviceList));

		//가능한 날짜 목록 가져오기
		ArrayList<String> flickr = new ArrayList<String>();

		String date1 = (String) mthdtl.get("MATCH_DATE");
		String[] date2 = date1.split(",");

		System.out.println("선택 가능 날짜(배열) : " + Arrays.toString(date2));

		String date3 = "";

		for(int i = 0; i < date2.length; i++) {
			date3 += '\"' + date2[i] + '\"' + ",";
		}

		System.out.println("큰 따옴표 붙인 날짜(스트링) : " + date3);

		String[] date4 = date3.split(",");

		System.out.println("큰 따옴표 붙인 날짜(배열) : " + Arrays.toString(date4));

		for(String item : date4) {
			flickr.add(item);
		}
		//이 부분은 리스트를 넘겨서 확인하는 부분입니다.
		List<String> chkList = new ArrayList<String>();
		for(String item1 : date4) {
			chkList.add(item1);
		}
		System.out.println("큰 따옴표 붙인 날짜(리스트) : " + chkList);
		//이 위까지 확인 부분입니다.

		mv.addObject("chkList", chkList);			//선택 가능 날짜 리스트
		mv.addObject("serviceList", serviceList);	//선택 서비스 배열
		mv.addObject("matchDtl", mthdtl);			//매치 정보(해당 글)
		mv.addObject("pst", pst);					//펫시터 정보
		mv.addObject("pstAdd", pstAdd);				//펫시터 추가 정보
		mv.addObject("pet", pet);					//펫 정보(펫시터)
		mv.addObject("pstPfl", pstPfl);				//펫시터 프로필 이미지
		mv.addObject("pstImg", pstImg);				//펫시터 위탁 장소 이미지
		mv.addObject("certi", certi);				//펫시터 자격증 이미지

		return mv;
	}
	
	@RequestMapping(value="/cashList")
	public ModelAndView cashList(CommandMap commandMap, HttpSession session) throws Exception {
		ModelAndView mv = new ModelAndView("mypage/bankList");
		
		String ID = (String) session.getAttribute("ID");
		
		commandMap.put("PSMEM_ID", ID);
		
		List<Map<String, Object>> map = myInfoService.cashList(commandMap.getMap());
		
		int count = map.size();
		
		mv.addObject("map", map);
		mv.addObject("count", count);
		
		return mv;
	}
	
	@RequestMapping(value="/withdrawReserve")
	public ModelAndView withdrawReserve(CommandMap commandMap, @RequestParam("cn") int cn, @RequestParam("pnum") int pnum) throws Exception {
		ModelAndView mv = new ModelAndView("redirect:/cashList");
		
		String upStep = "출금 요청";
		
		commandMap.put("CASH_CARE_NO", cn);
		commandMap.put("PNUM", pnum);
		commandMap.put("CASH_CARE_SELECT", upStep);
		
		
		myInfoService.withdrawReserve(commandMap.getMap());
		matchService.updateCash(commandMap.getMap());
		
		return mv;
	}
}   

package project.common.match;
import java.text.SimpleDateFormat;
//
//2020.02.13 호석
//
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Calendar;
import java.util.Date;
import java.util.Enumeration;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import org.springframework.web.servlet.support.RequestContextUtils;

import project.common.common.CommandMap;

@Controller
public class MatchController {

	Logger log = Logger.getLogger(this.getClass());

	@Resource(name = "matchService")
	private MatchService matchService;
	
	//Match List로 이동 : 호석
	@RequestMapping(value = "/matchMain")
	public ModelAndView matchMain(CommandMap commandMap, HttpServletRequest request) throws Exception {
		ModelAndView mv = new ModelAndView("/match/matchMain");
		
		List<Map<String, Object>> allList = matchService.matchAllList(commandMap.getMap());
		List<Map<String, Object>> proList = matchService.matchProList(commandMap.getMap());
		List<Map<String, Object>> newList = matchService.matchNewList(commandMap.getMap());
		
		if(request.getParameter("msg") != null) {
			String msg = request.getParameter("msg");
			mv.addObject("msg", msg);
		}
		
		mv.addObject("allList", allList);
		mv.addObject("proList", proList);
		mv.addObject("newList", newList);
		
		return mv;
	}
	
	
	//Match Main All View Button
	@RequestMapping(value = "/matchAddList")
	public ModelAndView matchAddList(CommandMap commandMap, @RequestParam("num") int num) throws Exception {
		ModelAndView mv = new ModelAndView("/match/matchAddList");
		
		//이 부분은 값이 넘어오는지 확인하는 부분
		System.out.println("넘어온 체크 값(인트) : " + num);		//넘어온 값 확인 : RequestParam
		
		List<Map<String, Object>> addList = new ArrayList<Map<String, Object>>();
		
		if(num == 1) {
			addList = matchService.matchAllList(commandMap.getMap());
			mv.addObject("addList", addList);
		} else if(num == 2) {
			addList = matchService.matchProList(commandMap.getMap());
			mv.addObject("addList", addList);
		} else if(num == 3) {
			addList = matchService.matchNewList(commandMap.getMap());
			mv.addObject("addList", addList);
		}
			
		return mv;
	}

	
	//Match Insert Form으로 이동 : 호석
	@RequestMapping(value = "/matchInsertForm")
	public ModelAndView matchInsertForm(CommandMap commandMap, HttpSession session) throws Exception {
		ModelAndView mv = new ModelAndView("/match/matchInsertForm");
		
		String ID = (String)session.getAttribute("ID");

		Map<String, Object> check = matchService.matchCheck(ID);
		
		if(check != null) {
			ModelAndView mav = new ModelAndView("match/matchModify");
			String msg = "매칭 정보가 등록되어 있어\n매칭 수정으로 이동합니다.";
			
			Map<String, Object> params = new HashMap<String, Object>();
			
			params.put("ID", ID);
			
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

			//가능한 날짜 목록 가져오기
			ArrayList<String> flickr = new ArrayList<String>();

			String date1 = (String) mthdtl.get("MATCH_DATE");
			String[] date2 = date1.split(",");

//			String date3 = "";
//
//			for(int i = 0; i < date2.length; i++) {
//				date3 += '\"' + date2[i] + '\"' + ",";
//			}
//
//			String[] date4 = date3.split(",");
//
//			for(String item : date4) {
//				flickr.add(item);
//			}
			List<String> chkList = new ArrayList<String>();
			for(String item1 : date2) {
				chkList.add(item1);
			}

			mav.addObject("chkList", chkList);			
			mav.addObject("serviceList", serviceList);	//선택 서비스 배열
			mav.addObject("matchDtl", mthdtl);			//매치 정보(해당 글)
			mav.addObject("pst", pst);					//펫시터 정보
			mav.addObject("pstAdd", pstAdd);				//펫시터 추가 정보
			mav.addObject("pet", pet);					//펫 정보(펫시터)
			mav.addObject("pstPfl", pstPfl);				//펫시터 프로필 이미지
			mav.addObject("pstImg", pstImg);				//펫시터 위탁 장소 이미지
			mav.addObject("certi", certi);				//펫시터 자격증 이미지
			mav.addObject("msg", msg);
			
			return mav;
		} else {
			HashMap<String, Object> map = new HashMap<String, Object>();
			
			map.put("ID", ID);
			
			Map<String, Object> pst = matchService.selPetsitter(map);				//펫시터 정보 가져오기
			Map<String, Object> pstAdd = matchService.selPetsitterAdd(map);			//펫시터 추가 정보 가져오기
			Map<String, Object> pstPfl = matchService.selPetsitterProfile(map);		//펫시터 프로필 가져오기
			
			List<Map<String, Object>> pet = matchService.selPet(map);				//펫 정보 가져오기
			List<Map<String, Object>> pstImg = matchService.selPetsitterAddImg(map);//위탁 장소 이미지 가져오기
			List<Map<String, Object>> certi = matchService.selCertificate(map);		//자격증 이미지 가져오기
	
			mv.addObject("pst", pst);
			mv.addObject("pstAdd", pstAdd);
			mv.addObject("pet", pet);
			mv.addObject("pstPfl", pstPfl);
			mv.addObject("pstImg", pstImg);
			mv.addObject("certi", certi);
		}
		
		return mv;
	}

	
	//Match Insert 기능 구현 : 호석
	@RequestMapping(value = "/matchCommit", method = RequestMethod.POST)
	public ModelAndView matchInsert(CommandMap commandMap, HttpServletRequest request) throws Exception {
		
		ModelAndView mv = new ModelAndView("redirect:/matchMain");
		
		if(request.getParameterValues("serviceChk") != null) {
			String[] arr = request.getParameterValues("serviceChk");
			String serviceArr = "";
			for(int i = 0; i < arr.length; i++) {
				serviceArr = serviceArr + arr[i] + ",";
			}
			System.out.println(serviceArr);
			commandMap.put("serviceArr", serviceArr);
		} else {
			commandMap.put("serviceArr", "");
		}
		
		matchService.insertMatch(commandMap.getMap(), request);
		
		return mv;
	}
	
	
	//Match Detail로 이동하기 위한 중간 단계
	@RequestMapping(value = "/matchDetailGo")
	public ModelAndView metchDetailGo(CommandMap commandMap, @RequestParam Map<String, Object> params, RedirectAttributes redirectattributes) {
		ModelAndView mv = new ModelAndView("redirect:/matchDetail");
		redirectattributes.addFlashAttribute("params", params);
		return mv;
	}
	
	
	//Match Detail로 이동 : 호석
	@RequestMapping(value = "/matchDetail")
	public ModelAndView matchDetail(CommandMap commandmap, HttpServletRequest request) throws Exception {
		ModelAndView mv = new ModelAndView("/match/matchDetail");

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
	
	//Match Detail에서 찜 등록
	@RequestMapping(value = "/bookmarkInsert")
	public ModelAndView bookmarkInsert(CommandMap commandmap, HttpServletRequest request) throws Exception {
		ModelAndView mv = new ModelAndView("redirect:/matchDetailGo");
		
		Map<String, Object> map = new HashMap<String, Object>();
		
		String MEM_ID = request.getParameter("ID");
		String PSMEM_ID = request.getParameter("PSMEM_ID");
		
		map.put("MEM_ID", MEM_ID);
		map.put("PSMEM_ID", PSMEM_ID);
		
		if(matchService.pstMarkCheck(map) == null) {	//찜 목록이 없으면 등록, 있으면 그대로 이동.
			matchService.pstMarkInsert(map);
		} else {
			String msg = "1";
			mv.addObject("msg", msg);
		}
		String seq = request.getParameter("MATCH_NO");
		String ID = request.getParameter("PSMEM_ID");
		
		mv.addObject("seq", seq);
		mv.addObject("ID", ID);
		
		return mv;
	}
	
	
	//match Search List 이동 중간 단계
	@RequestMapping(value = "/matchSearchClick")
	public ModelAndView matchSearchClick(CommandMap commandMap, HttpServletRequest request, RedirectAttributes redirectattributes) throws Exception {
		ModelAndView mv = new ModelAndView("redirect:/matchResultList");

		Map<String, Object> params = new HashMap<String, Object>();
		
		//여기부터 : request에 든 키와 값 꺼내서 확인하기
		Enumeration<String> confirmMap = request.getParameterNames();	//넘어온 값 확인 Request

		while(confirmMap.hasMoreElements()) {
			String name = (String) confirmMap.nextElement();
			System.out.println(name + " : " + request.getParameter(name));
			
			if(!name.equals("serviceChk")) {
				params.put(name, request.getParameter(name));	//이 부분은 request에서 값을 가져와서 map에 저장하는 부분.
			} 
		}
		//여기까지 : request에 든 키와 값 꺼내 확인하기
		
		//아래 부분은 서비스 배열을 스트링으로 변환해서 넘기려고 하는 작업
		String service = "";
		
		if(request.getParameterValues("serviceChk") != null) {
			String serviceChk[] = request.getParameterValues("serviceChk");
			System.out.println("서비스 배열 잘 받아오나 : " + Arrays.toString(serviceChk));
			
			for(int i = 0; i < serviceChk.length; i++) {
				service += serviceChk[i] + ",";
			}
			System.out.println("배열이 스트링으로 잘 변환됐나 : " + service);
		}
		
		params.put("service", service);
				
		redirectattributes.addFlashAttribute("params", params);

		return mv;
	}
	
	
	//Match Search List
	@RequestMapping(value = "/matchResultList")
	public ModelAndView matchResultList(CommandMap commandMap, HttpServletRequest request) throws Exception {
		ModelAndView mv = new ModelAndView("/match/matchResultList");
		
		Map<String, Object> map = new HashMap<String, Object>();
		
		Map<String, Object> params = new HashMap<String, Object>();
		Map<String, ?> flashMap = RequestContextUtils.getInputFlashMap(request);
		if(flashMap != null) {
			params = (Map<String, Object>) flashMap.get("params");
		}
		
		//맵 키, 값 확인하기 : 값 확인 map(key : value)
		for(Map.Entry<String, Object> entry : params.entrySet()) {
			System.out.println("[key] : " + entry.getKey() + ", " + "[value] : " + entry.getValue());
		}

		//이 부분은 값이 넘어오는지 확인하는 부분
		System.out.println("넘어온 주소값(스트링) : " + params.get("ADDRESS1"));
		
		//검색 주소 : 이 부분은 주소값 만들기 부분
		if(params.get("ADDRESS1") != null && !params.get("ADDRESS1").equals("")) {
			String Address1 = (String) params.get("ADDRESS1");
			String[] searchAddress = Address1.split(" ");
			System.out.println("주소값(배열) : " + Arrays.toString(searchAddress));
			
			for(int i = 0; i < searchAddress.length; i++ ) {
				map.put("add1", searchAddress[0]);
				map.put("add2", searchAddress[1]);
			}
		
			for(Map.Entry<String, Object> elem : map.entrySet()) {
				String key = elem.getKey();
				Object value = elem.getValue();
				
				System.out.println("저장된 주소값 : " + key + " : " + value);
			}
		}	//주소 배열 쪼개서 조건값 2개(도, 시(구)) 만들기 끝.
		
		//검색 서비스 : 조건 검색 만들기 부분
		ArrayList<String> serviceLt = new ArrayList<String>();
		
		String service = (String) params.get("service");
		String arr[] = service.split(",");
		
		if(arr != null) {
			System.out.println("넘어온 서비스(배열) : " + Arrays.toString(arr));
			
			for(String item : arr) {
				serviceLt.add(item);
			}
		
			System.out.println("서비스 리스트 : " + serviceLt);
		
			try {
				map.put("serviceLt", serviceLt);
			} catch(Exception e) {
				e.printStackTrace();
			}
		}	//조건 검색 끝
		
		//검색 날짜 : 날짜 선택 부분
		String searchDate = (String) params.get("basicDate");
		System.out.println("넘어온 날짜(스트링) : " + searchDate);
		
		if(searchDate != null && !searchDate.equals("")) {
			String[] searchDay = searchDate.split(", ");
			System.out.println("넘어온 날짜(배열) : " + Arrays.toString(searchDay));
			
			if(!searchDay.equals(null)) {
				try {
					map.put("searchDay", searchDay);
				} catch(Exception e) {
					e.printStackTrace();
				}
			}
		}	//예약 날짜 쪼개기 끝
		
		//맵 키, 값 확인하기 : 값 확인 map(key : value)
		for(Map.Entry<String, Object> entry : map.entrySet()) {
			System.out.println("[key] : " + entry.getKey() + ", " + "[value] : " + entry.getValue());
		}
		
		List<Map<String, Object>> resultComplete = matchService.mtchSearch(map);
		
		//resultComplete의 키 값을 확인해서 있으면 넘기고, 없으면 안 넘기고.
		for(Map<String, Object> result : resultComplete) {
			if(result.get("PSMEM_ID") != null && (String)result.get("PSMEM_ID") != "") {
				mv.addObject("resultComplete", resultComplete); //원 파일
			} 
		}
			
		return mv;
	}
	
	//펫시팅 예약하기 폼
	@RequestMapping(value = "/petsittingReserve")
	public ModelAndView petsitting(CommandMap commandMap, HttpServletRequest request, HttpSession session) throws Exception {
		ModelAndView mv = new ModelAndView("/match/petsittingReserve");
		
		String basicDate = request.getParameter("basicDate");	//예약 날짜
		String PSMEM_ID = request.getParameter("PSMEM_ID");		//매치에 등록된 펫시터 아이디
		String MATCH_NO = request.getParameter("MATCH_NO");		//매치 번호
		System.out.println("넘어온 매치 번호 : " + MATCH_NO);
		int seq = Integer.parseInt(MATCH_NO);

		//로그인한 회원 아이디를 세션에서 가져옴
		String MEM_ID = (String)session.getAttribute("ID");			//세션에서 가져온 회원 아이디

		HashMap<String, Object> map = new HashMap<String, Object>();
		HashMap<String, Object> psmem = new HashMap<String, Object>();
		
		map.put("MEM_ID", MEM_ID);
		psmem.put("ID", PSMEM_ID);
		map.put("seq", seq);
		
		Map<String, Object> mthdtl = matchService.matchDetail(map);						//매치 정보 가져오기
		
		Map<String, Object> pst = matchService.selPetsitter(psmem);						//펫시터 정보 가져오기
		Map<String, Object> pstAdd = matchService.selPetsitterAdd(psmem);				//펫시터 추가 정보 가져오기
		Map<String, Object> pstPfl = matchService.selPetsitterProfile(psmem);			//펫시터 프로필 가져오기
		
		List<Map<String, Object>> pet = matchService.selPet(psmem);						//펫시터 펫 정보 가져오기(펫, 추가, 프로필)
		List<Map<String, Object>> pstImg = matchService.selPetsitterAddImg(psmem);		//위탁 장소 이미지 가져오기
		List<Map<String, Object>> certi = matchService.selCertificate(psmem);			//자격증 이미지 가져오기
		
		Map<String, Object> mem = matchService.selMember(map);							//멤버 정보 가져오기(멤버, 프로필)
		List<Map<String, Object>> memPet = matchService.selMemPet(map);					//멤버 펫 정보 가져오기(펫, 추가, 프로필)
		
		//가능한 서비스 목록 가져오기.
		String serviceLt = (String) mthdtl.get("POSSIBLE_SERVICE");
		String[] serviceList = serviceLt.split(",");
		
		System.out.println("가능한 서비스 : " + Arrays.toString(serviceList));
		
		mv.addObject("serviceList", serviceList);	//서비스 리스트(배열)
		mv.addObject("matchDtl", mthdtl);			//매치 정보(해당 글)
		mv.addObject("pst", pst);					//펫시터 정보
		mv.addObject("pstAdd", pstAdd);				//펫시터 추가 정보
		mv.addObject("pet", pet);					//펫 정보(펫시터)
		mv.addObject("pstPfl", pstPfl);				//펫시터 프로필 이미지
		mv.addObject("pstImg", pstImg);				//펫시터 위탁 장소 이미지
		mv.addObject("certi", certi);				//펫시터 자격증 이미지
		mv.addObject("mem", mem);					//멤버 정보
		mv.addObject("memPet", memPet);				//펫 정보(멤버)
		mv.addObject("basicDate", basicDate);		//예약 날짜
		
		return mv;
	}
	
	//예약하기 등록(DB에 저장) + 예약을 하면, 매치 정보의 날짜에서 예약한 날짜를 빼야 함.
	@RequestMapping(value = "/petsittingOk")
	public ModelAndView petsittingOk(CommandMap commandMap, HttpServletRequest request) throws Exception {
		ModelAndView mv = new ModelAndView("redirect:/memMatchList");
		
		Map<String, Object> map = new HashMap<String, Object>();
		
		//여기부터 : request에 든 키와 값 꺼내서 확인하기
		Enumeration<String> params = request.getParameterNames();	//넘어온 값 확인 Request
			
		while(params.hasMoreElements()) {
			String name = (String) params.nextElement();
			System.out.println(name + " : " + request.getParameter(name));
			
			map.put(name, request.getParameter(name));	//이 부분은 request에서 값을 가져와서 map에 저장하는 부분.
		}
		//여기까지 : request에 든 키와 값 꺼내 확인하기
		
		//map에 담긴 값 확인하기.
		for(Map.Entry<String, Object> entry : map.entrySet()) {
			System.out.println("[key] : " + entry.getKey() + ", " + "[value] : " + entry.getValue());
		}
		//map에 담긴 값 확인하기 끝
		
		//펫 배열을 스트링으로 변환해 담기
		String[] dengArr = request.getParameterValues("PETARR");	//가져온 펫 리스트를 어레이에 담는다.
		System.out.println("반려견 목록 : " + Arrays.toString(dengArr));
		
		String PETARR = "";		//DB에 펫 이름을 저장하기 위한 String
		
		for(int i = 0; i < dengArr.length; i++) {	//펫 리스트를 반복해 꺼낸다.
			PETARR += dengArr[i] + ", ";
		}
		PETARR = PETARR.substring(0, PETARR.length() - 2);
		 
		map.put("PET_ID", PETARR);		//펫 목록 String을 map에 넣기
		//이 위까지 펫 아이디 목록 스트링으로 변환
		
		//매치 정보에서 서비스 목록 가져와서 스트링으로 넣기
		Map<String, Object> mapp = new HashMap<String, Object>();
		
		int seq = Integer.parseInt(request.getParameter("MATCH_REGISTER_NO"));
		
		mapp.put("seq", seq);
		Map<String, Object> mthdtl = matchService.matchDetail(mapp);	
		
		String p_service = (String) mthdtl.get("POSSIBLE_SERVICE");
		
		map.put("P_SERVICE", p_service);
		//이 위까지 서비스 목록 스트링 변환
		
		//펫 가격 확인하기.
		//넘어온 값 int형으로 바꿔버리기
		String smallAll = request.getParameter("PRICE_SMALL_ALL");
		if(smallAll != "예약 불가") {
			smallAll = smallAll.replace(",", "");
			smallAll = smallAll.replace("원", "");
		} else {
			smallAll = "0";
		}
		System.out.println("소형견 하루 : " + smallAll);
		int sAll = Integer.parseInt(smallAll);
		
		String smallHalf = request.getParameter("PRICE_SMALL_HALF");
		if(smallHalf != "예약 불가") {
			smallHalf = smallHalf.replace(",", "");
			smallHalf = smallHalf.replace("원", "");
		} else {
			smallHalf = "0";
		}
		System.out.println("소형견 반일 : " + smallHalf);
		int sHalf = Integer.parseInt(smallHalf);
		
		String mediumAll = request.getParameter("PRICE_MEDIUM_ALL");
		if(mediumAll != "예약 불가") {
			mediumAll = mediumAll.replace(",", "");
			mediumAll = mediumAll.replace("원", "");
		} else {
			mediumAll = "0";
		}
		System.out.println("중형견 하루 : " + mediumAll);
		int mAll = Integer.parseInt(mediumAll);
		
		String mediumHalf = request.getParameter("PRICE_MEDIUM_HALF");
		if(mediumHalf != "예약 불가") {
			mediumHalf = mediumHalf.replace(",", "");
			mediumHalf = mediumHalf.replace("원", "");
		} else {
			mediumHalf = "0";
		}
		System.out.println("중형견 반일 : " + mediumHalf);
		int mHalf = Integer.parseInt(mediumHalf);
		
		String largeAll = request.getParameter("PRICE_LARGE_ALL");
		if(largeAll != "예약 불가") {
			largeAll = largeAll.replace(",", "");
			largeAll = largeAll.replace("원", "");
		} else {
			largeAll = "0";
		}
		System.out.println("대형견 하루 : " + largeAll);
		int lAll = Integer.parseInt(largeAll);
		
		String largeHalf = request.getParameter("PRICE_LARGE_HALF");
		if(largeHalf != "예약 불가") {
			largeHalf = largeHalf.replace(",", "");
			largeHalf = largeHalf.replace("원", "");
		} else {
			largeHalf = "0";
		}
		System.out.println("대형견 반일 : " + largeHalf);
		int lHalf = Integer.parseInt(largeHalf);
		
		System.out.println("소형견 하루(int) : " + sAll);
		System.out.println("소형견 반일(int) : " + sHalf);
		System.out.println("중형견 하루(int) : " + mAll);
		System.out.println("중형견 반일(int) : " + mHalf);
		System.out.println("대형견 하루(int) : " + lAll);
		System.out.println("대형견 반일(int) : " + lHalf);
		
		String PET_MEM_ID = "";	//쿼리를 실행할 키
		
		int large = 0;			//대형견 가격용
		int medium = 0;			//중형견 가격용
		int small = 0;			//소형견 가격용
		int intPRICE = 0;		//총 가격 합산용
		
		String PRICE = "";		//쿼리에 넘길 값
		
		//아래는 가격 계산. 남은 문제는 예약한 날이 연속이 아니고 떨어져 있으면 계산이 어떻게 되냐는 것. 이건 뷰에서 예약할 때 정하게 만들어야 할 것 같음. 
		String strDays = request.getParameter("PETSITTING_DAYS");
		System.out.println("넘어온 날짜(스트링) : " + strDays);
		
		String[] days = strDays.split(", ");
		System.out.println("넘어온 날짜(배열) : " + Arrays.toString(days));
		
		if(days.length <= 1) {		//반일(데이) 요금
			for(int i = 0; i < dengArr.length; i++) {
				PET_MEM_ID = dengArr[i];
				Map<String, String> petSize = matchService.selPetSize(PET_MEM_ID);

				//맵 키, 값 확인하기 : 값 확인 map(key : value)
				for(Map.Entry<String, String> entry : petSize.entrySet()) {
					System.out.println("[key] : " + entry.getKey() + ", " + "[value] : " + entry.getValue());
					String petValue = entry.getValue();
					System.out.println("펫 사이즈 값 확인 : " + petValue);	 //이 부분이 들어가는거면 조건문이 잘못 됐다는 건데...

					if(petValue.equals("대형견")) {
						large += 1;
					} else if(petValue.equals("중형견")) {
						medium += 1;
					} else if(petValue.equals("소형견")) {
						small += 1;
					}
				}
			}
			System.out.println("대형견 숫자 : " + large);
			System.out.println("중형견 숫자 : " + medium);
			System.out.println("소형견 숫자 : " + small);

			intPRICE = (lHalf * large) + (mHalf * medium) + (sHalf * small);
			PRICE = Integer.toString(intPRICE);	//이 부분 나중에 실제 금액처럼 변환해야 함. 예. 999,999(원)
			
		} else if(days.length > 1) {	//하루(올데이) 요금
			for(int i = 0; i < dengArr.length; i++) {
				PET_MEM_ID = dengArr[i];
				Map<String, String> petSize = matchService.selPetSize(PET_MEM_ID);

				//맵 키, 값 확인하기 : 값 확인 map(key : value)
				for(Map.Entry<String, String> entry : petSize.entrySet()) {
					System.out.println("[key] : " + entry.getKey() + ", " + "[value] : " + entry.getValue());
					String petValue = entry.getValue();
					System.out.println("펫 사이즈 값 확인 : " + petValue);	 //이 부분이 들어가는거면 조건문이 잘못 됐다는 건데...

					if(petValue.equals("대형견")) {
						large += 1;
					} else if(petValue.equals("중형견")) {
						medium += 1;
					} else if(petValue.equals("소형견")) {
						small += 1;
					}
				}
			}
			System.out.println("대형견 숫자 : " + large);
			System.out.println("중형견 숫자 : " + medium);
			System.out.println("소형견 숫자 : " + small);

			intPRICE = (lAll * large) + (mAll * medium) + (sAll * small);
			PRICE = Integer.toString(intPRICE);	//이 부분 나중에 실제 금액처럼 변환해야 함. 예. 999,999(원)
		}
		//이 위까지 가격 계산
	
		//이 아래 부분 Request를 map에 담을 것
		map.put("PRICE", PRICE);
		map.put("PROGRESS_STEPS", "1");	//펫시팅 진행 단계 1로 시작.
		

		for(Map.Entry<String, Object> entry : map.entrySet()) {
			System.out.println("[key] : " + entry.getKey() + ", " + "[value] : " + entry.getValue());
		}
		
		//참조 주소가 없을 경우 에러 방지
		if(map.get("M_ADD_ADD") == null || map.get("M_ADD_ADD").equals("")) {
			String Sql_empty = " ";
			map.put("M_ADD_ADD", Sql_empty);
		}
		if(map.get("P_ADD_ADD") == null || map.get("P_ADD_ADD").equals("")) {
			String Sql_empty = " ";
			map.put("P_ADD_ADD", Sql_empty);
		}
		
		//일단 단계별로 작동하게 만들어놓자.
		matchService.insertPetsitt(map);
		
		return mv;
	}
	
	
	//펫시팅 임시 페이지(리스트)
	@RequestMapping(value = "/petsittingTest")
	public ModelAndView petsittingTest(CommandMap commandMap, HttpSession session) throws Exception {
		ModelAndView mv = new ModelAndView("/match/petsittingTest");
		
		HashMap<String, Object> map = new HashMap<String, Object>();
		
		List<Map<String, Object>> petsittingInfo = null;
		
		String idType = (String) session.getAttribute("MEM_TYPE");
		
		if(idType.equals("일반 회원")) {
			String MEM_ID = (String)session.getAttribute("ID");
			
			map.put("ID", MEM_ID);
			petsittingInfo = matchService.selPetsittingMem(map);						//펫시팅 정보 가져오기(멤버)
		} else if(idType.equals("펫시터")) {
			String PSMEM_ID = (String)session.getAttribute("ID");
			
			map.put("ID", PSMEM_ID);
			petsittingInfo = matchService.selPetsittingPst(map);						//펫시팅 정보 가져오기(펫시터)
		}
		
		mv.addObject("petsittingInfo", petsittingInfo);
		
		return mv;
	}
	
	//petsitting 정보(리스트에서 디테일 들어가는 부분)
	@RequestMapping(value = "/petsittingInfo")
	public ModelAndView petsittingInfo(CommandMap commandMap,  @RequestParam("pnum") int pnum) throws Exception {
		ModelAndView mv = new ModelAndView("/match/petsittingInfo");
		
		Map<String, Object> map = new HashMap<String, Object>();

		int PNUM = pnum;
		map.put("PNUM", PNUM);
		
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

			mv.addObject("nowDay", nowDay);
			mv.addObject("firstDay", firstDay);
			mv.addObject("lastDay", lastDay);
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
	
	//펫시팅 진행 단계 업데이트(조건문으로 각 단계를 나눠야 함. 왜냐하면! 단계에 따라서 실행해야 하는 기능이 달라지기 때문.)
	@RequestMapping(value = "/petsittingUpdate")
	public ModelAndView petsittingUpdate(CommandMap commandMap, HttpServletRequest request) throws Exception {
		
		ModelAndView mv = new ModelAndView("redirect:/petsittingInfo");
		Map<String, Object> map = new HashMap<String, Object>();
		
		//여기부터 : request에 든 키와 값 꺼내서 확인하기
		Enumeration<String> params = request.getParameterNames();	//넘어온 값 확인 Request
			
		while(params.hasMoreElements()) {
			String name = (String) params.nextElement();
			System.out.println(name + " : " + request.getParameter(name));
		}
		//여기까지 : request에 든 키와 값 꺼내 확인하기
				
		int pnum = Integer.parseInt(request.getParameter("pnum"));
		int step = Integer.parseInt(request.getParameter("step"));
		step += 1;
		
		if(step == 2) {	//결제 진행 단계
			map.put("PNUM", pnum);
			map.put("STEP", step);
			
			//아래는 결제 진행을 위해 추가한 부분 : 입금 대기
			String M_ID = request.getParameter("M_ID");
			String P_ID = request.getParameter("P_ID");
			String PRICE = request.getParameter("PRICE");
			
			map.put("M_ID", M_ID);
			map.put("P_ID", P_ID);
			map.put("PRICE", PRICE);
			
			matchService.insertCash(map);
		} else if(step == 3) {	//결제 완료 -> 펫시팅 진행 단계
			map.put("PNUM", pnum);
			map.put("STEP", step);
			//이 부분. 그러니까 2에서 3으로 업데이트 되는 부분에 결제 API 넣어야 함.
			//입금 완료
			String CASH_CARE_SELECT = "입금 완료";
			
			map.put("CASH_CARE_SELECT", CASH_CARE_SELECT);
			
			matchService.updateCash(map);
		} else if(step == 4) {	//펫시팅 완료, 후기 작성 단계(후기 데이터 따로 받아와서 DB에 저장해야 함)
			map.put("PNUM", pnum);
			map.put("STEP", step);
			//출금 가능
			String CASH_CARE_SELECT = "출금 가능";
			
			map.put("CASH_CARE_SELECT", CASH_CARE_SELECT);
			
			matchService.updateCash(map);
			
			//아래는 이용 횟수 증가를 위해 정보를 가져옴
			Map<String, Object> mapp = new HashMap<String, Object>();
			
			String MEM_ID = request.getParameter("M_ID");
			String PSMEM_ID = request.getParameter("P_ID");
			
			mapp.put("MEM_ID", MEM_ID);
			mapp.put("PSMEM_ID", PSMEM_ID);
			
			matchService.updateMemberCount(mapp);		//멤버 이용횟수 증가
			matchService.updatePetsitterCount(mapp);	//펫시터 이용횟수 증가
			
			String petStr = request.getParameter("PET_STR");
			String[] petArr = petStr.split(",");
			System.out.println("가져온 펫 어레이 : " + Arrays.toString(petArr));
			
			mapp.put("PET_ARR", petArr);
			matchService.updatePetCount(mapp);			//펫 이용횟수 증가
		} else if(step == 5) {	//펫시팅 완전 종료 단계 
			map.put("PNUM", pnum);
			map.put("STEP", step);
		}
		matchService.upPetsittingStep(map);
		
		mv.addObject("pnum", pnum);
		return mv;
	}
	
	//펫시팅 취소 (취소하면 제외한 날짜 다시 돌려주기 기능 추가해야 함.)
	@RequestMapping(value = "/petsittingDelete")
	public ModelAndView petsittingDelete(CommandMap commandMap, HttpServletRequest request) throws Exception {
		
		ModelAndView mv = new ModelAndView("redirect:/matchMain");
		
		Map<String, Object> map = new HashMap<String, Object>();

		int pnum = Integer.parseInt(request.getParameter("pnum"));
		String del_name = request.getParameter("del_name");
		
		map.put("PNUM", pnum);
		map.put("DEL_NAME", del_name);

		matchService.deletePst(map);
		
		return mv;
	}
	
	//MatchModify Form
	@RequestMapping(value = "/matchModifyForm")
	public ModelAndView matchModifyForm(CommandMap commandMap, HttpSession session) throws Exception {
		ModelAndView mv = new ModelAndView("/match/matchModify");

		String ID = (String) session.getAttribute("ID");
		
		Map<String, Object> params = new HashMap<String, Object>();
		
		params.put("ID", ID);
		
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
	
	//MatchModify Form
	@RequestMapping(value = "/matchModifySave")
	public ModelAndView matchModifySave(CommandMap commandMap, HttpServletRequest request) throws Exception {
		ModelAndView mv = new ModelAndView("redirect:/matchMain");
		
		//Map<>에 담긴 값 확인하기
		for(Map.Entry<String, Object> entry : commandMap.entrySet()) {
			System.out.println("[key] : " + entry.getKey() + ", " + "[value] : " + entry.getValue());
		}
		
		if(request.getParameterValues("serviceChk") != null) {
			String[] arr = request.getParameterValues("serviceChk");
			String serviceArr = "";
			for(int i = 0; i < arr.length; i++) {
				serviceArr = serviceArr + arr[i] + ",";
			}
			System.out.println(serviceArr);
			commandMap.put("serviceArr", serviceArr);
		} else {
			commandMap.put("serviceArr", "");
		}
		
		matchService.matchUpdate(commandMap.getMap());
		String msg = "수정 완료";
		
		mv.addObject("msg", msg);
		return mv;
	}
}



////List<Map>에 담긴 값 확인하기
//for(Map<String, Object> result : list) {
//	for(Map.Entry<String, Object> entry : result.entrySet()) {
//		System.out.println("[key] : " + entry.getKey() + ", " + "[value] : " + entry.getValue());
//	}
//}

////HttpServletRequest로 넘어온 값 확인하기
//Enumeration<String> confirmMap = request.getParameterNames();	//넘어온 값 확인 Request
//
//while(confirmMap.hasMoreElements()) {
//	String name = (String) confirmMap.nextElement();
//	System.out.println(name + " : " + request.getParameter(name));
//}

////Map<>에 담긴 값 확인하기
//for(Map.Entry<String, Object> entry : map.entrySet()) {
//System.out.println("[key] : " + entry.getKey() + ", " + "[value] : " + entry.getValue());
//}

////배열에 담긴 값 확인하기
//System.out.println(Arrays.toString(배열명));

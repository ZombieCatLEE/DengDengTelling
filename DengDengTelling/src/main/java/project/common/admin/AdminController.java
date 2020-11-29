package project.common.admin;

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
import project.common.match.MatchService;
import project.common.mypage.MyInfoService;
import project.common.paging.Paging;

@Controller
public class AdminController {

	Logger log = Logger.getLogger(this.getClass());

	@Resource(name = "adminService")
	private AdminService adminService;
	
	@Resource(name = "myInfoService")
	private MyInfoService myInfoService;
	
	@Resource(name = "matchService")
	private MatchService matchService;
	
	private int currentPage = 1;
	private int totalCount;
	private int blockCount = 10;
	private int blockpaging = 10;
	private String pagingHtml;
	private Paging paging;

	@RequestMapping(value = "/adminMainGo")
	public ModelAndView adminMainGo(@RequestParam("isSearch") String isSearch, RedirectAttributes redirectattributes) {
		ModelAndView mv = new ModelAndView("redirect:/adminMain");
		redirectattributes.addFlashAttribute("isSearch", isSearch);

		return mv;
	}
		
	//AdminMainMember Page(main 대용)로 이동 : 호석
	@RequestMapping(value="/adminMain")
    public ModelAndView adminMain(CommandMap commandMap, HttpServletRequest request) throws Exception{
		ModelAndView mv = new ModelAndView();
		
		if(request.getParameter("currentPage") == null || request.getParameter("currentPage").trim().isEmpty() || request.getParameter("currentPage").equals("0")){
			currentPage = 1;
		}else{
			currentPage = Integer.parseInt(request.getParameter("currentPage"));
		}
		
		List<Map<String, Object>> AllMemberList = null;
		String isSearch  = null;
		int searchNum = 0;
		
		isSearch = request.getParameter("isSearch");
		
		if(RequestContextUtils.getInputFlashMap(request) != null) {
			Map<String, ?> redirectMap = RequestContextUtils.getInputFlashMap(request);
			if(redirectMap != null) {
				isSearch = (String) redirectMap.get("isSearch");
			}
		}
		
		CommandMap smap = new CommandMap();
		
		if(isSearch != null){
			if(isSearch.equals("펫시터") || isSearch.equals("일반회원")) {
				if(isSearch.equals("일반회원")) {
					isSearch = "일반 회원";
				}
				smap.put("MEM_TYPE", isSearch);
				
				AllMemberList = adminService.adminMemSearch(smap.getMap());
				
				totalCount = AllMemberList.size();
				paging = new Paging(currentPage, totalCount, blockCount, blockpaging, "adminMain", searchNum, isSearch);
				pagingHtml = paging.getPagingHtml().toString();
				
				int lastCount = totalCount;
				
				if(paging.getEndCount() < totalCount){
					lastCount = paging.getEndCount() + 1;
				}
				
				AllMemberList = AllMemberList.subList(paging.getStartCount(), lastCount);
				mv.addObject("currentPage", currentPage);
				mv.addObject("pagingHtml", pagingHtml);
				mv.addObject("AllMemberList", AllMemberList);
				mv.setViewName("admin/adminMainMember");
				
				return mv;
			} else {
				searchNum = Integer.parseInt(request.getParameter("searchNum"));
				
				if(searchNum == 0){
					smap.put("NAME", isSearch);
					AllMemberList = adminService.adminMemSearch(smap.getMap());
				}else if(searchNum == 1){
					smap.put("ID", isSearch);
					AllMemberList = adminService.adminMemSearch(smap.getMap());
				}
				
				totalCount = AllMemberList.size();
				paging = new Paging(currentPage, totalCount, blockCount, blockpaging, "adminMain", searchNum, isSearch);
				pagingHtml = paging.getPagingHtml().toString();
				
				int lastCount = totalCount;
				
				if(paging.getEndCount() < totalCount){
					lastCount = paging.getEndCount() + 1;
				}
				
				AllMemberList = AllMemberList.subList(paging.getStartCount(), lastCount);
				mv.addObject("currentPage", currentPage);
				mv.addObject("pagingHtml", pagingHtml);
				mv.addObject("AllMemberList", AllMemberList);
				mv.setViewName("admin/adminMainMember");
				return mv;
			}
		}
		
		AllMemberList = adminService.selectAllMemberList(commandMap.getMap());
		
		totalCount = AllMemberList.size();
		paging = new Paging(currentPage, totalCount, blockCount, blockpaging, "adminMain");
		pagingHtml = paging.getPagingHtml().toString();
		
		int lastCount = totalCount;
		
		if(paging.getEndCount() < totalCount){
			lastCount = paging.getEndCount() + 1;
		}
		
		AllMemberList = AllMemberList.subList(paging.getStartCount(), lastCount);
		
		mv.addObject("currentPage", currentPage);
		mv.addObject("pagingHtml", pagingHtml);
		mv.addObject("AllMemberList", AllMemberList);
		mv.setViewName("admin/adminMainMember");
		return mv;
	}
	
	//AdminMainBoard로 이동 : 호석   , 박선기 게시판 리스트 
	@RequestMapping(value="/adminNoticeList")
	public ModelAndView adminNoticeList(CommandMap commandMap, HttpServletRequest request) throws Exception {
		
		ModelAndView mv = new ModelAndView();
		
		if(request.getParameter("currentPage") == null || request.getParameter("currentPage").trim().isEmpty() || request.getParameter("currentPage").equals("0")){
			currentPage = 1;
		}else{
			currentPage = Integer.parseInt(request.getParameter("currentPage"));
		}
		
		List<Map<String, Object>> adminNoticeList = null;
		String isSearch  = null;
		int searchNum = 0;
		
		isSearch = request.getParameter("isSearch");
		
		CommandMap smap = new CommandMap();
		
		if(isSearch != null){
			searchNum = Integer.parseInt(request.getParameter("searchNum"));
			
			if(searchNum == 0){
				smap.put("NOTICE_SUBJECT", isSearch);
				adminNoticeList = adminService.adminNoticeSearch(smap.getMap());
			}else if(searchNum == 1){
				smap.put("NOTICE_WRITER", isSearch);
				adminNoticeList = adminService.adminNoticeSearch(smap.getMap());
			} else if(searchNum == 2){
				smap.put("NOTICE_CONTENT", isSearch);
				adminNoticeList = adminService.adminNoticeSearch(smap.getMap());
			} 
			
			totalCount = adminNoticeList.size();
			paging = new Paging(currentPage, totalCount, blockCount, blockpaging, "adminNoticeList", searchNum, isSearch);
			pagingHtml = paging.getPagingHtml().toString();
			
			int lastCount = totalCount;
			
			if(paging.getEndCount() < totalCount){
				lastCount = paging.getEndCount() + 1;
			}
			
			adminNoticeList = adminNoticeList.subList(paging.getStartCount(), lastCount);
			mv.addObject("currentPage", currentPage);
			mv.addObject("pagingHtml", pagingHtml);
			mv.addObject("adminNoticeList", adminNoticeList);
			mv.setViewName("admin/adminMainBoard");
			return mv;
		}
		
		adminNoticeList = adminService.selectNoticeList(commandMap.getMap());
		
		totalCount = adminNoticeList.size();
		paging = new Paging(currentPage, totalCount, blockCount, blockpaging, "adminNoticeList");
		pagingHtml = paging.getPagingHtml().toString();
		
		int lastCount = totalCount;
		
		if(paging.getEndCount() < totalCount){
			lastCount = paging.getEndCount() + 1;
		}
		
		adminNoticeList = adminNoticeList.subList(paging.getStartCount(), lastCount);
		
		mv.addObject("currentPage", currentPage);
		mv.addObject("pagingHtml", pagingHtml);
		mv.addObject("adminNoticeList", adminNoticeList);
		mv.setViewName("admin/adminMainBoard");
		return mv;
	}
	
	//공지사항 디테일 박선기
	@RequestMapping(value="/adminNoticeDetail")
	public ModelAndView noticeAdminDetail(CommandMap commandMap) throws Exception {
		
		ModelAndView mv = new ModelAndView("/notice/noticeDetail");
		
		Map<String, Object> map = adminService.selectNoticeDetail(commandMap.getMap());
		mv.addObject("map", map.get("map"));
		mv.addObject("list", map.get("list"));
		mv.addObject("currentPage", commandMap.get("currentPage"));
		
		return mv;
	}

	@RequestMapping(value = "/adminMatchListGo")
	public ModelAndView adminMatchListGo(@RequestParam("isSearch") String isSearch, RedirectAttributes redirectattributes) {
		ModelAndView mv = new ModelAndView("redirect:/adminMatchList");
		redirectattributes.addFlashAttribute("isSearch", isSearch);

		return mv;
	}
	
	//AdminMainMatching Page로 이동 : 호석
	@RequestMapping(value="/adminMatchList")
	public ModelAndView adminMatch(CommandMap commandMap, HttpServletRequest request) throws Exception{
		ModelAndView mv = new ModelAndView();
		
		List<Map<String, Object>> adminMatchList = adminService.adminMatchList(commandMap.getMap());
		
		if (request.getParameter("currentPage") == null || request.getParameter("currentPage").trim().isEmpty() || request.getParameter("currentPage").equals("0")) {
			currentPage = 1;
		} else {
			currentPage = Integer.parseInt(request.getParameter("currentPage"));
		}
		
		String isSearch  = null;
		int searchNum = 0;
		
		isSearch = request.getParameter("isSearch");
		
		if(RequestContextUtils.getInputFlashMap(request) != null) {
			Map<String, ?> redirectMap = RequestContextUtils.getInputFlashMap(request);
			if(redirectMap != null) {
				isSearch = (String) redirectMap.get("isSearch");
			}
		}
		
		CommandMap smap = new CommandMap();

		if(isSearch != null){
			if(isSearch.equals("예약대기") || isSearch.equals("결제대기") || isSearch.equals("진행중") || isSearch.equals("후기작성") || isSearch.equals("진행완료") || isSearch.equals("취소")) {
				if(isSearch.equals("예약대기")) {
					isSearch = "1";
				} else if(isSearch.equals("결제대기")) {
					isSearch = "2";
				} else if(isSearch.equals("진행중")) {
					isSearch = "3";
				} else if(isSearch.equals("후기작성")) {
					isSearch = "4";
				} else if(isSearch.equals("진행완료")) {
					isSearch = "5";
				} else if(isSearch.equals("취소")) {
					isSearch = "Y";
				}
				if(isSearch.equals("Y")) {
					smap.put("DEL_GB", isSearch);
				} else {
					smap.put("PROGRESS_STEPS", isSearch);
				}
				
				adminMatchList = adminService.adminMatchSearch(smap.getMap());
				
				totalCount = adminMatchList.size(); 
				paging = new Paging(currentPage, totalCount, blockCount, blockpaging, "adminMatchList", searchNum, isSearch);
				pagingHtml = paging.getPagingHtml().toString(); 

				int lastCount = totalCount;

				if (paging.getEndCount() < totalCount) {
					lastCount = paging.getEndCount() + 1;
				}
				
				adminMatchList = adminMatchList.subList(paging.getStartCount(), lastCount);
						
				mv.addObject("currentPage", currentPage);
				mv.addObject("pagingHtml", pagingHtml);
				mv.addObject("adminMatchList", adminMatchList);
				mv.setViewName("/admin/adminMainMatching");
				
				return mv;
			} else {
				searchNum = Integer.parseInt(request.getParameter("searchNum"));
				
				if(searchNum == 0){
					smap.put("P_NAME", isSearch);
					adminMatchList = adminService.adminMatchSearch(smap.getMap());
				} else if(searchNum == 1) {
					smap.put("M_NAME", isSearch);
					adminMatchList = adminService.adminMatchSearch(smap.getMap());
				}

				totalCount = adminMatchList.size(); 
				paging = new Paging(currentPage, totalCount, blockCount, blockpaging, "adminMatchList", searchNum, isSearch);
				pagingHtml = paging.getPagingHtml().toString(); 

				int lastCount = totalCount;

				if (paging.getEndCount() < totalCount) {
					lastCount = paging.getEndCount() + 1;
				}
				
				adminMatchList = adminMatchList.subList(paging.getStartCount(), lastCount);
						
				mv.addObject("currentPage", currentPage);
				mv.addObject("pagingHtml", pagingHtml);
				mv.addObject("adminMatchList", adminMatchList);
				mv.setViewName("/admin/adminMainMatching");
				
				return mv;
			}
		}
		
		adminMatchList = adminService.adminMatchList(commandMap.getMap());
		
		totalCount = adminMatchList.size();
		paging = new Paging(currentPage, totalCount, blockCount, blockpaging, "adminMatchList");
		pagingHtml = paging.getPagingHtml().toString();
		
		int lastCount = totalCount;
		
		if(paging.getEndCount() < totalCount){
			lastCount = paging.getEndCount() + 1;
		}
		
		adminMatchList = adminMatchList.subList(paging.getStartCount(), lastCount);
		
		int count = adminService.countReportList();
		
		mv.addObject("currentPage", currentPage);
		mv.addObject("pagingHtml", pagingHtml);
		mv.addObject("adminMatchList", adminMatchList);
		mv.addObject("count", count);
		mv.setViewName("/admin/adminMainMatching");
		
		System.out.println(mv);
		
		return mv;
	}

	//AdminMainServer Page로 이동 : 호석
	@RequestMapping(value="/adminServer")
	public ModelAndView adminServer(CommandMap commandMap) throws Exception{
		ModelAndView mv = new ModelAndView("admin/adminMainServer");
		return mv;
	}
	
	//AdminLogin Form으로 이동 : 호석
	@RequestMapping(value = "/adminLogin")
	public ModelAndView adminLogin(CommandMap commandMap) throws Exception {
		ModelAndView mv = new ModelAndView("/admin/adminLogin");
		return mv;
	}

	//AdminLogin 기능 구현 : 호석
	@RequestMapping(value = "/adminLoginResult", method = RequestMethod.POST)
	public ModelAndView adminLoginResult(CommandMap commandMap, HttpServletRequest request) throws Exception {
		
		ModelAndView mv = new ModelAndView("/admin/adminLoginResult");
		
		String message = "";
		String url = "";
		  
		HttpSession session = request.getSession();
		  
		Map<String, Object> Check = adminService.adminLoginCheck(commandMap.getMap());
		
		if(Check == null) {	//DB에서 값을 가져오지 못 하면
			message = "해당 아이디가 존재하지 않습니다.";
		} else {
			if(Check.get("ADMIN_PW").equals(commandMap.get("ADMIN_PW"))) {
				session.setAttribute("ADMIN_ID", commandMap.get("ADMIN_ID"));
				session.setAttribute("ADMIN_NAME", Check.get("ADMIN_NAME"));
				session.setAttribute("MEM_TYPE", "관리자");
				
				String NAME = (String)Check.get("ADMIN_NAME");
				
				message = "관리자 " + NAME + " 님이 접속중입니다.";
				url = "/adminMain";
			} else {
				message = "비밀번호가 일치하지 않습니다.";
			}
		} 
		mv.addObject("message", message);
		mv.addObject("url", url);
		  
		return mv;
	}

	//로그아웃 기능 구현 : 호석  //이걸 굳이 나눠놔야 되나 모르겠네. 일단 안 나눠도 되는지 확인해보자.
	@RequestMapping(value = "/adminLogout")
	public ModelAndView adminLogout(HttpServletRequest request, CommandMap commandMap) throws Exception {
		HttpSession session = request.getSession(false);
		if (session != null)
			session.invalidate();
		ModelAndView mv = new ModelAndView();
		mv.setViewName("redirect:/main");
		return mv;
	}
	
	// Q&A 리스트
	@RequestMapping(value = "/adminQnaList") // 요청 URL(/qnaList)이 호출되면 어노테이션이 매핑되어, qnaList() 실행됨
	public ModelAndView qnaList(CommandMap commandMap, HttpServletRequest request) throws Exception {

		ModelAndView mv = new ModelAndView(); // jsonView??

		List<Map<String, Object>> adminQnaList = adminService.selectQnaList(commandMap.getMap());
		/*
		 * 게시판 목록을 보여주기 위해, 목록을 저장할 수 있는 qnaList를 선언함 List의 형식은 Map<String,Object>임 게시글
		 * 목록에 여러가지 정보가 있기에, 그 내용을 Map에 저장함 Map은 key와 value로 구분되어짐. 각 컬럼의 키와 값이 저장됨.
		 * adminService 부분은 상세조회, 조회수 증가 등을 Service에서 처리해줌
		 */

		if (request.getParameter("currentPage") == null || request.getParameter("currentPage").trim().isEmpty() || request.getParameter("currentPage").equals("0")) {
			currentPage = 1;
		} else {
			currentPage = Integer.parseInt(request.getParameter("currentPage"));
		}
		
		String isSearch  = null;
		int searchNum = 0;
		
		isSearch = request.getParameter("isSearch");
		
		CommandMap smap = new CommandMap();

		if(isSearch != null){
			searchNum = Integer.parseInt(request.getParameter("searchNum"));
			
			if(searchNum == 0){
				smap.put("QNA_SUBJECT", isSearch);
				adminQnaList = adminService.adminQnaSearch(smap.getMap());
			}else if(searchNum == 1){
				smap.put("QNA_CONTENT", isSearch);
				adminQnaList = adminService.adminQnaSearch(smap.getMap());
			}else if(searchNum == 2){
				smap.put("QNA_WRITER", isSearch);
				adminQnaList = adminService.adminQnaSearch(smap.getMap());
			}

			totalCount = adminQnaList.size(); //리스트 전체 수를 구해서 저장
			paging = new Paging(currentPage, totalCount, blockCount, blockpaging, "adminQnaList", searchNum, isSearch);
			pagingHtml = paging.getPagingHtml().toString(); //페이징 생성자에 필요한 정보를 담아서 세팅 후 url 받음

			int lastCount = totalCount;

			if (paging.getEndCount() < totalCount) {
				lastCount = paging.getEndCount() + 1;
			}
			
			adminQnaList = adminQnaList.subList(paging.getStartCount(), lastCount);
			
			mv.addObject("currentPage", currentPage);
			mv.addObject("pagingHtml", pagingHtml);
			mv.addObject("adminQnaList", adminQnaList);
			mv.setViewName("/admin/adminMainQnaBoard");
			
			return mv;
		}
		
		adminQnaList = adminService.selectQnaList(commandMap.getMap());

		totalCount = adminQnaList.size();
		paging = new Paging(currentPage, totalCount, blockCount, blockpaging, "adminQnaList");
		pagingHtml = paging.getPagingHtml().toString();
		
		int lastCount = totalCount;
		
		if(paging.getEndCount() < totalCount){
			lastCount = paging.getEndCount() + 1;
		}
		
		adminQnaList = adminQnaList.subList(paging.getStartCount(), lastCount);
		
		int count = adminService.countQnaList();
		
		mv.addObject("currentPage", currentPage);
		mv.addObject("pagingHtml", pagingHtml);
		mv.addObject("adminQnaList", adminQnaList);
		mv.addObject("count", count);
		mv.setViewName("/admin/adminMainQnaBoard");

		return mv;
	}
	
	@RequestMapping(value = "/adminQnaDetail")
	public ModelAndView qnaDetail(CommandMap commandMap) throws Exception {

		ModelAndView mv = new ModelAndView("/qna/qnaDetail");
		Map<String, Object> map = adminService.selectQnaDetail(commandMap.getMap());
		
		mv.addObject("map", map.get("map"));
		mv.addObject("list", map.get("list"));

		return mv;
	}
	
	@RequestMapping(value = "/adminReportList") 
	public ModelAndView reportList(CommandMap commandMap, HttpServletRequest request) throws Exception {

		ModelAndView mv = new ModelAndView(); 

		List<Map<String, Object>> adminReportList = adminService.selectReportList(commandMap.getMap());

		if (request.getParameter("currentPage") == null || request.getParameter("currentPage").trim().isEmpty() || request.getParameter("currentPage").equals("0")) {
			currentPage = 1;
		} else {
			currentPage = Integer.parseInt(request.getParameter("currentPage"));
		}
		
		String isSearch  = null;
		int searchNum = 0;
		
		isSearch = request.getParameter("isSearch");
		
		CommandMap smap = new CommandMap();

		if(isSearch != null){
			searchNum = Integer.parseInt(request.getParameter("searchNum"));
			
			if(searchNum == 0){
				smap.put("REPORT_SUBJECT", isSearch);
				adminReportList = adminService.adminReportSearch(smap.getMap());
			}else if(searchNum == 1){
				smap.put("REPORT_CONTENT", isSearch);
				adminReportList = adminService.adminReportSearch(smap.getMap());
			}else if(searchNum == 2){
				smap.put("REPORT_WRITER", isSearch);
				adminReportList = adminService.adminReportSearch(smap.getMap());
			}

			totalCount = adminReportList.size(); 
			paging = new Paging(currentPage, totalCount, blockCount, blockpaging, "adminReportList", searchNum, isSearch);
			pagingHtml = paging.getPagingHtml().toString(); 

			int lastCount = totalCount;

			if (paging.getEndCount() < totalCount) {
				lastCount = paging.getEndCount() + 1;
			}
			
			adminReportList = adminReportList.subList(paging.getStartCount(), lastCount);
					
			mv.addObject("currentPage", currentPage);
			mv.addObject("pagingHtml", pagingHtml);
			mv.addObject("adminReportList", adminReportList);
			mv.setViewName("/admin/adminMainReportBoard");
			return mv;
		}
		
		adminReportList = adminService.selectReportList(commandMap.getMap());
		
		totalCount = adminReportList.size();
		paging = new Paging(currentPage, totalCount, blockCount, blockpaging, "adminReportList");
		pagingHtml = paging.getPagingHtml().toString();
		
		int lastCount = totalCount;
		
		if(paging.getEndCount() < totalCount){
			lastCount = paging.getEndCount() + 1;
		}
		
		adminReportList = adminReportList.subList(paging.getStartCount(), lastCount);
		
		int count = adminService.countReportList();
		
		mv.addObject("currentPage", currentPage);
		mv.addObject("pagingHtml", pagingHtml);
		mv.addObject("adminReportList", adminReportList);
		mv.addObject("count", count);
		mv.setViewName("/admin/adminMainReportBoard");
		
		System.out.println(mv);
		
		return mv;
	}
	
	@RequestMapping(value = "/adminReportDetail")
	public ModelAndView reportDetail(CommandMap commandMap) throws Exception {

		ModelAndView mv = new ModelAndView("/report/reportDetail");
		
		Map<String, Object> map = adminService.selectReportDetail(commandMap.getMap());
		
		mv.addObject("map", map.get("map"));
		mv.addObject("list", map.get("list"));
		
		System.out.println(mv);
		return mv;
	}
	
	// mypet 리스트
	@RequestMapping(value = "/adminMypetList")
	public ModelAndView mypetList(CommandMap commandMap, HttpServletRequest request) throws Exception {
		
		if(request.getParameter("currentPage") == null || request.getParameter("currentPage").trim().isEmpty() || request.getParameter("currentPage").equals("0")){
			currentPage = 1;
		}else{
			currentPage = Integer.parseInt(request.getParameter("currentPage"));
		}

		ModelAndView mv = new ModelAndView(); // jsonView?? /mypet/mypet이 진짜 경로 

		List<Map<String, Object>> adminMypetList = null;
		/*
		 * 게시판 목록을 보여주기 위해, 목록을 저장할 수 있는 qnaList를 선언함 List의 형식은 Map<String,Object>임 게시글
		 * 목록에 여러가지 정보가 있기에, 그 내용을 Map에 저장함 Map은 key와 value로 구분되어짐. 각 컬럼의 키와 값이 저장됨.
		 * adminService 부분은 상세조회, 조회수 증가 등을 Service에서 처리해줌
		 */
		String isSearch  = null;
		int searchNum = 0;
		
		isSearch = request.getParameter("isSearch");
		
		CommandMap smap = new CommandMap();
		
		if(isSearch != null){
			searchNum = Integer.parseInt(request.getParameter("searchNum"));
			
			if(searchNum == 0){
				smap.put("MYPET_SUBJECT", isSearch);
				adminMypetList = adminService.adminMypetSearch(smap.getMap());
			}else if(searchNum == 1){
				smap.put("MYPET_CONTENT", isSearch);
				adminMypetList = adminService.adminMypetSearch(smap.getMap());
			}else if(searchNum == 2){
				smap.put("MYPET_WRITER", isSearch);
				adminMypetList = adminService.adminMypetSearch(smap.getMap());
			}
			
			totalCount = adminMypetList.size();
			paging = new Paging(currentPage, totalCount, blockCount, blockpaging, "adminMypetList", searchNum, isSearch);
			pagingHtml = paging.getPagingHtml().toString();
			
			int lastCount = totalCount;
			
			if(paging.getEndCount() < totalCount){
				lastCount = paging.getEndCount() + 1;
			}
		
			adminMypetList = adminMypetList.subList(paging.getStartCount(), lastCount);
			mv.addObject("currentPage", currentPage);
			mv.addObject("pagingHtml", pagingHtml);
			mv.addObject("adminMypetList", adminMypetList);
			mv.setViewName("/admin/adminMainMypetBoard");
			
		/*
		 * 서버스로직의 결과를 ModelAndView객체에 담아서 jsp에서 그 결과를 사용할 수 있게 함
		 * adminService.selectBoardList()를 통해 얻어온 결과 list를 "mypetlist"라는 이름으로 저장
		 */
		
		return mv;
	}
		adminMypetList = adminService.selectMypetList(commandMap.getMap());
		
		totalCount = adminMypetList.size();
		paging = new Paging(currentPage, totalCount, blockCount, blockpaging, "adminMypetList");
		pagingHtml = paging.getPagingHtml().toString();
		
		int lastCount = totalCount;
		
		if(paging.getEndCount() < totalCount){
			lastCount = paging.getEndCount() + 1;
		}
		
		adminMypetList = adminMypetList.subList(paging.getStartCount(), lastCount);
		
		mv.addObject("currentPage", currentPage);
		mv.addObject("pagingHtml", pagingHtml);
		mv.addObject("adminMypetList", adminMypetList);
		 
		mv.setViewName("/admin/adminMainMypetBoard");
		
		System.out.println(adminMypetList);
		System.out.println(mv);
		return mv;
	}
	
	@RequestMapping(value = "/adminMypetDetail")
	public ModelAndView mypetDetail(CommandMap commandMap, HttpSession session) throws Exception {

		ModelAndView mv = new ModelAndView("/mypet/mypetDetail");
		
		//시작
		Map<String, Object> map = adminService.selectMypetDetail(commandMap.getMap());
		
		mv.addObject("map", map.get("map"));
		mv.addObject("list", map.get("list"));
		//댓글 디테일
		mv.addObject("cmtList", map.get("cmtList"));
		
		System.out.println(map);
		System.out.println(mv);
		
		return mv;
	}

	///회원 관리 디테일 팝업
	@RequestMapping(value="/adminMemDetail")
	public ModelAndView adminMemDetail(CommandMap commandMap, @RequestParam("type") String type, @RequestParam("id") String id) throws Exception{

		commandMap.put("MEM_TYPE", type);
		commandMap.put("ID", id);

		if(type.equals("펫시터")){ 
			ModelAndView mv = new ModelAndView("admin/pstDetail");
			commandMap.put("PSMEM_ID", id);
			Map<String,Object> map = myInfoService.selectPstMyInfoDetail(commandMap.getMap()); 
			Map<String,Object> map1 = myInfoService.selectPstMyInfoAddDetail(commandMap.getMap());
			List<Map<String, Object>> certi = myInfoService.selectCertiInfo(commandMap.getMap());
			List<Map<String, Object>> list = myInfoService.selectPstPlaceInfo(commandMap.getMap());
			List<Map<String, Object>> petList = matchService.selPet(commandMap.getMap());
			
			mv.addObject("petList", petList);
			mv.addObject("map", map);
			mv.addObject("map1", map1);
			mv.addObject("certi", certi);
			mv.addObject("list", list);

			if(myInfoService.selectProfile(commandMap.getMap()) != null) {
				Map<String, Object> pathMap = new HashMap<String, Object>();
				pathMap = myInfoService.selectProfile(commandMap.getMap());
				String path = (String) pathMap.get("PROFILE_STORED_FILE_NAME");

				mv.addObject("path", path);
			}

			return mv;
		} 

		ModelAndView mv = new ModelAndView("admin/memDetail");
		commandMap.put("MEM_ID", id);
		Map<String,Object> map = myInfoService.selectMemMyInfoDetail(commandMap.getMap());
		List<Map<String, Object>> petList = matchService.selPet(commandMap.getMap());
		
		mv.addObject("petList", petList);
		mv.addObject("map", map);

		if(myInfoService.selectProfile(commandMap.getMap()) != null) {
			Map<String, Object> pathMap = new HashMap<String, Object>();
			pathMap = myInfoService.selectProfile(commandMap.getMap());
			String path = (String) pathMap.get("PROFILE_STORED_FILE_NAME");

			mv.addObject("path", path);
		}
		return mv;
	}
	
	//회원 탈퇴 페이지 이동 중간 단계
	@RequestMapping(value = "/memDeleteAdmin")
	public ModelAndView metchDetailGo(CommandMap commandMap, @RequestParam Map<String, Object> params, RedirectAttributes redirectattributes) {
		ModelAndView mv = new ModelAndView("redirect:/memDeleteAdminConfirm");
		redirectattributes.addFlashAttribute("params", params);

		return mv;
	}
		
	//회원 탈퇴 페이지
	@RequestMapping(value="/memDeleteAdminConfirm")
	public ModelAndView MyInfoDeleteConfirm(CommandMap commandMap, HttpServletRequest request) throws Exception{
		ModelAndView mv = new ModelAndView("admin/memDeleteAdmin");
		
		Map<String, Object> params = new HashMap<String, Object>();
		Map<String, ?> flashMap = RequestContextUtils.getInputFlashMap(request);
		if(flashMap != null) {
			params = (Map<String, Object>) flashMap.get("params");
		}
		
		mv.addObject("type", params.get("type"));
		mv.addObject("id", params.get("id"));
		mv.addObject("pass", params.get("pass"));
		
		return mv;
	}

	//회원 탈퇴
	@RequestMapping(value="/deleteAdmin")
	public ModelAndView MyInfoDelete(CommandMap commandMap, HttpServletRequest request)throws Exception{
		ModelAndView mv=new ModelAndView();	
		
		Map<String, Object> map = new HashMap<String, Object>();
		
		String type = request.getParameter("type");
		String id = request.getParameter("id");
		String pass = request.getParameter("pass");
		
		if(type.equals("일반 회원")) {
			map.put("MEM_ID", id);
		} else if(type.equals("펫시터")) {
			map.put("PSMEM_ID", id);
		}

		map.put("ID", id);
		map.put("PASSWORD1", pass);

		myInfoService.deleteMyInfo(map);	

		return mv;
	}
	
	
	//입출금 내역 검색
	@RequestMapping(value = "/adminCashGo")
	public ModelAndView adminCashGo(@RequestParam("isSearch") String isSearch, RedirectAttributes redirectattributes) {
		ModelAndView mv = new ModelAndView("redirect:/adminCash");
		redirectattributes.addFlashAttribute("isSearch", isSearch);

		return mv;
	}

	//입출금 내역
	@RequestMapping(value="/adminCash")
	public ModelAndView adminCash(CommandMap commandMap, HttpServletRequest request) throws Exception{
		ModelAndView mv = new ModelAndView("admin/adminCashBoard");

		if(request.getParameter("currentPage") == null || request.getParameter("currentPage").trim().isEmpty() || request.getParameter("currentPage").equals("0")){
			currentPage = 1;
		}else{
			currentPage = Integer.parseInt(request.getParameter("currentPage"));
		}

		List<Map<String, Object>> cashList = null;
		String isSearch  = null;
		int searchNum = 0;

		isSearch = request.getParameter("isSearch");

		if(RequestContextUtils.getInputFlashMap(request) != null) {
			Map<String, ?> redirectMap = RequestContextUtils.getInputFlashMap(request);
			if(redirectMap != null) {
				isSearch = (String) redirectMap.get("isSearch");
			}
		}

		CommandMap smap = new CommandMap();

		if(isSearch != null){
			if(isSearch.equals("미승인") || isSearch.equals("승인")) {
				if(isSearch.equals("미승인")) {
					isSearch = "N";
				} else if(isSearch.equals("승인")) {
					isSearch = "Y";
				}
				smap.put("CASH_CARE_CHECK", isSearch);

				cashList = adminService.adminCashSearch(smap.getMap());

				totalCount = cashList.size();
				paging = new Paging(currentPage, totalCount, blockCount, blockpaging, "adminCash", searchNum, isSearch);
				pagingHtml = paging.getPagingHtml().toString();

				int lastCount = totalCount;

				if(paging.getEndCount() < totalCount){
					lastCount = paging.getEndCount() + 1;
				}

				cashList = cashList.subList(paging.getStartCount(), lastCount);
				mv.addObject("currentPage", currentPage);
				mv.addObject("pagingHtml", pagingHtml);
				mv.addObject("cashList", cashList);
				mv.setViewName("admin/adminCashBoard");

				return mv;
			} else {
				searchNum = Integer.parseInt(request.getParameter("searchNum"));

				if(searchNum == 0){
					smap.put("P_NAME", isSearch);
					cashList = adminService.adminCashSearch(smap.getMap());
				}else if(searchNum == 1){
					smap.put("CASH_CARE_SELECT", isSearch);
					cashList = adminService.adminCashSearch(smap.getMap());
				}

				totalCount = cashList.size();
				paging = new Paging(currentPage, totalCount, blockCount, blockpaging, "adminCash", searchNum, isSearch);
				pagingHtml = paging.getPagingHtml().toString();

				int lastCount = totalCount;

				if(paging.getEndCount() < totalCount){
					lastCount = paging.getEndCount() + 1;
				}

				cashList = cashList.subList(paging.getStartCount(), lastCount);
				mv.addObject("currentPage", currentPage);
				mv.addObject("pagingHtml", pagingHtml);
				mv.addObject("cashList", cashList);
				mv.setViewName("admin/adminCashBoard");
				return mv;
			}
		}

		cashList = adminService.adminCash(commandMap.getMap());

		totalCount = cashList.size();
		paging = new Paging(currentPage, totalCount, blockCount, blockpaging, "adminCash");
		pagingHtml = paging.getPagingHtml().toString();

		int lastCount = totalCount;

		if(paging.getEndCount() < totalCount){
			lastCount = paging.getEndCount() + 1;
		}

		cashList = cashList.subList(paging.getStartCount(), lastCount);

		mv.addObject("currentPage", currentPage);
		mv.addObject("pagingHtml", pagingHtml);
		mv.addObject("cashList", cashList);

		return mv;
	}
	
	//withdrawCashAdmin
	@RequestMapping(value="/withdrawCashAdmin")
	public ModelAndView withdrawCashAdmin(CommandMap commandMap, @RequestParam("cn") int cn) throws Exception {
		ModelAndView mv = new ModelAndView("redirect:/adminCash");

		Map<String, Object> map = new HashMap<String, Object>();
		
		map.put("cn", cn);
		
		adminService.adminCashWithdraw(map);
		
		return mv;
	}
}

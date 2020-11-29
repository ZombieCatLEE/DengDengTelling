package project.common.mypet;

import java.io.File;
import java.net.URLEncoder;
import java.util.Enumeration;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.io.FileUtils;
import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import project.common.common.CommandMap;
import project.common.paging.Paging;


@Controller
public class MyPetBoardController {

	Logger log = Logger.getLogger(this.getClass());
	
	private int currentPage = 1;
	private int totalCount;
	private int blockCount = 9;   //화면에 보여줄 개시글의 수
	private int blockpaging = 10;
	private String pagingHtml;
	private Paging paging;           

	@Resource(name = "mypetService") // Service 영역의 접근을 위한 선언
	private MyPetService mypetService;
	
	// mypet 리스트
	@RequestMapping(value = "/mypetList") // 요청 URL(/qnaList)이 호출되면 어노테이션이 매핑되어, qnaList() 실행됨
	public ModelAndView mypetList(CommandMap commandMap, HttpServletRequest request) throws Exception {
		
		if(request.getParameter("currentPage") == null || request.getParameter("currentPage").trim().isEmpty() || request.getParameter("currentPage").equals("0")){
			currentPage = 1;
		}else{
			currentPage = Integer.parseInt(request.getParameter("currentPage"));
		}

		ModelAndView mv = new ModelAndView();

		List<Map<String, Object>> mypetList = null;
		/*
		 * 게시판 목록을 보여주기 위해, 목록을 저장할 수 있는 qnaList를 선언함 List의 형식은 Map<String,Object>임 게시글
		 * 목록에 여러가지 정보가 있기에, 그 내용을 Map에 저장함 Map은 key와 value로 구분되어짐. 각 컬럼의 키와 값이 저장됨.
		 * mypetService 부분은 상세조회, 조회수 증가 등을 Service에서 처리해줌
		 */
		String isSearch  = null;
		int searchNum = 0;
		
		isSearch = request.getParameter("isSearch");
		
		CommandMap smap = new CommandMap();
		
		if(isSearch != null){
			searchNum = Integer.parseInt(request.getParameter("searchNum"));
			
			if(searchNum == 0){
				smap.put("MYPET_SUBJECT", isSearch);
				mypetList = mypetService.mypetSearch(smap.getMap());
			}else if(searchNum == 1){
				smap.put("MYPET_CONTENT", isSearch);
				mypetList = mypetService.mypetSearch(smap.getMap());
			}
			
			totalCount = mypetList.size();
			paging = new Paging(currentPage, totalCount, blockCount, blockpaging, "mypetList", searchNum, isSearch);
			pagingHtml = paging.getPagingHtml().toString();
			
			int lastCount = totalCount;
			
			if(paging.getEndCount() < totalCount){
				lastCount = paging.getEndCount() + 1;
			}
		
			mypetList = mypetList.subList(paging.getStartCount(), lastCount);
			mv.addObject("currentPage", currentPage);
			mv.addObject("pagingHtml", pagingHtml);
			mv.addObject("mypetlist", mypetList);
			mv.setViewName("/mypet/mypetList");
			
		/*
		 * 서버스로직의 결과를 ModelAndView객체에 담아서 jsp에서 그 결과를 사용할 수 있게 함
		 * mypetService.selectBoardList()를 통해 얻어온 결과 list를 "mypetlist"라는 이름으로 저장
		 */
		
		return mv;
	}
		mypetList = mypetService.selectBoardList(commandMap.getMap());
		
		totalCount = mypetList.size();
		paging = new Paging(currentPage, totalCount, blockCount, blockpaging, "mypetList");
		pagingHtml = paging.getPagingHtml().toString();
		
		int lastCount = totalCount;
		
		if(paging.getEndCount() < totalCount){
			lastCount = paging.getEndCount() + 1;
		}
		
		mypetList = mypetList.subList(paging.getStartCount(), lastCount);
		
		mv.addObject("currentPage", currentPage);
		mv.addObject("pagingHtml", pagingHtml);
		mv.addObject("mypetList", mypetList);
		 
		mv.setViewName("/mypet/mypetList");
		
		return mv;
	}

	@RequestMapping(value = "/mypetWriteForm")
	public ModelAndView mypetWriteForm(CommandMap commandMap, HttpSession session) throws Exception {
		ModelAndView mv = new ModelAndView();
		
		Map<String, Object> map = new HashMap<String, Object>();
		
		String ID = (String)session.getAttribute("ID"); 
	    map.put("ID", ID);
	    
	    Map<String, Object> mem = mypetService.selectMemInfo(map);
	    
	    mv.addObject("mem", mem);
		mv.setViewName("/mypet/mypetWrite");
		
		return mv;
	}

	@RequestMapping(value = "/mypetWrite")
	public ModelAndView mypetWrite(CommandMap commandMap, HttpServletRequest request) throws Exception {
		ModelAndView mv = new ModelAndView("redirect:/mypetList");

		mypetService.insertBoard(commandMap.getMap(), request);
		
		return mv;
	}

	@RequestMapping(value = "/mypetDetail")
	public ModelAndView mypetDetail(CommandMap commandMap, HttpSession session) throws Exception {
		ModelAndView mv = new ModelAndView("/mypet/mypetDetail");
		
		//시작
		Map<String, Object> map = mypetService.selectBoardDetail(commandMap.getMap());
		
		mv.addObject("map", map.get("map"));
		mv.addObject("list", map.get("list"));
		//댓글 디테일
		mv.addObject("cmtList", map.get("cmtList"));
		
		return mv;
	}

	@RequestMapping(value="/mypetUpdateForm") 
	public ModelAndView	mypetUpdateForm(CommandMap commandMap, HttpSession session) throws Exception {
		ModelAndView mv = new ModelAndView("/mypet/mypetUpdate");
	
	    Map<String, Object> mapp = new HashMap<String, Object>();
	    
	    if(session.getAttribute("ID") != null) {
			String ID = (String)session.getAttribute("ID"); 
		    mapp.put("ID", ID);
		} else if(session.getAttribute("ADMIN_ID") != null) {
			String ID = (String)session.getAttribute("ADMIN_ID"); 
			mapp.put("ID", ID);
		}
	    
	  		
	    Map<String, Object> mem = mypetService.selectMemInfo(mapp);
		Map<String,Object> map = mypetService.selectBoardDetail(commandMap.getMap());
		
		mv.addObject("mem", mem);
		mv.addObject("map", map.get("map"));
		mv.addObject("list", map.get("list"));
	  
		return mv;
	}
	  
	@RequestMapping(value="/mypetUpdate")
	public ModelAndView mypetUpdate(CommandMap commandMap, HttpServletRequest request) throws Exception {
		ModelAndView mv = new ModelAndView("redirect:/mypetDetail");
	  
		//HttpServletRequest로 넘어온 값 확인하기
		Enumeration<String> confirmMap = request.getParameterNames();	//넘어온 값 확인 Request
		
		while(confirmMap.hasMoreElements()) {
			String name = (String) confirmMap.nextElement();
			System.out.println("request " + name + " : " + request.getParameter(name));
		}

		//Map<>에 담긴 값 확인하기
		for(Map.Entry<String, Object> entry : commandMap.entrySet()) {
			System.out.println("commandMap [key] : " + entry.getKey() + ", " + "[value] : " + entry.getValue());
		}
		
		mypetService.updateBoard(commandMap.getMap(), request);
		mv.addObject("BOARD_NO", commandMap.get("BOARD_NO"));
	  
		return mv;
	}
	 
	@RequestMapping(value="/mypetDelete")//게시글 삭제
	public ModelAndView mypetDelete(CommandMap commandMap) throws Exception {
		ModelAndView mv = new ModelAndView("redirect:/mypetList");
	  
		mypetService.deleteBoard(commandMap.getMap());
	  
		return mv;
	}
	
	//댓글 작성
	@RequestMapping(value = "/mypetInsert")
	public ModelAndView insertComment(CommandMap commandMap, HttpSession session) throws Exception {
		ModelAndView mv = new ModelAndView("redirect:/mypetDetail");
		
		mypetService.insertComment(commandMap.getMap());
		mv.addObject("BOARD_NO", commandMap.get("BOARD_NO"));
		
		return mv;
	}
	
	@RequestMapping(value ="/mypetCommentDelete", method= {RequestMethod.GET})
	public ModelAndView mypetCommentDelete(CommandMap commandMap, @RequestParam("seq") int seq, @RequestParam("sed") int sed ) throws Exception {
		ModelAndView mv = new ModelAndView("/mypet/mypetDetail");
		
		HashMap<String, Object> mapp = new HashMap<String, Object>();
		mapp.put("MYPET_COMMENT_NO", seq);
		
		HashMap<String, Object> mappp = new HashMap<String, Object>();
		mappp.put("BOARD_NO", sed);
		
		mypetService.deleteComment(mapp);
		Map<String, Object> map = mypetService.selectBoardDetail(mappp);
		mv.addObject("map", map.get("map"));
		mv.addObject("list", map.get("list"));
		//댓글 디테일
		mv.addObject("cmtList", map.get("cmtList"));
		
		return mv;
	}
	
	@RequestMapping(value="/mypet/downloadFile")
	public void downloadFile(CommandMap commandMap, HttpServletResponse response, HttpServletRequest request) throws Exception{
		
		Map<String,Object> map = mypetService.selectFileInfo(commandMap.getMap());
		
		String storedFileName = (String)map.get("BOARD_STORED_FILE_NAME");
		String originalFileName = (String)map.get("BOARD_ORIGINAL_FILE_NAME");
		
		String filePath = request.getSession().getServletContext().getRealPath("/resources/images/board/");
		// 여기 있는 FileUtils는 org.apache.commons.io 패키지의 FileUtils 클래스이다.
		byte fileByte[] = FileUtils.readFileToByteArray(new File(filePath + storedFileName));
		
		response.setContentType("application/octet-stream");
		response.setContentLength(fileByte.length);
		response.setHeader("Content-Disposition", "attachment; fileName=\"" + URLEncoder.encode(originalFileName,"UTF-8")+"\";");
		response.setHeader("Content-Transfer-Encoding", "binary");
		response.getOutputStream().write(fileByte);
		
		response.getOutputStream().flush();
		response.getOutputStream().close();
		
	}
	 
}

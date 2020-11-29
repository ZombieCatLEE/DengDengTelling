package project.common.qna;

import java.io.File;
import java.net.URLEncoder;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.ServletRequest;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.io.FileUtils;
import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import project.common.common.CommandMap;
import project.common.paging.Paging;

@Controller
public class QnaBoardController {

	Logger log = Logger.getLogger(this.getClass());

	@Resource(name = "qnaService") // Service 영역의 접근을 위한 선언
	private QnaService qnaService;

	private int currentPage = 1;
	private int totalCount;
	private int blockCount = 10;
	private int blockpaging = 10;
	private String pagingHtml;
	private Paging paging;
	private int count;

	// Q&A 리스트
	@RequestMapping(value = "/qnaList") // 요청 URL(/qnaList)이 호출되면 어노테이션이 매핑되어, qnaList() 실행됨
	public ModelAndView qnaList(CommandMap commandMap, HttpServletRequest request) throws Exception {

		ModelAndView mv = new ModelAndView(); // jsonView??

		List<Map<String, Object>> qnaList = qnaService.selectBoardList(commandMap.getMap());
		/*
		 * 게시판 목록을 보여주기 위해, 목록을 저장할 수 있는 qnaList를 선언함 List의 형식은 Map<String,Object>임 게시글
		 * 목록에 여러가지 정보가 있기에, 그 내용을 Map에 저장함 Map은 key와 value로 구분되어짐. 각 컬럼의 키와 값이 저장됨.
		 * qnaService 부분은 상세조회, 조회수 증가 등을 Service에서 처리해줌
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
				qnaList = qnaService.qnaSearch(smap.getMap());
			}else if(searchNum == 1){
				smap.put("QNA_CONTENT", isSearch);
				qnaList = qnaService.qnaSearch(smap.getMap());
			}else if(searchNum == 2){
				smap.put("QNA_WRITER", isSearch);
				qnaList = qnaService.qnaSearch(smap.getMap());
			}

			totalCount = qnaList.size(); //리스트 전체 수를 구해서 저장
			paging = new Paging(currentPage, totalCount, blockCount, blockpaging, "qnaList", searchNum, isSearch);
			pagingHtml = paging.getPagingHtml().toString(); //페이징 생성자에 필요한 정보를 담아서 세팅 후 url 받음

			int lastCount = totalCount;

			if (paging.getEndCount() < totalCount) {
				lastCount = paging.getEndCount() + 1;
			}
			
			qnaList = qnaList.subList(paging.getStartCount(), lastCount);
			
			int count = qnaService.countBoardList();
			
			mv.addObject("currentPage", currentPage);
			mv.addObject("pagingHtml", pagingHtml);
			mv.addObject("qnaList", qnaList);
			mv.addObject("count", count);
			mv.setViewName("/qna/qnaList");
			
			return mv;
		}
		
		qnaList = qnaService.selectBoardList(commandMap.getMap());

		totalCount = qnaList.size();
		paging = new Paging(currentPage, totalCount, blockCount, blockpaging, "qnaList");
		pagingHtml = paging.getPagingHtml().toString();
		
		int lastCount = totalCount;
		
		if(paging.getEndCount() < totalCount){
			lastCount = paging.getEndCount() + 1;
		}
		
		qnaList = qnaList.subList(paging.getStartCount(), lastCount);
		
		int count = qnaService.countBoardList();
		
		mv.addObject("currentPage", currentPage);
		mv.addObject("pagingHtml", pagingHtml);
		mv.addObject("qnaList", qnaList);
		mv.addObject("count", count);
		mv.setViewName("/qna/qnaList");

		return mv;
	}
		
	@RequestMapping(value = "/qnaWriteForm")
	public ModelAndView qnaWriteForm(CommandMap commandMap, HttpSession session) throws Exception {

		ModelAndView mv = new ModelAndView();
		
		Map<String, Object> map = new HashMap<String, Object>();
		
		if(session.getAttribute("ID") != null) {
			String ID = (String)session.getAttribute("ID"); 
		    map.put("ID", ID);
		} else if(session.getAttribute("ADMIN_ID") != null) {
			String ID = (String)session.getAttribute("ADMIN_ID"); 
			map.put("ID", ID);
		}
		
	    Map<String, Object> mem = qnaService.selectMemInfo(map);
	    
	    mv.addObject("mem", mem);
		mv.setViewName("/qna/qnaWrite");

		return mv;
	}

	@RequestMapping(value = "/qnaWrite")
	public ModelAndView qnaWrite(CommandMap commandMap, HttpServletRequest request) throws Exception {

		ModelAndView mv = new ModelAndView("redirect:/qnaList");
		
		if(request.getParameter("QNA_PRIVATE_CHECK") == null) {
			String check  = (String)"N";
			commandMap.put("QNA_PRIVATE_CHECK", check);
		} 
		
		qnaService.insertBoard(commandMap.getMap(), request);
		return mv;
	}

	@RequestMapping(value = "/qnaDetail")
	public ModelAndView qnaDetail(CommandMap commandMap) throws Exception {
		ModelAndView mv = new ModelAndView("/qna/qnaDetail");
		
		Map<String, Object> map = qnaService.selectBoardDetail(commandMap.getMap());
		
		mv.addObject("map", map.get("map"));
		mv.addObject("list", map.get("list"));

		return mv;
	}

	@RequestMapping(value = "/qnaUpdateForm")
	public ModelAndView qnaUpdateForm(CommandMap commandMap, HttpSession session) throws Exception {
		ModelAndView mv = new ModelAndView("/qna/qnaUpdate");
		
		Map<String, Object> mapp = new HashMap<String, Object>();
		
		if(session.getAttribute("ID") != null) {
			String ID = (String)session.getAttribute("ID"); 
		    mapp.put("ID", ID);
		} else if(session.getAttribute("ADMIN_ID") != null) {
			String ID = (String)session.getAttribute("ADMIN_ID"); 
			mapp.put("ID", ID);
		}
	    
	    Map<String, Object> mem = qnaService.selectMemInfo(mapp);
		Map<String, Object> map = qnaService.selectBoardDetail(commandMap.getMap());
		
		mv.addObject("mem", mem);
		mv.addObject("map", map.get("map"));
		mv.addObject("list", map.get("list"));
		
		return mv;
	}

	@RequestMapping(value = "/qnaUpdate")
	public ModelAndView qnaUpdate(CommandMap commandMap, HttpServletRequest request) throws Exception {
		ModelAndView mv = new ModelAndView("redirect:/qnaDetail");

		qnaService.updateBoard(commandMap.getMap(), request);
		mv.addObject("BOARD_NO", commandMap.get("BOARD_NO"));

		return mv;
	}

	@RequestMapping(value = "/qnaDelete")
	public ModelAndView qnaDelete(CommandMap commandMap) throws Exception {
		ModelAndView mv = new ModelAndView("redirect:/qnaList");

		qnaService.deleteBoard(commandMap.getMap());

		return mv;
	}
	
	@RequestMapping(value = "/qnaReplyForm")
	public ModelAndView qnaReplyForm(CommandMap commandMap, HttpSession session) throws Exception {
		ModelAndView mv = new ModelAndView();
	
		Map<String, Object> map = qnaService.selectBoardDetail(commandMap.getMap());
	    
		mv.addObject("map", map.get("map"));
		mv.addObject("list", map.get("list"));
		mv.setViewName("/qna/qnaReply");

		return mv;
	}

	@RequestMapping(value = "/qnaReply")
	public ModelAndView qnaReply(CommandMap commandMap, HttpServletRequest request) throws Exception {

		ModelAndView mv = new ModelAndView("redirect:/qnaList");
		
		qnaService.insertReplyBoard(commandMap.getMap(), request);

		return mv;
	}

	@RequestMapping(value = "/qnaReUpdateForm")
	public ModelAndView qnaReUpdateForm(CommandMap commandMap, HttpSession session) throws Exception {

		ModelAndView mv = new ModelAndView("/qna/qnaReUpdate");
		
		Map<String, Object> mapp = new HashMap<String, Object>();
		
		if(session.getAttribute("ADMIN_ID") != null) {
			String ADMIN_ID = (String)session.getAttribute("ADMIN_ID"); 
			mapp.put("ADMIN_ID", ADMIN_ID);
		}
		
		Map<String, Object> mem = qnaService.selectAdminInfo(mapp);
		Map<String, Object> map = qnaService.selectBoardDetail(commandMap.getMap());
		
		mv.addObject("mem", mem);
	    mv.addObject("map", map.get("map"));
		mv.addObject("list", map.get("list"));
		
		return mv;
	}

	@RequestMapping(value = "/qnaReUpdate")
	public ModelAndView qnaReUpdate(CommandMap commandMap, HttpServletRequest request) throws Exception {

		ModelAndView mv = new ModelAndView("redirect:/qnaDetail");
		
		qnaService.updateReplyBoard(commandMap.getMap(), request);
		mv.addObject("BOARD_NO", commandMap.get("BOARD_NO"));

		return mv;
	}
	
	@RequestMapping(value="/qna/downloadFile")
	public void downloadFile(CommandMap commandMap, HttpServletResponse response, HttpServletRequest request) throws Exception{
		
		Map<String,Object> map = qnaService.selectFileInfo(commandMap.getMap());
		
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

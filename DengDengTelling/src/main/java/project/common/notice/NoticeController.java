package project.common.notice;

import java.io.File;
import java.net.URLEncoder;
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
import org.springframework.web.servlet.ModelAndView;

import project.common.paging.Paging;

import project.common.common.CommandMap;

@Controller
public class NoticeController {
	Logger log = Logger.getLogger(this.getClass());
	
	@Resource(name="noticeService")
	private NoticeService noticeService;
	
	private int currentPage = 1;
	private int totalCount;
	private int blockCount = 10;
	private int blockpaging = 10;
	private String pagingHtml;
	private Paging paging;
	
	@RequestMapping(value="/noticeList")
	public ModelAndView noticeList(CommandMap commandMap, HttpServletRequest request) throws Exception {
		
		ModelAndView mv = new ModelAndView();
		
		if(request.getParameter("currentPage") == null || request.getParameter("currentPage").trim().isEmpty() || request.getParameter("currentPage").equals("0")){
			currentPage = 1;
		}else{
			currentPage = Integer.parseInt(request.getParameter("currentPage"));
		}
		
		List<Map<String, Object>> noList = null;
		String isSearch  = null;
		int searchNum = 0;
		
		isSearch = request.getParameter("isSearch");
		
		CommandMap smap = new CommandMap();
		
		if(isSearch != null){
			searchNum = Integer.parseInt(request.getParameter("searchNum"));
			
			if(searchNum == 0){
				smap.put("NOTICE_SUBJECT", isSearch);
				noList = noticeService.noticeSearch(smap.getMap());
			}else if(searchNum == 1){
				smap.put("NOTICE_CONTENT", isSearch);
				noList = noticeService.noticeSearch(smap.getMap());
			} 
			
			totalCount = noList.size();
			paging = new Paging(currentPage, totalCount, blockCount, blockpaging, "noticeList", searchNum, isSearch);
			pagingHtml = paging.getPagingHtml().toString();
			
			int lastCount = totalCount;
			
			if(paging.getEndCount() < totalCount){
				lastCount = paging.getEndCount() + 1;
			}
			
			noList = noList.subList(paging.getStartCount(), lastCount);
			
			int count = noticeService.countBoardList();
			
			mv.addObject("currentPage", currentPage);
			mv.addObject("pagingHtml", pagingHtml);
			mv.addObject("noList", noList);
			mv.addObject("count", count);
			mv.setViewName("/notice/noticeList");
			return mv;
		}
		
		noList = noticeService.selectBoardList(commandMap.getMap());
		
		totalCount = noList.size();
		paging = new Paging(currentPage, totalCount, blockCount, blockpaging, "noticeList");
		pagingHtml = paging.getPagingHtml().toString();
		
		int lastCount = totalCount;
		
		if(paging.getEndCount() < totalCount){
			lastCount = paging.getEndCount() + 1;
		}
		
		noList = noList.subList(paging.getStartCount(), lastCount);
		
		int count = noticeService.countBoardList();
		
		mv.addObject("currentPage", currentPage);
		mv.addObject("pagingHtml", pagingHtml);
		mv.addObject("noList", noList);
		mv.addObject("count", count);
		mv.setViewName("/notice/noticeList");
		return mv;
	}
	
	@RequestMapping(value="/noticeWriteForm")
	public ModelAndView noticeWriteForm(CommandMap commandMap, HttpSession session) throws Exception {
	
		ModelAndView mv = new ModelAndView();
		
		String ADMIN_ID = (String)session.getAttribute("ADMIN_ID");
		System.out.println(ADMIN_ID);
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("ADMIN_ID", ADMIN_ID);
		
		Map<String, Object> mem = noticeService.selectAdminInfo(map);
		mv.addObject("mem", mem);
		mv.setViewName("/notice/noticeWrite");
		
		return mv;
	}
	
	@RequestMapping(value="/noticeWrite")
	public ModelAndView noticeWrite(CommandMap commandMap, HttpServletRequest request) throws Exception{
		
		ModelAndView mv = new ModelAndView("redirect:/noticeList");
		
		noticeService.insertBoard(commandMap.getMap(), request);
		
		return mv;
	}
	
	@RequestMapping(value="/noticeDetail")
	public ModelAndView noticeDetail(CommandMap commandMap) throws Exception {
		ModelAndView mv = new ModelAndView("/notice/noticeDetail");
		
		Map<String, Object> map = noticeService.selectBoardDetail(commandMap.getMap());
		
		mv.addObject("map", map.get("map"));
		mv.addObject("list", map.get("list"));
		
		return mv;
	}
	
	@RequestMapping(value ="/noticeUpdateForm")
	public ModelAndView noticeUpdateForm(CommandMap commandMap, HttpSession session) throws Exception {
		
		ModelAndView mv = new ModelAndView("/notice/noticeUpdate");
		
		String ADMIN_ID = (String)session.getAttribute("ADMIN_ID");
		Map<String, Object> mapp = new HashMap<String, Object>();
		mapp.put("ADMIN_ID", ADMIN_ID);
		
		Map<String, Object> mem = noticeService.selectAdminInfo(mapp);
		Map<String, Object> map = noticeService.selectBoardDetail(commandMap.getMap());
		
		mv.addObject("mem", mem);
		mv.addObject("map", map.get("map"));
		mv.addObject("list", map.get("list"));
		
		return mv;
	}
	
	@RequestMapping(value="/noticeUpdate")
	public ModelAndView noticeWUpdate(CommandMap commandMap, HttpServletRequest request) throws Exception {
		
		ModelAndView mv = new ModelAndView("redirect:/noticeDetail");
		
		noticeService.updateBoard(commandMap.getMap(), request);
		mv.addObject("BOARD_NO", commandMap.get("BOARD_NO"));
		
		return mv;
	}
	
	@RequestMapping(value="/noticeDelete")
	public ModelAndView noticeDelete(CommandMap commandMap) throws Exception {
		ModelAndView mv = new ModelAndView("redirect:/noticeList");
		
		noticeService.deleteBoard(commandMap.getMap());
		
		return mv;
	}
	
	@RequestMapping(value="/notice/downloadFile")
	public void downloadFile(CommandMap commandMap, HttpServletResponse response, HttpServletRequest request) throws Exception{
		
		Map<String,Object> map = noticeService.selectFileInfo(commandMap.getMap());
		
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

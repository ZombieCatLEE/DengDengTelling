/*20.02.12*/
package project.common.report;

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
public class ReportBoardController {

	Logger log = Logger.getLogger(this.getClass());

	@Resource(name = "reportService") 
	private ReportService reportService;

	private int currentPage = 1;
	private int totalCount;
	private int blockCount = 10;
	private int blockpaging = 10;
	private String pagingHtml;
	private Paging paging;
	private int count;
	
	@RequestMapping(value = "/reportList") 
	public ModelAndView reportList(CommandMap commandMap, HttpServletRequest request) throws Exception {

		ModelAndView mv = new ModelAndView(); 

		List<Map<String, Object>> reportList = reportService.selectBoardList(commandMap.getMap());

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
				reportList = reportService.reportSearch(smap.getMap());
			}else if(searchNum == 1){
				smap.put("REPORT_CONTENT", isSearch);
				reportList = reportService.reportSearch(smap.getMap());
			}else if(searchNum == 2){
				smap.put("REPORT_WRITER", isSearch);
				reportList = reportService.reportSearch(smap.getMap());
			}

			totalCount = reportList.size(); 
			paging = new Paging(currentPage, totalCount, blockCount, blockpaging, "reportList", searchNum, isSearch);
			pagingHtml = paging.getPagingHtml().toString(); 

			int lastCount = totalCount;

			if (paging.getEndCount() < totalCount) {
				lastCount = paging.getEndCount() + 1;
			}
			
			reportList = reportList.subList(paging.getStartCount(), lastCount);
			
			int count = reportService.countBoardList();
			
			mv.addObject("currentPage", currentPage);
			mv.addObject("pagingHtml", pagingHtml);
			mv.addObject("reportList", reportList);
			mv.addObject("count", count);
			mv.setViewName("/report/reportList");
			return mv;
		}
		
		reportList = reportService.selectBoardList(commandMap.getMap());
		
		totalCount = reportList.size();
		paging = new Paging(currentPage, totalCount, blockCount, blockpaging, "reportList");
		pagingHtml = paging.getPagingHtml().toString();
		
		int lastCount = totalCount;
		
		if(paging.getEndCount() < totalCount){
			lastCount = paging.getEndCount() + 1;
		}
		
		reportList = reportList.subList(paging.getStartCount(), lastCount);
		
		int count = reportService.countBoardList();
		
		mv.addObject("currentPage", currentPage);
		mv.addObject("pagingHtml", pagingHtml);
		mv.addObject("reportList", reportList);
		mv.addObject("count", count);
		mv.setViewName("/report/reportList");
		
		return mv;
	}
		
	@RequestMapping(value = "/reportWriteForm")
	public ModelAndView reportWriteForm(CommandMap commandMap, HttpSession session) throws Exception {

		ModelAndView mv = new ModelAndView();
		
		Map<String, Object> map = new HashMap<String, Object>();
		
		if(session.getAttribute("ID") != null) {
			String ID = (String)session.getAttribute("ID"); 
		    
		    map.put("ID", ID);
		} else if(session.getAttribute("ADMIN_ID") != null) {
			String ID = (String)session.getAttribute("ADMIN_ID"); 

			map.put("ID", ID);
		}
		
	    Map<String, Object> mem = reportService.selectMemInfo(map);
	    
	    mv.addObject("mem", mem);
		mv.setViewName("/report/reportWrite");
		
		return mv;
	}

	@RequestMapping(value = "/reportWrite")
	public ModelAndView reportWrite(CommandMap commandMap, HttpServletRequest request) throws Exception {

		ModelAndView mv = new ModelAndView("redirect:/reportList");
		
		reportService.insertBoard(commandMap.getMap(), request);
		
		return mv;
	}

	@RequestMapping(value = "/reportDetail")
	public ModelAndView reportDetail(CommandMap commandMap) throws Exception {

		ModelAndView mv = new ModelAndView("/report/reportDetail");
		
		Map<String, Object> map = reportService.selectBoardDetail(commandMap.getMap());
		
		mv.addObject("map", map.get("map"));
		mv.addObject("list", map.get("list"));
		
		return mv;
	}

	@RequestMapping(value = "/reportUpdateForm")
	public ModelAndView reportUpdateForm(CommandMap commandMap, HttpSession session) throws Exception {

		ModelAndView mv = new ModelAndView("/report/reportUpdate");
		
		Map<String, Object> mapp = new HashMap<String, Object>();
		
		if(session.getAttribute("ID") != null) {
			String ID = (String)session.getAttribute("ID"); 
		    mapp.put("ID", ID);
		} else if(session.getAttribute("ADMIN_ID") != null) {
			String ID = (String)session.getAttribute("ADMIN_ID"); 
			mapp.put("ID", ID);
		}
	    
	    Map<String, Object> mem = reportService.selectMemInfo(mapp);
		Map<String, Object> map = reportService.selectBoardDetail(commandMap.getMap());

		mv.addObject("mem", mem);
		mv.addObject("map", map.get("map"));
		mv.addObject("list", map.get("list"));
		
		return mv;
	}

	@RequestMapping(value = "/reportUpdate")
	public ModelAndView reportUpdate(CommandMap commandMap, HttpServletRequest request) throws Exception {

		ModelAndView mv = new ModelAndView("redirect:/reportDetail");

		reportService.updateBoard(commandMap.getMap(), request);
		mv.addObject("BOARD_NO", commandMap.get("BOARD_NO"));

		return mv;
	}

	@RequestMapping(value = "/reportDelete")
	public ModelAndView reportDelete(CommandMap commandMap) throws Exception {

		ModelAndView mv = new ModelAndView("redirect:/reportList");

		reportService.deleteBoard(commandMap.getMap());
		
		return mv;
	}
	
	@RequestMapping(value = "/reportReplyForm")
	public ModelAndView reportReplyForm(CommandMap commandMap, HttpSession session) throws Exception {

		ModelAndView mv = new ModelAndView();
	
		Map<String, Object> map = reportService.selectBoardDetail(commandMap.getMap());
	    
		mv.addObject("map", map.get("map"));
		mv.addObject("list", map.get("list"));
		mv.setViewName("/report/reportReply");
		
		return mv;
	}

	@RequestMapping(value = "/reportReply")
	public ModelAndView reportReply(CommandMap commandMap, HttpServletRequest request) throws Exception {

		ModelAndView mv = new ModelAndView("redirect:/reportList");
		
		reportService.insertReplyBoard(commandMap.getMap(), request);

		return mv;
	}
	
	@RequestMapping(value = "/reportReUpdateForm")
	public ModelAndView reportReUpdateForm(CommandMap commandMap, HttpSession session) throws Exception {

		ModelAndView mv = new ModelAndView("/report/reportReUpdate");
		
		Map<String, Object> mapp = new HashMap<String, Object>();
		
		if(session.getAttribute("ADMIN_ID") != null) {
			String ADMIN_ID = (String)session.getAttribute("ADMIN_ID"); 
			mapp.put("ADMIN_ID", ADMIN_ID);
		}
		
		Map<String, Object> mem = reportService.selectAdminInfo(mapp);
		Map<String, Object> map = reportService.selectBoardDetail(commandMap.getMap());
		
		mv.addObject("mem", mem);
	    mv.addObject("map", map.get("map"));
		mv.addObject("list", map.get("list"));
		
		return mv;
	}

	@RequestMapping(value = "/reportReUpdate")
	public ModelAndView reportReUpdate(CommandMap commandMap, HttpServletRequest request) throws Exception {

		ModelAndView mv = new ModelAndView("redirect:/reportDetail");
		
		reportService.updateReplyBoard(commandMap.getMap(), request);
		mv.addObject("BOARD_NO", commandMap.get("BOARD_NO"));
		
		return mv;
	}
	
	@RequestMapping(value="/report/downloadFile")
	public void downloadFile(CommandMap commandMap, HttpServletResponse response, HttpServletRequest request) throws Exception{
		
		Map<String,Object> map = reportService.selectFileInfo(commandMap.getMap());
		
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

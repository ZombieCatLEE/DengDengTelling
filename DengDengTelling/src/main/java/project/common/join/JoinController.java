//지연 수정  2020.03.09

package project.common.join;

import java.util.Enumeration;
import java.util.HashMap;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import project.common.common.CommandMap;
import project.common.join.JoinService;

@Controller
public class JoinController {
	Logger log = Logger.getLogger(this.getClass());

	@Resource(name = "joinService") // service 영역에 접근
	private JoinService joinService;

	@RequestMapping(value = "/join/idCheck") // 아이디 중복확인 체크 
	public @ResponseBody String idCheck(CommandMap commandMap) throws Exception {

		System.out.println(commandMap.getMap());
		String idCheck = joinService.selectIdCheck(commandMap.getMap());
		System.out.println(idCheck + "idcheck값이랍니다.");

		return idCheck;
	}

	// 회원가입 페이지
	@RequestMapping(value = "/joinPage", method = {RequestMethod.GET, RequestMethod.POST})
	public ModelAndView joinPage(CommandMap commandMap, HttpServletRequest request) throws Exception {

		ModelAndView mv = new ModelAndView("join/join");
		return mv;
	}

	//일반회원 회원가입 동의
	@RequestMapping(value = "/memJoinAgree", method = RequestMethod.GET)
	public ModelAndView memJoinAgreePage(CommandMap commandMap, HttpServletRequest request) throws Exception {

		ModelAndView mv = new ModelAndView("join/agreementMem");
		return mv;
	}

	//펫시터 회원가입 동의
	@RequestMapping(value = "/pstJoinAgree", method = RequestMethod.GET)
	public ModelAndView pstJoinAgreePage(CommandMap commandMap, HttpServletRequest request) throws Exception {

		ModelAndView mv = new ModelAndView("join/agreementPst");
		return mv;
	}


	///////////////////////////////////일반 회원가입////////////////////////////////////////

	// 일반 회원 회원가입 부분
	@RequestMapping(value = "/joinForm", method = RequestMethod.GET)
	public ModelAndView joinForm(CommandMap commandMap) throws Exception {
		ModelAndView mv = new ModelAndView("join/memJoinForm");
		return mv;
	}

	//지연 수정 2020.03.09
	@RequestMapping(value = "/join", method = RequestMethod.POST)
	// 회원가입 성공
	public ModelAndView join(CommandMap commandMap, HttpServletRequest request) throws Exception {

		ModelAndView mv = new ModelAndView("join/joinSuccess"); // join/joinSuccess에서 수정

		joinService.insertMember(commandMap.getMap(), request);

		String ID = (String) commandMap.get("MEM_ID");
		mv.addObject("Result_ID", ID);

		String NAME = (String) commandMap.get("NAME");
		mv.addObject("NAME", NAME);

		mv.addObject("map", commandMap.getMap());

		return mv;
	}

	///////////////////////////////////팻시터 회원가입////////////////////////////////////////

	// 펫시터 회원가입 부분
	// 펫시터 회원가입
	@RequestMapping(value = "/pstJoinForm", method = RequestMethod.GET) // 회원가입 폼
	public ModelAndView pstJoinForm(CommandMap commandMap) throws Exception {
		ModelAndView mv = new ModelAndView("join/pstJoinForm");
		return mv;
	}

	// 펫시터 회원 가입 성공 -> 추가 정보 1입력페이지 이동
	@RequestMapping(value = "/joinPst1", method = RequestMethod.POST)
	public ModelAndView joinPst1(CommandMap commandMap, HttpServletRequest request) throws Exception {
		System.out.println("===================pstJoinFormAdd1 실행 ======================");

		ModelAndView mv = new ModelAndView("join/pstJoinFormAdd");

		joinService.insertPst(commandMap.getMap(), request);
		mv.addObject("map", commandMap.getMap());

		return mv;
	}

	// 펫시터 추가 정보 2입력페이지 이동
	@RequestMapping(value = "/joinPst2", method = RequestMethod.POST)
	public ModelAndView joinPst2(CommandMap commandMap, HttpServletRequest request) throws Exception {
		System.out.println("===================pstJoinFormAdd2 실행 ======================");

		ModelAndView mv = new ModelAndView("join/pstJoinFormAdd2");
		//System.out.println("CERTI_NAME[0]은 " + commandMap.get("CERTI_NAME[0]"));
		/*String[] arrayParam = request.getParameterValues("CERTI_NAME");
        for (int i = 0; i < arrayParam.length; i++) {
            System.out.println(arrayParam[i]);
        }*/

		//  commandMap.getMap().put("CERTI_NAME_LIST", arrayParam);  //자격증 이름 배열정보를 CERTI_NAME으로 저장 


		//System.out.println("두번째 페이지에서 넘어온 펫시터ID는" +request.getParameter("PSMEM_ID"));
		commandMap.getMap().put("PSMEM_ID",request.getParameter("PSMEM_ID"));
		joinService.insertPstAdd(commandMap.getMap(), request);
		mv.addObject("map", commandMap.getMap());
		return mv;
	}

	@RequestMapping(value = "/joinPstAdd", method = RequestMethod.POST)
	public ModelAndView pstAdd(CommandMap commandMap, HttpServletRequest request) throws Exception {

		ModelAndView mv = new ModelAndView("join/joinSuccess");
		commandMap.getMap().put("PSMEM_ID", request.getParameter("PSMEM_ID"));
		joinService.insertPstAdd2(commandMap.getMap(), request);

		String PSMEM_ID = request.getParameter("PSMEM_ID");
		
		Map<String, Object> map = joinService.selectPetsitter(PSMEM_ID);
		
		//펫시터 정보 가져와야 함. 왜냐하면 네임이 필요해.
		mv.addObject("Result_ID", PSMEM_ID);

		String NAME = (String) map.get("NAME");
		mv.addObject("NAME", NAME);
		
		return mv;
	}



	//댕댕이 정보 입력 폼으로 이동 지연 수정 2020.03.06
	@RequestMapping(value="/petRegisterForm", method=RequestMethod.GET) 
	public ModelAndView petRegisterForm(CommandMap commandMap, HttpServletRequest request) throws Exception{
		ModelAndView mv=new ModelAndView("join/petJoinForm");

		String ID = request.getParameter("ID");
		mv.addObject("MEM_ID", ID);

		return mv;
	} 

	//댕댕이 정보 입력
	@RequestMapping(value="/petRegister")
	public ModelAndView petRegister(CommandMap commandMap, HttpServletRequest request) throws Exception{

		ModelAndView mv = new ModelAndView("join/petJoinEnd");

		joinService.insertPet(commandMap.getMap(), request);

		return mv;
	}

	//마이페이지 댕댕이 등록 폼 -> petRegister로 가도록!
	@RequestMapping(value="/myPagePetInsert", method=RequestMethod.GET) 
	public ModelAndView myPagePetInsert(CommandMap commandMap, HttpSession session) throws Exception{
		ModelAndView mv=new ModelAndView("join/myPagePetInsert");
		
		mv.addObject("ID", (String) session.getAttribute("ID"));

		return mv;
	} 
		

	//이 부분은 필요없을 듯
	//댕댕이 추가 정보 입력  지연 수정  2020.03.06
	@RequestMapping(value="/petRegisterAdd", method=RequestMethod.POST)
	public ModelAndView petRegisterAdd(CommandMap commandMap, HttpServletRequest request) throws Exception{

		System.out.println("===================petRegisterADD 실행 ======================");
		ModelAndView mv=new ModelAndView("main/main");

		System.out.println("ID는" + commandMap.get("ID"));
		System.out.println("PET_MEM_NAME은" + commandMap.get("PET_MEM_NAME"));

		//PET_MEM_ID를 DB에서 꺼내오기
		String pet_mem_id = joinService.getPetMemId(commandMap.getMap());
		//꺼내온 아이디값을 map에 넣어준다. 
		commandMap.getMap().put("PET_MEM_ID", pet_mem_id);

		joinService.petRegistAdd(commandMap.getMap());

		HttpSession session = request.getSession(false);
		//String name = (String)session.getAttribute("NAME");
		if ((session.getAttribute("NAME"))==null) {
			System.out.println("회원가입후 바로 펫등록할경우 세션 invalidate!!!!");
			session.invalidate();
		}
		return mv;
	}

	
	//펫시터 회원 가입 완료되지 않았을 때 실행될 메서드******************************
	//메인에서 펫시터 추가 가입으로 이동
	@RequestMapping(value = "/joinAdd1")
	public ModelAndView joinAdd1(HttpSession session) throws Exception {
		ModelAndView mv = new ModelAndView("join/joinAdd1");

		String PSMEM_ID = (String) session.getAttribute("ID");
		
		mv.addObject("PSMEM_ID", PSMEM_ID);
		
		return mv;
	}
	
	//펫시터 추가 가입에서 저장 후 펫시터 위탁 장소로 이동
	@RequestMapping(value = "/joinAddInsert", method = RequestMethod.POST)
	public ModelAndView joinAddInsert(CommandMap commandMap, HttpServletRequest request) throws Exception {

		ModelAndView mv = new ModelAndView("join/joinAdd2");
		
		commandMap.getMap().put("PSMEM_ID", request.getParameter("PSMEM_ID"));
		joinService.insertPstAdd(commandMap.getMap(), request);
		mv.addObject("map", commandMap.getMap());
		
		return mv;
	}

	//메인에서 위탁 장소 등록으로 이동
	@RequestMapping(value = "/joinAdd2")
	public ModelAndView joinAdd2(HttpSession session) throws Exception {
		ModelAndView mv = new ModelAndView("join/joinAdd2");

		String PSMEM_ID = (String) session.getAttribute("ID");
		
		mv.addObject("PSMEM_ID", PSMEM_ID);
		
		return mv;
	}
		
	//펫시터 위탁 장소 등록 후 메인으로
	@RequestMapping(value = "/joinAdd2Insert", method = RequestMethod.POST)
	public ModelAndView joinAdd2Insert(CommandMap commandMap, HttpServletRequest request) throws Exception {

		ModelAndView mv = new ModelAndView("join/addJoinSuccess");
		commandMap.getMap().put("PSMEM_ID", request.getParameter("PSMEM_ID"));
		joinService.insertPstAdd2(commandMap.getMap(), request);

		String PSMEM_ID = request.getParameter("PSMEM_ID");
		
		Map<String, Object> map = joinService.selectPetsitter(PSMEM_ID);
		
		//펫시터 정보 가져와야 함. 왜냐하면 결과 뽑을 때 필요함.
		mv.addObject("Result_ID", PSMEM_ID);

		String NAME = (String) map.get("NAME");
		mv.addObject("NAME", NAME);
		
		return mv;
	}

}

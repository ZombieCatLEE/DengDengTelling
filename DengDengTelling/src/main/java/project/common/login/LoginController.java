package project.common.login;

import java.util.HashMap;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import project.common.common.CommandMap;

@Controller
public class LoginController {

	Logger log = Logger.getLogger(this.getClass());

	@Resource(name = "loginService")
	private LoginService loginService;

	//Login Form으로 이동 : 호석
	@RequestMapping(value = "/login")
	public ModelAndView login(CommandMap commandMap) throws Exception {
		ModelAndView mv = new ModelAndView("/main/login");
		return mv;
	}

	//Login 기능 구현 : 호석
	@RequestMapping(value = "/loginResult", method = RequestMethod.POST)
	public ModelAndView loginResult(CommandMap commandMap, HttpServletRequest request) throws Exception {
		
		ModelAndView mv = new ModelAndView("/main/loginResult");
		
		String message = "";
		String url = "";
		String pJoinStep = "";
		  
		HttpSession session = request.getSession();
		  
		Map<String, Object> Check = loginService.loginCheck(commandMap.getMap());
		
		if(Check == null) {	//DB에서 값을 가져오지 못 하면
			message = "해당 아이디가 존재하지 않습니다.";
		} else {
			if(Check.get("PASSWORD1").equals(commandMap.get("PASSWORD1"))) {
				session.setAttribute("ID", commandMap.get("ID"));
				session.setAttribute("MEM_TYPE", Check.get("MEM_TYPE"));
				session.setAttribute("NAME", Check.get("NAME"));
				
				String MEM_TYPE = (String)Check.get("MEM_TYPE");
				String NAME = (String)Check.get("NAME");
				String PSMEM_ID = (String)Check.get("ID");
				
				message = MEM_TYPE + " " + NAME + " 님의 방문을 환영합니다.";
				url = "/main";
				if(MEM_TYPE.equals("펫시터")) {
					Map<String, Object> map = loginService.selectPetsitterAdd(PSMEM_ID);
					if(map != null) {
						if(map.get("PSMEM_JOB") != null && map.get("PSMEM_CONSIGNMENT_ZIPCODE").equals(" ")) {
							pJoinStep = "위탁";
						} else {
							pJoinStep = "완료";
						}
					} else {
						pJoinStep = "추가";
					}
				}
			} else {
				message = "비밀번호가 일치하지 않습니다.";
			}
		}
		System.out.println("펫시터 가입 단계 : " + pJoinStep + " 단계");
		mv.addObject("message", message);
		mv.addObject("url", url);
		mv.addObject("step", pJoinStep);
		  
		return mv;
	}

	//로그아웃 기능 구현 : 호석
	@RequestMapping(value = "/logout")
	public ModelAndView logout(HttpServletRequest request, CommandMap commandMap) throws Exception {
		HttpSession session = request.getSession(false);
		if (session != null)
			session.invalidate();
		ModelAndView mv = new ModelAndView();
		mv.setViewName("redirect:/main");
		return mv;
	}

//	@RequestMapping("/needLogin")
//	// 로그인 인터셉터. 이 부분은 추후 로그인을 하지 않은 아이디를 구분할 때 사용할 예정.
//	public ModelAndView needLogin(CommandMap commandMap) throws Exception {
//		ModelAndView mv = new ModelAndView("/member/main/login");
//		String message = "로그인이 필요한 서비스입니다.";
//		String url = "/loginForm";
//		mv.addObject("message", message);
//		mv.addObject("url", url);
//		return mv;
//	}
//
//	
//	@RequestMapping("/tenantOnly") //로그인 인터셉터
//	public ModelAndView tenantOnly(CommandMap commandMap) throws Exception {
//		ModelAndView mv = new ModelAndView("member/common/back");
//		String message = "임대인 계정만 이용할 수 있는 서비스입니다.";
//		mv.addObject("message",message);
//		return mv;
//	}
	
	
	//아이디 비밀번호 찾기 폼으로 이동 : 지연
	@RequestMapping(value="/findIdPw")
	public ModelAndView loginSearchForm(CommandMap commandMap) throws Exception { 
		ModelAndView mv = new ModelAndView();

		mv.setViewName("/main/findIdPw"); return mv; 
	}

	//아이디 찾기 기능 : 지연
	@RequestMapping(value = "/findIdResult", method = RequestMethod.POST) // 입력한 정보에 맞춰서 아이디를 찾아주는 거
	public ModelAndView findIdResult(CommandMap commandMap) throws Exception {
		ModelAndView mv = new ModelAndView("/main/findIdResult");

		Map<String, Object> map = loginService.findId(commandMap.getMap());
		mv.addObject("id", map);
		return mv;
	}

	//비밀번호 찾기 기능 : 지연
	@RequestMapping(value = "/findPwResult", method = RequestMethod.POST) // 입력한 정보에 맞춰서 아이디를 찾아주는 거
	public ModelAndView findPwResult(CommandMap commandMap) throws Exception {
		ModelAndView mv = new ModelAndView("/main/findPwResult");

		Map<String, Object> map = loginService.findPw(commandMap.getMap());
		mv.addObject("pw", map);
		return mv;

	}
}

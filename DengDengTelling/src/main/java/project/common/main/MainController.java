package project.common.main;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import project.common.common.CommandMap;

@Controller
public class MainController {

	Logger log = Logger.getLogger(this.getClass());

	@RequestMapping(value="/", method = {RequestMethod.GET, RequestMethod.POST})
	public ModelAndView main(CommandMap commandMap) throws Exception{
		ModelAndView mv = new ModelAndView("main/main");
		System.out.println("..........................................");
		return mv;
	}
	
	@RequestMapping(value="/warning")
	public ModelAndView warning(CommandMap commandMap) throws Exception{
		ModelAndView mv = new ModelAndView("main/pageWarning");
		return mv;
	}
}


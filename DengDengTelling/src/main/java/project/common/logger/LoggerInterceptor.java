package project.common.logger;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

public class LoggerInterceptor extends HandlerInterceptorAdapter {		//요청한 URL을 모두 출력함.	action-servlet에 사용을 위한 코드가 있음.
	
	protected Log log = LogFactory.getLog(LoggerInterceptor.class);
	
	@Override		//처리 시작
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
		if(log.isDebugEnabled()) {
			log.debug("=================================  Start  =================================");
			log.debug(" Request URI \t:  " + request.getRequestURI());
		}
		return super.preHandle(request, response, handler);
	}
	
	@Override		//처리 끝
	public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler, ModelAndView modelAndView) throws Exception {
		if(log.isDebugEnabled()) {
			log.debug("=================================  End  =================================\n");
		}
	}
}

package project.common.logger;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.aspectj.lang.ProceedingJoinPoint;
import org.aspectj.lang.annotation.Around;
import org.aspectj.lang.annotation.Aspect;

@Aspect	//action-servlet.xml과 context-aspect.xml에서 <aop:aspectj-autoproxy/>를 사용했었는데 @Aspect 어노테이션을 통해서 bean을 등록시켜주는 역할을 한다.
public class LoggerAspect {

	protected Log log = LogFactory.getLog(LoggerAspect.class);
	static String name = "";
	static String type = "";
	
	@Around("execution(* project..controller.*Controller.*(..)) or execution(* project..service.*Impl.*(..)) or execution(* project..dao.*DAO.*(..))")
	public Object logPrint(ProceedingJoinPoint joinPoint) throws Throwable {
		type = joinPoint.getSignature().getDeclaringTypeName();
		
		if(type.indexOf("Controller") > -1) {
			name = "Controller \t:  ";
		} else if(type.indexOf("Service") > -1) {
			name = "ServiceImpl \t:  ";
		} else if(type.indexOf("DAO") > -1) {
			name = "DAO \t\t:  ";
		}
		log.debug(name + type + "." + joinPoint.getSignature().getName() + "()");
		return joinPoint.proceed();
	}
}


/*
 * @Around("execution(* first..controller.*Controller.*(..)) or execution(* first..service.*Impl.*(..)) or execution(* first..dao.*DAO.*(..))"
 * )
 * 
 * 먼저 @Around다. 어드바이스는 어노테이션이 붙은 메서드를 이용해 정의한다. AspectJ에서는 다섯 가지 종류의 Advice를 이용할
 * 수 있는데 각각 @Before, @AfterReturning, @AfterThrowing, @After, @Around 어노테이션으로
 * 표현된다.
 * 
 * @Around로 시작하기 때문에, Around Advice임을 알수 있다.
 * 
 * 그 다음으로 "execution"은 포인트컷 표현식 부분이다. 포인트컷 표현식은 위에서 사용된 execution()을 포함하여 여러가지
 * 포인트컷 지시자(PointCut Designator)를 사용할 수 있다. 그 종류는 다음과 같다.
 * 
 * execution() : 가장 대표적이고 강력한 지시자로, 접근제어자, 리턴 타입, 타입 패턴, 메서드, 파라미터 타입, 예외 타입 등을
 * 조합해서 메서드까지 선택가능한 가장 정교한 포인트컷을 만들수 있다. within() : 타입 패턴만을 이용하여 조인포인트를 정의한다.
 * this : 빈 오브텍트의 타입의 조인토인트를 정의한다. target : 대상객체의 타입 비교를 이용한 조인포인트를 정의한다. args :
 * 메서드의 파라미터 타입만을 이용하여 조인포인트를 정의한다.
 * 
 * @target : 특정 어노테이션이 정의된 객체를 찾는 조인포인트를 정의한다.
 * 
 * @args : 특정 어노테이션을 파라미터로 받는 오브젝트를 찾는 조인포인트를 정의한다.
 * 
 * @within : @target과 유사하게 특정 어노테이션이 정의된 객체를 찾는데, 선택될 조인포인트 메서드는 타겟 클래스에서 선언이
 * 되어있어야 한다.
 * 
 * @annotation : 조인 포인트 메서드에 특정 어노테이션을 찾는 조인포인트를 정의한다. 이렇게 종류를 써 놨지만, 필자도 다 사용을
 * 해본것은 아니다.
 * 
 * 보통 execution 하나로 다 처리를 해버린다....ㅡ_ㅡ;;;
 * 
 * 그 다음으로 * first..controller.*Controller.*(..) 부분을 살펴보자. 처음에 first.. 라고 되어있는것을
 * 볼 수 있다. 이는 first 패키지 밑의 모든 서브패키지를 의미한다.
 * 
 * 그 다음 controller. 는 controller 패키지 밑의 클래스와 인터페이스만을 지정한다. 그 다음 *Controller.는
 * Controller라는 이름으로 끝나는 것을 의미한다. 마지막으로 *(..)은 모든 메서드를 의미한다.
 * 
 * 그 다음으로 or는 포인트컷 표현식을 조합할 수 있다. 포인트컷의 조합식에는 or, and, not 3가지를 사용할 수 있으며 각각 ||,
 * &&, !으로 표현할 수도 있다. 즉 @(..)) || execution 이런식으로 표현해도 무방하다는 의미이다.
 * 
 * 여기서 AspectJ를 이용한 장점 한가지를 이야기하려고 한다. AOP를 설정할 때는 하나 이상의 포인트컷과 어드바이스를 가져야하는데
 * AspectJ를 사용하면 위에서 보는것과 같이 어노테이션을 이용하여 어드바이스에 포인트컷을 직접 지정해 줄 수 있다. 만약 이러한 방식이
 * 되지 않는다면, 포인트컷과 어드바이스를 따로따로 정의해야한다. 굳이 불편한 방법을 선택할 이유는 없으니, 이 부분은 넘어가도록 한다.
 * 
 * 그 외 소스 부분은 따로 설명하지 않아도 될것으로 생각한다.
 * 
 * 이제 마지막으로 설명할 부분은 왜 action-servlet.xml과 context-aspect.xml 두 곳에서 AOP를 설정했는지에
 * 대한 것이다. 이는 Application Context의 계층구조와 연관이 되어 있다. 지금 우리의 프로젝트는 2개의 컨텍스트가 설정이
 * 되어있다. 하나는 action-servlet.xml이고 다른 하나는 context-*.xml 파일이 그것인데, 이는 각각 Root
 * Application Context, Servlet Context의 설정파일이다.
 * 
 * 두개의 차이점은 다음과 같다.
 * 
 * Root Application Context - 최상단 컨텍스트 - 서로 다른 서블릿 컨텍스트에서 공유하는 bean을 등록 - 웹에서
 * 사용되는 컨트롤러 등을 등록 - 서블릿 컨텍스트에서 등록된 bean을 사용할 수 없으며, 서블릿 컨텍스트와 루트 컨텍스트에서 동일한
 * bean을 설정할 경우, 서블릿 컨텍스트에서 설정한 bean만 동작
 * 
 * Servlet Context - 서블릿에서 이용되는 컨텍스트 - 여기서 정의된 bean은 다른 서블릿 컨텍스트와 공유할 수 없음
 * 
 * 따라서 Controller와 관련된 bean은 action-servlet.xml에 설정하고, Service, DAO, Component등은
 * context-*에 설정하게 된다. SpringMVC 개발에서는 이렇게 설정하는것이 원칙이다.
 * 
 * 우리가 설정한 AOP를 보면 Controller, Service, DAO의 3개 영역에서 모두 사용이 되어야 하는데, 한쪽의 컨텍스트에서만
 * 설정하게 되면 다른 컨텍스트에서는 동작하지 않게 된다. 예를 들어 action-servlet.xml에만 설정을 하면 Controller의
 * 로그만 출력될 것이고, context-aspect.xml에서만 설정하면 Service, DAO에서만 로그가 출력이 될 것이다.
 * 
 * 사실 이 글 전에 action-servlet.xml에서만 Component-scan을 했었는데, 이는 잘못된 방법이다.
 */
package project.common.login;

import java.util.Map;

import javax.annotation.Resource;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Service;


@Service("loginService")
public class LoginServiceImpl implements LoginService{
	
	Logger log = Logger.getLogger(this.getClass());
	
	@Resource(name="loginDAO")
	private LoginDAO loginDAO;

	@Override
	public Map<String, Object> loginCheck(Map<String, Object> map) throws Exception {
		// TODO Auto-generated method stub
		return loginDAO.selectId(map);
	}
	
	@Override
	public Map<String, Object> findId(Map<String, Object> map) throws Exception {
		// TODO Auto-generated method stub
		return loginDAO.findId(map);
	}
	
	@Override
	public Map<String, Object> findPw(Map<String, Object> map) throws Exception {
		// TODO Auto-generated method stub
		return loginDAO.findPw(map);
	}

	@Override
	public Map<String, Object> selectPetsitterAdd(String str) throws Exception {
		// TODO Auto-generated method stub
		return loginDAO.selectPetsitterAdd(str);
	}
	
}

package project.common.login;

import java.util.Map;

import org.springframework.stereotype.Repository;

import project.common.dao.AbstractDAO;

@Repository("loginDAO")
public class LoginDAO extends AbstractDAO { 

	//로그인 : 호석
	@SuppressWarnings("unchecked")
	public Map<String, Object> selectId(Map<String, Object> map) throws Exception {
		// TODO Auto-generated method stub
		return (Map<String, Object>) selectOne("loginSql.selectId", map);
	}

	//지연: 아이디찾기 DAO
	@SuppressWarnings("unchecked")
	public Map<String, Object> findId(Map<String, Object> map) throws Exception{
		// TODO Auto-generated method stub
		return (Map<String, Object>) selectOne("loginSql.findId", map);
	}

	//지연: 비번찾기 DAO 
	@SuppressWarnings("unchecked")
	public Map<String, Object> findPw(Map<String, Object> map) throws Exception{
		// TODO Auto-generated method stub
		return (Map<String, Object>) selectOne("loginSql.findPw", map);
	}

	//펫시터 회원 가입 단계 확인
	@SuppressWarnings("unchecked")
	public Map<String, Object> selectPetsitterAdd(String str) {
		return (Map<String, Object>) selectOne("loginSql.selectPetsitterAdd", str);
	}
}

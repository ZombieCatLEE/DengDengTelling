//지연 수정  2020.03.06
package project.common.join;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;

public interface JoinService {

	String selectIdCheck(Map<String, Object> map) throws Exception; //지연

	void insertMember(Map<String, Object> map, HttpServletRequest request) throws Exception; //지연

	void insertPst(Map<String, Object> map, HttpServletRequest request) throws Exception; //준호
 
	void insertPstAdd(Map<String, Object> map, HttpServletRequest request) throws Exception; 
	 
	void insertPstAdd2(Map<String, Object> map, HttpServletRequest request) throws Exception; 

	void petRegist(Map<String, Object> map, HttpServletRequest request) throws Exception;//지연

	Map<String, Object> getPstId(Map<String, Object> map) throws Exception; //준호
	
	void petRegistAdd(Map<String, Object> map) throws Exception; //지연추가
	
	public String getPetMemId(Map<String, Object> map) throws Exception; //지연추가
	
	void insertPet(Map<String, Object> map, HttpServletRequest request) throws Exception;
	//void insertPetAdd(Map<String, Object> map) throws Exception;
	Map<String, Object> selectPetMemId(Map<String, Object> map) throws Exception;
	
	Map<String, Object> selectPetsitter(String str) throws Exception;
}

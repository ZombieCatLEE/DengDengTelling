package project.common.common;

import java.util.HashMap;
import java.util.Map;
import java.util.Map.Entry;
import java.util.Set;

public class CommandMap {		//전송된 데이터는 맵으로 바로 받을 수 없기 때문에 이와 같이 설정해줘야 한다. 참고 홈페이지 (11) HandlerMethodArgumentResolver 내용 참고.

	Map<String, Object> map = new HashMap<String, Object>();
	
	public Object get(String key) {
		return map.get(key);
	}
	
	public void put(String key, Object value) {
		map.put(key, value);
	}
	
	public Object remove(String key) {
		return map.remove(key);
	}
	
	public boolean containsKey(String key) {
		return map.containsKey(key);
	}
	
	public boolean containsValue(Object value) {
		return map.containsValue(value);
	}
	
	public void clear() {
		map.clear();
	}
	
	public Set<Entry<String, Object>> entrySet() {
		return map.entrySet();
	}
	
	public Set<String> keySet() {
		return map.keySet();
	}
	
	public boolean isEmpty() {
		return map.isEmpty();
	}
	
	public void putAll(Map<? extends String, ?extends Object> m) {
		map.putAll(m);
	}
	
	public Map<String, Object> getMap() {
		return map;
	}
}

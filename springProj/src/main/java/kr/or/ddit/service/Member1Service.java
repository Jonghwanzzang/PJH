package kr.or.ddit.service;

import java.util.List;
import java.util.Map;

import kr.or.ddit.vo.Member1VO;

public interface Member1Service {

	public List<Member1VO> list(Map<String,String> map);
	
	public int getTotal(Map<String,String> map);
	
	public int insert(Member1VO memberVO);
	
	public int insertIdCheck(String memId);
	
}

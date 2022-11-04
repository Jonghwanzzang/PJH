package kr.or.ddit.mapper;

import java.util.List;
import java.util.Map;

import kr.or.ddit.vo.Member1VO;

public interface MemMapper {
	//글 목록
	public List<Member1VO> selectall(Map<String,String> map);
	
	public int getTotal(Map<String,String> map);
	
	public int insert(Member1VO memberVO);

	//아이디 중복
	public int insertIdCheck(String memId) ;
	
	//상세보기
	public Member1VO detail(String memId); 
}

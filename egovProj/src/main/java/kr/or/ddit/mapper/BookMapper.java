package kr.or.ddit.mapper;

import java.util.List;

import kr.or.ddit.vo.BookVO;

public interface BookMapper {
	
	public List<BookVO> list();

	public BookVO detail(String bookId);
	
	public int modify(BookVO vo);
	
	public int insert(BookVO vo);
	
	public int delete(int bookId);
	
}

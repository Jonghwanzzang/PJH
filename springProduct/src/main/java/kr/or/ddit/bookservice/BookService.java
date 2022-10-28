package kr.or.ddit.bookservice;

import java.util.List;

import kr.or.ddit.bookvo.BookVO;

public interface BookService {
	
	public List<BookVO> selectAll();
	
	public int insertbook(BookVO vo);

	public BookVO detail(String bookId);
}

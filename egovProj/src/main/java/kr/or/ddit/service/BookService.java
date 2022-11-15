package kr.or.ddit.service;

import java.util.List;

import kr.or.ddit.vo.BookVO;

public interface BookService  {

	public List<BookVO> list();
	
	public BookVO detail(String bookId);
	
	public int modify(BookVO vo);
	
	public int insert(BookVO vo);
	
	public BookVO filelist(BookVO vo);
	
	public int delete(int bookId);
	
	public List<BookVO> bookList();
}

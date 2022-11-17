package kr.or.ddit.mapper;

import java.util.List;

import kr.or.ddit.vo.AttachVO;
import kr.or.ddit.vo.BookVO;

public interface GalleryMapper {
	
	//한 권의 책에 대한 여러개의 이미지 목록
	public BookVO filelist(BookVO vo);
	
	//도서 목록 가져와서 select에 추가하기
	public List<BookVO> bookList();
	
	public int fileupdate(AttachVO vo);
	
	public int deletePost(AttachVO vo);
	
	public List<BookVO> searchBook(BookVO vo);
}

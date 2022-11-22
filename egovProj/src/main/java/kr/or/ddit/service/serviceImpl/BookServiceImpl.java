package kr.or.ddit.service.serviceImpl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.or.ddit.mapper.BookMapper;
import kr.or.ddit.mapper.GalleryMapper;
import kr.or.ddit.service.BookService;
import kr.or.ddit.vo.AttachVO;
import kr.or.ddit.vo.BookVO;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service
public class BookServiceImpl implements BookService {
	
	@Autowired
	BookMapper bookMapper;
	
	@Autowired
	GalleryMapper galleryMapper;
	
	public List<BookVO> list() {
		return this.bookMapper.list();
		
	}

	@Override
	public BookVO detail(String bookId) {
		return this.bookMapper.detail(bookId); 
	}

	@Override
	public int modify(BookVO vo) {
		log.info("befor VO : " + vo.toString());
			int result = this.bookMapper.insert(vo);
			log.info("after VO : " + vo.toString());
				return result;
	}

	@Override
	public int insert(BookVO vo) {
		log.info("북서비스임플 : "+ vo.toString());
		return this.bookMapper.insert(vo);
	}

	@Override
	public BookVO filelist(BookVO vo) {
		return this.galleryMapper.filelist(vo);
	}

	@Override
	public int delete(int bookId) {
		return this.bookMapper.delete(bookId);
	}

	@Override
	public List<BookVO> bookList() {
		return this.galleryMapper.bookList();
	}

	@Override
	public int fileupdate(AttachVO vo) {
		return this.galleryMapper.fileupdate(vo);
	}

	@Override
	public int deletePost(AttachVO vo) {
		return this.galleryMapper.deletePost(vo);
	}

	@Override
	public List<BookVO> searchBook(BookVO vo) {
		return this.galleryMapper.searchBook(vo);
	}

	@Override
	public int uploadAjaxAction(List<AttachVO> attachVOList) {
		return this.galleryMapper.uploadAjaxAction(attachVOList);
	}

	@Override
	public int getSeq(String bookId) {
		// TODO Auto-generated method stub
		return this.galleryMapper.getSeq(bookId);
	}
	
	
	

}

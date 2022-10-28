package kr.or.ddit.bookservice.serviceimpl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.or.ddit.bookdao.BookDao;
import kr.or.ddit.bookservice.BookService;
import kr.or.ddit.bookvo.BookVO;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service
public class BookServiceImpl implements BookService {
	
	@Autowired
	BookDao bookdao;
	
	@Override
	public List<BookVO> selectAll() {
		return this.bookdao.selectAll();
	}

	@Override
	public int insertbook(BookVO vo) {
		return this.bookdao.insertbook(vo);
	}

	@Override
	public BookVO detail(String bookId) {
		return this.bookdao.detail(bookId);
	}
	
		
	

}

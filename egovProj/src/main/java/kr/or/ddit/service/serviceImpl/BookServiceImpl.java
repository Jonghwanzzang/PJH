package kr.or.ddit.service.serviceImpl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.or.ddit.mapper.BookMapper;
import kr.or.ddit.service.BookService;
import kr.or.ddit.vo.BookVO;

@Service
public class BookServiceImpl implements BookService {
	
	@Autowired
	BookMapper bookMapper;
	
	public List<BookVO> list() {
		return this.bookMapper.list();
		
	}

}

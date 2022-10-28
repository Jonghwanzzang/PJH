package kr.or.ddit.bookcontroller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import kr.or.ddit.bookservice.BookService;
import kr.or.ddit.bookvo.BookVO;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
public class BookController {
	
	@Autowired
	BookService bookservice;
	
	@RequestMapping("/welcome")
	public String welcome() {
		
		return "book/welcome";
	}
	
	@RequestMapping(value="/books" , method = RequestMethod.GET)
	public ModelAndView books(ModelAndView mav) {
		log.info("books 들어옴");
		List<BookVO> list = this.bookservice.selectAll();
		log.info(list.toString());
		
		mav.addObject("list", list);
		mav.setViewName("book/books");
		return mav;
	}
	
	@RequestMapping("/addBook")
	public String addBook() {
		return "book/addBook";
		
	}
	
	
	@RequestMapping(value="/processAddBook" , method = RequestMethod.POST)
	public String processAddBook( BookVO vo ) {
		log.info(" v o : " + vo.toString());
		int resultchk = this.bookservice.insertbook(vo);
		
		if(resultchk >0) {
			log.info("insert 성공");
		}else {
			log.info("insert 실패");
			
		}
		
		return "book/welcome";
		
	}
	@RequestMapping(value="/product" , method = RequestMethod.GET)
	public ModelAndView detail( String bookId , ModelAndView mav) {
		log.info("Controller bookId  : " + bookId);
		BookVO vo = this.bookservice.detail(bookId);	
		log.info("db에서 나온 vo   : " + vo.toString());
		
		 mav.addObject("bookvo", vo); 
		 mav.setViewName("book/product");
		
		return mav;
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
}

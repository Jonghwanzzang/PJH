package kr.or.ddit;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import org.mvel2.ast.Instance;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import javassist.expr.Instanceof;
import kr.or.ddit.service.serviceImpl.BookServiceImpl;
import kr.or.ddit.vo.BookVO;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@RequestMapping("/book")
@Controller
public class BookController {
	
	@Autowired
	BookServiceImpl bookServiceImpl;
	
	@GetMapping("/list")
	public String list(Model model) {
		
		List<BookVO> list = this.bookServiceImpl.list();
		log.info("list : " + list);
		
		// 공통 약속
		model.addAttribute("bodyTitle", "도서 목록");
		model.addAttribute("list", list);
		
		
		return "book/list";
	}
	
	//요청URI : /book/detail?bookId=3
	//요청파라미터 : bookId=3
	//메소드 이름 : detail
	//목록에서 title을 클릭 시 상세페이지로 이동
	// 1) 스프링에서 요청파라미터를 매개변수로 받을 수 있다.
	// 		요청 파라미터는 Stirng타입, int형 매개변수로도 받을 수 있음(자동 형 변환)
	// 2) Map<String,String> / Map<String,Objecvt> 가능
	// 3) 골뱅이ModelAttricute BookVO bookVO
	// 4) 골뱅이 RequestParam Map<String, String> / Map<String,Object> 가능
	// 받을 수 있는 방법은 다양하다.
	@GetMapping("/detail")
	public String detail(String bookId , Model model) {
		log.info("detail bookId : " + bookId);
		BookVO vo = this.bookServiceImpl.detail(bookId);
		log.info(vo.toString());
		SimpleDateFormat sd = new SimpleDateFormat("yyyy-MM-dd");
		Object time = sd.format(vo.getInsertDate());
		model.addAttribute("bodyTitle", "도서 상세");
		model.addAttribute("vo",vo);
		
		return "book/detail"; 
	}
	
	@PostMapping("/modify")
	public String modify(@ModelAttribute BookVO vo) {
		log.info("BookVO : "  + vo.toString());
//		vo.setInsertDate((Date)vo.getInsertDate());
		// 머지 인투에 의해 id가 변경될 것이므로 미리 id를 받아놓자
		int bookId = vo.getBookId();
		
		int result = this.bookServiceImpl.modify(vo);
		log.info("result : " + result);
		return "redirect:/book/detail?bookId="+bookId;
	}
	
	@GetMapping("/intpage")
	public String intpage() {
		return "book/insert";
	}
	
	@PreAuthorize("permitAll")
	@PostMapping("/insert")
	public String bookInsert(BookVO vo) {
		log.info(" hihi  ");
		log.info(" isnert vo : " + vo.toString());
		int result = this.bookServiceImpl.insert(vo);
		return "redirect:/book/list";
		//		return "redirect:/book/detail?bookId="+vo.getBookId();
	}
}

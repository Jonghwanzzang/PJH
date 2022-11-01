package kr.or.ddit.Controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestAttribute;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
/*
 	Cotoller 어노테이션이라고 함
 	스프링 프레임워크에게  스프링아 이 클래스는 웹 브라우저의 요청(request)를 받아들이는 컨트롤러야 라고 알려주는 것
 	스프링은 servlet-context.xml의 context:component-scan의 설정에 의해
 	이 클래스를 자바 빈 객체로 등록(메모리에 바인딩)
 */
import org.springframework.web.servlet.ModelAndView;

import lombok.extern.slf4j.Slf4j;
import kr.or.ddit.service.BookService;
import kr.or.ddit.vo.BookVO;


@Slf4j
@Controller
public class BookController {
	// 도서관리프로그램
	// 의존성 주입 DI  --> BookService 서비스를 호출하기 위해 의존성 주입
	@Autowired
	BookService bookService;
	
	// URI => http ://localhost/create 
	// URI를 요청했을때 아래있는 메소드와 매핑을 해준다
	
	// Request : client가 server에 URI를 요청
	// Mapping : create() 메소드를 실행
	@RequestMapping(value="/create",method=RequestMethod.GET)
	public ModelAndView create(Model model) {
		/* ModelAndView
		   1) Model : return 할 데이터 (String int , List,Map , VO..)를 담당
		   2) View : 화면을 담당(view(뷰 :JSP)의 경로)
		   	 	Viewresolver => prefix + jsp파일 + .suffix
		 */
		log.info("==============================View(JSP)===============");
		ModelAndView mav = new ModelAndView();
		// WEB-INF/views/book/create.jsp
		mav.setViewName("book/create");
		//forwoarding
		return mav;
	}
	
	//URI : http://localhost/create
	// 요청 파라미터 : {title:개똥이 , category:소설 , price:8000}
	// <form action="/create" method="post">
	@RequestMapping(value="/create" ,method=RequestMethod.POST)
	public ModelAndView createPost(ModelAndView mav,@ModelAttribute BookVO bookVO) {
		log.info("=====================POST Method ===============");
		log.info("bookVO : "+ bookVO.toString());
		
		int result = this.bookService.insert(bookVO);
		log.info("result : " + result);
		if(result <1) {
			// create(get방식) URI를 재요청
			// 책 입력 화면으로 이동
			mav.setViewName("redirect:/create");
		}else {
			mav.setViewName("redirect:/detail?bookId="+bookVO.getBookId());
			log.info("성공");
		}
		
		return mav;
	}
	
	//책 상세보기
	// 요청된URI 주소 : /detail?bookId=1
	// URL : http:// localhost/detail
	// 요청(HTTP) 파라미터, 쿼리스트링 : bookId=1
	@RequestMapping(value="/detail" , method = RequestMethod.GET)
	public ModelAndView deatail(ModelAndView mav , @ModelAttribute BookVO bookVO) {
		log.info("---------------------detail------------------------");
		log.info("bookVO : " + bookVO.toString());
		
		
		//select 결과 1행을 bookVO에 담을것임
		
		// forwarding => "WEB-INF/views/book/detail.jsp" 찾아서
		// 해석 / 컴파일을 하여 응답.
		// 데이터(BookVO) 1행을 함께 응답
		// but, redirect 방식은 데이터를 응답해주지 못함
		BookVO data = this.bookService.selectDetail(bookVO);
		mav.setViewName("book/detail"); // forward 방식
		mav.addObject("data", data);
		mav.addObject("bookId",data.getBookId());
		return mav;
	}

	//요청 URI => http://localhost/list
	// @RequestParam(value="파라미터name(keyowrd)", required=false(?keyword=일 떄 방지))
	@RequestMapping(value="/list" , method=RequestMethod.GET)
	public ModelAndView list(ModelAndView mav,
						@RequestParam(value="keyword",required = false) String keyword) {
		//forwarding
		List<BookVO> list = this.bookService.list(keyword);
		for(BookVO vo : list) {
			log.info("vo : " + vo);
		}
		
		mav.addObject("data",list);
		mav.setViewName("book/list"); // forwarding
		return mav;
	}
	
	//책 수정하기
	// 요청 URL : /update?bookId=1
	// 요청 파라미터 : bookId=1
	@RequestMapping(value="/update", method = RequestMethod.GET)
	public ModelAndView upate(BookVO bookVO , ModelAndView mav) {
		//책 수정 화면 = 책 상세 화면 + 책 상세 화면
		// 책 입력 화면 형식을 그대로 따라가고 빈 칸을 데이터로 채워주면 됨
		
		// 책 상세 데이터 가져오기
		BookVO data = this.bookService.selectDetail(bookVO);
		mav.addObject("data",data);
		
		// view : jsp 경로
		// servlet-context.xml에서 설정한대로
		// WEB-INF/views/ + "book/update" + qqw.jsp
		mav.setViewName("book/update");
		return mav;
	}
	
	//책 변경
	@RequestMapping(value="/update" , method = RequestMethod.POST)
	public ModelAndView updatePost(BookVO bookVO , @ModelAttribute ModelAndView mav) {
		log.info("updatePost=>BOOKVO : " + bookVO);
		int result  = this.bookService.update(bookVO);
		if(result>0) {
			log.info("업데이트 성공");
			mav.setViewName("redirect:/detail?bookId="+bookVO.getBookId());
		}else { // 실패 -> 책 상세페이지 update.jsp로 이동
			mav.setViewName("redirect:/update?bookId="+bookVO.getBookId());
			log.info("업데이트 실패");
		}
		return mav;
	}
	
	//요청URI => http://localhost//delete?bookId=1
	//요청URL => http://localhost/delete
	//요청파라미터 => {"bookId":"1"}
	//매개변수 타입이 int 타입을 자동 형 변환 
	@RequestMapping(value="/delete" , method = RequestMethod.POST )
	public ModelAndView delete(ModelAndView mav, int bookId) {
		log.info("bookId" + bookId);
		
		int result = this.bookService.delete(bookId);
		if(result>0) {
			mav.setViewName("redirect:/list");
		}else {
			mav.setViewName("redirect:detail?bookId="+bookId);
		}
		return mav;
	}
	
	
}

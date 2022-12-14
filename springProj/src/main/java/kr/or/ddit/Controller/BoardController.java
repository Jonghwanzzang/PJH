package kr.or.ddit.Controller;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;


import kr.or.ddit.vo.BookVO;
import lombok.extern.slf4j.Slf4j;

//스프링아 이거 자바 빈 객체로 관리해줘 (메모리에 올려줘) 
@RequestMapping("/board") // 클래스 레벨
@Controller
@Slf4j
public class BoardController {
	/*
	 	RequestMapping의 value 속성에 요청 결로를 설정
	 	- 요청 경로는 반드시 설정해야 하는 필수 정보
	 	- 속성이 하나 일 경우엔 속성명을 생략할 수 있음(@RequestMapping("/board/register) <<--- 이런 방식
	 	- 컨트롤러의 클래스 레벨과 메서드 레벨로 지정 할 수 있음
	 	- 클래스 레벨로 요청 경로를 지정하면 메서드 레벨에서 지정한 경로의 기본 경로로 취급됨
	 	- 클래스 레벨의 요청 경로에 메서드 레벨의 요청 결로를 덧붙인 형태가 최종 경로가 됨
	 */
	
	// 요청 URL : http://localhost/board/register
	// value 속성에 요청 경로 값을 입력
	
	@RequestMapping(value="/register") //메서드 레벨
	public void registerForm() {
		log.info("registerForm");
	}
	
	//속성이 하나일 때는  속성명(value)을 생략할 수 있다.
	@RequestMapping("/modify")
	public void modifyForm() {
		log.info("modifyForm");
	}
	
	/*
	 2. 경로 패턴 매핑
	 요청 경로를 동적으로 표현이 가능한 경로 패턴을 지정할 수 있음
	  - URL 경로 상의 변하는 값을 경로 변수로 취급
	  - 경로(path) 변수(variable에 해당하는 값을 파라미터 변수에 설정할 수 있음
	  // 요청 RUI : http//localhost/board/read/100 => 100번째 글
	  // 요청 RUI : http//localhost/board/read/101 => 101번째 글
	  // 요청 RUI : http//localhost/board/read/102 => 102번째 글
	   그동안 http//localhost/board/read?boardNo=102 이런식으로 했었음
	   
	 */
	@RequestMapping("/read/{boardNo}")
	public String read(@PathVariable("boardNo") int boardNo) {
		
		log.info("boardNo : " + boardNo);
		
		
		// model and view 방식이 아닌 그냥 String으로 보내는 방식
		return "board/read";
	}
	
//	method 속성이 생략 시 기본 메서드는 get 방식이다.
	@RequestMapping("/formHome")
	public String formHome() {
		return "board/formHome";
	}
	/*
	  	Http 메서드 매핑
	  	method 속성을 사용하여 HTTP메서드를 매핑 조건으로 지정 가능
	  	화면으로 응답하는 경우 HTTP 메서드로 GET방식과 POST방식 두 가지를 사용할 수 있다,
	  
	  
	 */
	
	
	
	//@GetMapping
	@RequestMapping(value="/register2" , method = RequestMethod.GET)
	public String register2(Model model) {
		//Model은 인터페이스 -> 데이터 담당
		model.addAttribute("name","개똥이");
		//forwarding -> 경로담당
		return "board/formHome";
	}
	//@PostMapping
	@RequestMapping(value="/register2" , method = RequestMethod.POST)
	public String register2Post(Model model) {
		//Model은 인터페이스 -> 데이터 담당
		model.addAttribute("name","광규");
		//forwarding -> 경로담당
		return "board/formHome";
	}

	/*
	  4. Params 매핑
	  - 요청 파라미터를 매핑 조건으로 지정하는 경우 params 속성을 사용함
	  - 버튼이나 링크에 따라 호출할 메서드를 바꿔야 할 때 사용
	 */
//	<p><a href="/board/get?register">Register</a></p>
	@RequestMapping(value="/get" , method = RequestMethod.GET , params="register")
	public String getRegister() {
		log.info("getregister IN");
		return "board/formHome";
		
	}
	
//	<p><a href="/board/get?modify">Modify</a></p>
	@RequestMapping(value="/get" , method = RequestMethod.GET , params="modify")
	public String getModify() {
		
		log.info("getModify IN");
		return "board/formHome";
	}
	
	@RequestMapping(value="/post" , method = RequestMethod.POST , params="register")
	public String postRegister() {
		log.info("postregister IN");
		return "board/formHome";
		
	}
	@RequestMapping(value="/post" , method = RequestMethod.POST , params="modify")
	public String postModify() {
		
		log.info("postModify IN");
		return "board/formHome";
	}
	
	
	/*
	 	5. Hearder 매핑
	 	요청 헤더를 매핑 조건으로 지정하는경우에는 headers 속성을 사용함
	 */
	// 요청URI : http://localhost/board/ajaxHome
	@RequestMapping("/ajaxHome")
	public String ajaxHome() {
		log.info("ajaxHome에 왔다");
		
		//forwarding
		return "board/ajaxHome";
	}
	
	//요청 URI : http://localhost/board/7
	// board/7 => 경로 변수(동적변수)
	// 데이터를 보낼때는 ResponseBody를 통해 JSON 데이타로 리턴
	@RequestMapping(value="/{boardNo}", method = RequestMethod.PUT,
			headers="X-HTTP-Method-Override=PUT")
	public ResponseEntity<String> ajaxModify(@PathVariable("boardNo") int boardNo){
		log.info("ajaxModify 왔다");
		
		log.info("boardNo : " + boardNo);
		
		//success:function(result{
		// 헤더에 String 데이터를 넣음
		ResponseEntity<String> entity = new ResponseEntity<String>("SUCCESS",HttpStatus.OK);
		
		return entity;
	}

	//요청 $.GET("/board/boardNo)
	// 요청 URI : http://localhost/board/7
	// /7 : 경로 변수
	@RequestMapping(value="/{boardNo}", method = RequestMethod.GET) // 겟으로 보냈으니까 겟으로 받음
	public ResponseEntity<BookVO> getRead(@PathVariable("boardNo") int boardNo){
		log.info("boardNo : " , boardNo);
		
		BookVO bookVO = new BookVO();
		bookVO.setBookId(7);
		bookVO.setTitle("천원자리 변호사");
		bookVO.setCategory("드라마");
		bookVO.setPrice(1000);
		bookVO.setInsertDate(new Date());
		
		//vo를 응답데이터에 포함해보자
		ResponseEntity<BookVO> entity = new ResponseEntity<BookVO>(bookVO,HttpStatus.OK);
		return entity;
		
	}
	//요청URI : /board/getBook
	// data : {"boardBo : 7"}
	// contentType(보내는 타입) : application/json;charset:utf-8
	// dataType(응답 타입) : json
	
	@ResponseBody
	@RequestMapping(value="/getBook" , method = RequestMethod.POST)
	public List<BookVO> getBook(@RequestBody String boardNo) {
		
		List<BookVO> list = new ArrayList<BookVO>();
		
		BookVO bookVO = new BookVO();
		bookVO.setBookId(7);
		bookVO.setTitle("천원자리 변호사");
		bookVO.setCategory("드라마");
		bookVO.setPrice(1000);
		bookVO.setInsertDate(new Date());
		
		list.add(bookVO);
		
		bookVO = new BookVO();
		bookVO.setBookId(8);
		bookVO.setTitle("모놀로그");
		bookVO.setCategory("음악");
		bookVO.setPrice(10000);
		bookVO.setInsertDate(new Date());
		
		list.add(bookVO);
		
		return list;
	}
}


























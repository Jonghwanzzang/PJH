package kr.or.ddit.Controller;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import org.apache.commons.lang.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import kr.or.ddit.service.MemberService;
import kr.or.ddit.vo.AddressVO;
import kr.or.ddit.vo.CardVO;
import kr.or.ddit.vo.MemberVO;
import lombok.extern.slf4j.Slf4j;
import oracle.jdbc.proxy.annotation.Post;

@Slf4j
@Controller
public class MemberController {
	@Autowired
	MemberService memberService;
	
	// 요청 파라미터 : register?userId=hong&passwd=1234
	@GetMapping("/register")
	public String registerByParameter(String userId, String passwd) {
		log.info("registerByParamter IN");
		log.info("userId : " + userId);
		log.info("passwd : " + passwd);

		return "success";
	}

	// URL 경로 상의 경로 변수로부터 요청 데이터를 취득
	// 경로(Path) 변수(Variable)
	// 요청URI : /register/hong
	@RequestMapping(value = "/register/{userId}", method = RequestMethod.GET)
	public String registerByPath(@PathVariable String userId) {
		log.info("registerByPath IN");

		log.info("userId : " + userId);

		// forwarding
		return "success";

	}

	// /register01 => register.jsp forwarding
	@GetMapping("/register01")
	public String register01() {
		return "/register";
	}

//	URL : /register01
//	요청 파라미터 :  {"userId":"hong","password":"1234","coin":"100"}
	@PostMapping("/register01")
	public String register01Post(String userId, String passwd, String coin) {
		log.info("userId : " + userId);
		log.info("passwd : " + passwd);
		log.info("coin : " + coin);

		return "success";
	}

	@GetMapping("/register/register03")
	public String register03() {
		// forwarding
		return "register/register";
	}

//    <!-- 요청URL : /register/register03
//	 요청 파라미터  : {"userId":"a001","password":"1234","coin","100"}
	@PostMapping("/register/register03")
	public String register03Post(String userId, String password, int coin) {
		log.info(" userId : " + userId);
		log.info(" password  : " + password);
		log.info(" coin : " + coin);

		return "register/success";
	}

	// URL 경로 상의 경로 변수 (PathVariable)가 여러 개일 때
	// @PathVariable 에너테이션을 사용하여 특정한 경로 변수명을 지정
	// 요청 URI : /register/register03/a001/100
	@RequestMapping(value = "/register/register03/{userId}/{coin}")
	public String register03ByPath(@PathVariable("userId") String userId, @PathVariable("coin") int coin) {
		log.info("register03ByPath IN");
		log.info("userId : " + userId);
		log.info("coin : " + coin);

		return "register/success";
	}

	@GetMapping("/register/register04")
	public String register04ByParam() {
		// forwarding
		return "register/register04";
	}

	// @RequestParam 어노테이션을 사용하여
	// HTML 폼 필드명을 지정하여 요청을 처리할 수 있음
	// 요청 파라미터 : {"userId":"a001","passowrd":"1234","coin":"100"}
	@PostMapping("/register/register04")
	public String register04ByParamPost(String userId, String password, String coin) {
		log.info("userId : " + userId);
		log.info("password : " + password);
		log.info("coin : " + coin);

		return "register/success";
	}

	@GetMapping("/register/register05")
	public String register04ByBeans() {
		// forwarding
		return "register/register05";
	}

	// 폼 텍스트 필드 요소의 값을 자바빈즈 매개변수의 정수 타입 매개변수로 처리 됨
	// MemberVO => private int coin
	@PostMapping("/register/register05")
	public String register05ByBeansPost(@ModelAttribute MemberVO vo, int coin, ArrayList<String> cars, AddressVO addresVO,
			Model model) {
		log.info("처음 memeberVO : " + vo.toString());
//		log.info("addressvo : " + addresvo.toString());
//		log.info("cardVO : " + cardVO.toString());
		List<CardVO> cardVOList = vo.getCardVOList();
//		log.info("cardVO : " + cardVOList.toString());
		addresVO =vo.getAddressVO(); 

		// 보유 자동차들(String[] cars) -> 보유 자동차(String car)
		String car = StringUtils.join(vo.getCars(), ",");
		vo.setCar(car);
		// 취미들(String[] hobbyList) -> 취미(String hobby)
		String hobby = StringUtils.join(vo.getHobbyList(), ",");
		vo.setHobby(hobby);
		
		int result = this.memberService.memberInsert(vo);
				model.addAttribute("result",result);
		
		
		
		
		return "register/success";
	}

	// 요청URI : /registerByGet02?userId=a001&birth=1234 (x)
	// 요청URI : /registerByGet02?userId=a001&birth=2022-10-31 (x)
	// 요청URI : /registerByGet02?userId=a001&birth=20221031 (x)
	// 요청URI : /registerByGet02?userId=a001&birth=2022/10/31 (O)

	@GetMapping("/register/registerByGet02")
	public String registerByGet02(MemberVO memberVO, Date birth) {
		log.info("registerByGet01 IN");
		log.info("memberVO :  " + memberVO.toString());
		log.info("birth : " + memberVO.getBirth());

		// forwarding
		return "register/success";
	}
}

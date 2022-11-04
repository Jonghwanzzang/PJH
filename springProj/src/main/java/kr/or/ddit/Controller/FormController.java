package kr.or.ddit.Controller;

import java.util.HashMap;
import java.util.Map;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.or.ddit.vo.Member1VO;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("/form")
public class FormController {

	//<form:form modelAttribute="member" method="post" action="register">
	@GetMapping("/registerForm01")
	public String registerForm01(Model model) {
		log.info("registerForm01 IN");
		
		model.addAttribute("member",new Member1VO());
		
		return "form/registerForm";
	}
	
	@GetMapping("/registerForm02")
	public String registerForm02(@ModelAttribute Member1VO member1VO ) {
		log.info("registerForm02 IN");
		
		return "form/registerForm02";
	}

	@GetMapping("/registerForm03")
	public String registerForm03(@ModelAttribute("mamber1VO") Member1VO member1VO 
			, Model model) {
		log.info("registerForm03 IN");
		
		//폼 객체의 프로퍼티에 값을 미리지정해놓음
		member1VO.setMemId("광규");
		member1VO.setMemName("김광규");
		//password 값을 설정하여 view에 전달하더라도 password 는 반영 안됨
		member1VO.setPassword("1234");
		
		Map<String,String> hobbyMap = new HashMap<String, String>();
		hobbyMap.put("Sports", "Sports");
		hobbyMap.put("Music", "Music");
		hobbyMap.put("Movie", "Movie");
		
		//라디오버튼
		Map<String, String> genderMap = new HashMap<String, String>();
		genderMap.put("Male", "Male");
		genderMap.put("FeMale", "FeMale");
		genderMap.put("Ohter", "Ohter");
		
		model.addAttribute("genderMap",genderMap);
		
		
		//셀릭트버튼
		Map<String,String> nationalityMap = new HashMap<String, String>();
		nationalityMap.put("Korea", "korea");
		nationalityMap.put("Germany", "Germany");
		nationalityMap.put("Australia", "Australia");
		model.addAttribute("nationalityMap",nationalityMap);
		
		model.addAttribute("hobbyMap",hobbyMap);
		
		
		
		return "form/registerForm03";
	}
	
	//요청URI : /form/register
	// 방식 : post 
	// 파라미터 :  {"memId":"광규","memName":"김광규"}
	@PostMapping("/register")
	public String registerPost(@Validated Member1VO member1VO , Model model,
			BindingResult result) {
		log.info("memberVO : " + member1VO.toString());
		
		// registerForm03.jsp에서 post 요청 시 Validated 확인 후 문제 발생 시 폼 화면으로 back
		if(result.hasErrors()) {
			return "form/registerForm03";
		}
		
		String[] hobbyList = member1VO.getHobbyList();
		
		if(hobbyList!=null) {
			for(String hobby : hobbyList) {
				log.info("hobby : " + hobby);
			}
		}
		model.addAttribute("hobbyList",hobbyList);
		
		
		
		
		return "form/success";
	}
	
}
